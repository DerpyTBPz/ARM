/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* Copyright (c) Nuvoton Technology Corp. All rights reserved.                                             */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
#include <stdio.h>

/*---------------------------------------------------------------------------------------------------------*/
/* Includes of headers                                                                                     */
/*---------------------------------------------------------------------------------------------------------*/
#include "NUC100.h"
#include "Driver\DrvCAN.h"
#include "Driver\DrvSYS.h"

/*---------------------------------------------------------------------------------------------------------*/
/* Macro, type and constant definitions                                                                    */
/*---------------------------------------------------------------------------------------------------------*/
static PFN_DRVCAN_CALLBACK *g_pfnCAN0callback = NULL;
static PFN_DRVCAN_CALLBACK *g_pfnCAN1callback = NULL;

/*---------------------------------------------------------------------------------------------------------*/
/* CAN0 ISR                                                                                         	   */
/*---------------------------------------------------------------------------------------------------------*/
void CAN0_IRQHandler(void)
{
 	
	if(CAN0->INTR.BEI ==1)		/* Bus Error Interrupt */
	{
		CAN0->INTR.BEI =1 ; 							/* Clear Bus Error Interrupt Flag */			

        if (g_pfnCAN0callback != NULL)                  /* Bus Error Interrupt Callback Function */          
     	   g_pfnCAN0callback(INT_BEI);
  	}
				   
	if(CAN0->INTR.ALI ==1)		/* Arbitration Lost Interrupt */
	{
		CAN0->INTR.ALI =1 ; 						   	/* Clear Arbitration Lost Interrupt Flag */

        if (g_pfnCAN0callback != NULL)                  /* Arbitration Lost Interrupt Callback Function */            
     	   g_pfnCAN0callback(INT_ALI);
  	}			   
	
	if(CAN0->INTR.WUI ==1)		/* Wake-Up Interrupt */
	{												  	
		CAN0->INTR.WUI =1 ; 						  	/* Clear Wake-Up Interrupt Flag */

        if (g_pfnCAN0callback != NULL)              	/* Wake-Up Interrupt Callback Function */               
     	   g_pfnCAN0callback(INT_WUI);
  	}			   
	if(CAN0->INTR.TI ==1)	 	/* Transmit Interrupt */
	{
		CAN0->INTR.TI =1 ; 							   	/* Clear Transmit Interrupt Flag */

        if (g_pfnCAN0callback != NULL)                  /* Transmit Interrupt Callback Function */           
     	   g_pfnCAN0callback(INT_TI);				  	
  	}			   
	if(CAN0->INTR.RI ==1)		/* Receive Interrupt */
	{
		CAN0->INTR.RI =1 ; 							  	/* Clear Receive Interrupt Flag */

        if (g_pfnCAN0callback != NULL)                  /* Receive Interrupt Callback Function */
     	   g_pfnCAN0callback(INT_RI);
  	}			   
}

/*---------------------------------------------------------------------------------------------------------*/
/* CAN1 ISR                                        														   */
/*---------------------------------------------------------------------------------------------------------*/

void CAN1_IRQHandler(void)
{
 	if(CAN1->INTR.BEI ==1)		/* Bus Error Interrupt */
	{
		CAN1->INTR.BEI =1 ; 						  	/* Clear Bus Error Interrupt Flag */

        if (g_pfnCAN1callback != NULL)                  /* Bus Error Interrupt Callback Function */ 
     	   g_pfnCAN1callback(INT_BEI);
  	}			   

	if(CAN1->INTR.ALI ==1)	   	/* Arbitration Lost Interrupt */
	{
		CAN1->INTR.ALI =1 ; 						  	/* Clear Arbitration Lost Interrupt Flag */

        if (g_pfnCAN1callback != NULL)                  /* Arbitration Lost Interrupt Callback Function */ 
     	   g_pfnCAN1callback(INT_ALI);
  	}			   

	if(CAN1->INTR.WUI ==1)	   	/* Wake-Up Interrupt */
	{												   	/* Clear Wake-Up Interrupt Flag */
		CAN1->INTR.WUI =1 ; 

        if (g_pfnCAN1callback != NULL)                  /* Wake-Up Interrupt Callback Function */ 
     	   g_pfnCAN1callback(INT_WUI);
  	}			   
	if(CAN1->INTR.TI ==1)	   	/* Transmit Interrupt */
	{												  	
		CAN1->INTR.TI =1 ; 							   	/* Clear Transmit Interrupt Flag */

        if (g_pfnCAN1callback != NULL)                  /* Transmit Interrupt Callback Function */ 
     	   g_pfnCAN1callback(INT_TI);
  	}			   
	if(CAN1->INTR.RI ==1)		/* Receive Interrupt */
	{												 	
		CAN1->INTR.RI =1 ; 						   		/* Clear Receive Interrupt Flag */

        if (g_pfnCAN1callback != NULL)                  /* Receive Interrupt Callback Function */
     	   g_pfnCAN1callback(INT_RI);
  	}	

}

