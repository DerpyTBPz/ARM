/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* Copyright(c) 2009 Nuvoton Technology Corp. All rights reserved.                                         */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
#include <stdio.h>
#include "NUC1xx.h"
#include "Driver\DrvGPIO.h"
#include "Driver\DrvSYS.h"
#define GPIOD_DOUT	(GPIODpin+0x8)
#define GPIODpin		(GP_BA+0xC0)
#define GP_BA		0x50004000			// GPIO BASE ADDRESS
#define GPIOD_PMD	(GPIOD+0)
#define GPIOD_DMASK	(GPIOD+0xC)
#define writew(addr,x)        ((*(uint32_t volatile *)(addr)) = (uint32_t )x)
void delay_loop(void)
 {
 uint32_t j;
 		for(j=0;j<60000;j++);		
		for(j=0;j<60000;j++);
    	for(j=0;j<60000;j++);		
		for(j=0;j<60000;j++);
 
 }


/*---------------------------------------------------------------------------------------------------------*/
/* MAIN function                                                                                          */
/*---------------------------------------------------------------------------------------------------------*/    

int main (void)
{	
  // uint32_t i,k;

	/* SYSCLK =>12Mhz*/
	UNLOCKREG();
    SYSCLK->PWRCON.XTL12M_EN = 1;
	
	/*set GPC outpui*/
	
	DrvGPIO_Open(E_GPC,3, E_IO_OUTPUT);
		
	while(1)
	{
	    
        DrvGPIO_ClrBit(E_GPC,3);
		delay_loop();
		DrvGPIO_SetBit(E_GPC,3);
		delay_loop();
		


	} 



}




