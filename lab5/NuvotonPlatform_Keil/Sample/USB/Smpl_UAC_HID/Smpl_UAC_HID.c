/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* Copyright(c) 2009 Nuvoton Technology Corp. All rights reserved.                                         */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
#include <stdio.h>
#include "DrvGPIO.h"
#include "DrvSYS.h"
#include "DrvUART.h"
#include "DrvUSB.h"

extern int32_t UACHID_MainProcess(void);

void Delay(uint32_t delayCnt)
{
    while(delayCnt--)
    {
        __NOP();
        __NOP();
    }
}

/*---------------------------------------------------------------------------------------------------------*/
/* Main function                                                                                           */
/*---------------------------------------------------------------------------------------------------------*/
int32_t main (void)
{

    /* Unlock the locked registers */
    UNLOCKREG();

	/* Enable 12M OSC */
	DrvSYS_SetOscCtrl(E_SYS_XTL12M, 1);

    /* Enable PLL */
    DrvSYS_SetPLLMode(1);
	Delay(1000);
	DrvSYS_SelectHCLKSource(2);    
    Delay(100);


    SystemCoreClockUpdate();
    
    UACHID_MainProcess();
}




