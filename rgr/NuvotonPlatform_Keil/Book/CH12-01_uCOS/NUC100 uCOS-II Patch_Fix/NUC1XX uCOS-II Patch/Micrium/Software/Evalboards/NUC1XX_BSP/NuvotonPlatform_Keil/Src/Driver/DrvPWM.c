/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* Copyright(c) 2009 Nuvoton Technology Corp. All rights reserved.                                         */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------------------------------------*/
/* Includes of local headers                                                                               */
/*---------------------------------------------------------------------------------------------------------*/
#include "Driver\DrvPWM.h"
#include "Driver\DrvSYS.h"

/*---------------------------------------------------------------------------------------------------------*/
/* Macro, type and constant definitions                                                                    */
/*---------------------------------------------------------------------------------------------------------*/
#define PWM_CNR0        PWM_BASE + 0x0C
#define PWM_PDR0        PWM_BASE + 0x14
#define PWM_CRLR0       PWM_BASE + 0x58
#define PWM_CFLR0       PWM_BASE + 0x5C

/*---------------------------------------------------------------------------------------------------------*/
/* Global file scope (static) variables                                                                    */
/*---------------------------------------------------------------------------------------------------------*/
static S_DRVPWM_CALLBACK_T g_sDrvPWMHandler = {0};

/*---------------------------------------------------------------------------------------------------------*/
/* Function: DrvPWM_GetVersion                                                                             */
/*                                                                                                         */
/* Parameters:        	                                                                                   */
/*               None	                                                         						   */
/*                                                                                                         */
/* Returns:                                                                                                */
/*               The DrvPWM version number                                                                 */
/*                                                                                                         */
/* Description:                                                                                            */
/*               This function is used to get the DrvPWM version number                                    */
/*---------------------------------------------------------------------------------------------------------*/
uint32_t DrvPWM_GetVersion(void)
{
	return DRVPWM_VERSION_NUM;
}

/*---------------------------------------------------------------------------------------------------------*/
/* Function:     <PWMA_IRQHandler>                                                                         */
/*                                                                                                         */
/* Parameter:                                                                                              */
/*               None                                                                                      */
/* Returns:                                                                                                */
/*               None                                                                                      */
/*                                                                                                         */
/* Description:                                                                                            */
/*               ISR to handle PWM0 and PWM2 interrupt event           		                               */
/*---------------------------------------------------------------------------------------------------------*/
void PWMA_IRQHandler(void)
{    
	if (PWM->PIIR.PWMIF0)
	{
		PWM->PIIR.PWMIF0 = 1;
		 
		if (g_sDrvPWMHandler.pfnPWM0CallBack != 0)                           
        	g_sDrvPWMHandler.pfnPWM0CallBack();	
	}

 	if (PWM->PIIR.PWMIF2)
	{
		PWM->PIIR.PWMIF2 = 1;
		 
		if (g_sDrvPWMHandler.pfnPWM2CallBack != 0)                           
        	g_sDrvPWMHandler.pfnPWM2CallBack();	
	}

    if (PWM->CCR0.CAPIF0) 
    {
        PWM->CCR0.CAPIF0 = 1;
		if (g_sDrvPWMHandler.pfnCAP0CallBack != 0)
        {
        	g_sDrvPWMHandler.pfnCAP0CallBack();
        }
	}
    
    if (PWM->CCR1.CAPIF2) 
    {
        PWM->CCR1.CAPIF2 = 1;
		if (g_sDrvPWMHandler.pfnCAP2CallBack != 0)
        {
        	g_sDrvPWMHandler.pfnCAP2CallBack();
        }
	}
}

/*---------------------------------------------------------------------------------------------------------*/
/* Function:     <PWMB_IRQHandler>                                                                         */
/*                                                                                                         */
/* Parameter:                                                                                              */
/*               None                                                                                      */
/* Returns:                                                                                                */
/*               None                                                                                      */
/*                                                                                                         */
/* Description:                                                                                            */
/*               ISR to handle PWM1 and PWM3 interrupt event           		                               */
/*---------------------------------------------------------------------------------------------------------*/
void PWMB_IRQHandler(void)
{    
	if (PWM->PIIR.PWMIF1)
	{ 
		PWM->PIIR.PWMIF1 = 1;
		 
		if (g_sDrvPWMHandler.pfnPWM1CallBack != 0)                           
        	g_sDrvPWMHandler.pfnPWM1CallBack();	
	}

 	if (PWM->PIIR.PWMIF3)
	{ 
		PWM->PIIR.PWMIF3 = 1;
		 
		if (g_sDrvPWMHandler.pfnPWM3CallBack != 0)                           
        	g_sDrvPWMHandler.pfnPWM3CallBack();	
	}

    if (PWM->CCR0.CAPIF1) 
    {
        PWM->CCR0.CAPIF1 = 1;
		if (g_sDrvPWMHandler.pfnCAP1CallBack != 0)
        {
        	g_sDrvPWMHandler.pfnCAP1CallBack();
        }
	}
    
    if (PWM->CCR1.CAPIF3) 
    {
        PWM->CCR1.CAPIF3 = 1;
		if (g_sDrvPWMHandler.pfnCAP3CallBack != 0)
        {
        	g_sDrvPWMHandler.pfnCAP3CallBack();
        }
	}
}

