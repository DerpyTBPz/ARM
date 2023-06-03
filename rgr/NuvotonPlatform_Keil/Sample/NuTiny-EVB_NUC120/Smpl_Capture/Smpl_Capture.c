/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* Copyright(c) 2009 Nuvoton Technology Corp. All rights reserved.                                         */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
#include <stdio.h>																											 
#include "NUC1xx.h"
#include "Driver\DrvSYS.h"
#include "Driver\DrvGPIO.h"
#include "Driver\DrvUART.h"

#define	PWM_CNR	0xFFFF
uint16_t	CaptureCounter=0;
uint32_t	CaptureValue[2];

void InitCapture(void)
{
 	/* Step 1. GPIO initial */ 
	SYS->GPAMFP.PWM0_AD13=1;			
	/* Step 2. Enable and Select PWM clock source*/		
	SYSCLK->APBCLK.PWM01_EN = 1;//Enable PWM clock
	SYSCLK->CLKSEL1.PWM01_S = 0;//Select 12Mhz for PWM clock source

	PWMA->PPR.CP01=11;			//Prescaler 0~255, Setting 0 to stop output clock
	PWMA->CSR.CSR0=100;			//clock divider->0:/2, 1:/4, 2:/8, 3:/16, 4:/1
									         
	/* Step 3. Select PWM Operation mode */
	PWMA->PCR.CH0MOD=1;			//0:One-shot mode, 1:Auto-load mode
								//CNR and CMR will be auto-cleared after setting CH0MOD form 0 to 1.
	PWMA->CNR0=PWM_CNR;			//Set Reload register
	PWMA->CAPENR=1;				//Enable Capture function pin
	PWMA->CCR0.CAPCH0EN=1;		//Enable Capture function

	/* Step 4. Set PWM Interrupt */
	PWMA->CCR0.CRL_IE0=1;		//Enable Capture rising edge interrupt
	PWMA->CCR0.CFL_IE0=1;		//Enable Capture falling edge interrupt
	PWMA->PIER.PWMIE0=1;		//Enable PWM interrupt for down-counter equal zero.
 	NVIC_EnableIRQ(PWMA_IRQn);  //enable PWM inturrupt

	/* Step 5. Enable PWM down counter*/
	PWMA->PCR.CH0EN=1;			//Enable PWM down counter
}
//--------------------------------------------
void InitPWM1(void)
{
 	/* Step 1. GPIO initial */ 
	SYS->GPAMFP.PWM1_AD14=1;
				
	/* Step 2. Enable and Select PWM clock source*/		
	SYSCLK->APBCLK.PWM01_EN = 1;//Enable PWM clock
	SYSCLK->CLKSEL1.PWM01_S = 0;//Select 12Mhz for PWM clock source

	PWMA->PPR.CP01=11;			//Prescaler 0~255, Setting 0 to stop output clock
	PWMA->CSR.CSR1=3;			// PWM clock = clock source/(Prescaler + 1)/divider
								//clock divider->0:/2, 1:/4, 2:/8, 3:/16, 4:/1
				         
	/* Step 3. Select PWM Operation mode */
	//PWM0
	PWMA->PCR.CH1MOD=1;			//0:One-shot mode, 1:Auto-load mode
								//CNR and CMR will be auto-cleared after setting CH0MOD form 0 to 1.
	PWMA->CNR1=0xFFFF;
	PWMA->CMR1=0x3FFF;

	PWMA->PCR.CH1INV=0;			//Inverter->0:off, 1:on
	PWMA->PCR.CH1EN=1;			//PWM function->0:Disable, 1:Enable
 	PWMA->POE.PWM1=1;			//Output to pin->0:Diasble, 1:Enable
}