/*---------------------------------------------------------------------------------------------------------*/
/* Function:     DrvCAN_Init		                                                                   	   */
/*                                                                                                         */
/* Parameter:                                                                                              */
/*               None                                                                                      */
/*                                                                                                         */
/* Returns:                                                                                                */
/*               None                                                                                      */
/* Description:                                                                                            */
/*               The function is used to intialize CAN0 and CAN1                                           */
/*---------------------------------------------------------------------------------------------------------*/
void DrvCAN_Init(void)
{
	SYS->IPRSTC2.CAN0_RST =1;  /* Reset CAN0 */
	SYS->IPRSTC2.CAN0_RST =0;
	SYS->IPRSTC2.CAN1_RST =1;  /* Reset CAN1 */
	SYS->IPRSTC2.CAN1_RST =0;
}


/*---------------------------------------------------------------------------------------------------------*/
/* Function:     DrvCAN_Open		                                                                   	   */
/*                                                                                                         */
/* Parameter:                                                                                              */
/*               port  		-[in]   		 CAN Channel:  CAN_PORT0 / CAN_PORT1                           */
/*               Clock  	-[in]            BitRate(KB): BITRATE_100K_6M/BITRATE_500K_6M/BITRATE_1000K_6M */
/*                                           		   BITRATE_100K_12M/BITRATE_500K_12M/BITRATE_1000K_12M */
/*                                                     BITRATE_100K_24M/BITRATE_500K_24M/BITRATE_1000K_24M */
/*                                                     BITRATE_100K_48M/BITRATE_500K_48M/BITRATE_1000K_48M */
/*                                                     or Userself configure value                         */
/*                                                                                                         */
/*               IsUserSet	-[in]            Decide configure by user self or configure table              */
/*                                           TRUE: 	Configure by function table                            */
/*                                           FALSE: Configure by user self                                 */
/* Returns:                                                                                                */
/*                                                                                                         */
/* Description:                                                                                            */
/*               The function is used to configure CAN intial setting                                      */
/*---------------------------------------------------------------------------------------------------------*/
int32_t DrvCAN_Open(CAN_PORT port,uint32_t u32Reg)
{
	/* Enable APB CLK & CAN BUS & IP Reset */
	UNLOCKREG();
	if(port == CAN_PORT0)
	{
		SYSCLK->APBCLK.CAN0_EN 	= 1;
		SYS->IPRSTC2.CAN0_RST 	= 1;
		SYS->IPRSTC2.CAN0_RST 	= 0;
		SYS->GPDMFP.CAN0_TX   	= 1;
		SYS->GPDMFP.CAN0_RX   	= 1;
		CAN0->CMD.CAN_EN 		= 1;
	}
	else if(port == CAN_PORT1)
	{
		SYSCLK->APBCLK.CAN1_EN 	= 1;
		SYS->IPRSTC2.CAN1_RST 	= 1;
		SYS->IPRSTC2.CAN1_RST 	= 0;
		SYS->GPDMFP.CAN1_TX   	= 1;
		SYS->GPDMFP.CAN1_RX   	= 1;
		CAN1->CMD.CAN_EN 		= 1;
	}
	LOCKREG();
	
	/* Bit Time Control Register Setting */
	/* Using Configure Table to decide */
	if(port == DRVCAN_PORT0)
		outpw(&CAN0->BTIMR,u32Reg);
	else
		outpw(&CAN1->BTIMR,u32Reg);
	return E_SUCCESS;
}


