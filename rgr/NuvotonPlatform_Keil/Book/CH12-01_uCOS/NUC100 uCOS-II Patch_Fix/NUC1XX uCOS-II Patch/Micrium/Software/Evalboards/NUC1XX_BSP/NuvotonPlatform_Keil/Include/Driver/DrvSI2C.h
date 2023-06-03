/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* Copyright(c) 2009 Nuvoton Technology Corp. All rights reserved.                                         */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
#ifndef _DRVSI2C_H_
#define _DRVSI2C_H_


/*---------------------------------------------------------------------------------------------------------*/
/* Includes of system headers                                                                              */
/*---------------------------------------------------------------------------------------------------------*/
#include "Platform.h"
#include "System/SysInfra.h"
#include "Driver/DrvGPIO.h"

#ifdef  __cplusplus
extern "C"
{
#endif


/*---------------------------------------------------------------------------------------------------------*/
/* Macro, type and constant definitions                                                                    */
/*---------------------------------------------------------------------------------------------------------*/
#define DRVSI2C_MAJOR_NUM 1
#define DRVSI2C_MINOR_NUM 00
#define DRVSI2C_BUILD_NUM 1

#define DRVSI2C_VERSION_NUM    _SYSINFRA_VERSION(DRVSI2C_MAJOR_NUM, DRVSI2C_MINOR_NUM, DRVSI2C_BUILD_NUM)


#define _DRVSI2C_SCK_SETIN(PortIndex, PinMask)	outp32(GPIOA_OMD+(PortIndex<<4),inp32(GPIOA_OMD+(PortIndex<<4))&(~PinMask)) //PortIndex<<4 == PortIndex*0x10
#define _DRVSI2C_SDA_SETIN(PortIndex, PinMask)	outp32(GPIOA_OMD+(PortIndex<<4),inp32(GPIOA_OMD+(PortIndex<<4))&(~PinMask))
#define _DRVSI2C_SCK_SETOUT(PortIndex, PinMask)	outp32(GPIOA_OMD+(PortIndex<<4),inp32(GPIOA_OMD+(PortIndex<<4))|PinMask)
#define _DRVSI2C_SDA_SETOUT(PortIndex, PinMask)	outp32(GPIOA_OMD+(PortIndex<<4),inp32(GPIOA_OMD+(PortIndex<<4))|PinMask)

#define _DRVSI2C_SCK_SETHIGH(PortIndex, PinMask)	outp32(GPIOA_DOUT+(PortIndex<<4),inp32(GPIOA_DOUT+(PortIndex<<4))|PinMask)
#define _DRVSI2C_SCK_SETLOW(PortIndex, PinMask)	outp32(GPIOA_DOUT+(PortIndex<<4),inp32(GPIOA_DOUT+(PortIndex<<4))&(~PinMask))
#define _DRVSI2C_SDA_SETHIGH(PortIndex, PinMask)	outp32(GPIOA_DOUT+(PortIndex<<4),inp32(GPIOA_DOUT+(PortIndex<<4))|PinMask)
#define _DRVSI2C_SDA_SETLOW(PortIndex, PinMask)	outp32(GPIOA_DOUT+(PortIndex<<4),inp32(GPIOA_DOUT+(PortIndex<<4))&(~PinMask))

#define _DRVSI2C_SCK_GETVALUE(PortIndex, PinMask) 	(inp32(GPIOA_PIN+(PortIndex<<4))&PinMask)
#define _DRVSI2C_SDA_GETVALUE(PortIndex, PinMask)  (inp32(GPIOA_PIN+(PortIndex<<4))&PinMask)

typedef struct
{
	UINT32 u32SCKPortIndex;
	UINT32 u32SCKPinMask;
	UINT32 u32SDAPortIndex;
	UINT32 u32SDAPinMask;
} S_SI2C_Channel;


//Error Code Definition 
//E_DRVSI2C_WRITE_FAIL			Write fail	
//E_DRVSI2C_PIN_UNAVAILABLE		Unvailable pin 
//E_DRVSI2C_NACK				Return NACK
//E_DRVSI2C_TIME_OUT			Time out
#define E_DRVSI2C_WRITE_FAIL         _SYSINFRA_ERRCODE(TRUE, MODULE_ID_DRVSI2C, 0)
#define E_DRVSI2C_PIN_UNAVAILABLE    _SYSINFRA_ERRCODE(TRUE, MODULE_ID_DRVSI2C, 1)
#define E_DRVSI2C_NACK               _SYSINFRA_ERRCODE(TRUE, MODULE_ID_DRVSI2C, 2)
#define E_DRVSI2C_TIME_OUT           _SYSINFRA_ERRCODE(TRUE, MODULE_ID_DRVSI2C, 3)


/*---------------------------------------------------------------------------------------------------------*/
/* Interface function declarations                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
ERRCODE DrvSI2C_Open(DRVGPIO_PORT u32SckIoPort, UINT32 u32SckIoBit, DRVGPIO_PORT u32SdaIoPort, UINT32 u32SdaIoBit);
VOID DrvSI2C_Close(VOID);
VOID DrvSI2C_SendStart(VOID);
VOID DrvSI2C_SendStop(VOID);
ERRCODE DrvSI2C_WriteByte(BOOL bStart, UINT8 u8Data, BOOL bCheckAck, BOOL bStop);
ERRCODE DrvSI2C_ReadByte(BOOL bStart, PUINT8 pu8ReadData, BOOL bSendAck, BOOL bStop);
UINT32 DrvSI2C_GetVersion(VOID);

#ifdef __cplusplus
}
#endif

#endif









