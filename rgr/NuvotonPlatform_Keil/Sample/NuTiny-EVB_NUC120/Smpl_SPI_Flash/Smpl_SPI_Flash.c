/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* Copyright (c) Nuvoton Technology Corp. All rights reserved.                                             */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
#include <stdio.h>
#include "NUC1xx.h"
#include "Driver\DrvSYS.h"
#include "Driver\DrvSPI.h"
#include "Driver\DrvUART.h"
#include "Driver\DrvGPIO.h"

void delay_loop(void)
{
    uint32_t j;
    for (j = 0;j < 60000;j++);
    for (j = 0;j < 60000;j++);
    for (j = 0;j < 60000;j++);
    for (j = 0;j < 60000;j++);
}

#define TEST_NUMBER 1 /* page numbers */
// **************************************
// For W25Q16BV, Manufacturer ID: 0xEF; Device ID: 0x14
// For W26X16, Manufacturer ID: 0xEF; Device ID: 0x14
uint32_t SpiFlash_ReadMidDid(void)
{
    uint32_t au32SourceData;
    uint32_t au32DestinationData;

    // configure transaction length as 8 bits
    DrvSPI_SetBitLength(eDRVSPI_PORT0, 8);

    // /CS: active
    DrvSPI_SetSS(eDRVSPI_PORT0, eDRVSPI_SS0);

    // send Command: 0x90, Read Manufacturer/Device ID
    au32SourceData = 0x90;
    DrvSPI_SingleWrite(eDRVSPI_PORT0, &au32SourceData);

    // wait
    while (DrvSPI_IsBusy(eDRVSPI_PORT0));

    // configure transaction length as 24 bits
    DrvSPI_SetBitLength(eDRVSPI_PORT0, 24);

    // send 24-bit '0', dummy
    au32SourceData = 0x0;
    DrvSPI_SingleWrite(eDRVSPI_PORT0, &au32SourceData);

    // wait
    while (DrvSPI_IsBusy(eDRVSPI_PORT0));

    // configure transaction length as 16 bits
    DrvSPI_SetBitLength(eDRVSPI_PORT0, 16);

    // receive
    au32SourceData = 0x0;
    DrvSPI_SingleWrite(eDRVSPI_PORT0, &au32SourceData);

    // wait
    while (DrvSPI_IsBusy(eDRVSPI_PORT0));

    // /CS: de-active
    DrvSPI_ClrSS(eDRVSPI_PORT0,eDRVSPI_SS0);

    DrvSPI_DumpRxRegister(eDRVSPI_PORT0, &au32DestinationData, 1);

    if ((au32DestinationData & 0xffff) == 0xEF14)
        printf("MID & DID=0xEF14\n");
    else
        printf("MID & DID Error!\n");
    return  (au32DestinationData & 0xffff);

}
// **************************************
void SpiFlash_ChipErase(void)
{
    uint32_t au32SourceData;

    // configure transaction length as 8 bits
    DrvSPI_SetBitLength(eDRVSPI_PORT0, 8);

    // /CS: active
    DrvSPI_SetSS(eDRVSPI_PORT0, eDRVSPI_SS0);

    // send Command: 0x06, Write enable
    au32SourceData = 0x06;
    DrvSPI_SingleWrite(eDRVSPI_PORT0, &au32SourceData);

    // wait
    while (DrvSPI_IsBusy(eDRVSPI_PORT0));

    // /CS: de-active
    DrvSPI_ClrSS(eDRVSPI_PORT0,eDRVSPI_SS0);

    // /CS: active
    DrvSPI_SetSS(eDRVSPI_PORT0, eDRVSPI_SS0);

    // send Command: 0xC7, Chip Erase
    au32SourceData = 0xc7;
    DrvSPI_SingleWrite(eDRVSPI_PORT0, &au32SourceData);

    // wait
    while (DrvSPI_IsBusy(eDRVSPI_PORT0));

    // /CS: de-active
    DrvSPI_ClrSS(eDRVSPI_PORT0,eDRVSPI_SS0);
}
// **************************************
uint32_t SpiFlash_ReadStatusReg1(void)
{
    uint32_t au32SourceData;
    uint32_t au32DestinationData;

    // configure transaction length as 16 bits
    DrvSPI_SetBitLength(eDRVSPI_PORT0, 16);

    // /CS: active
    DrvSPI_SetSS(eDRVSPI_PORT0, eDRVSPI_SS0);

    // send Command: 0x05, Read status register 1
    au32SourceData = 0x0500;
    DrvSPI_SingleWrite(eDRVSPI_PORT0, &au32SourceData);

    // wait
    while (DrvSPI_IsBusy(eDRVSPI_PORT0));

    // /CS: de-active
    DrvSPI_ClrSS(eDRVSPI_PORT0,eDRVSPI_SS0);

    // dump Rx register
    DrvSPI_DumpRxRegister(eDRVSPI_PORT0, &au32DestinationData, 1);

    return (au32DestinationData & 0xFF);
}
// **************************************
void SpiFlash_WaitReady(void)
{
    uint32_t ReturnValue;

    do
    {
        ReturnValue = SpiFlash_ReadStatusReg1();
        ReturnValue = ReturnValue & 1;
    }
    while (ReturnValue != 0); // check the BUSY bit

}
// **************************************
void SpiFlash_PageProgram(uint8_t *DataBuffer, uint32_t StartAddress, uint32_t ByteCount)
{
    uint32_t au32SourceData;
    uint32_t Counter;

    // configure transaction length as 8 bits
    DrvSPI_SetBitLength(eDRVSPI_PORT0, 8);

    // /CS: active
    DrvSPI_SetSS(eDRVSPI_PORT0, eDRVSPI_SS0);

    // send Command: 0x06, Write enable
    au32SourceData = 0x06;
    DrvSPI_SingleWrite(eDRVSPI_PORT0, &au32SourceData);

    // wait
    while (DrvSPI_IsBusy(eDRVSPI_PORT0));

    // /CS: de-active
    DrvSPI_ClrSS(eDRVSPI_PORT0,eDRVSPI_SS0);

    // /CS: active
    DrvSPI_SetSS(eDRVSPI_PORT0, eDRVSPI_SS0);

    // send Command: 0x02, Page program
    au32SourceData = 0x02;
    DrvSPI_SingleWrite(eDRVSPI_PORT0    , &au32SourceData);

    // wait
    while (DrvSPI_IsBusy(eDRVSPI_PORT0));

    // configure transaction length as 24 bits
    DrvSPI_SetBitLength(eDRVSPI_PORT0, 24);

    // send 24-bit start address
    au32SourceData = StartAddress;
    DrvSPI_SingleWrite(eDRVSPI_PORT0, &au32SourceData);

    // wait
    while (DrvSPI_IsBusy(eDRVSPI_PORT0));

    // configure transaction length as 8 bits
    DrvSPI_SetBitLength(eDRVSPI_PORT0, 8);

    for (Counter = 0; Counter < ByteCount; Counter++)
    {
        // send data to program
        au32SourceData = DataBuffer[Counter];
        DrvSPI_SingleWrite(eDRVSPI_PORT0, &au32SourceData);

        // wait
        while (DrvSPI_IsBusy(eDRVSPI_PORT0));
    }

    // /CS: de-active
    DrvSPI_ClrSS(eDRVSPI_PORT0,eDRVSPI_SS0);
}
// **************************************
void SpiFlash_ReadData(uint8_t *DataBuffer0, uint32_t StartAddress, uint32_t ByteCount)
{
    uint32_t au32SourceData;
    uint32_t au32DestinationData;
    uint32_t Counter;

    // configure transaction length as 8 bits
    DrvSPI_SetBitLength(eDRVSPI_PORT0, 8);

    // /CS: active
    DrvSPI_SetSS(eDRVSPI_PORT0, eDRVSPI_SS0);

    // send Command: 0x03, Read data
    au32SourceData = 0x03;
    DrvSPI_SingleWrite(eDRVSPI_PORT0, &au32SourceData);

    // wait
    while (DrvSPI_IsBusy(eDRVSPI_PORT0));

    // configure transaction length as 24 bits
    DrvSPI_SetBitLength(eDRVSPI_PORT0, 24);

    // send 24-bit start address
    au32SourceData = StartAddress;
    DrvSPI_SingleWrite(eDRVSPI_PORT0, &au32SourceData);

    // wait
    while (DrvSPI_IsBusy(eDRVSPI_PORT0));

    // configure transaction length as 8 bits
    DrvSPI_SetBitLength(eDRVSPI_PORT0, 8);

    for (Counter = 0; Counter < ByteCount; Counter++)
    {
        // receive
        au32SourceData = 0x0;
        DrvSPI_SingleWrite(eDRVSPI_PORT0, &au32SourceData);

        // wait
        while (DrvSPI_IsBusy(eDRVSPI_PORT0));

        // dump Rx register
        DrvSPI_DumpRxRegister(eDRVSPI_PORT0, &au32DestinationData, 1);
        DataBuffer0[Counter] = (uint8_t) au32DestinationData;
    }

    // /CS: de-active
    DrvSPI_ClrSS(eDRVSPI_PORT0,eDRVSPI_SS0);
}