/*---------------------------------------------------------------------------------------------------------*/
/* Function:     DrvCAN_WaitReady                                                                   	   */
/*                                                                                                         */
/* Parameter:                                                                                              */
/*               port  		-[in]   		 CAN Channel:  CAN_PORT0 / CAN_PORT1                           */
/*                                                                                                         */
/* Returns:                                                                                                */
/*               E_SUCCESS   				Success                                                        */
/*               E_DRVCAN_ERR_ARGUMENT      Invalid Argument                                               */
/*               E_DRVCAN_ERR_TIMEOUT       Time-Out                                                       */
/* Description:                                                                                            */
/*               The function is used to check bus is idle                                                 */
/*---------------------------------------------------------------------------------------------------------*/
int32_t DrvCAN_WaitReady(CAN_PORT port)
{
	volatile uint32_t u32SFR;
	volatile int32_t timeout1,timeout2;
		
	if(port == CAN_PORT0)
	{	
		
		timeout1 =1000;
	
		while(1)
		{
			u32SFR = CAN0->BSR.BS;
			if(u32SFR ==1)        			/* BUS is idle */
				break;
		
			timeout1--;
			if(timeout1==0)					/* Time-Out */
				return E_DRVCAN_ERR_TIMEOUT;
		}

	}
	else if(port == CAN_PORT1)
	{
		timeout2 =1000;
		
		while(1)
		{

			u32SFR = CAN0->BSR.BS;
			if(u32SFR ==1)        			/* BUS is idle */
				break;
		
			timeout2--;
			if(timeout2==0)					/* Time-Out */
				return E_DRVCAN_ERR_TIMEOUT;
		}
	}
	else
		return E_DRVCAN_ERR_ARGUMENT;

	return E_SUCCESS;
}



/*---------------------------------------------------------------------------------------------------------*/
/* Function:     DrvCAN_Close                                                                   	       */
/*                                                                                                         */
/* Parameter:                                                                                              */
/*               port  		-[in]   		 CAN Channel:  CAN_PORT0 / CAN_PORT1                           */
/* Returns:                                                                                                */
/*               E_SUCCESS   				Success                                                        */
/*               E_DRVCAN_ERR_PORT_INVALID  Invalid Port                                                   */
/* Description:                                                                                            */
/*               To disable the CAN APB Clock and BUS Enable                                               */
/*---------------------------------------------------------------------------------------------------------*/

int32_t DrvCAN_Close(CAN_PORT port)
{
	/*Enable APB CLK & CAN BUS*/

	if(port == CAN_PORT0)
	{
		SYSCLK->APBCLK.CAN0_EN =0;
		CAN0->CMD.CAN_EN =0;
	
	}
	else if(port == CAN_PORT1)
	{
		SYSCLK->APBCLK.CAN1_EN =0;
		CAN1->CMD.CAN_EN =0;
	}
	else
		return E_DRVCAN_ERR_PORT_INVALID;

	return E_SUCCESS;

}


/*---------------------------------------------------------------------------------------------------------*/
/* Function:     DrvCAN_WriteMsg                                                                   	       */
/*                                                                                                         */
/* Parameter:                                                                                              */
/*               port  		-[in]   		 CAN Channel:  CAN_PORT0 / CAN_PORT1                           */
/*               Msg     	-[in]   	     Sturcture of CAN                                              */
/*                                                                                                         */
/* Returns:                                                                                                */
/*               E_SUCCESS   				Success                                                        */
/*               E_DRVCAN_ERR_TIMEOUT  		Time-Out                                                       */
/*               E_DRVCAN_ERR_PORT_INVALID	Invalid port                                                   */
/*                                                                                                         */
/* Description:                                                                                            */
/*               The function is set CAN information and send to CAN BUS                                   */
/*---------------------------------------------------------------------------------------------------------*/

