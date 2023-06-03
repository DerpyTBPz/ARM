/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* Copyright(c) 2009 Nuvoton Technology Corp. All rights reserved.                                         */
/*                                                                                                         */			   	
/*---------------------------------------------------------------------------------------------------------*/
#include <stdio.h>
#include <stdlib.h>
#include "Driver\DrvSYS.h"
#include "Driver\DrvGPIO.h"
#include "Driver\DrvUART.h"
#include "Driver\DrvRTC.h"
#include "Driver\DrvCAN.h"
#include "Driver\DrvTIMER.h"

/* 
   To enable IP clock include 
   Watch Dog, RTC, Timer0, Timer1, Timer2, Timer3, I2C0, I2C1, 
   SPI0, SPI1, SPI2, SPI3, UART0, UART1, UART2, PWM01, PWM23, PWM45, PWM67, 
   CAN0, USBD, ADC, ACMP, PS2, PDMA and Flash ISP controller.
*/
/*---------------------------------------------------------------------------------------------------------*/
/* Macro, type and constant definitions                                                                    */
/*---------------------------------------------------------------------------------------------------------*/
#define ALL_IP_ON       0xFFFFFFFF
#define ALL_IP_OFF      0x0
#define WDT_CLOCK       (1 << 0)
#define RTC_CLOCK      	(1 << 1)
#define TMR0_CLOCK 	   	(1 << 2)
#define TMR1_CLOCK  	(1 << 3)
#define TMR2_CLOCK    	(1 << 4)
#define TMR3_CLOCK    	(1 << 5)
#define FDIV_CLOCK    	(1 << 6)
#define I2C0_CLOCK      (1 << 7)
#define I2C1_CLOCK      (1 << 8)
#define SPI0_CLOCK      (1 << 9)
#define SPI1_CLOCK      (1 << 10)
#define SPI2_CLOCK      (1 << 11)
#define SPI3_CLOCK      (1 << 12)
#define UART0_CLOCK     (1 << 13)
#define UART1_CLOCK     (1 << 14)
#define UART2_CLOCK     (1 << 15)
#define PWM01_CLOCK     (1 << 16)
#define PWM23_CLOCK     (1 << 17)
#define PWM45_CLOCK     (1 << 18)
#define PWM67_CLOCK     (1 << 19)
#define CAN0_CLOCK      (1 << 20)
#define USBD_CLOCK      (1 << 21)
#define ADC_CLOCK     	(1 << 22)
#define I2S_CLOCK     	(1 << 23)
#define ACMP_CLOCK      (1 << 24)
#define PS2_CLOCK     	(1 << 25)
#define PDMA_CLOCK      (1 << 26)
#define ISP_CLOCK       (1 << 27)
#define EBI_CLOCK       (1 << 28)

#define _CHECK_UART_MSG_NOT_EMPTY        (UART0->FSR.TX_EMPTY==0)? 1:0

static uint32_t u32SysIPCfg = ALL_IP_ON; 

void DelayNOP(uint32_t t32DelayTicks)
{
    volatile uint32_t t32Ticks = t32DelayTicks;
    while ( t32Ticks-- )
    {
        __NOP();
        __NOP();
    }
}

uint32_t GetNum(void)
{
    uint8_t cInput=0, cString[16]={0};
    uint32_t nLoop=0;

    while (cInput != 0xD)
    {
        cInput = getchar();
        if (cInput == 27)
        {
            return cInput;
        }

        if ((cInput == 'x') || (cInput == 'X') || (cInput == 'f') ||
            (cInput == 'F') || (cInput == 'r') || (cInput == 'R'))
        {
            return cInput;
        }

        if (cInput == '-')
        {
            cString[nLoop] = cInput;
            printf("%c", cInput);
            nLoop++;
        }else
        if ((cInput >= '0') && (cInput <= '9'))
        {
            cString[nLoop] = cInput;
            printf("%c",cInput);
            nLoop++;
        }
    }
    printf("\n");

	return atoi((const char *)cString);
}

void ShowClockSettings(void)
{
    printf("Current PWRCON=0x%08X, APBCLK=0x%08X, PLLCON=0x%08X\n", inpw(SYSCLK_BASE), inpw(SYSCLK_BASE+0x8), inpw(SYSCLK_BASE+0x20));
}

void EnableFlashPowerSaving()
{
    FMC->FATCON.FPSEN = 1;	
}

void DisableFlashPowerSaving()
{
    FMC->FATCON.FPSEN = 0;	
}

