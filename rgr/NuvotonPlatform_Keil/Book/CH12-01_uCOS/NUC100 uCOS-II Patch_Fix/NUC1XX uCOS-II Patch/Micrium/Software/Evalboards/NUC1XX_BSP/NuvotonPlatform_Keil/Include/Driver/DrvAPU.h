/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* Copyright (c) Nuvoton Technology Corp. All rights reserved.                                             */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
#ifndef __DRVAPU_H__
#define __DRVAPU_H__


/*---------------------------------------------------------------------------------------------------------*/
/* Includes of system headers                                                                              */
/*---------------------------------------------------------------------------------------------------------*/
#include "Platform.h"
#include "System/SysInfra.h"
#include "Driver/DrvSYS.h"


#ifdef  __cplusplus
extern "C"
{
#endif


/*---------------------------------------------------------------------------------------------------------*/
/* Macro, type and constant definitions                                                                    */
/*---------------------------------------------------------------------------------------------------------*/
/* version define with SysInfra */
#define DRVAPU_MAJOR_NUM 1
#define DRVAPU_MINOR_NUM 00
#define DRVAPU_BUILD_NUM 2
#define DRVAPU_VERSION_NUM    _SYSINFRA_VERSION(DRVAPU_MAJOR_NUM, DRVAPU_MINOR_NUM, DRVAPU_BUILD_NUM)

#define DRVAPU_TH1_INT T1INTS	/* Threshold 1 Interrupt Status */
#define DRVAPU_TH2_INT T2INTS	/* Threshold 2 Interrupt Status */

#define _DRVAPU_SET_SAMPLE_RATE(u32SampleRate) outp32(CLKDIV1, (inp32(CLKDIV1) & ~APU_N) | (((((DrvSYS_GetPLLClock() / 128) / u32SampleRate) - 1) << 24) & APU_N))
#define _DRVAPU_GET_SAMPLE_RATE() (DrvSys_GetPLLOutputKHz()*1000 / ((((inp32(CLKDIV1) & APU_N) >> 24) + 1) * 128))

#define _DRVAPU_ENABLE()		outp32(APUCON, inp32(APUCON) | APURUN)
#define _DRVAPU_DISABLE()		outp32(APUCON, inp32(APUCON) & ~APURUN)
#define _DRVAPU_RESET()		    outp32(APUCON, inp32(APUCON) | APURST); outp32(APUCON, inp32(APUCON) & ~APURST)
#define	_DRVAPU_ISENABLED()	    (inp32(APUCON) & APURUN)

#define _DRVAPU_SET_BASE_ADDRESS(u32BaseAddress)		outp32(RAMBSAD	, (u32BaseAddress))
#define _DRVAPU_GET_BASE_ADDRESS()						inp32(RAMBSAD)
#define _DRVAPU_SET_TH1_ADDRESS(u32TH1Address)			outp32(THAD1	, (u32TH1Address))
#define _DRVAPU_GET_TH1_ADDRESS()						inp32(THAD1)
#define _DRVAPU_SET_TH2_ADDRESS(u32TH2Address)			outp32(THAD2	, (u32TH2Address))
#define _DRVAPU_GET_TH2_ADDRESS()						inp32(THAD2)
#define _DRVAPU_GET_CUR_ADDRESS()						inp32(CURAD)

#define _DRVAPU_ENTER_POWER_DOWN()		outp32(PDCON, inp32(PDCON) |  ANA_PD) 
#define _DRVAPU_RELEASE_POWER_DOWN()	outp32(PDCON, inp32(PDCON) & ~ANA_PD) 

/* define typedef  */
typedef UINT32 (*APU_CALLBACK)(UINT32 u32BufAddr, UINT32 u32Samples, UINT32 u32UserData);


/*---------------------------------------------------------------------------------------------------------*/
/* Interface function declarations                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
UINT32 DrvAPU_GetVersion( VOID );
VOID DrvAPU_EnableInt(APU_CALLBACK fnPlayCallBack, UINT32 u32UserData);
VOID DrvAPU_DisableInt(	VOID );
VOID DrvAPU_ClearInt( UINT32 );
UINT32 DrvAPU_GetInt( UINT32 );
VOID DrvAPU_Open(UINT32 u32BufAddr, UINT32 u32Samples, UINT32 u32SampleRate);
VOID DrvAPU_Close( VOID );
VOID DrvAPU_StartPlay( VOID );
VOID DrvAPU_StopPlay( VOID );
UINT32 DrvAPU_GetSampleClock(VOID);

UINT32 DrvAPU_GetSpaceInFIFO( VOID );
VOID DrvAPU_InitFIFO(INT16 *pi16Buf, UINT32 u32Samples);
VOID DrvAPU_PushFIFO(INT16 * pi16Buf, UINT32 u32Samples);
UINT32 DrvAPU_PopFIFO(INT16 * pi16Buf, UINT32 u32Samples);
UINT32 DrvAPU_GetSamplesInFIFO(VOID);
ERRCODE DrvAPU_SetSampleClock(UINT32 u32SampleRate);

#ifdef  __cplusplus
}
#endif


#endif