int32_t DrvCAN_WriteMsg(CAN_PORT port,STR_CAN_T *Msg)
{
	
	if(port == CAN_PORT0)
	{
		int32_t timeout1 = 1000;
	
		/* Check Busy is idle */		
		while(CAN0->BSR.BS == 0)		
		{
			timeout1--;
			if(timeout1==0)				/* TimeOut */
			{
				printf("Time-Out\n");
				return E_DRVCAN_ERR_TIMEOUT;
			}
		}
		
		/* Configure Setting */		
		CAN0->TXID.TXID 		= Msg->id;

		CAN0->TXFINFO.TXDLC		= Msg->u8cLen;
		
		CAN0->TXDATA[0] 		= Msg->u32cData[0];
		
		CAN0->TXDATA[1] 		= Msg->u32cData[1];

		CAN0->TXFINFO.TXFF 		= Msg->u8cFormat;

		CAN0->TXFINFO.TXRTR 	= Msg->u8cType;
		
		CAN0->CMD.OVERFLOAD_EN 	= Msg->u8cOverLoad;

		/* Trigger and Send */
		CAN0->CMD.TR = 1; 

		/* Transfer Complete */
		while(CAN0->BSR.TCS != 1); 		

	}
	else if(port == CAN_PORT1)
	{

		int32_t timeout2 = 1000;

		/* Check Busy is idle */
		while(CAN1->BSR.BS == 1)
		{
			printf("BUS is Busy");
			
			timeout2--;
			if(timeout2==0)					 /* TimeOut */
				return E_DRVCAN_ERR_TIMEOUT;
		}
		
		/* Configure Setting */		
		CAN1->TXID.TXID 		= Msg->id;

		CAN1->TXFINFO.TXDLC		= Msg->u8cLen;
		
		CAN1->TXDATA[0] 		= Msg->u32cData[0];
		
		CAN1->TXDATA[1] 		= Msg->u32cData[1];

		CAN1->TXFINFO.TXFF 		= Msg->u8cFormat;
		
		CAN1->TXFINFO.TXRTR 	= Msg->u8cType;
		
		CAN1->CMD.OVERFLOAD_EN 	= Msg->u8cOverLoad;

		/* Trigger and Send */
		CAN1->CMD.TR = 1; 
		
		/* Transfer Complete */
		while(CAN1->BSR.TCS != 1); 		 	
	}
	else
	 	return E_DRVCAN_ERR_PORT_INVALID;
	
	return E_SUCCESS;
}		  

/*---------------------------------------------------------------------------------------------------------*/
/* Function:     DrvCAN_ReadMsg                                                                   	       */
/*                                                                                                         */
/* Parameter:                                                                                              */
/*               port  		-[in]   		 CAN Channel:  CAN_PORT0 / CAN_PORT1                           */
/* Returns:                                                                                                */
/*               STR_CAN_T  -[out]           The stucture of CAN                                           */
/*                                                                                                         */
/* Description:                                                                                            */
/*               The function is used to get CAN RX information                                            */
/*---------------------------------------------------------------------------------------------------------*/

STR_CAN_T DrvCAN_ReadMsg(CAN_PORT port)
{
	STR_CAN_T recCAN;

	if(port == CAN_PORT0)
	{
		/* Wait Receiving */
		while(CAN0->BSR.RS == 1);

		recCAN.id 			= CAN0->RXID.RXID;
	 	recCAN.u8cLen 		= CAN0->RXFINFO.RXDLC; 
		recCAN.u8cFormat	= CAN0->RXFINFO.RXIDE; 
		recCAN.u8cType		= CAN0->RXFINFO.RXRTR; 

		recCAN.u32cData[0] 	= CAN0->RX_DATA[0] ; 
		recCAN.u32cData[1] 	= CAN0->RX_DATA[1] ; 

	}
	else if(port == CAN_PORT1)
	{
		/* Wait Receiving */
		while(CAN1->BSR.RS == 1);

		recCAN.id 			= CAN1->RXID.RXID;
	 	recCAN.u8cLen 		= CAN1->RXFINFO.RXDLC; 
		recCAN.u8cFormat	= CAN1->RXFINFO.RXIDE; 
		recCAN.u8cType		= CAN1->RXFINFO.RXRTR; 

		recCAN.u32cData[0] 	= CAN1->RX_DATA[0] ; 
		recCAN.u32cData[1] 	= CAN1->RX_DATA[1] ; 
	}
	
 	return recCAN;
}		  