/*---------------------------------------------------------------------------------------------------------*/
/* Function: DrvPWM_IsTimerEnabled                                                                         */
/*                                                                                                         */
/* Parameters:                                                                                             */
/*               u8Timer - [in]		DRVPWM_TIMER0/DRVPWM_TIMER1/DRVPWM_TIMER2/DRVPWM_TIMER3                */
/*                                                                                                         */
/* Returns:                                                                                                */
/*               0		disable                                                                            */
/*               1		enable	                                                                           */
/* Description:                                                                                            */
/*               This function is used to get PWM specified timer enable/disable state  	               */
/*---------------------------------------------------------------------------------------------------------*/
int32_t DrvPWM_IsTimerEnabled(uint8_t u8Timer)
{
	int32_t status;

	status = 0;
	switch (u8Timer)
	{
		case DRVPWM_TIMER0:
			status = PWM->PCR.CH0EN;
			break;
		case DRVPWM_TIMER1:
			status = PWM->PCR.CH1EN;				
			break;
		case DRVPWM_TIMER2:
			status = PWM->PCR.CH2EN;
			break;																	  
		case DRVPWM_TIMER3:
			status = PWM->PCR.CH3EN;
			break;
	}
	return status;
}


/*---------------------------------------------------------------------------------------------------------*/
/* Function: DrvPWM_SetTimerCounter                                                                        */
/*                                                                                                         */
/* Parameters:                                                                                             */
/*               u8Timer 		- [in]		DRVPWM_TIMER0/DRVPWM_TIMER1/DRVPWM_TIMER2/DRVPWM_TIMER3        */
/*               u16Counter     - [in]      Timer counter : 0~65535                                        */
/* Returns:                                                                                                */
/*               None	                                                                           		   */
/* Description:                                                                                            */
/*               This function is used to set the PWM specified timer counter 			           		   */
/*---------------------------------------------------------------------------------------------------------*/
void DrvPWM_SetTimerCounter(uint8_t u8Timer, uint16_t u16Counter)
{	
	*((__IO uint32_t *) (PWM_CNR0 + (u8Timer & 0x7) * 12)) = u16Counter;
}


/*---------------------------------------------------------------------------------------------------------*/
/* Function: DrvPWM_GetTimerCounter                                                                        */
/*                                                                                                         */
/* Parameters:                                                                                             */
/*               u8Timer 		- [in]		DRVPWM_TIMER0/DRVPWM_TIMER1/DRVPWM_TIMER2/DRVPWM_TIMER3        */
/*              											                                        	   */
/* Returns:                                                                                                */
/*               The specified timer counter value                                                         */
/*              											                                        	   */
/* Description:                                                                                            */
/*               This function is used to get the PWM specified timer counter value 		               */
/*---------------------------------------------------------------------------------------------------------*/
uint32_t DrvPWM_GetTimerCounter(uint8_t u8Timer)
{
	return *((__IO uint32_t *) (PWM_PDR0 + (u8Timer & 0x7) * 12));
}


/*---------------------------------------------------------------------------------------------------------*/
/* Function: DrvPWM_EnableInt		                                                                       */
/*                                                                                                         */
/* Parameters:                                                                                             */
/*               u8Timer 		- [in]		DRVPWM_TIMER0/DRVPWM_TIMER1/DRVPWM_TIMER2/DRVPWM_TIMER3        */
/*         									DRVPWM_CAP0/DRVPWM_CAP1/DRVPWM_CAP2/DRVPWM_CAP3        		   */
/*               u8Int	 		- [in]		DRVPWM_CAP_RISING_INT/DRVPWM_CAP_FALLING_INT/DRVPWM_CAP_ALL_INT*/
/*              					        (The parameter is valid only when capture function)	       	   */
/*               pfncallback	- [in]		The call back function for specified timer / capture		   */
/*              											                                        	   */
/* Returns:                                                                                                */
/*               None                                                                            		   */
/*               			                                                                          	   */
/* Description:                                                                                            */
/*               This function is used to Enable the PWM timer/capture interrupt 		                   */
/*---------------------------------------------------------------------------------------------------------*/
void DrvPWM_EnableInt(uint8_t u8Timer, uint8_t u8Int, PFN_DRVPWM_CALLBACK pfncallback)
{
	IRQn_Type intNum = PWMA_IRQn;
	
	int32_t Rflag, Fflag;	

	if (u8Timer & 0x10)
	{		
		Rflag = u8Int & 0x01;
		Fflag = u8Int & 0x02;
		
		switch (u8Timer)
		{
			case DRVPWM_CAP0:
				if (Rflag)
					PWM->CCR0.CRL_IE0 = 1;
				if (Fflag)
					PWM->CCR0.CFL_IE0 = 1;			
				break;
			case DRVPWM_CAP1:
				if (Rflag)
					PWM->CCR0.CRL_IE1 = 1;
				if (Fflag)
					PWM->CCR0.CFL_IE1 = 1;
				break;
			case DRVPWM_CAP2:
				if (Rflag)
					PWM->CCR1.CRL_IE2 = 1;
				if (Fflag)
					PWM->CCR1.CFL_IE2 = 1;
				break;																	  
			case DRVPWM_CAP3:
				if (Rflag)
					PWM->CCR1.CRL_IE3 = 1;
				if (Fflag)
					PWM->CCR1.CFL_IE3 = 1;
				break;
		}	
	}
	else
	{
		
		switch (u8Timer)
		{
			case DRVPWM_TIMER0:
				PWM->PIER.PWMIE0 = 1;
				break;
			case DRVPWM_TIMER1:
				PWM->PIER.PWMIE1 = 1;
				break;
			case DRVPWM_TIMER2:
				PWM->PIER.PWMIE2 = 1;
				break;																	  
			case DRVPWM_TIMER3:
				PWM->PIER.PWMIE3 = 1;
				break;
		}
	}

	switch (u8Timer)
	{	
		case DRVPWM_TIMER0:
		case DRVPWM_CAP0:			
		    if (u8Timer & 0x10)
		       	g_sDrvPWMHandler.pfnCAP0CallBack = pfncallback;
		    else
		        g_sDrvPWMHandler.pfnPWM0CallBack = pfncallback;
			intNum = PWMA_IRQn;
			break;
		case DRVPWM_TIMER1:
		case DRVPWM_CAP1:		
		    if (u8Timer & 0x10)
		       	g_sDrvPWMHandler.pfnCAP1CallBack = pfncallback;
		    else
		       	g_sDrvPWMHandler.pfnPWM1CallBack = pfncallback;
			intNum = PWMB_IRQn;
			break;
		case DRVPWM_TIMER2:
		case DRVPWM_CAP2:
		    if (u8Timer & 0x10)
		       	g_sDrvPWMHandler.pfnCAP2CallBack = pfncallback;
		    else
		       	g_sDrvPWMHandler.pfnPWM2CallBack = pfncallback;
			intNum = PWMA_IRQn;
			break;
		case DRVPWM_TIMER3:
		case DRVPWM_CAP3:
		    if (u8Timer & 0x10)
		       	g_sDrvPWMHandler.pfnCAP3CallBack = pfncallback;
		    else
		       	g_sDrvPWMHandler.pfnPWM3CallBack = pfncallback;
			intNum = PWMB_IRQn;
			break;									
	}

	NVIC_EnableIRQ(intNum); 
}