void WaitForEventTrigger(uint8_t u8ShowMsg)
{
#if 1
    getchar();
#else
	if (u8ShowMsg)
		printf("CPU has been hold. Press key to continue ...\n");
		
    /* This function uses PB14 hold CPU */
    GPIOB->PMD.PMD14 = 0;
    while((GPIOB->PIN & (1 << 14)));
#endif
}

void _ConfigureIPClock(uint32_t u32IPCfg)
{
    u32SysIPCfg = u32IPCfg;

	DrvSYS_SetIPClock(E_SYS_WDT_CLK, 	((u32IPCfg&WDT_CLOCK)? 1:0));
	DrvSYS_SetIPClock(E_SYS_RTC_CLK, 	((u32IPCfg&RTC_CLOCK)? 1:0));
	DrvSYS_SetIPClock(E_SYS_TMR0_CLK, 	((u32IPCfg&TMR0_CLOCK)? 1:0));
	DrvSYS_SetIPClock(E_SYS_TMR1_CLK, 	((u32IPCfg&TMR1_CLOCK)? 1:0));
	DrvSYS_SetIPClock(E_SYS_TMR2_CLK, 	((u32IPCfg&TMR2_CLOCK)? 1:0));
	DrvSYS_SetIPClock(E_SYS_TMR3_CLK, 	((u32IPCfg&TMR3_CLOCK)? 1:0));
	DrvSYS_SetIPClock(E_SYS_FDIV_CLK, 	((u32IPCfg&FDIV_CLOCK)? 1:0));       
	DrvSYS_SetIPClock(E_SYS_I2C0_CLK, 	((u32IPCfg&I2C0_CLOCK)? 1:0));
	DrvSYS_SetIPClock(E_SYS_I2C1_CLK, 	((u32IPCfg&I2C1_CLOCK)? 1:0));
	DrvSYS_SetIPClock(E_SYS_SPI0_CLK, 	((u32IPCfg&SPI0_CLOCK)? 1:0));
	DrvSYS_SetIPClock(E_SYS_SPI1_CLK, 	((u32IPCfg&SPI1_CLOCK)? 1:0));
	DrvSYS_SetIPClock(E_SYS_SPI2_CLK, 	((u32IPCfg&SPI2_CLOCK)? 1:0));
	DrvSYS_SetIPClock(E_SYS_SPI3_CLK, 	((u32IPCfg&SPI3_CLOCK)? 1:0));
	DrvSYS_SetIPClock(E_SYS_UART0_CLK, 	((u32IPCfg&UART0_CLOCK)? 1:0));
	DrvSYS_SetIPClock(E_SYS_UART1_CLK, 	((u32IPCfg&UART1_CLOCK)? 1:0));
	DrvSYS_SetIPClock(E_SYS_UART2_CLK, 	((u32IPCfg&UART2_CLOCK)? 1:0));
	DrvSYS_SetIPClock(E_SYS_PWM01_CLK, 	((u32IPCfg&PWM01_CLOCK)? 1:0));
	DrvSYS_SetIPClock(E_SYS_PWM23_CLK, 	((u32IPCfg&PWM23_CLOCK)? 1:0));
	DrvSYS_SetIPClock(E_SYS_PWM45_CLK, 	((u32IPCfg&PWM45_CLOCK)? 1:0));
	DrvSYS_SetIPClock(E_SYS_PWM67_CLK, 	((u32IPCfg&PWM67_CLOCK)? 1:0));
	DrvSYS_SetIPClock(E_SYS_CAN0_CLK, 	((u32IPCfg&CAN0_CLOCK)? 1:0));
	DrvSYS_SetIPClock(E_SYS_USBD_CLK, 	((u32IPCfg&USBD_CLOCK)? 1:0));
	DrvSYS_SetIPClock(E_SYS_ADC_CLK, 	((u32IPCfg&ADC_CLOCK)? 1:0));
	DrvSYS_SetIPClock(E_SYS_I2S_CLK, 	((u32IPCfg&I2S_CLOCK)? 1:0));
	DrvSYS_SetIPClock(E_SYS_ACMP_CLK, 	((u32IPCfg&ACMP_CLOCK)? 1:0));
	DrvSYS_SetIPClock(E_SYS_PS2_CLK, 	((u32IPCfg&PS2_CLOCK)? 1:0));
	DrvSYS_SetIPClock(E_SYS_PDMA_CLK, 	((u32IPCfg&PDMA_CLOCK)? 1:0));
	DrvSYS_SetIPClock(E_SYS_ISP_CLK, 	((u32IPCfg&ISP_CLOCK)? 1:0));
	DrvSYS_SetIPClock(E_SYS_EBI_CLK, 	((u32IPCfg&EBI_CLOCK)? 1:0));   
}

