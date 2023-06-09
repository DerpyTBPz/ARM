/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* Copyright (c) Nuvoton Technology Corp. All rights reserved.                                             */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
#include <stdio.h>
#include "Driver\DrvGPIO.h"
#include "Driver\DrvSYS.h"
#include "Driver\DrvUART.h"
#include "Driver\DrvUSB.h"
#include "ScanKey.h"

extern int32_t VCOM_MainProcess(void);

void Delay(uint32_t delayCnt)
{
    while(delayCnt--)
    {
        __NOP();
        __NOP();
    }
}

/*---------------------------------------------------------------------------------------------------------*/
/*  Main Function									                                           			   */
/*---------------------------------------------------------------------------------------------------------*/
int32_t main (void)
{
    STR_UART_T sParam;

    /* Set UART Pin */
    DrvGPIO_InitFunction(E_FUNC_UART0);

    /* UART Setting */
    sParam.u32BaudRate 		= 115200;
    sParam.u8cDataBits 		= DRVUART_DATABITS_8;
    sParam.u8cStopBits 		= DRVUART_STOPBITS_1;
    sParam.u8cParity 		= DRVUART_PARITY_NONE;
    sParam.u8cRxTriggerLevel = DRVUART_FIFO_1BYTES;

    /* Select UART Clock Source From 12Mhz*/
    DrvSYS_SelectIPClockSource(E_SYS_UART_CLKSRC, 0);

    /* Set UART Configuration */
    DrvUART_Open(UART_PORT0, &sParam);

    UNLOCKREG();

    SYSCLK->PWRCON.XTL12M_EN = 1;

    /* Enable PLL */
    DrvSYS_SetPLLMode(0);
    Delay(1000);

    /* Switch to PLL clock */
    DrvSYS_SelectHCLKSource(2);
    Delay(100);

    /* Update system core clock */
    SystemCoreClockUpdate();

    /* The PLL must be 48MHz when using USB */
    printf("Initial VCOM\n");

	/* Initial Key Pad */
	OpenKeyPad();
	
    /* Execute VCOM process */
	VCOM_MainProcess();
}