/*---------------------------------------------------------------------------------------------------------*/
/* Function: DrvPWM_DisableInt		                                                                       */
/*                                                                                                         */
/* Parameters:                                                                                             */
/*               u8Timer 		- [in]		DRVPWM_TIMER0/DRVPWM_TIMER1/DRVPWM_TIMER2/DRVPWM_TIMER3        */
/*         									DRVPWM_CAP0/DRVPWM_CAP1/DRVPWM_CAP2/DRVPWM_CAP3        		   */
/*               u8Int	 		- [in]		DRVPWM_CAP_RISING_INT/DRVPWM_CAP_FALLING_INT/DRVPWM_CAP_ALL_INT*/
/*              											                                        	   */
/* Returns:                                                                                                */
/*               None                                                                            		   */
/*               			                                                                          	   */
/* Description:                                                                                            */
/*               This function is used to clear the PWM timer/capture interrupt 		                   */
/*---------------------------------------------------------------------------------------------------------*/
void DrvPWM_DisableInt(uint8_t u8Timer)
{   
	IRQn_Type intNum = PWMA_IRQn;
	
	if (u8Timer & 0x10)
	{
		switch (u8Timer)
		{
			case DRVPWM_CAP0:
			case DRVPWM_CAP2:
				PWM->CCR0.CRL_IE0 = 0;
				PWM->CCR0.CFL_IE0 = 0;
				PWM->CCR1.CRL_IE2 = 0;
				PWM->CCR1.CFL_IE2 = 0;			
				break;
			
			case DRVPWM_CAP1:
			case DRVPWM_CAP3:
				PWM->CCR0.CRL_IE1 = 0;
				PWM->CCR0.CFL_IE1 = 0;
				PWM->CCR1.CRL_IE3 = 0;
				PWM->CCR1.CFL_IE3 = 0;				
				break;
		}
	}
	else
	{		    
		if (u8Timer & 0x01)
		{
			PWM->PIER.PWMIE1 = 0;
			PWM->PIER.PWMIE3 = 0;
			PWM->PIIR.PWMIF1 = 1;
			PWM->PIIR.PWMIF3 = 1;		
		}
		else
		{
			PWM->PIER.PWMIE0 = 0;
			PWM->PIER.PWMIE2 = 0;
			PWM->PIIR.PWMIF0 = 1;
			PWM->PIIR.PWMIF1 = 1;		
		}
   	} 
	
	switch(u8Timer)
	{	
		case DRVPWM_TIMER0:
		case DRVPWM_TIMER2:
		case DRVPWM_CAP0:			 		
		case DRVPWM_CAP2:
       	    g_sDrvPWMHandler.pfnCAP0CallBack = 0;
       		g_sDrvPWMHandler.pfnPWM0CallBack = 0;				
       	    g_sDrvPWMHandler.pfnCAP2CallBack = 0;
       		g_sDrvPWMHandler.pfnPWM2CallBack = 0;
			intNum = PWMA_IRQn;
			break;
		case DRVPWM_TIMER1:
		case DRVPWM_TIMER3:
		case DRVPWM_CAP1:		
		case DRVPWM_CAP3:
       	    g_sDrvPWMHandler.pfnCAP1CallBack = 0;
       		g_sDrvPWMHandler.pfnPWM1CallBack = 0;				
       	    g_sDrvPWMHandler.pfnCAP3CallBack = 0;
       		g_sDrvPWMHandler.pfnPWM3CallBack = 0;
			intNum = PWMB_IRQn;
			break;									
	}
	
	NVIC_DisableIRQ(intNum);   
}