/*---------------------------------------------------------------------------------------------------------*/
/* Functions                                                                                               */
/*---------------------------------------------------------------------------------------------------------*/
void IPClockControlTest(void)
{
	uint8_t u8Item, u8IPIndex;
	uint8_t bIsNeedToTurnOffUART0Clk;

	UNLOCKREG();
		
    u32SysIPCfg = UART0_CLOCK;
	_ConfigureIPClock(u32SysIPCfg);
	
	while (1)
	{
		printf("+-------------------------------------+\n");
		printf("|        IP Clock Control Test        |\n");
		printf("+-------------------------------------+\n");
		printf("| [0]   Quit                          |\n");	 		
		printf("| [1]   %s Watch Dog Clock       |\n", (u32SysIPCfg&WDT_CLOCK)?       "Disable":"Enable ");
		printf("| [2]   %s RTC Clock             |\n", (u32SysIPCfg&RTC_CLOCK)?      "Disable":"Enable ");
		printf("| [3]   %s Timer0 Clock          |\n", (u32SysIPCfg&TMR0_CLOCK)?     "Disable":"Enable "); 
		printf("| [4]   %s Timer1 Clock          |\n", (u32SysIPCfg&TMR1_CLOCK)?     "Disable":"Enable ");
		printf("| [5]   %s Timer2 Clock          |\n", (u32SysIPCfg&TMR2_CLOCK)?     "Disable":"Enable ");
		printf("| [6]   %s Timer3 Clock          |\n", (u32SysIPCfg&TMR3_CLOCK)?     "Disable":"Enable ");
		printf("| [7]   %s FDIV Output Clock     |\n", (u32SysIPCfg&FDIV_CLOCK)?     "Disable":"Enable ");
		printf("| [8]   %s I2C0 Clock            |\n", (u32SysIPCfg&I2C0_CLOCK)?     "Disable":"Enable ");    
		printf("| [9]   %s I2C1 Clock            |\n", (u32SysIPCfg&I2C1_CLOCK)?     "Disable":"Enable ");
		printf("| [10]  %s SPI0 Clock            |\n", (u32SysIPCfg&SPI0_CLOCK)?     "Disable":"Enable ");    
		printf("| [11]  %s SPI1 Clock            |\n", (u32SysIPCfg&SPI1_CLOCK)?     "Disable":"Enable ");
		printf("| [12]  %s SPI2 Clock            |\n", (u32SysIPCfg&SPI2_CLOCK)?     "Disable":"Enable ");    
		printf("| [13]  %s SPI3 Clock            |\n", (u32SysIPCfg&SPI3_CLOCK)?     "Disable":"Enable ");
		printf("| [14]  %s UART0 Clock           |\n", (u32SysIPCfg&UART0_CLOCK)?    "Disable":"Enable ");    
		printf("| [15]  %s UART1 Clock           |\n", (u32SysIPCfg&UART1_CLOCK)?    "Disable":"Enable ");
		printf("| [16]  %s UART2 Clock           |\n", (u32SysIPCfg&UART2_CLOCK)?    "Disable":"Enable ");    
		printf("| [17]  %s PWM01 Clock           |\n", (u32SysIPCfg&PWM01_CLOCK)?    "Disable":"Enable ");
		printf("| [18]  %s PWM23 Clock           |\n", (u32SysIPCfg&PWM23_CLOCK)?    "Disable":"Enable ");
		printf("| [19]  %s PWM45 Clock           |\n", (u32SysIPCfg&PWM45_CLOCK)?    "Disable":"Enable ");
		printf("| [20]  %s PWM67 Clock           |\n", (u32SysIPCfg&PWM67_CLOCK)?    "Disable":"Enable ");
		printf("| [21]  %s CAN0 Clock            |\n", (u32SysIPCfg&CAN0_CLOCK)?     "Disable":"Enable ");
		printf("| [22]  %s USBD Clock            |\n", (u32SysIPCfg&USBD_CLOCK)?     "Disable":"Enable ");
		printf("| [23]  %s ADC Clock             |\n", (u32SysIPCfg&ADC_CLOCK)?      "Disable":"Enable ");
		printf("| [24]  %s I2S Clock             |\n", (u32SysIPCfg&I2S_CLOCK)?      "Disable":"Enable ");
		printf("| [25]  %s ACMP Clock            |\n", (u32SysIPCfg&ACMP_CLOCK)?     "Disable":"Enable ");
		printf("| [26]  %s PS2 Clock             |\n", (u32SysIPCfg&PS2_CLOCK)?      "Disable":"Enable ");
		printf("| [27]  %s PDMA Clock            |\n", (u32SysIPCfg&PDMA_CLOCK)?     "Disable":"Enable ");
		printf("| [28]  %s Flash ISP Clock       |\n", (u32SysIPCfg&ISP_CLOCK)?      "Disable":"Enable ");
		printf("| [29]  %s EBI Clock             |\n", (u32SysIPCfg&EBI_CLOCK)?      "Disable":"Enable ");
		printf("| [30]  %s All IP Clock          |\n", (u32SysIPCfg==ALL_IP_ON)?     "Disable":"Enable ");
		printf("Please select an item to test (u32SysIPCfg:0x%08X) ... ", u32SysIPCfg);

		u8Item = GetNum();
		printf("%c\n", u8Item);
		
		if (u8Item == 30)
		{
			if (u32SysIPCfg == ALL_IP_ON)
				u32SysIPCfg = ALL_IP_OFF;
			else
				u32SysIPCfg = ALL_IP_ON;
			printf("\r%s all IP ...\n\n", (u32SysIPCfg==ALL_IP_OFF)? "Disable":"Enable");
		}else
		if ((u8Item >= 1) && (u8Item <= 29))
		{
 			u8IPIndex = u8Item - 1;
			u32SysIPCfg = u32SysIPCfg ^ (1<<u8IPIndex);
			printf("\rIndex-[%d] IP is %s ...\n\n", u8Item, ((u32SysIPCfg&(1<<u8IPIndex))==0)? "Disable":"Enable");
		}else
		if (u8Item == 0)
        {
            break;
		}else
		{
			continue;
		}
		
		/* check UART0 clodk ... */
		bIsNeedToTurnOffUART0Clk = (u32SysIPCfg&UART0_CLOCK)? FALSE:TRUE;
		if ( bIsNeedToTurnOffUART0Clk )
		{
			printf("Stop UART0 clock for measure the current.\n"); 
		    printf("CPU has been hold. Press any key to continue ...\n");
			while (_CHECK_UART_MSG_NOT_EMPTY);
		}
		
		/* apply the settings */
		_ConfigureIPClock(u32SysIPCfg);
		
		if (bIsNeedToTurnOffUART0Clk)
		{
			WaitForEventTrigger(TRUE);
			bIsNeedToTurnOffUART0Clk = FALSE;
			u32SysIPCfg = u32SysIPCfg | UART0_CLOCK;
			DrvSYS_SetIPClock(E_SYS_UART0_CLK, 1);
			printf("Enable UART0 clock for the next test.\n"); 
		}
	}
	
	LOCKREG();

	printf("\nExit IPClockControlTest !!!\n");
}

