/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* Copyright(c) 2009 Nuvoton Technology Corp. All rights reserved.                                         */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
#include <stdio.h>
#include "Driver\DrvFMC.h"
#include "Driver\DrvGPIO.h"
#include "Driver\DrvUART.h"
#include "Driver\DrvSYS.h"

#define LDROM_BASE      0x00100000
#define PAGE_SIZE       512
int32_t  i32Err = 0;


extern uint32_t loaderImageBase;
extern uint32_t loaderImageLimit;

void delay_loop(void)
{
    uint32_t i, j;
    for (i = 0;i < 4;i++)
        for (j = 0;j < 60000;j++);


}
/*---------------------------------------------------------------------------------------------------------*/
/*  Main Function									                                           			   */
/*---------------------------------------------------------------------------------------------------------*/
int32_t main(void)
{
    uint32_t u32Data, i, u32ImageSize, j, *pu32Loader;
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
    sParam.u8cRxTriggerLevel = DRVUART_FIFO_1BYTES;

    /* Set UART Configuration */
    if (DrvUART_Open(UART_PORT0, &sParam) != E_SUCCESS)
    {
        printf("UART0 open failed\n");
        return FALSE;
    }

    while ((GPIOB->PIN & (1 << 15)))
    {
        printf("Please press INT1\n");
    }
    printf("INT1 has pressed\n");
    /* Unlock protected registers to write ISP Control Register (ISPCON) */
    UNLOCKREG();
    /* Enable ISP function */
    DrvFMC_EnableISP();

    /* Enable LDROM update */
    DrvFMC_EnableLDUpdate();

    /* Page Erase LDROM */
    for (i = 0;i < 4096;i += PAGE_SIZE)
        DrvFMC_Erase(LDROM_BASE + i);
    /* Erase Verify */
    i32Err = 0;
    for (i = LDROM_BASE; i < (LDROM_BASE + 4096); i += 4)
    {
        DrvFMC_Read(i, &u32Data);

        if (u32Data != 0xFFFFFFFF)
        {
            i32Err = 1;
        }
    }


    u32ImageSize = (uint32_t) & loaderImageLimit - (uint32_t) & loaderImageBase;

    pu32Loader = (uint32_t *) & loaderImageBase;
    for (i = 0;i < u32ImageSize;i += PAGE_SIZE)
    {
        DrvFMC_Erase(LDROM_BASE + i);
        for (j = 0;j < PAGE_SIZE;j += 4)
        {
            DrvFMC_Write(LDROM_BASE + i + j, pu32Loader[(i + j) / 4]);
        }
    }

    /* Verify loader */
    i32Err = 0;
    for (i = 0;i < u32ImageSize;i += PAGE_SIZE)
    {
        for (j = 0;j < PAGE_SIZE;j += 4)
        {
            DrvFMC_Read(LDROM_BASE + i + j, &u32Data);
            if (u32Data != pu32Loader[(i+j)/4])
                i32Err = 1;

            if (i + j >= u32ImageSize)
                break;
        }


    }

    printf("Boot in LD\n");
    DrvFMC_BootSelect(E_FMC_LDROM);
    DrvSYS_ResetCPU();
    while (1);
}