/*---------------------------------------------------------------------------------------------------------*/
/* Function: DrvPWM_ClearInt		                                                                       */
/*                                                                                                         */
/* Parameters:                                                                                             */
/*               u8Timer 		- [in]		DRVPWM_TIMER0/DRVPWM_TIMER1/DRVPWM_TIMER2/DRVPWM_TIMER3        */
/*         									DRVPWM_CAP0/DRVPWM_CAP1/DRVPWM_CAP2/DRVPWM_CAP3        		   */
/*              											                                        	   */
/* Returns:                                                                                                */
/*               None                                                                            		   */
/*               			                                                                          	   */
/* Description:                                                                                            */
/*               This function is used to clear the PWM timer/capture interrupt 		                   */
/*---------------------------------------------------------------------------------------------------------*/
void DrvPWM_ClearInt(uint8_t u8Timer)
{
	if (u8Timer & 0x10)
	{
		switch (u8Timer)
		{
			case DRVPWM_CAP0:
				PWM->CCR0.CAPIF0 = 1;
				break;
			case DRVPWM_CAP1:
				PWM->CCR0.CAPIF1 = 1;				
				break;
			case DRVPWM_CAP2:
				PWM->CCR1.CAPIF2 = 1;
				break;																	  
			case DRVPWM_CAP3:
				PWM->CCR1.CAPIF3 = 1;
			break;
		}			
	}
	else
	{
		switch (u8Timer)
		{
			case DRVPWM_TIMER0:
				PWM->PIIR.PWMIF0 = 1;
				break;
			case DRVPWM_TIMER1:
				PWM->PIIR.PWMIF1 = 1;				
				break;
			case DRVPWM_TIMER2:
				PWM->PIIR.PWMIF2 = 1;
				break;																	  
			case DRVPWM_TIMER3:
				PWM->PIIR.PWMIF3 = 1;
			break;
		}
	}
}

/*---------------------------------------------------------------------------------------------------------*/
/* Function: DrvPWM_GetIntFlag				                                                               */
/*                                                                                                         */
/* Parameters:                                                                                             */
/*               u8Timer 		- [in]		DRVPWM_TIMER0/DRVPWM_TIMER1/DRVPWM_TIMER2/DRVPWM_TIMER3        */
/*         									DRVPWM_CAP0/DRVPWM_CAP1/DRVPWM_CAP2/DRVPWM_CAP3        		   */
/*              											                                        	   */
/* Returns:                                                                                                */
/*               0		FALSE                                                                              */
/*               1		TRUE		                                                                       */
/* Description:                                                                                            */
/*               This function is used to get the PWM timer/capture interrupt flag 		                   */
/*---------------------------------------------------------------------------------------------------------*/
int32_t DrvPWM_GetIntFlag(uint8_t u8Timer)
{
	int32_t status;
	
	status = 0;	

	if (u8Timer & 0x10)
	{
		switch (u8Timer)
		{
			case DRVPWM_CAP0:
				status = PWM->CCR0.CAPIF0;
				break;
			case DRVPWM_CAP1:
				status = PWM->CCR0.CAPIF1;				
				break;
			case DRVPWM_CAP2:
				status = PWM->CCR1.CAPIF2;
				break;																	  
			case DRVPWM_CAP3:
				status = PWM->CCR1.CAPIF3;
			break;
		}		
	}
	else
	{
		switch (u8Timer)
		{
			case DRVPWM_TIMER0:
				status = PWM->PIIR.PWMIF0;
				break;
			case DRVPWM_TIMER1:
				status = PWM->PIIR.PWMIF1;				
				break;
			case DRVPWM_TIMER2:
				status = PWM->PIIR.PWMIF2;
				break;																	  
			case DRVPWM_TIMER3:
				status = PWM->PIIR.PWMIF3;
			break;
		}	
	}
	return status;		
}


/*---------------------------------------------------------------------------------------------------------*/
/* Function: DrvPWM_GetRisingCounter				                                                       */
/*                                                                                                         */
/* Parameters:                                                                                             */
/*               u8Capture 		- [in]		DRVPWM_CAP0/DRVPWM_CAP1/DRVPWM_CAP2/DRVPWM_CAP3	       		   */
/*              											                                        	   */
/* Returns:                                                                                                */
/*               The value which latches the counter when there・s a rising transition                      */
/*               							                                                               */
/* Description:                                                                                            */
/*               This function is used to get value which latches the counter when there・s a rising 	   */		
/*				 transition		                   														   */
/*---------------------------------------------------------------------------------------------------------*/
uint16_t DrvPWM_GetRisingCounter(uint8_t u8Capture)
{
	return *((__IO uint32_t *) (PWM_CRLR0 + ((u8Capture & 0x7) << 3)));
}


/*---------------------------------------------------------------------------------------------------------*/
/* Function: DrvPWM_GetFallingCounter				                                                       */
/*                                                                                                         */
/* Parameters:                                                                                             */
/*               u8Capture 		- [in]		DRVPWM_CAP0/DRVPWM_CAP1/DRVPWM_CAP2/DRVPWM_CAP3	       		   */
/*              											                                        	   */
/* Returns:                                                                                                */
/*               The value which latches the counter when there・s a falling transition                     */
/*               							                                                               */
/* Description:                                                                                            */
/*               This function is used to get value which latches the counter when there・s a falling 	   */		
/*				 transition		                   														   */
/*---------------------------------------------------------------------------------------------------------*/
uint16_t DrvPWM_GetFallingCounter(uint8_t u8Capture)
{
	return *((__IO uint32_t *) (PWM_CFLR0 + ((u8Capture & 0x7) << 3)));
}