/*----------------------------------------------------------------------*/
/* Power down wakeup interrupt Callback function                        */
/*----------------------------------------------------------------------*/
void PWRWU_CallBackfn(void)
{
	printf("PWRWU interrupt.\n");
    if(SYSCLK->PWRCON.PD_WU_STS==1)
    {
	    printf("Got power down status bit!!\n");
    }
    else
    {
	    printf("Can't get power down status bit!!\n");
        while(1);
    }
}

/*---------------------------------------------------------------------------------------------------------*/
/* RTC Alarm interrupt Callback function                                                                   */
/*---------------------------------------------------------------------------------------------------------*/
void RTC_AlarmCallBackfn(void)
{
	printf("RTC alarm interrupt.\n");
}
/*---------------------------------------------------------------------------------------------------------*/
/* Functions                                                                                               */
/*---------------------------------------------------------------------------------------------------------*/
static S_DRVRTC_TIME_DATA_T sSysRTCTime;
uint8_t InitRTCWakeupFunction(void)
{
	S_DRVRTC_TIME_DATA_T sInitTime;

    /* RTC Initialize */
	DrvRTC_Init();	
	
	/* Time Setting */
	sInitTime.u32Year 		= 2010;
	sInitTime.u32cMonth 	= 8;	
	sInitTime.u32cDay 		= 18;
	sInitTime.u32cHour 		= 13;
	sInitTime.u32cMinute 	= 20;
	sInitTime.u32cSecond 	= 15;
	sInitTime.u32cDayOfWeek = DRVRTC_WEDNESDAY;
	sInitTime.u8cClockDisplay = DRVRTC_CLOCK_24;			

	/* Initialization the RTC timer */
	if (DrvRTC_Open(&sInitTime) != E_SUCCESS)
	{
	    printf("RTC Open Fail!!\n");
		return FALSE;
	}				

	/* Get the currnet time */
	DrvRTC_Read(DRVRTC_CURRENT_TIME, &sSysRTCTime);
	printf("Current Time:%d/%02d/%02d %02d:%02d:%02d\n", 
		sSysRTCTime.u32Year, sSysRTCTime.u32cMonth, sSysRTCTime.u32cDay, 
		sSysRTCTime.u32cHour, sSysRTCTime.u32cMinute, sSysRTCTime.u32cSecond);

	printf("RTC alarm wake up after 10 seconds ...\n");
	
	/* The alarm time setting */	
	sSysRTCTime.u32cSecond = sSysRTCTime.u32cSecond + 10; 	

	/* Set the alarm time (Install the call back function and enable the alarm interrupt)*/
	DrvRTC_Write(DRVRTC_ALARM_TIME, &sSysRTCTime);
			
	/* Enable RTC Alarm Interrupt & Set Alarm call back function*/
	DrvRTC_EnableInt(DRVRTC_ALARM_INT, RTC_AlarmCallBackfn);
	
	return TRUE;
}
/*---------------------------------------------------------------------------------------------------------*/
/* Functions                                                                                               */
/*---------------------------------------------------------------------------------------------------------*/
void UnInitRTCWakeupFunction(void)
{
	/* Get the currnet time */
	DrvRTC_Read(DRVRTC_CURRENT_TIME, &sSysRTCTime);
	printf("Current Time:%d/%02d/%02d %02d:%02d:%02d\n", 
		sSysRTCTime.u32Year, sSysRTCTime.u32cMonth, sSysRTCTime.u32cDay, 
		sSysRTCTime.u32cHour, sSysRTCTime.u32cMinute, sSysRTCTime.u32cSecond);
		
	/* Disable RTC Clock */		
	DrvRTC_Close();
}