/*---------------------------------------------------------------------------------------------------------*/
/* Function:     DrvCAN_EnableInt                                                                   	   */
/*                                                                                                         */
/* Parameter:                                                                                              */
/*               port  			  -[in]	  CAN Channel:  CAN_PORT0 / CAN_PORT1                              */
/*               u32InterruptFlag -[in]   Interrupt Flag:It could be INT_BEI/INT_ALI/INT_WUI/INT_TI/INT_RI */
/*                                                 INT_BEI:                                                 */
/*                                                 INT_ALI:                                                 */
/*                                                 INT_WUI:                                                 */
/*                                                 INT_TI :                                                 */
/*                                                 INT_RI :                                                 */
/*                                                                                                         */
/*               pfncallback                  Callback function pointer                                    */
/*                                                                                                         */
/* Returns:                                                                                                */
/*                                                                                                         */
/* Side effects:                                                                                           */
/*                                                                                                         */
/* Description:                                                                                            */
/*               The function is used to enable CAN Interrupt and install the call back function           */
/*---------------------------------------------------------------------------------------------------------*/
int32_t DrvCAN_EnableInt(CAN_PORT port,int32_t u32InterruptFlag,PFN_DRVCAN_CALLBACK pfncallback)
{
	
	if(port == CAN_PORT0)
	{
		outpw(CAN0_BASE+0x10, (M32(CAN0_BASE+0x10) & ~(INT_BEI | INT_ALI | INT_WUI | INT_TI | INT_RI )) | 
		(u32InterruptFlag & (INT_BEI | INT_ALI | INT_WUI | INT_TI | INT_RI )));
		g_pfnCAN0callback = pfncallback;        
		NVIC_EnableIRQ(CAN0_IRQn); 
	
	}
	else if(port == CAN_PORT1)
	{
		outpw(CAN1_BASE+0x10, (M32(CAN0_BASE+0x10) & ~(INT_BEI | INT_ALI | INT_WUI | INT_TI | INT_RI )) | 
		(u32InterruptFlag & (INT_BEI | INT_ALI | INT_WUI | INT_TI | INT_RI )));
		g_pfnCAN1callback = pfncallback;        
		NVIC_EnableIRQ(CAN1_IRQn); 
	}
	else
	{
	}
	return TRUE;

}



/*---------------------------------------------------------------------------------------------------------*/
/* Function:     DrvUART_DisableInt                                                                   	   */
/*                                                                                                         */
/* Parameter:                                                                                              */
/*               port  			  	-[in]	  CAN Channel:  CAN_PORT0 / CAN_PORT1                          */
/*               u32InterruptFlag             INT_BEI/INT_ALI/INT_WUI/INT_TI/INT_RI                        */
/* Returns:                                                                                                */
/*                                                                                                         */
/* Side effects:                                                                                           */
/*                                                                                                         */
/* Description:                                                                                            */
/*               The function is used to disable CAN Interrupt and uninstall the call back function        */
/*---------------------------------------------------------------------------------------------------------*/
int32_t DrvCAN_DisableInt(CAN_PORT port,int32_t u32InterruptFlag)
{

	switch (port)
    {
        case CAN_PORT0:
			g_pfnCAN0callback = NULL;
			outpw(&CAN0->INTEN,inpw(&CAN0->INTEN)&~u32InterruptFlag);
            NVIC_DisableIRQ(CAN0_IRQn);   
            break;

        case CAN_PORT1:
			g_pfnCAN1callback = NULL;
			outpw(&CAN1->INTEN,inpw(&CAN1->INTEN)&~u32InterruptFlag);
           	NVIC_DisableIRQ(CAN1_IRQn);    
            break;

        default:
			return E_DRVCAN_ERR_PORT_INVALID;
   }

	return E_SUCCESS;

}