/*---------------------------------------------------------------------------------------------------------*/
/* Function: DrvPWM_GetCaptureIntStatus				                                                       */
/*                                                                                                         */
/* Parameters:                                                                                             */
/*               u8Capture 		- [in]		DRVPWM_CAP0/DRVPWM_CAP1/DRVPWM_CAP2/DRVPWM_CAP3	       		   */
/*               u8IntType 		- [in]		DRVPWM_CAP_RISING_FLAG/DRVPWM_CAP_FALLING_FLAG	       		   */
/*              											                                        	   */
/* Returns:                                                                                                */
/*               Check if there・s a rising / falling transition                    				     	   */
/*               							                                                               */
/* Description:                                                                                            */
/*               This function is used to get the rising / falling transition interrupt flag			   */		
/*---------------------------------------------------------------------------------------------------------*/
int32_t DrvPWM_GetCaptureIntStatus(uint8_t u8Capture, uint8_t u8IntType)
{	
	int32_t status;

	status = 0;	

	switch (u8Capture)
	{
		case DRVPWM_CAP0:
			status = (u8IntType == DRVPWM_CAP_RISING_FLAG)? PWM->CCR0.CRLRI0 : PWM->CCR0.CFLRI0;
			break;
		case DRVPWM_CAP1:
			status = (u8IntType == DRVPWM_CAP_RISING_FLAG)? PWM->CCR0.CRLRI1 : PWM->CCR0.CFLRI1;
			break;
		case DRVPWM_CAP2:
			status = (u8IntType == DRVPWM_CAP_RISING_FLAG)? PWM->CCR1.CRLRI2 : PWM->CCR1.CFLRI2;
			break;																	  
		case DRVPWM_CAP3:
			status = (u8IntType == DRVPWM_CAP_RISING_FLAG)? PWM->CCR1.CRLRI3 : PWM->CCR1.CFLRI3;
			break;
	}

	return status;
}

/*---------------------------------------------------------------------------------------------------------*/
/* Function: DrvPWM_ClearCaptureIntStatus				                                                   */
/*                                                                                                         */
/* Parameters:                                                                                             */
/*               u8Capture 		- [in]		DRVPWM_CAP0/DRVPWM_CAP1/DRVPWM_CAP2/DRVPWM_CAP3	       		   */
/*               u8IntType 		- [in]		DRVPWM_CAP_RISING_FLAG/DRVPWM_CAP_FALLING_FLAG	       		   */
/*              											                                        	   */
/* Returns:                                                                                                */
/*               Clear the rising / falling transition interrupt flag	                    		       */
/*               							                                                               */
/* Description:                                                                                            */
/*               This function is used to clear the rising / falling transition interrupt flag		 	   */		
/*---------------------------------------------------------------------------------------------------------*/
void DrvPWM_ClearCaptureIntStatus(uint8_t u8Capture, uint8_t u8IntType)
{
	switch (u8Capture)
	{
		case DRVPWM_CAP0:
			(u8IntType == DRVPWM_CAP_RISING_FLAG)? (PWM->CCR0.CRLRI0 = 0) :	(PWM->CCR0.CFLRI0 = 0);
			break;
		case DRVPWM_CAP1:
			(u8IntType == DRVPWM_CAP_RISING_FLAG)? (PWM->CCR0.CRLRI1 = 0) :	(PWM->CCR0.CFLRI1 = 0);
			break;
		case DRVPWM_CAP2:
			(u8IntType == DRVPWM_CAP_RISING_FLAG)? (PWM->CCR1.CRLRI2 = 0) :	(PWM->CCR1.CFLRI2 = 0);
			break;																	  
		case DRVPWM_CAP3:
			(u8IntType == DRVPWM_CAP_RISING_FLAG)? (PWM->CCR1.CRLRI3 = 0) :	(PWM->CCR1.CFLRI3 = 0);
			break;
	} 
}

/*---------------------------------------------------------------------------------------------------------*/
/* Function: DrvPWM_Open				                                                   				   */
/*                                                                                                         */
/* Parameters:                                                                                             */
/*               None             											                               */
/*              											                                        	   */
/* Returns:                                                                                                */
/*               None 											                    		       		   */
/*               							                                                               */
/* Description:                                                                                            */
/*               Enable PWM engine clock and reset PWM											 	   	   */		
/*---------------------------------------------------------------------------------------------------------*/
void DrvPWM_Open(void)
{ 
	SYSCLK->APBCLK.PWM01_EN = 1;
	SYSCLK->APBCLK.PWM23_EN = 1;
	SYS->IPRSTC2.PWM_RST = 1;
	SYS->IPRSTC2.PWM_RST = 0;
}

/*---------------------------------------------------------------------------------------------------------*/
/* Function: DrvPWM_Close				                                                   				   */
/*                                                                                                         */
/* Parameters:                                                                                             */
/*               None             											                               */
/*              											                                        	   */
/* Returns:                                                                                                */
/*               None 											                    		       		   */
/*               							                                                               */
/* Description:                                                                                            */
/*               Disable PWM engine clock and the I/O enable											   */		
/*---------------------------------------------------------------------------------------------------------*/
void DrvPWM_Close(void)
{
	PWM->POE.PWM0 = 0;
	PWM->POE.PWM1 = 0;
	PWM->POE.PWM2 = 0;
	PWM->POE.PWM3 = 0;
	PWM->CAPENR = 0;

	NVIC_DisableIRQ(PWMA_IRQn);
	NVIC_DisableIRQ(PWMB_IRQn);
	SYSCLK->APBCLK.PWM01_EN = 0;
	SYSCLK->APBCLK.PWM23_EN = 0;
}