void InitPWM2(void)
{
 	/* Step 1. GPIO initial */ 
	SYS->GPAMFP.PWM2_AD15=1;
				
	/* Step 2. Enable and Select PWM clock source*/		
	SYSCLK->APBCLK.PWM23_EN = 1;//Enable PWM clock
	SYSCLK->CLKSEL1.PWM23_S = 0;//Select 12Mhz for PWM clock source

	PWMA->PPR.CP23=1;			//Prescaler 0~255, Setting 0 to stop output clock
	PWMA->CSR.CSR2=4;			// PWM clock = clock source/(Prescaler + 1)/divider
				         
	/* Step 3. Select PWM Operation mode */
	//PWM0
	PWMA->PCR.CH2MOD=1;			//0:One-shot mode, 1:Auto-load mode
								//CNR and CMR will be auto-cleared after setting CH0MOD form 0 to 1.
	PWMA->CNR2=0x1FFF;
	PWMA->CMR2=0x0FFF;

	PWMA->PCR.CH2INV=0;			//Inverter->0:off, 1:on
	PWMA->PCR.CH2EN=1;			//PWM function->0:Disable, 1:Enable
 	PWMA->POE.PWM2=1;			//Output to pin->0:Diasble, 1:Enable
}



void PWMA_IRQHandler(void) // PWM interrupt subroutine 
{
	if(PWMA->PIIR.PWMIF0)
	{
		CaptureCounter++;//Delay (PWM_CNR+1) usec
		if(CaptureCounter==0)
		{
			//Overflow
		}
		PWMA->PIIR.PWMIF0=1;
	}
	if(PWMA->CCR0.CAPIF0)
	{
		if(PWMA->CCR0.CFLRI0)//Calculate High Level
		{
			CaptureValue[0]=CaptureCounter*(PWM_CNR+1)+(PWM_CNR-PWMA->CFLR0);//usec
			CaptureCounter=0;
			PWMA->CCR0.CFLRI0=0;
		}
		if(PWMA->CCR0.CRLRI0)//Calculate Low Level
		{
			CaptureValue[1]=CaptureCounter*(PWM_CNR+1)+(PWM_CNR-PWMA->CRLR0);//usec
			CaptureCounter=0;
			PWMA->CCR0.CRLRI0=0;	
		}
		PWMA->CCR0.CAPIF0=1;
	}
}



void Delay(int count)
{
	while(count--)
	{
		//__NOP;
	 }
}

/*----------------------------------------------------------------------------
  MAIN function
  ----------------------------------------------------------------------------*/
int32_t main (void)
{
	STR_UART_T sParam;

	/* Unlock the protected registers */	
	UNLOCKREG();
   	/* Enable the 12MHz oscillator oscillation */
	DrvSYS_SetOscCtrl(E_SYS_XTL12M, 1);
 
     /* Waiting for 12M Xtal stalble */
    DrvSYS_Delay(5000);
 
	/* HCLK clock source. 0: external 12MHz; 4:internal 22MHz RC oscillator */
	DrvSYS_SelectHCLKSource(0);		
    /*lock the protected registers */
	LOCKREG();				

	DrvSYS_SetClockDivider(E_SYS_HCLK_DIV, 0); /* HCLK clock frequency = HCLK clock source / (HCLK_N + 1) */

	/* Set UART Pin */
	DrvGPIO_InitFunction(E_FUNC_UART0);

 	/* UART Setting */
    sParam.u32BaudRate 		= 115200;
    sParam.u8cDataBits 		= DRVUART_DATABITS_8;
    sParam.u8cStopBits 		= DRVUART_STOPBITS_1;
    sParam.u8cParity 		= DRVUART_PARITY_NONE;
    sParam.u8cRxTriggerLevel= DRVUART_FIFO_1BYTES;

	/* Set UART Configuration */
 	if(DrvUART_Open(UART_PORT0,&sParam) != E_SUCCESS)
	{
		printf("UART0 open failed\n");
		return FALSE;
	}


	InitPWM1();
	InitPWM2();
	InitCapture();
	printf("Capture demo\n");
	printf("GPA12 and GPA13\n");
	 
	while(1)
	{
		if(CaptureValue[0]>=1000000)
		{
		   	printf("High:%dsec\n",CaptureValue[0]/1000000);
		}
		else if(CaptureValue[0]>=1000)
		{
		   	printf("High:%dmsec\n",CaptureValue[0]/1000);
		}
		else			  
			printf("High:%dusec\n",CaptureValue[0]);
		
		if(CaptureValue[1]>=1000000)
		{
		   	printf("Low:%dsec\n",CaptureValue[1]/1000000);
		}
		else if(CaptureValue[1]>=1000)
		{
		   	printf("Low:%dmsec\n",CaptureValue[1]/1000);
		}
		else			  
			printf("Low:%dusec\n",CaptureValue[1]);		
	}				 

}