void SPItest(void)
{
    uint32_t u32ByteCount, u32FlashAddress, u32PageNumber;
    uint8_t DataBuffer0[256];

    /* Erase SPI flash */
    printf("Erase Flash.....\n");
    /*All chip erase*/
    SpiFlash_ChipErase();
    /* Wait ready */
    SpiFlash_WaitReady();
    /* Get the status of SPI flash */
    printf("Erase done !!!\n");
    delay_loop();


    /* Program SPI flash */
    printf("Program Flash...\n");
    /* source data */
    for (u32ByteCount = 0; u32ByteCount < 256; u32ByteCount++)
    {
        DataBuffer0[u32ByteCount] = u32ByteCount;
    }

    for (u32PageNumber = 0, u32FlashAddress = 0; u32PageNumber < TEST_NUMBER; u32PageNumber++)
    {
        /* page program */
        SpiFlash_PageProgram(DataBuffer0, u32FlashAddress, 256);
        SpiFlash_WaitReady();
        u32FlashAddress += 0x100;
    }
    printf("Program done !!!\n");
    delay_loop();

    /* clear data buffer */
    for (u32ByteCount = 0; u32ByteCount < 256; u32ByteCount++)
    {
        DataBuffer0[u32ByteCount] = 0;
    }

    /* read back and compare */
    printf("Verify Flash....\n");
    for (u32PageNumber = 0, u32FlashAddress = 0; u32PageNumber < TEST_NUMBER; u32PageNumber++)
    {
        SpiFlash_ReadData(DataBuffer0, u32FlashAddress, 256);
        u32FlashAddress += 0x100;

        for (u32ByteCount = 0; u32ByteCount < 256; u32ByteCount++)
        {
            if (DataBuffer0[u32ByteCount] != u32ByteCount)
            {
                printf("F0 Verify Error!\n");
                while (1);
            }
        }
        /* clear data buffer */
        for (u32ByteCount = 0; u32ByteCount < 256; u32ByteCount++)
        {
            DataBuffer0[u32ByteCount] = 0;
        }

        printf("Verify done !!!\n");
    }
}