/*---------------------------------------------------------------------------------------------------------*/
/* Function: DrvPWM_EnableDeadZone				                                             		       */
/*                                                                                                         */
/* Parameters:                                                                                             */
/*               u8Timer 		   - [in]	DRVPWM_TIMER0/DRVPWM_TIMER1/DRVPWM_TIMER2/DRVPWM_TIMER3        */
/*               u8Length 		   - [in]	Dead Zone Length : 0~255				       		   		   */
/*               i32EnableDeadZone - [in]	Enable DeadZone (1) / Diasble DeadZone (0)     		           */
/*              											                                        	   */
/* Returns:                                                                                                */
/*               None											                    		               */
/*               							                                                               */
/* Description:                                                                                            */
/*               This function is used to set the dead zone length and enable/disable Dead Zone function   */		
/*---------------------------------------------------------------------------------------------------------*/
void DrvPWM_EnableDeadZone(uint8_t u8Timer, uint8_t u8Length, int32_t i32EnableDeadZone)
{
	if (u8Timer & 0x02)
	{
		PWM->PPR.DZI1  = u8Length;
		PWM->PCR.DZEN1 = i32EnableDeadZone;
	}
	else
	{
		PWM->PPR.DZI0  = u8Length;
		PWM->PCR.DZEN0 = i32EnableDeadZone;
	}	
}

/*---------------------------------------------------------------------------------------------------------*/
/* Function: DrvPWM_Enable				                            		                 		       */
/*                                                                                                         */
/* Parameters:                                                                                             */
/*               u8Timer 		- [in]		DRVPWM_TIMER0/DRVPWM_TIMER1/DRVPWM_TIMER2/DRVPWM_TIMER3        */
/*         									DRVPWM_CAP0/DRVPWM_CAP1/DRVPWM_CAP2/DRVPWM_CAP3        		   */
/*               i32Enable		- [in]		Enable  (1) / Disable  (0)     					       		   */
/*              											                                        	   */
/* Returns:                                                                                                */
/*               None											                    		               */
/*               							                                                               */
/* Description:                                                                                            */
/*               This function is used to enable PWM timer / capture function					 		   */		
/*---------------------------------------------------------------------------------------------------------*/
void DrvPWM_Enable(uint8_t u8Timer, int32_t i32Enable)
{
	switch (u8Timer & 0x07)
	{
		case DRVPWM_TIMER0:
			PWM->PCR.CH0EN = i32Enable;
			break;
		case DRVPWM_TIMER1:
			PWM->PCR.CH1EN = i32Enable;
			break;
		case DRVPWM_TIMER2:
			PWM->PCR.CH2EN = i32Enable;
			break;
		case DRVPWM_TIMER3:
			PWM->PCR.CH3EN = i32Enable;
			break;
	} 	

	if (u8Timer & 0x10)
	{
		switch (u8Timer)
		{
			case DRVPWM_CAP0:
				PWM->CCR0.CAPCH0EN = i32Enable;
				break;
			case DRVPWM_CAP1:
				PWM->CCR0.CAPCH1EN = i32Enable;
				break;
			case DRVPWM_CAP2:
				PWM->CCR1.CAPCH2EN = i32Enable;	
				break;																	  
			case DRVPWM_CAP3:
				PWM->CCR1.CAPCH3EN = i32Enable;				
				break;
		}
	}
}

