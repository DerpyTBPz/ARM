/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* Copyright(c) 2009 Nuvoton Technology Corp. All rights reserved.                                         */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
#include <stdio.h>
#include "NUC1xx.h"
#include "Driver\DrvGPIO.h"

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
	/*set GPA10 output mode*/	
	DrvGPIO_Open(E_GPA,10, E_IO_OUTPUT);
		
	while(1)
	{
	    
        DrvGPIO_ClrBit(E_GPA,10);
		delay_loop();
		DrvGPIO_SetBit(E_GPA,10);
		delay_loop();	
	} 

}




