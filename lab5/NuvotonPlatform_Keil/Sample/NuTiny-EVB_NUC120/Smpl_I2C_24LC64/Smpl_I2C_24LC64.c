/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* Copyright (c) Nuvoton Technology Corp. All rights reserved.                                             */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/

#include <stdio.h>
#include "NUC1xx.h"
#include "Driver\DrvSYS.h"
#include "Driver\DrvGPIO.h"
#include "Driver\DrvUART.h"
#include "EEPROM_24LC64.h"
#include "Driver\DrvI2C.h"

void delay_loop(void)
{
 	uint32_t i,j;
	for(i=0;i<3;i++)	
	{
		for(j=0;j<60000;j++);
    }
 
 }

void delay(void)
{
	int j;
   	for(j=0; j<1000; j++);
}


int main(void)
{
	int8_t item;
	uint32_t i2cdata = 0;
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

	DrvGPIO_InitFunction(E_FUNC_I2C1);

    printf("\n\n");
    printf("+-----------------------------------------------------------+\n");
    printf("|               UART Sample Program                         |\n");
    printf("+-----------------------------------------------------------+\n");
    printf("| Write (Select key + 11) test                        - [1] |\n");
    printf("| Write (Select key + 22) test                        - [2] |\n");
    printf("| Write (Select key + 33) test                        - [3] |\n");
    printf("| Write (Select key + 44) test                        - [4] |\n");
    printf("| Write (Select key + 55) test                        - [5] |\n");
	printf("+-----------------------------------------------------------+\n");
    printf("| Quit                                        	    - [ESC] |\n");
    printf("+-----------------------------------------------------------+\n");
	printf("Select key : ");
    do
    {
        item = getchar();
        printf("%c\n",item);
        switch(item)
        {
			case '1':
			    Write_24LC64(0x00000000 + item, item + 11);
                i2cdata = Read_24LC64(0x00000000 + item);
				printf("Write %x ,Read i2cdata = %x\n",item + 11, i2cdata);
				break;
			case '2':
			    Write_24LC64(0x00000000 + item, item + 22);
                i2cdata = Read_24LC64(0x00000000 + item);
				printf("Write %x ,Read i2cdata = %x\n",item + 22, i2cdata);
				break;
			case '3':
			    Write_24LC64(0x00000000 + item, item + 33);
                i2cdata = Read_24LC64(0x00000000 + item);
				printf("Write %x ,Read i2cdata = %x\n",item + 33, i2cdata);
				break;
			case '4':
			    Write_24LC64(0x00000000 + item, item + 44);
                i2cdata = Read_24LC64(0x00000000 + item);
				printf("Write %x ,Read i2cdata = %x\n",item + 44, i2cdata);
				break;
			case '5':
			    Write_24LC64(0x00000000 + item, item + 55);
                i2cdata = Read_24LC64(0x00000000 + item);
				printf("Write %x ,Read i2cdata = %x\n",item + 55, i2cdata);
				break;
			case 27:
				printf("Exit");
				break;
            default:
                break;
				
		}
    }while(item != 27);
	  		
}


