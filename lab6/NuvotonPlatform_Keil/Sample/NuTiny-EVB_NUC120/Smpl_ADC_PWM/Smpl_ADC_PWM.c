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
#include "Driver\DrvPWM.h"
#include "Driver\DrvADC.h"

void InitADC(void)
{
	/* Step 1. GPIO initial */ 
	GPIOA->OFFD|=0x00800000; 	//Disable digital input path
	SYS->GPAMFP.ADC7_SS21_AD6=1; 		//Set ADC function 
				
	/* Step 2. Enable and Select ADC clock source, and then enable ADC module */          
	SYSCLK->CLKSEL1.ADC_S = 2;	//Select 22Mhz for ADC
	SYSCLK->CLKDIV.ADC_N = 1;	//ADC clock source = 22Mhz/2 =11Mhz;
	SYSCLK->APBCLK.ADC_EN = 1;	//Enable clock source
	ADC->ADCR.ADEN = 1;			//Enable ADC module

	/* Step 3. Select Operation mode */
	ADC->ADCR.DIFFEN = 0;     	//single end input
	ADC->ADCR.ADMD   = 0;     	//single mode
		
	/* Step 4. Select ADC channel */
	ADC->ADCHER.CHEN = 0x80;
	
	/* Step 5. Enable ADC interrupt */
	ADC->ADSR.ADF =1;     		//clear the A/D interrupt flags for safe 
	ADC->ADCR.ADIE = 1;
//	NVIC_EnableIRQ(ADC_IRQn);
	
	/* Step 6. Enable WDT module */
	ADC->ADCR.ADST=1;
}
//--------------------------------------------
void InitPWM(void)
{
 	/* Step 1. GPIO initial */ 
	SYS->GPAMFP.PWM0_AD13=1;
				
	/* Step 2. Enable and Select PWM clock source*/		
	SYSCLK->APBCLK.PWM01_EN = 3;//Enable PWM clock
	SYSCLK->CLKSEL1.PWM01_S = 3;//Select 22.1184Mhz for PWM clock source

	PWMA->PPR.CP01=1;			//Prescaler 0~255, Setting 0 to stop output clock
	PWMA->CSR.CSR0=0;			// PWM clock = clock source/(Prescaler + 1)/divider
				         
	/* Step 3. Select PWM Operation mode */
	//PWM0
	PWMA->PCR.CH0MOD=1;			//0:One-shot mode, 1:Auto-load mode
								//CNR and CMR will be auto-cleared after setting CH0MOD form 0 to 1.
	PWMA->CNR0=0xFFFF;
	PWMA->CMR0=0xFFFF;

	PWMA->PCR.CH0INV=0;			//Inverter->0:off, 1:on
	PWMA->PCR.CH0EN=1;			//PWM function->0:Disable, 1:Enable
 	PWMA->POE.PWM0=1;			//Output to pin->0:Diasble, 1:Enable
}

void Delay(int count)
{
	while(count--)
	{
//		__NOP;
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
	printf("ADC PWM Testing\n");

	InitPWM();
	InitADC();

	/* Synch field transmission & Request Identifier Field transmission*/
					 
	while(1)
	{
		while(ADC->ADSR.ADF==0);
		ADC->ADSR.ADF=1;
		PWMA->CMR0=ADC->ADDR[7].RSLT<<4;

		printf("ADC Value = %d\n",ADC->ADDR[7].RSLT);
		Delay(20000);
		ADC->ADCR.ADST=1;
	}
}