/*---------------------------------------------------------------------------------------------------------*/
/* Function: DrvPWM_SetTimerClk					                                             		       */
/*                                                                                                         */
/* Parameters:                                                                                             */
/*               u8Timer 						DRVPWM_TIMER0/DRVPWM_TIMER1/DRVPWM_TIMER2/DRVPWM_TIMER3    */
/*         										DRVPWM_CAP0/DRVPWM_CAP1/DRVPWM_CAP2/DRVPWM_CAP3        	   */
/*				 S_DRVPWM_TIME_DATA_T *sPt																   */
/*               u8Frequency					Frequency   					       					   */
/*               u8HighPulseRatio				High Pulse Ratio    					       			   */
/*               u8Mode							DRVPWM_ONE_SHOT_MODE / DRVPWM_TOGGLE_MODE 				   */
/*               bInverter						Inverter Enable  (TRUE) / Inverter Disable  (FALSE)        */
/*               u8ClockSelector				Clock Selector											   */
/*              								DRVPWM_CLOCK_DIV_1/DRVPWM_CLOCK_DIV_2/DRVPWM_CLOCK_DIV_4   */
/*              								DRVPWM_CLOCK_DIV_8/DRVPWM_CLOCK_DIV_16					   */
/*												(The parameter takes effect when u8Frequency = 0)		   */
/*               u8PreScale						Prescale (2 ~ 256)										   */ 
/*												(The parameter takes effect when u8Frequency = 0)		   */
/*               u32Duty						Pulse duty										           */                             
/*												(The parameter takes effect when u8Frequency = 0 or		   */
/*												u8Timer = DRVPWM_CAP0/DRVPWM_CAP1/DRVPWM_CAP2/DRVPWM_CAP3) */	
/*              											                                        	   */
/* Returns:                                                                                                */
/*               The actual frequency											                           */
/*               							                                                               */
/* Description:                                                                                            */
/*               This function is used to configure the frequency/pulse/mode/inverter function		       */		
/*---------------------------------------------------------------------------------------------------------*/
uint32_t DrvPWM_SetTimerClk(uint8_t u8Timer, S_DRVPWM_TIME_DATA_T *sPt)
{
	uint32_t 	u32Frequency;
	uint32_t	u32Freqout;
	uint16_t	u16Duty, u16cnrData, u16cmrData;
	uint8_t	    u8EngineClk;
		
	if (u8Timer & 0x2)
		u8EngineClk = SYSCLK->CLKSEL1.PWM32_S;	
	else
		u8EngineClk = SYSCLK->CLKSEL1.PWM10_S;

	if (u8EngineClk == 0)		 /* external 12MHz crystal clock	*/
	{
		u32Freqout = 12000000;	
	}
	else if(u8EngineClk == 1)    /* external 32KHz crystal clock */
	{
		u32Freqout = 32000;
	}
	else if(u8EngineClk == 2)	 /* HCLK clock */
	{
		u32Freqout = DrvSYS_GetHCLK()*1000;
	}
	else						 /* internal 22MHz oscillator clock */
	{
	 	u32Freqout = 22000000;	
	}


	if (u8Timer & 0x10)	
	{
		if (u8Timer & 0x02)
		{
			if (u8Timer & 0x01)
			{
				PWM->CCR1.INV3 = sPt->i32Inverter;
			}
			else
			{
				PWM->CCR1.INV2 = sPt->i32Inverter;
			}
		}
		else
		{
			if (u8Timer & 0x01)
			{
				PWM->CCR0.INV1 = sPt->i32Inverter;
			}
			else
			{
				PWM->CCR0.INV0 = sPt->i32Inverter;
			}		
		}
	}
	else
	{
		switch (u8Timer)
		{
			case DRVPWM_TIMER0:
				PWM->PCR.CH0INV = sPt->i32Inverter;
				break;
			case DRVPWM_TIMER1:
				PWM->PCR.CH1INV = sPt->i32Inverter;
				break;
			case DRVPWM_TIMER2:
				PWM->PCR.CH2INV = sPt->i32Inverter;
				break;
			case DRVPWM_TIMER3:
				PWM->PCR.CH3INV = sPt->i32Inverter;
				break;
		} 
	}
	switch (u8Timer & 0x07)
	{
		case DRVPWM_TIMER0:
			PWM->PCR.CH0MOD = sPt->u8Mode;
			break;
		case DRVPWM_TIMER1:
			PWM->PCR.CH1MOD = sPt->u8Mode;
			break;
		case DRVPWM_TIMER2:
			PWM->PCR.CH2MOD = sPt->u8Mode;
			break;
		case DRVPWM_TIMER3:
			PWM->PCR.CH3MOD = sPt->u8Mode;
			break;
	} 
			
	if (sPt->u32Frequency == 0)
	{	
		uint8_t	u8Divider = 1;
		uint32_t u32duty;
		
		if (u8Timer & 0x02)
		{	
			PWM->PPR.CP1 = sPt->u8PreScale - 1;
		}
		else
		{	
			PWM->PPR.CP0 = sPt->u8PreScale - 1;
		}

		u32duty = sPt->u32Duty * sPt->u8HighPulseRatio / 100 - 1;
		
		switch (u8Timer & 0x07)
		{
			case DRVPWM_TIMER0:
				PWM->CSR.CSR0 = sPt->u8ClockSelector;
				PWM->CNR0 = sPt->u32Duty - 1;
				PWM->CMR0 = u32duty;
				break;
			case DRVPWM_TIMER1:
				PWM->CSR.CSR1 = sPt->u8ClockSelector;
				PWM->CNR1 = sPt->u32Duty - 1;
				PWM->CMR1 = u32duty;
				break;
			case DRVPWM_TIMER2:
				PWM->CSR.CSR2 = sPt->u8ClockSelector;
				PWM->CNR2 = sPt->u32Duty - 1;
				PWM->CMR2 = u32duty;
				break;
			case DRVPWM_TIMER3:
				PWM->CSR.CSR3 = sPt->u8ClockSelector;
				PWM->CNR3 = sPt->u32Duty - 1;
				PWM->CMR3 = u32duty;
				break;
		}
				
		switch (sPt->u8ClockSelector)
		{
			case DRVPWM_CLOCK_DIV_1:
				u8Divider = 1;
				break;
			case DRVPWM_CLOCK_DIV_2:
				u8Divider = 2;			
				break;			
			case DRVPWM_CLOCK_DIV_4:
				u8Divider = 4;			
				break;			
			case DRVPWM_CLOCK_DIV_8:
				u8Divider = 8;			
				break;			
			case DRVPWM_CLOCK_DIV_16: 
				u8Divider = 16;			
				break;		
		}		
		
		u32Frequency = u32Freqout / sPt->u8PreScale / u8Divider / sPt->u32Duty;
	}
	else
	{
		uint8_t	 u8Divider;
		uint16_t u16PreScale;
		
		u32Frequency =  u32Freqout / sPt->u32Frequency;		
		
		if (u32Frequency > 0x10000000)
			return 0;
			
		u8Divider = 1;			
			
		if (u32Frequency < 0x20000)
			u16PreScale = 2;	
		else
		{
			u16PreScale = u32Frequency / 65536;	
							
			if (u32Frequency / u16PreScale > 65536)
				u16PreScale++;
			
			if (u16PreScale > 256)
			{
				uint8_t u8i = 0;
				
				u16PreScale = 256;
				u32Frequency = u32Frequency / u16PreScale;
				
				u8Divider = u32Frequency / 65536;				
				
				if(u32Frequency / u8Divider > 65536)
					u8Divider++;				
				
				while(1)	
				{
					if((1 << u8i++) > u8Divider)
						break;
				}
				
				u8Divider = 1 << (u8i - 1);
				
				if (u8Divider > 16)
					return 0;	
					
				u32Frequency = u32Frequency * u16PreScale;						
			}		
					
		}
		u16Duty = (uint16_t )(u32Frequency/u16PreScale/u8Divider);
		
		u32Frequency = (u32Freqout / u16PreScale / u8Divider) / u16Duty;	
				
		if (u8Timer & 0x02)
		{	
			PWM->PPR.CP1 = u16PreScale - 1;
		}
		else
		{	
			PWM->PPR.CP0 = u16PreScale - 1;
		}		

		switch(u8Divider)
		{
			case 1:
				u8Divider = DRVPWM_CLOCK_DIV_1;
				break;
			case 2:
				u8Divider = DRVPWM_CLOCK_DIV_2;			
				break;			
			case 4:
				u8Divider = DRVPWM_CLOCK_DIV_4;			
				break;			
			case 8:
				u8Divider = DRVPWM_CLOCK_DIV_8;			
				break;			
			case 16:
				u8Divider = DRVPWM_CLOCK_DIV_16;			
				break;		
		}				
					
		if (u8Timer & 0x10)
		{
			u16cnrData = sPt->u32Duty - 1; 
			u16cmrData = sPt->u32Duty * sPt->u8HighPulseRatio / 100 - 1;		
		}
		else
		{
		 	u16cnrData = u16Duty - 1;
			u16cmrData = u16Duty * sPt->u8HighPulseRatio / 100 - 1;
		}
		
		switch (u8Timer & 0x07)
		{
			case DRVPWM_TIMER0:
				PWM->CSR.CSR0 = u8Divider;
				PWM->CNR0 = u16cnrData;
				PWM->CMR0 = u16cmrData;
				break;
			case DRVPWM_TIMER1:
				PWM->CSR.CSR1 = u8Divider;
				PWM->CNR1 = u16cnrData;
				PWM->CMR1 = u16cmrData;
				break;
			case DRVPWM_TIMER2:
				PWM->CSR.CSR2 = u8Divider;
				PWM->CNR2 = u16cnrData;
				PWM->CMR2 = u16cmrData;
				break;
			case DRVPWM_TIMER3:
				PWM->CSR.CSR3 = u8Divider;
				PWM->CNR3 = u16cnrData;
				PWM->CMR3 = u16cmrData;
				break;
		}
	}
	
	return u32Frequency;
}