/*---------------------------------------------------------------------------------------------------------*/
/* GPIO interrupt Callback function                                                                        */
/*---------------------------------------------------------------------------------------------------------*/
void GPIO_INTCallback(uint32_t u32GPABStatus, uint32_t u32GPCDEStatus)
{
    printf("GPIO interrupt. [0x%08X]\n", u32GPABStatus);
}
/*---------------------------------------------------------------------------------------------------------*/
/* Functions                                                                                               */
/*---------------------------------------------------------------------------------------------------------*/
uint8_t InitGPIOWakeupFunction(void)
{
 	DrvGPIO_Open(E_GPA, 1, E_IO_QUASI);

	DrvGPIO_SetIntCallback(GPIO_INTCallback, NULL);
    DrvGPIO_EnableInt(E_GPA, 1, E_IO_FALLING, E_MODE_EDGE);	

    printf("Please pull GPA1 from HIGH to LOW to return to Normal Modee.\n"); 	

	return TRUE;
}
/*---------------------------------------------------------------------------------------------------------*/
/* Functions                                                                                               */
/*---------------------------------------------------------------------------------------------------------*/
void UnInitGPIOWakeupFunction(void)
{	
	DrvGPIO_DisableInt(E_GPA, 1);
	DrvGPIO_Close(E_GPA, 1);
}



/*---------------------------------------------------------------------------------------------------------*/
/* UART interrupt Callback function                                                                        */
/*---------------------------------------------------------------------------------------------------------*/
volatile uint8_t u8UARTIntFlg = TRUE;
void UART_INTCallback(uint32_t u32IntStatus)
{
	if ( u8UARTIntFlg )
	{
		u8UARTIntFlg = FALSE;
		
		printf("UART0-CTS interrupt.\n");
	}
}
/*---------------------------------------------------------------------------------------------------------*/
/* Functions                                                                                               */
/*---------------------------------------------------------------------------------------------------------*/
uint8_t InitUARTWakeupFunction(void)
{
	u8UARTIntFlg = TRUE;
		
	/* Enable UART0-CTS(GPB3) for wake up */
	DrvUART_EnableInt(UART_PORT0, DRVUART_WAKEUPINT, UART_INTCallback);
	
    printf("Please toggle UART0-CTS(GPB3) to return to Normal Mode.\n"); 
	while (_CHECK_UART_MSG_NOT_EMPTY);

	return TRUE;
}
/*---------------------------------------------------------------------------------------------------------*/
/* Functions                                                                                               */
/*---------------------------------------------------------------------------------------------------------*/
void UnInitUARTWakeupFunction(void)
{
	u8UARTIntFlg = FALSE;
	DrvUART_DisableInt(UART_PORT0, DRVUART_WAKEUPINT);
}