int main(void)
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

    /*SPI0 test*/
    DrvGPIO_InitFunction(E_FUNC_SPI0);
    /*Initialize SPI*/
	/* Configure SPI0 as a master, 32-bit transaction*/
	DrvSPI_Open(eDRVSPI_PORT0, eDRVSPI_MASTER, eDRVSPI_TYPE1, 32);
    /* MSB first */
    DrvSPI_SetEndian(eDRVSPI_PORT0, eDRVSPI_MSB_FIRST);
    /* Disable the automatic slave select function of SS0. */
    DrvSPI_DisableAutoSS(eDRVSPI_PORT0);
    /* Set the active level of slave select. */
    DrvSPI_SetSlaveSelectActiveLevel(eDRVSPI_PORT0, eDRVSPI_ACTIVE_LOW_FALLING);
    /* SPI clock rate 12MHz */
    DrvSPI_SetClockFreq(eDRVSPI_PORT0, 12000000, 0);

    printf("SPI Sample Code\n");
    printf("Press any Key\n");
	getchar();

    if (SpiFlash_ReadMidDid() != 0xEF14)  /*Get flash ID*/
    {
        printf("SPI ID fail\n");
        while (1);
    }
    else
    {
        printf("SPI ID OK\n");
    }
    delay_loop();

    SPItest();

    DrvSPI_Close(eDRVSPI_PORT0);
    return 1;
}