/*---------------------------------------------------------------------------------------------------------*/
/* Function:     DrvCAN_GetErrorStatus                                                                	   */
/*                                                                                                         */
/* Parameter:                                                                                              */
/*               port  			  -[in]	  CAN Channel:  CAN_PORT0 / CAN_PORT1                              */
/*               DRVCAN_ERRFLAG   -[in]   Bus Error Flag - It includes of           			           */
/*                                            DRVCAN_ERRSTUFF :  Stuff Error                               */
/*                                            DRVCAN_ERRFORM  :  Form Error                                */
/*                                            DRVCAN_ERRCRC   :  CRC Error                                 */
/*                                            DRVCAN_ERRACK   :  Acknowledge Error                         */
/*                                            DRVCAN_ERRBIT   :  Bit Error                                 */
/* Returns:                                                                                                */
/*               TRUE  : The Error Flag is set                                                             */
/*               FALSE : The Error Flag is clear                                                           */
/*               E_DRVCAN_ERR_PORT_INVALID : Error Port Setting                                            */
/* Side effects:                                                                                           */
/*                                                                                                         */
/* Description:                                                                                            */
/*               The function is used to Get CAN Error Status				       						   */
/*---------------------------------------------------------------------------------------------------------*/
int32_t DrvCAN_GetErrorStatus(CAN_PORT port,DRVCAN_ERRFLAG u32ErrorFlag)
{
	
	if(port == CAN_PORT0)
	{
		switch(u32ErrorFlag)
		{
			case DRVCAN_ERRSTUFF:
				if(CAN0->ERRCR.STUFF_ERR)	
					return TRUE;
				break;
	
			case DRVCAN_ERRFORM:
				if(CAN0->ERRCR.FORM_ERR)	
					return TRUE;
				break;

			case DRVCAN_ERRCRC:
				if(CAN0->ERRCR.CRC_ERR)	
					return TRUE;
				break;
			  
			case DRVCAN_ERRACK:
				if(CAN0->ERRCR.ACK_ERR)	
					return TRUE;
				break;
			
			case DRVCAN_ERRBIT:
				if(CAN0->ERRCR.BIT_ERR)	
					return TRUE;
				break;

			default:
				break;
		}
	}
	else if(port == CAN_PORT1)
	{
		switch(u32ErrorFlag)
		{
			case DRVCAN_ERRSTUFF:
				if(CAN1->ERRCR.STUFF_ERR)	
					return TRUE;
				break;
	
			case DRVCAN_ERRFORM:
				if(CAN1->ERRCR.FORM_ERR)	
					return TRUE;
				break;

			case DRVCAN_ERRCRC:
				if(CAN1->ERRCR.CRC_ERR)	
					return TRUE;
				break;
			  
			case DRVCAN_ERRACK:
				if(CAN1->ERRCR.ACK_ERR)	
					return TRUE;
				break;
			
			case DRVCAN_ERRBIT:
				if(CAN1->ERRCR.BIT_ERR)	
					return TRUE;
				break;

			default:
				break;
		}
	}
	else
	{
		return E_DRVCAN_ERR_PORT_INVALID;	
	}
	
	return E_SUCCESS;
}




/*---------------------------------------------------------------------------------------------------------*/
/* Function:     DrvCAN_SetAcceptanceFilter                                                            	   */
/*                                                                                                         */
/* Parameter:                                                                                              */
/*               port  		-[in]   		 CAN Channel:  CAN_PORT0 / CAN_PORT1                           */
/*               id_Filter  -[in]            The data to write to the specified ID Filter                  */
/*                                                                                                         */
/* Returns:                                                                                                */
/*               E_SUCCESS                   SUCCSSS                                                       */
/*               E_DRVCAN_ERR_PORT_INVALID   Error Port Setting                                            */
/* Description:                                                                                            */
/*               The function is used to Set a Accept ID filter                                            */
/*---------------------------------------------------------------------------------------------------------*/
int32_t DrvCAN_SetAcceptanceFilter(CAN_PORT port,int32_t id_Filter )
{
	if(port == CAN_PORT0 )
	{
		CAN0->ACR.ACR =id_Filter;	
	}
	else if(port == CAN_PORT1)
	{
		CAN1->ACR.ACR =id_Filter;		
	}
	else
	{
		return E_DRVCAN_ERR_PORT_INVALID;
	}
	return E_SUCCESS;
}

/*---------------------------------------------------------------------------------------------------------*/
/* Function:     DrvCAN_SetMaskFilter                                                                 	   */
/*                                                                                                         */
/* Parameter:                                                                                              */
/*               port  		-[in]   		 CAN Channel:  CAN_PORT0 / CAN_PORT1                           */
/*               id_Filter  -[in]            The data to write to the specified Mask Filter                */
/* Returns:                                                                                                */
/*               E_SUCCESS                   SUCCSSS                                                       */
/*               E_DRVCAN_ERR_PORT_INVALID   Error Port Setting                                            */
/* Description:                                                                                            */
/*               The function is used to set mask ID filter                                                */
/*---------------------------------------------------------------------------------------------------------*/
int32_t DrvCAN_SetMaskFilter(CAN_PORT port,int32_t id_Filter )
{
	if(port == CAN_PORT0 )
	{
		CAN0->AMR.AMR =id_Filter;	
	}
	else if(port == CAN_PORT1)
	{
		CAN1->AMR.AMR =id_Filter;		
	}
	else
	{
		return E_DRVCAN_ERR_PORT_INVALID;
	}
	return E_SUCCESS;
}

