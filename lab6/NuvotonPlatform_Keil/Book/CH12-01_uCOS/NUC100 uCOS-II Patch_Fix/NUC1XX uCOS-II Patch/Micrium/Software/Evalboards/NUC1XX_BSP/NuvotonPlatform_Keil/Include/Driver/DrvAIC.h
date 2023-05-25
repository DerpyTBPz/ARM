/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* Copyright(c) 2009 Nuvoton Technology Corp. All rights reserved.                                         */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
#ifndef __DRVAIC_H__
#define __DRVAIC_H__

/*---------------------------------------------------------------------------------------------------------*/
/* Includes of system headers                                                                              */
/*---------------------------------------------------------------------------------------------------------*/
#include "Platform.h"
#include "System/SysInfra.h"

#ifdef __cplusplus
extern "C" {
#endif


/*---------------------------------------------------------------------------------------------------------*/
/* Macro, type and constant definitions                                                                    */
/*---------------------------------------------------------------------------------------------------------*/
#define	DRVAIC_MAJOR_NUM 1
#define	DRVAIC_MINOR_NUM 00
#define	DRVAIC_BUILD_NUM 1

#define DRVAIC_VERSION_NUM		_SYSINFRA_VERSION(DRVAIC_MAJOR_NUM,DRVAIC_MINOR_NUM,DRVAIC_BUILD_NUM)  

//Error Code Definition 
//E_DRVAIC_INVALID_CHANNEL			Invalid interrupt channel 
//E_DRVAIC_INVALID_CPSR_SETTING		Incalid CPSR setting
#define E_DRVAIC_INVALID_CHANNEL       	_SYSINFRA_ERRCODE(TRUE, MODULE_ID_DRVAIC, 0)
#define E_DRVAIC_INVALID_CPSR_SETTING   _SYSINFRA_ERRCODE(TRUE, MODULE_ID_DRVAIC, 1)

#define _DRVAIC_TEST_MODE(bIsTestMode)			outp32(AIC_TEST, bIsTestMode)  		/* debug AIC_IPER*/
#define _DRVAIC_CLEAR_INT(u32IntChannels)		outp32(AIC_SCCR, u32IntChannels) 	/* clear all int events */
#define	_DRVAIC_ENABLE_INT(u32IntChannels)		outp32(AIC_MECR, u32IntChannels)   	/* turn on mask bit */
#define	_DRVAIC_DISABLE_INT(u32IntChannels)		outp32(AIC_MECR, u32IntChannels)   	/* turn on mask bit */
#define	_DRVAIC_TRIGGER_INT(u32IntChannels)		outp32(AIC_SSCR, u32IntChannels)   	/* trigger interrupt */

typedef void (*PFN_DRVAIC)(VOID);   /* function pointer */

typedef enum
{
    AIC_ENABLE_IRQ              = 0x7F,
    AIC_ENABLE_FIQ              = 0xBF,
    AIC_ENABLE_FIQ_IRQ          = 0x3F,
    AIC_DISABLE_IRQ             = 0x80,
    AIC_DISABLE_FIQ             = 0x40,
    AIC_DISABLE_FIQ_IRQ         = 0xC0
}AIC_CPSR_SETTING;

typedef enum {
    INT_WDT = 1, INT_GPIO0 = 3, INT_GPIO1 = 4, INT_GPIO2 = 5, 
    INT_GPIO3 = 6, INT_APU = 7, INT_ADC = 10, INT_RTC = 11, 
    INT_UART0 = 12, INT_UART1 = 13, INT_TMR1 = 14, INT_TMR0 = 15, 
    INT_USB = 19, INT_PWM0 = 22, INT_PWM1 = 23,  INT_PWM2 = 24,
    INT_PWM3 = 25, INT_I2C = 26, INT_SPIMS = 27, INT_PWR = 29,
    INT_SPIM = 30
} AIC_INT_SOURCE;

typedef enum {AIC_INT_LEVEL0 = 0, AIC_INT_LEVEL1, AIC_INT_LEVEL2, AIC_INT_LEVEL3, AIC_INT_LEVEL4, AIC_INT_LEVEL5, AIC_INT_LEVEL6, AIC_INT_LEVEL7} AIC_INT_LEVEL; 
typedef enum {AIC_LOW_LEVEL, AIC_HIGH_LEVEL, AIC_FALLING, AIC_RISING} AIC_INT_TYPE;

/* The parameters of DrvAIC_SetGlobalInterrupt() */
#define AIC_ENABLE_ALL_INTERRUPTS      0
#define AIC_DISABLE_ALL_INTERRUPTS     1

/* The parameters of DrvAIC_InstallExceptionHandler() */
typedef enum {AIC_SWI = 0, AIC_D_ABORT, AIC_I_ABORT, AIC_UNDEFINE} AIC_EXCEPTION_TYPE;


/*---------------------------------------------------------------------------------------------------------*/
/* Interface function declarations                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
UINT32 DrvAIC_GetVersion (VOID);
VOID DrvAIC_SetGlobalInt(INT32 intState);
INT32 DrvAIC_EnableInt(AIC_INT_SOURCE intNo);
INT32 DrvAIC_DisableInt(AIC_INT_SOURCE unIntNo);
UINT32 DrvAIC_GetIntEnableStatus(VOID);
PVOID DrvAIC_InstallExceptionHandler(AIC_EXCEPTION_TYPE eExceptionType, PVOID pNewHandler);
PVOID DrvAIC_InstallFiqHandler (PVOID pNewISR);
PVOID DrvAIC_InstallIrqHandler (PVOID pNewISR);
PVOID DrvAIC_InstallISR(AIC_INT_LEVEL intTypeLevel, AIC_INT_SOURCE intNo, PVOID pfnNewISR, UINT32 u32UserData);
VOID DrvAIC_EndISR(AIC_INT_SOURCE intNo);
INT32 DrvAIC_SetIntPriorityLevel (AIC_INT_SOURCE intNo, AIC_INT_LEVEL intLevel);
INT32 DrvAIC_SetIntType(AIC_INT_SOURCE intNo, AIC_INT_TYPE intSourceType);
UINT32 DrvAIC_SetCPSR (CONST AIC_CPSR_SETTING setting);
BOOL DrvAIC_IsIrqEnable(VOID);
BOOL DrvAIC_IsFiqEnable(VOID);
extern VOID DrvAIC_IrqHandler(VOID);
extern VOID DrvAIC_FiqHandler(VOID);


#ifdef  __cplusplus
}
#endif

#endif