/*---------------------------------------------------------------------------------------------------------*/
/* USB interrupt Callback function                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
void USBD_IRQHandler(void)
{
    uint32_t reg;

    REGCOPY(reg, USBD->INTSTS);
    printf("USB interrupt, INTSTS = 0x%x\n", inpw(&USBD->INTSTS));

    REGCOPY(USBD->INTSTS, reg);
}
/*---------------------------------------------------------------------------------------------------------*/
/* Functions                                                                                               */
/*---------------------------------------------------------------------------------------------------------*/
uint8_t InitUSBWakeupFunction(void)
{
    uint32_t u32reg;
	
    SYSCLK->APBCLK.USBD_EN = 1;

	u32reg = 0x340;
    REGCOPY(USBD->ATTR, u32reg);
    USBD->INTEN.WAKEUP_EN = 1;
    USBD->INTEN.WAKEUP_IE = 1;
    USBD->INTEN.FLDET_IE = 1;

    NVIC_EnableIRQ(USBD_IRQn);
	
    printf("Please plug-in USB to return to Normal Mode.\n"); 
	while (_CHECK_UART_MSG_NOT_EMPTY);
	
	return TRUE;
}
/*---------------------------------------------------------------------------------------------------------*/
/* Functions                                                                                               */
/*---------------------------------------------------------------------------------------------------------*/
void UnInitUSBWakeupFunction(void)
{
    SYSCLK->APBCLK.USBD_EN = 0;

    NVIC_DisableIRQ(USBD_IRQn);	
}



/*---------------------------------------------------------------------------------------------------------*/
/* CAN interrupt Callback function                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
void CAN_INTCallback()
{
//	CAN->CMD.WAKEUP_EN = 0;
//	printf("CAN-RX0(GPD6) interrupt.\n");
}
/*---------------------------------------------------------------------------------------------------------*/
/* Functions                                                                                               */
/*---------------------------------------------------------------------------------------------------------*/
uint8_t InitCANWakeupFunction(void)
{	
    UNLOCKREG();

    DrvGPIO_InitFunction(E_FUNC_CAN0);

 	SYSCLK->APBCLK.CAN0_EN 	= 1;
	SYS->IPRSTC2.CAN0_RST =1;  /* Reset CAN0 */
	SYS->IPRSTC2.CAN0_RST =0;
    CAN->u32CON = 0;
    NVIC_SetPriority(CAN0_IRQn, (1<<__NVIC_PRIO_BITS) - 2);
    NVIC_EnableIRQ(CAN0_IRQn); 	
    CAN->u32WU_EN = 1;// Set CAN wakeup
    printf("Please toggle CAN-RX0(GPD6) to return to Normal Mode.\n"); 
    LOCKREG();

	return TRUE;
}
/*---------------------------------------------------------------------------------------------------------*/
/* Functions                                                                                               */
/*---------------------------------------------------------------------------------------------------------*/
void UnInitCANWakeupFunction(void)
{	
    CAN->u32WU_STATUS = 0;// clear CAN wakeup status
	DrvCAN_Close();
}



/*---------------------------------------------------------------------------------------------------------*/
/* WDT interrupt Callback function                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
void WDT_INTCallback()
{
    DrvWDT_Ioctl(E_WDT_IOC_STOP_TIMER, 0);
    printf("WDT interrupt.\n");	
}
/*---------------------------------------------------------------------------------------------------------*/
/* Functions                                                                                               */
/*---------------------------------------------------------------------------------------------------------*/
uint8_t InitWDTWakeupFunction(void)
{
    UNLOCKREG();

    printf("Wait WDT time-out to return to Normal Mode.\n");                   

    /* Enable 10KHz clock for WDT */
	DrvSYS_SetOscCtrl(E_SYS_OSC10K, 1);
    DrvSYS_Delay(5000);
	DrvSYS_SelectIPClockSource(E_SYS_WDT_CLKSRC, 3); 
    
    DrvWDT_Open(E_WDT_LEVEL6);
    DrvWDT_InstallISR((WDT_CALLBACK)WDT_INTCallback);
    DrvWDT_Ioctl(E_WDT_IOC_ENABLE_INT, 0);
    DrvWDT_Ioctl(E_WDT_IOC_ENABLE_WAKEUP, 0);

    DrvWDT_Ioctl(E_WDT_IOC_START_TIMER, 0);

    LOCKREG();

    return TRUE;
}
/*---------------------------------------------------------------------------------------------------------*/
/* Functions                                                                                               */
/*---------------------------------------------------------------------------------------------------------*/
void UnInitWDTWakeupFunction(void)
{
    DrvWDT_Close();   
}