/*---------------------------------------------------------------------------------------------------------*/
/* Function:     DrvCAN_EnableInt                                                                   	   */
/*                                                                                                         */
/* Parameter:                                                                                              */
/*               port  			  -[in]	  CAN Channel:  CAN_PORT0 / CAN_PORT1                              */
/*               i8SynJumpWidth   -[in]   Synchronization Jump Width :It could be 0~3                      */
/*               i16TimeSeg1      -[in]   Time Segment 1:It could be 0~31                                  */
/*               i8TimeSeg2       -[in]   Time Segment 2 :It could be 0~15                                 */
/*               SampPtNo         -[in]   Sampling Point Number :It could be 0~1                           */
/*                                                                                                         */
/* Returns:                                                                                                */
/*                                                                                                         */
/* Side effects:                                                                                           */
/*                                                                                                         */
/* Description:                                                                                            */
/*               The function is used to Set CAN Bus Timming Parameter                                     */
/*---------------------------------------------------------------------------------------------------------*/
int32_t DrvCAN_SetBusTiming(
	CAN_PORT port,
	int8_t i8SynJumpWidth,
	int16_t i16TimeSeg1,
	int8_t i8TimeSeg2,
	int8_t SampPtNo
)
{
	if((i8SynJumpWidth>3) || (i16TimeSeg1 >31 || (i8TimeSeg2 > 15) || (SampPtNo >1)))
	{
	   return E_DRVCAN_ERR_ARGUMENT;
	}

	if(port == CAN_PORT0)
	{
	   CAN0->BTIMR.SJW 		= i8SynJumpWidth;
	   CAN0->BTIMR.TSEG1 	= i16TimeSeg1;
	   CAN0->BTIMR.TSEG2 	= i8TimeSeg2;
	   CAN0->BTIMR.SAMP 	= SampPtNo;
	}
	else if(port == CAN_PORT1)
	{								   
	   CAN1->BTIMR.SJW 		= i8SynJumpWidth;
	   CAN1->BTIMR.TSEG1 	= i16TimeSeg1;
	   CAN1->BTIMR.TSEG2 	= i8TimeSeg2;
	   CAN1->BTIMR.SAMP 	= SampPtNo;
	}
	else
	{
		return E_DRVCAN_ERR_ARGUMENT;
	}
	return E_SUCCESS;

}

/*---------------------------------------------------------------------------------------------------------*/
/* Function:     DrvCAN_GetClock                                                                 	       */
/*                                                                                                         */
/* Parameter:                                                                                              */
/*               None                                                                                      */
/* Returns:                                                                                                */
/*               Current CAN Clock                                                                         */
/* Description:                                                                                            */
/*               The function is used to Get CAN Clock                                                     */
/*---------------------------------------------------------------------------------------------------------*/
int32_t DrvCAN_GetClock(void)
{
	uint32_t clk =0 , div;
											/* Check UART Clock Source Setting */
	if(SYSCLK->CLKSEL1.CAN_S == 0)			
	{
		clk = DrvSYS_GetEXTClock();			/* Get External Clock From DrvSYS Setting */
	}
	else if(SYSCLK->CLKSEL1.CAN_S == 0)
	{
	 	div = SYSCLK->CLKDIV.CAN_N;			/* According PLL Clock and UART_Divider to get clock */
	
		clk = DrvSYS_GetPLLClock() / (div+1);
	}
	else
		clk = 22000000;						/* Clock 22Mhz  */

	return clk;
}

/*---------------------------------------------------------------------------------------------------------*/
/* Function:     DrvCAN_GetVersion                                                                         */
/*                                                                                                         */
/* Parameter:        																					   */	
/*	             None                                                                                 	   */
/* Returns:                                                                                                */
/*               Version Number                                                                            */
/* Description:                                                                                            */
/*               The function is used to get DrvCAN Version Number                                         */
/*---------------------------------------------------------------------------------------------------------*/
int32_t DrvCAN_GetVersion(void)
{
	return DRVCAN_VERSION_NUM;
	
}