/*---------------------------------------------------------------------------------------------------------*/
/* Function: DrvPWM_SetTimerIO				                                             		           */
/*                                                                                                         */
/* Parameters:                                                                                             */
/*               u8Timer 		- [in]		DRVPWM_TIMER0/DRVPWM_TIMER1/DRVPWM_TIMER2/DRVPWM_TIMER3        */
/*         									DRVPWM_CAP0/DRVPWM_CAP1/DRVPWM_CAP2/DRVPWM_CAP3        		   */
/*               i32Enable		- [in]		Enable  (1) / Diasble  (0)     					       		   */
/*              											                                        	   */
/* Returns:                                                                                                */
/*               None											                    		               */
/*               							                                                               */
/* Description:                                                                                            */
/*               This function is used to enable/disable PWM timer / capture I/O function				   */		
/*---------------------------------------------------------------------------------------------------------*/
void DrvPWM_SetTimerIO(uint8_t u8Timer, int32_t i32Enable)
{
	if (i32Enable)
	{
		if (u8Timer & 0x10)
		{
			PWM->CAPENR = PWM->CAPENR | (1 << (u8Timer & 0x07));
		}
		else
		{
			switch (u8Timer)
			{
				case DRVPWM_TIMER0:
					PWM->POE.PWM0 = 1;
					break;
				case DRVPWM_TIMER1:
					PWM->POE.PWM1 = 1;				
					break;
				case DRVPWM_TIMER2:
					PWM->POE.PWM2 = 1;
					break;																	  
				case DRVPWM_TIMER3:
					PWM->POE.PWM3 = 1;
					break;
			}		
		}
	}
	else
	{
		if (u8Timer & 0x10)			
		{
			PWM->CAPENR = PWM->CAPENR & ~(1 << (u8Timer & 0x07));			
		}
		else
		{
			switch (u8Timer)
			{
				case DRVPWM_TIMER0:
					PWM->POE.PWM0 = 0;
					break;
				case DRVPWM_TIMER1:
					PWM->POE.PWM1 = 0;				
					break;
				case DRVPWM_TIMER2:
					PWM->POE.PWM2 = 0;
					break;																	  
				case DRVPWM_TIMER3:
					PWM->POE.PWM3 = 0;
					break;
			}	
		}
	}
}

/*---------------------------------------------------------------------------------------------------------*/
/* Function: DrvPWM_SelectClockSource				                                             		           */
/*                                                                                                         */
/* Parameters:                                                                                             */
/*           u8Timer 		        - [in] DRVPWM_TIMER0/DRVPWM_TIMER1/DRVPWM_TIMER2/DRVPWM_TIMER3         */
/*           u8ClockSourceSelector  - [in] DRVPWM_EXT_12M/DRVPWM_EXT_32K/DRVPWM_HCLK/DRVPWM_INTERNAL_22M   */
/*              											                                        	   */
/* Returns:                                                                                                */
/*               None											                    		               */
/*               							                                                               */
/* Description:                                                                                            */
/*               This function is used to select PWM clock source                                   	   */		
/*---------------------------------------------------------------------------------------------------------*/
void DrvPWM_SelectClockSource(uint8_t u8Timer, uint8_t u8ClockSourceSelector)
{
	if (u8Timer & 0x02)
	{
		SYSCLK->CLKSEL1.PWM32_S = u8ClockSourceSelector;
	}
	else
	{
	    SYSCLK->CLKSEL1.PWM10_S = u8ClockSourceSelector;
	}
}