/*---------------------------------------------------------------------------------------------------------*/
/* BOD interrupt Callback function                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
void BOD_INTCallback(void)
{
    printf("BOD interrupt.\n");	
}
/*---------------------------------------------------------------------------------------------------------*/
/* Functions                                                                                               */
/*---------------------------------------------------------------------------------------------------------*/
uint8_t InitBODWakeupFunction(void)
{
    printf("Wait BOD interrupt to return to Normal Mode. (Voltage < 2.7V) \n");                   
    UNLOCKREG();  
                     
    /* Enable 10KHz clock for BOD */
	DrvSYS_SetOscCtrl(E_SYS_OSC10K, 1);
    DrvSYS_Delay(5000);
   
    /* Change NMI Interrupt source from BOD to IRQ26 */
    SYSINT->NMISEL.NMISEL = 26;
    DrvSYS_EnableBODLowPowerMode();
    DrvSYS_SelectBODVolt(1);
    DrvSYS_SetBODFunction(1, 0, BOD_INTCallback);
    LOCKREG();
    return TRUE;
}
/*---------------------------------------------------------------------------------------------------------*/
/* Functions                                                                                               */
/*---------------------------------------------------------------------------------------------------------*/
void UnInitBODWakeupFunction(void)
{
    SYSINT->NMISEL.NMISEL = 0;
    DrvSYS_SetBODFunction(0, 1, NULL);
}



/*---------------------------------------------------------------------------------------------------------*/
/* Functions                                                                                               */
/*---------------------------------------------------------------------------------------------------------*/
void PowerDownAndIDLEModeTest(uint8_t u8Type)
{
 	uint8_t u8Item;
	
    do
    {      
		printf("+-------------------------------------------+\n");
		if (u8Type == 1)
			printf("|            Power Down Mode Test(Wait for CPU)    |\n");
		else if (u8Type == 2)
			printf("|            Power Down Mode Test(Immediate)|\n");
		else
			printf("|              IDLE Mode Test               |\n");
		printf("+-------------------------------------------+\n");
		printf("| [1] RTC wake up test                      |\n");
		printf("| [2] GPIO wake up test ........... (GPA1)  |\n");
		printf("| [3] UART0-CTS wake up test ...... (GPB3)  |\n");
		printf("| [4] USB wake up test                      |\n");
		printf("| [5] CAN-RX0 wake up test ........ (GPD6)  |\n");
		printf("| [6] WDT time-out wake up test             |\n");
		printf("| [7] BOD wake up test                      |\n");
		printf("| [9] Do not wake up                        |\n");
		printf("| [0] Exit                                  |\n");
		printf("Please select an item  to enter %s Mode Test ==> ", (u8Type==1)? "Power Down":"IDLE");

		u8Item = getchar();
		printf("%c\n", u8Item);
 		switch (u8Item)
		{
			case '1':
				if (InitRTCWakeupFunction() == FALSE)
					continue;
				break;
			case '2':
				if (InitGPIOWakeupFunction() == FALSE)
					continue;
				break;
			case '3':
				if (InitUARTWakeupFunction() == FALSE)
					continue;
				break;
			case '4':
				if (InitUSBWakeupFunction() == FALSE)
					continue;
				break;
			case '5':
				if (InitCANWakeupFunction() == FALSE)
					continue;
				break;
			case '6':
				if (InitWDTWakeupFunction() == FALSE)
					continue;
				break;
			case '7':
				if (InitBODWakeupFunction() == FALSE)
					continue;
				break;
			case '9':
				break;
			case '0':
				return;
			default :
				continue;
		}
		
	    UNLOCKREG();
    	DrvSYS_SetPowerDownWakeUpInt(1, NULL, 1); // for checking power down status bit		
        printf("\n");
        ShowClockSettings();
        printf(" >> Enter to %s Mode ! << \n", (u8Type==0)? "IDLE":"Power Down");
        printf(" >> Wait event for wake up system ...... <<\n");
		while (_CHECK_UART_MSG_NOT_EMPTY);
		
		/* Enable Flash Power Saving */
        EnableFlashPowerSaving();
		DrvSYS_Delay(1000);
		
		if (u8Type == 0)
		{
			/* For IDLE Mode */

            SYSCLK->PWRCON.PD_WAIT_CPU  = 0;
	        SYSCLK->PWRCON.PWR_DOWN_EN     = 0;
                        
			/* Wait for interrupt and enter in IDLE mode */
			DrvSYS_Delay(1000);
			__WFI();	
		}else
		if (u8Type == 1)
		{
			/* For PowerDown Mode */	
            	
			SCB->SCR = 4;
            DrvSYS_EnterPowerDown(E_SYS_WAIT_FOR_CPU);
            	
			/* Wait for interrupt and enter in Power Down mode */
			DrvSYS_Delay(1000);
			__WFI();
   		}else
		if (u8Type == 2)
		{
			/* For PowerDown Mode */	       	
			SCB->SCR = 4;
            DrvSYS_EnterPowerDown(E_SYS_IMMEDIATE);       	
			/* Wait for interrupt and enter in Power Down mode */
			DrvSYS_Delay(1000);
        }
		/* Disable Flash Power Saving */
        DisableFlashPowerSaving();
		DrvSYS_Delay(1000);
		
		/* Clear Wait CPU bit to 0 */
        SYSCLK->PWRCON.PD_WAIT_CPU = 0;

		switch (u8Item)
		{
			case '1':
				UnInitRTCWakeupFunction();
				break;
			case '2':
				UnInitGPIOWakeupFunction();
				break;
			case '3':
				UnInitUARTWakeupFunction();
				break;
			case '4':
				UnInitUSBWakeupFunction();
				break;
			case '5':
				UnInitCANWakeupFunction();
				break;
			case '6':
				UnInitWDTWakeupFunction();
				break;
			case '7':
				UnInitBODWakeupFunction();
				break;
			default :
				break;
		}
		
    	LOCKREG();

        ShowClockSettings();

        printf("\n");
        printf("System has been return to Normal Moode !!!\n");
        printf("Press 'q' to quit or 'c' for next test.\n");       
        while (1)
        {
			u8Item = getchar();
          
            if ((u8Item == 'c') || (u8Item == 'C'))
                break;
            
            if ((u8Item == 'q') || (u8Item == 'Q'))
            {				
				return ;
			}
        }
    }while (1);
}

