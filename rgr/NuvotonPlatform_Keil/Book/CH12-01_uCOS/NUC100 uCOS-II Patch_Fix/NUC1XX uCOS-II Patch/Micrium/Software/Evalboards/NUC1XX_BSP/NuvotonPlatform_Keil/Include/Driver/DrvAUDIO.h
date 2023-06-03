#ifndef _DRVAUDIO_H
#define _DRVAUDIO_H
//-------------------------------------------------------------------------------------------------

/*---------------------------------------------------------------------------------------------------------*/
/* Macro, type and constant definitions                                                                    */
/*---------------------------------------------------------------------------------------------------------*/
#define DRVAUDIO_MAJOR_NUM 1
#define DRVAUDIO_MINOR_NUM 00
#define DRVAUDIO_BUILD_NUM 1
#define DRVAUDIO_VERSION_NUM    _SYSINFRA_VERSION(DRVAUDIO_MAJOR_NUM, DRVAUDIO_MINOR_NUM, DRVAUDIO_BUILD_NUM)

#define APU_SAMPLES_PER_INT     128
#define ADC_SAMPLES_PER_INT     8

typedef struct _APU_EP_T {
    INT16 option;
    INT16 *buf;
    INT32 firstSampleIndex;
    INT32 samplesInBuf;
    INT32 bufSamples;
    struct _APU_EP_T *next;
} APU_EP_T;


VOID DrvAUDIO_PlayInit(INT32 sampleRate);
UINT32 DrvAUDIO_FillPlayData(INT16 *pi16Buf, UINT32 u32Samples);
VOID DrvAUDIO_FillPlayDataAndBlock(INT16 *pi16Buf, UINT32 u32Samples);
VOID DrvAUDIO_StopPlay(VOID);
VOID DrvAUDIO_StartPlay(VOID);
VOID DrvAUDIO_SetPlayVolume(INT32 volume);
UINT32 DrvAUDIO_GetPlayBufSamples(VOID);
VOID DrvAUDIO_RecordFinish(VOID);
UINT32 DrvAUDIO_GetPlayTicks(VOID);
VOID DrvAUDIO_SetPlayTicks(UINT32 u32Ticks);


VOID DrvAUDIO_RecordInit(INT32 sampleRate);
VOID DrvAUDIO_GetRecDataAndBlock(INT16 *pi16Buf, UINT32 u32Samples);
UINT32 DrvAUDIO_GetRecData(INT16 *pi16Buf, UINT32 u32Samples);
VOID DrvAUDIO_StartRecord(VOID);
VOID DrvAUDIO_StopRecord(VOID);
VOID DrvAUDIO_SetRecVolume(INT32 volume);
UINT32 DrvAUDIO_GetRecBufSamples(VOID);
VOID DrvAUDIO_PlayFinish(VOID);
UINT32 DrvAUDIO_GetRecTicks(VOID);
VOID DrvAUDIO_SetRecTicks(UINT32 u32Ticks);
UINT32 DrvAUDIO_GetVersion(VOID);

//-------------------------------------------------------------------------------------------------
#endif