int32_t main (void)
{
	uint8_t u8Item;
	int32_t i32Loop = 1;
	STR_UART_T sParam;
	    
	UNLOCKREG();
		
	/* Default HCLK source is from 22MHz ... can not disable 22MHZ before change HCLK Source */
	DrvSYS_SetOscCtrl(E_SYS_OSC22M, 1);
	DrvSYS_SetOscCtrl(E_SYS_OSC10K, 1);
	DrvSYS_SetOscCtrl(E_SYS_XTL12M, 1);
	DrvSYS_SetOscCtrl(E_SYS_XTL32K, 1);

 	 /* Waiting for 12M Xtal stalble */
    DrvSYS_Delay(5000);
			
	/* Select UART Clock Source From 12Mhz*/
	DrvSYS_SelectIPClockSource(E_SYS_UART_CLKSRC, 0); 

	/* Set UART Pin */
	DrvGPIO_InitFunction(E_FUNC_UART0);
	
	/* Set UART Configuration */
    sParam.u32BaudRate 		= 115200;
    sParam.u8cDataBits 		= DRVUART_DATABITS_8;
    sParam.u8cStopBits 		= DRVUART_STOPBITS_1;
    sParam.u8cParity 		= DRVUART_PARITY_NONE;
    sParam.u8cRxTriggerLevel= DRVUART_FIFO_1BYTES;    
	DrvUART_Open(UART_PORT0, &sParam);

	 /* Set target HCLK from 12MHz and it's between 25MHz~50MHz. */
    DrvSYS_Open(50000*1000);
    DrvSYS_SetClockDivider(E_SYS_HCLK_DIV, 0);      // Set HCKL to HCKL/(n+1)
    DrvSYS_Delay(5000);

    printf("\nPower Management Sample Code !!!\n");
	printf("\nGet PLL clock : %dHz\n\n", DrvSYS_GetPLLClockFreq());	

	LOCKREG();

	while (i32Loop)
    {    
        printf("\n");
        printf("+-------------------------------------------+\n");
        printf("|        Power Management Sample Code       |\n");
        printf("+-------------------------------------------+\n");
        printf("| [1] IP Clock Control Test                 |\n");
        printf("| [2] IDLE Mode Test                        |\n");
        printf("| [3] Power Down Mode Test(Wait for CPU)    |\n");
        printf("| [4] Power Down Mode Test(Immediate)       |\n");
        printf("+-------------------------------------------+\n");
     
        u8Item = getchar();

		printf("Select item = %c\n", u8Item);
		switch (u8Item)
		{
			case '0':
				i32Loop = 0;
				break;
			case '1':
				IPClockControlTest();
				break;
			case '2':	/* for IDLE Mode */
			case '3':	/* for Power Down Mode */
            case '4':	/* for Power Down Mode(Immediate) */
				PowerDownAndIDLEModeTest(u8Item-'2');
				break;
		}
	}

	printf("Exit Power Management Sample Code !!!   \n");

	return 0;  
}




