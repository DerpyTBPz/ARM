/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* Copyright(c) 2009 Nuvoton Technology Corp. All rights reserved.                                         */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
#include <string.h>
#include "Driver\DrvUSB.h"
#include "USB\UACSys.h"
#include "UAC_API.h"

#define Maximum(a,b)		((a)>(b) ? (a) : (b))
#define Minimum(a,b)		((a)<(b) ? (a) : (b))

S_UAC_DEVICE g_UAC_sDevice;

/* The UAC control and data callback */
UAC_DEVICE_ENABLE   pfnUacDeviceEnable;
UAC_DEVICE_DISABLE  pfnUacDeviceDisable;
UAC_ISO_IN          pfnUacSendRecData;
UAC_ISO_OUT         pfnUacGetPlayData;

void UAC_EpNum1InEvent(void * pVoid);
void UAC_EpNum2OutEvent(void * pVoid);
void UAC_CtrlSetupSetInterface(void * pVoid);

#define CFG_ISO_IN      (CFGx_ISOCH | ISO_IN_EP_NUM  | CFGx_EPT_IN)
#define CFG_ISO_OUT     (CFGx_ISOCH | ISO_OUT_EP_NUM | CFGx_EPT_OUT)

/* Endpoint description */
S_DRVUSB_EP_CTRL sEpDescription[] = 
{
	{CTRL_EP_NUM    | EP_INPUT,  UAC_MAX_PACKET_SIZE_EP0, NULL},
	{CTRL_EP_NUM    | EP_OUTPUT, UAC_MAX_PACKET_SIZE_EP0, NULL},
	{ISO_IN_EP_NUM  | EP_INPUT,  ISO_IN_MXPLD,            NULL},
	{ISO_OUT_EP_NUM | EP_OUTPUT, ISO_OUT_MXPLD,     	  NULL},
	{0,0,0}
};

//bus event call back function
S_DRVUSB_EVENT_PROCESS g_sBusOps[6] = 
{
	{NULL, NULL},//attach
	{NULL, NULL},//detach
	{DrvUSB_BusResetCallback, &g_UAC_sDevice},//bus reset
	{NULL, NULL},//bus suspend
	{NULL, NULL},//bus resume
	{DrvUSB_CtrlSetupAck, &g_UAC_sDevice},//setup
};

//USB event call back function
S_DRVUSB_EVENT_PROCESS g_sUsbOps[12] = 
{
	{DrvUSB_CtrlDataInAck, &g_UAC_sDevice},
	{DrvUSB_CtrlDataOutAck, &g_UAC_sDevice},//ctrl pipe0
	{UAC_EpNum1InEvent, &g_UAC_sDevice},
    {NULL, NULL},//endpoint address 1
	{NULL, NULL},
	{UAC_EpNum2OutEvent, &g_UAC_sDevice},//endpoint address 2
    {NULL, NULL},	
	{NULL, NULL},//endpoint address 3
	{NULL, NULL},
	{NULL, NULL},//endpoint address 4
	{NULL, NULL},
	{NULL, NULL},//endpoint address 5
};


/* ctrl pipe call back.                                                                   */
/* it will be call by DrvUSB_CtrlSetupAck, DrvUSB_CtrlDataInAck and DrvUSB_CtrlDataOutAck */
/* if in ack handler and out ack handler is 0, default handler will be called             */
S_DRVUSB_CTRL_CALLBACK_ENTRY g_asCtrlCallbackEntry[64] =
{  /* request type,command     ,setup ack handler         , in ack handler      ,out ack handler,  parameter */
	{REQ_STANDARD, SET_ADDRESS, DrvUSB_CtrlSetupSetAddress, DrvUSB_CtrlDataInSetAddress, NULL, &g_UAC_sDevice},
	{REQ_STANDARD, CLEAR_FEATURE, DrvUSB_CtrlSetupClearSetFeature, NULL, NULL, &g_UAC_sDevice},
	{REQ_STANDARD, SET_FEATURE, DrvUSB_CtrlSetupClearSetFeature, NULL, NULL, &g_UAC_sDevice},
	{REQ_STANDARD, GET_CONFIGURATION, DrvUSB_CtrlSetupGetConfiguration, NULL, NULL, &g_UAC_sDevice},
	{REQ_STANDARD, GET_STATUS, DrvUSB_CtrlSetupGetStatus, NULL, NULL, &g_UAC_sDevice},
	{REQ_STANDARD, GET_INTERFACE, UAC_CtrlSetupGetInterface, NULL, NULL, &g_UAC_sDevice},
	{REQ_STANDARD, SET_INTERFACE, UAC_CtrlSetupSetInterface, NULL, NULL, &g_UAC_sDevice},
	{REQ_STANDARD, GET_DESCRIPTOR, UAC_CtrlSetupGetDescriptor, UAC_CtrlDataInGetDescriptor, NULL, &g_UAC_sDevice},
	{REQ_STANDARD, SET_CONFIGURATION, DrvUSB_CtrlSetupSetConfiguration, NULL, NULL, &g_UAC_sDevice},
	{REQ_CLASS, UAC_SET_CUR, UAC_ClassCtrlSetCurRequest, NULL, UAC_ClassCtrlSetCurOutData, &g_UAC_sDevice},
	{REQ_CLASS, UAC_GET_CUR, UAC_ClassCtrlGetCurRequest, NULL, NULL, &g_UAC_sDevice},
	{REQ_CLASS, UAC_GET_MIN, UAC_ClassCtrlGetMinRequest, NULL, NULL, &g_UAC_sDevice},
	{REQ_CLASS, UAC_GET_MAX, UAC_ClassCtrlGetMaxRequest, NULL, NULL, &g_UAC_sDevice},
	{REQ_CLASS, UAC_GET_RES, UAC_ClassCtrlGetResRequest, NULL, NULL, &g_UAC_sDevice},
};

/* -128 ~ 24 dB in 2 dB step in Q12. Formula: x = 10.^([-128:2:24]/20) */
uint32_t gVolumeTbl[] = {
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,2,2,3,3,4,5,6,8,10,13,16,21,26,33,41,52,65,82,103,130,163,205,258,325,410,516,649,817,1029,1295,1631,2053,2584,3254,4096,5157,6492,8173,10289,12953,16306,20529,25844,32536,40960,51566,64917
};

/* The structure registered to USB driver */
S_DRVUSB_CLASS sUacUsbClass = 
{
	(void *)&g_UAC_sDevice, 
	(PFN_DRVUSB_CALLBACK)UAC_Reset,
	UAC_IsCfgId
};

static  volatile uint16_t s_u16Len;
static  volatile uint16_t s_u16SendLength, s_u16CurPtr, s_u16Toggle;
static  volatile uint8_t  s_u8ConfigLenOver64;

void UAC_CtrlSetupGetInterface(void * pVoid)
{
	S_UAC_DEVICE *psDevice = (S_UAC_DEVICE *) pVoid;
  
  	DrvUSB_DataIn(0, &psDevice->u8AlternativeSetting, 1);
}

/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* FUNCTION                                                                                                */
/*      UAC_CtrlSetupSetInterface()	          	                                                           */
/*                                                                                                         */
/* DESCRIPTION                                                                                             */
/*      Setup ACK handler for SET_INTERFACE request                                                        */
/*                                                                                                         */
/* INPUTS                                                                                                  */
/*      pVoid   The function point of UAC device                                                           */
/*                                                                                                         */
/* OUTPUTS                                                                                                 */
/*      None                            				                                                   */
/*                                                                                                         */
/* RETURN                                                                                                  */
/*      None                                                                                               */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
void UAC_CtrlSetupSetInterface(void * pVoid)
{
    S_DRVUSB_DEVICE *psUSBDevice = &gsUsbDevice;
    S_UAC_DEVICE *psDevice = (S_UAC_DEVICE *)pVoid;

	psDevice->u8AlternativeSetting = psUSBDevice->au8Setup[2];
	
    if (psUSBDevice->au8Setup[4] == 1)
    {
        /* Audio Iso IN interface */
    	if (psDevice->u8AlternativeSetting == 1)
	    {
            psDevice->u8AudioState = UAC_START_AUDIO_RECORD;
            
            DrvUSB_DataIn(ISO_IN_EP_NUM, NULL, 0);
            pfnUacDeviceEnable(UAC_MICROPHONE, 0);
     	}
     	else if (psDevice->u8AlternativeSetting == 0)
    	{
            pfnUacDeviceDisable(UAC_MICROPHONE);
            DrvUSB_DataIn(ISO_IN_EP_NUM, NULL, 0);
            psDevice->u8AudioState = UAC_STOP_AUDIO_RECORD;
	    }
	}
	else if (psUSBDevice->au8Setup[4] == 2)
	{
	    /* Audio Iso OUT interface */
    	if (psDevice->u8AlternativeSetting == 1)
	    {
     	   	DrvUSB_DataOutTrigger(ISO_OUT_EP_NUM, psDevice->u8IsoOutPacketSize);
        	pfnUacDeviceEnable(UAC_SPEAKER, 0);
        	psDevice->u8IsoOutToggle = 0;
     	}  
     	else
     	{
            pfnUacDeviceDisable(UAC_SPEAKER);
     	}      	
	}
	
    DrvUSB_DataIn(0, NULL, 0);
}


/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* FUNCTION                                                                                                */
/*      UAC_EpNum1InEvent()	          	                                                                   */
/*                                                                                                         */
/* DESCRIPTION                                                                                             */
/*      Call back function for ISO pipe IN ack of endpoint number 1.                                       */
/*                                                                                                         */
/* INPUTS                                                                                                  */
/*      pVoid   The function point of UAC device                                                           */
/*                                                                                                         */
/* OUTPUTS                                                                                                 */
/*      None                            				                                                   */
/*                                                                                                         */
/* RETURN                                                                                                  */
/*      None                                                                                               */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
void UAC_EpNum1InEvent(void * pVoid)
{
    uint32_t u32PacketType;
	
	S_UAC_DEVICE *psDevice = (S_UAC_DEVICE *) pVoid;
	S_DRVUSB_DEVICE *psUsbDevice;
	int32_t u32EpId;	
	
	psUsbDevice = (S_DRVUSB_DEVICE *)psDevice->device;
	
	u32EpId = DrvUSB_GetEpId(ISO_IN_EP_NUM | 0x80);
    u32PacketType = ((psUsbDevice->u32STS >> (4 + u32EpId * 3))  & STS_STS);
	
	/* Confirm it is ISO in event */
	if (u32PacketType == STS_ISO)
	{
	
        if (psDevice->u8AudioState == UAC_START_AUDIO_RECORD)
        {
            pfnUacDeviceEnable(UAC_MICROPHONE, 1);
            psDevice->u8AudioState = UAC_PROCESSING_AUDIO_RECORD;
        }
        else if (psDevice->u8AudioState == UAC_PROCESSING_AUDIO_RECORD)
        {
            psDevice->u8AudioState = UAC_BUSY_AUDIO_RECORD;    
        }
        
        if (psDevice->u8AudioState == UAC_BUSY_AUDIO_RECORD)
        {
            pfnUacSendRecData();
        }
        else
        {         
            u32EpId = DrvUSB_GetEpIdentity(ISO_IN_EP_NUM, EP_INPUT);
            _DRVUSB_TRIG_EP(u32EpId, 0);
        }
    }
}

/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* FUNCTION                                                                                                */
/*      UAC_EpNum2OutEvent()	          	                                                               */
/*                                                                                                         */
/* DESCRIPTION                                                                                             */
/*      Call back function for ISO pipe OUT ack of endpoint number 2.                                      */
/*                                                                                                         */
/* INPUTS                                                                                                  */
/*      pVoid   The function point of UAC device                                                           */
/*                                                                                                         */
/* OUTPUTS                                                                                                 */
/*      None                            				                                                   */
/*                                                                                                         */
/* RETURN                                                                                                  */
/*      None                                                                                               */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
void UAC_EpNum2OutEvent(void * pVoid)
{
    uint32_t tmp;
    uint8_t *pcmBuf;
    uint32_t u32EpId;
    S_UAC_DEVICE *psDevice = (S_UAC_DEVICE *) pVoid;

    pcmBuf = DrvUSB_GetOutData(ISO_OUT_EP_NUM, &tmp);
    tmp = (PLAY_RATE / 1000) * PLAY_CHANNELS;
    pfnUacGetPlayData((int16_t *)pcmBuf, (int16_t)tmp);
    u32EpId = DrvUSB_GetEpIdentity(ISO_OUT_EP_NUM, EP_OUTPUT);
    
    _DRVUSB_SET_EP_BUF(u32EpId, (uint32_t)(pcmBuf));
    _DRVUSB_TRIG_EP(u32EpId, ISO_OUT_MXPLD);
    if (psDevice->u8IsoOutToggle == 0)
    {
        psDevice->u8IsoOutToggle = 1;
    }
    else 
    {
        psDevice->u8IsoOutToggle = 0;
    }
    
}

/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* FUNCTION                                                                                                */
/*      UAC_GetVersion()	             	                                                               */
/*                                                                                                         */
/* DESCRIPTION                                                                                             */
/*      To get the UAC driver version.                                                                     */
/*                                                                                                         */
/* INPUTS                                                                                                  */
/*      None                                                                                               */
/*                                                                                                         */
/* OUTPUTS                                                                                                 */
/*      None                            				                                                   */
/*                                                                                                         */
/* RETURN                                                                                                  */
/*      The UAC driver version.                                                                            */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
uint32_t UAC_GetVersion(void)
{
	return UAC_VERSION_NUM;
}


/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* FUNCTION                                                                                                */
/*      UAC_GetIsoOutPackeSize()	      	                                                               */
/*                                                                                                         */
/* DESCRIPTION                                                                                             */
/*      To get the ISO OUT packet size according configuration descriptor.                                 */
/*                                                                                                         */
/* INPUTS                                                                                                  */
/*      u8Cfg   The pointer of configuration descriptor.                                                   */
/*                                                                                                         */
/* OUTPUTS                                                                                                 */
/*      None                            				                                                   */
/*                                                                                                         */
/* RETURN                                                                                                  */
/*      The packet size of ISO OUT.                                                                        */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
uint16_t UAC_GetIsoOutPackeSize(const uint8_t *u8Cfg)
{
    uint16_t packetSize;
    int32_t offset;
    
    offset = 0;
    while(1)
    {
        offset += u8Cfg[offset];
        
        /* Limit the max search size */
        if (offset > LEN_CONFIG_AND_SUBORDINATE)
            break;
    
        if ((u8Cfg[offset + 1] == 0x05) && (u8Cfg[offset + 3] == 0x0D))
        {
            packetSize = u8Cfg[offset + 4] | ((uint16_t)u8Cfg[offset + 5] << 8);
            return packetSize;
        }       
    }
    
    return 0;
}

/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* FUNCTION                                                                                                */
/*      UAC_Open()	                       	                                                               */
/*                                                                                                         */
/* DESCRIPTION                                                                                             */
/*      To initial all descriptors and control handlers of USB Audio Class.                                */
/*                                                                                                         */
/* INPUTS                                                                                                  */
/*      pVoid   The function point of UAC device                                                           */
/*                                                                                                         */
/* OUTPUTS                                                                                                 */
/*      None                            				                                                   */
/*                                                                                                         */
/* RETURN                                                                                                  */
/*      E_SUCCESS                                                                                          */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
int32_t UAC_Open(void * pVoid)
{		
	g_UAC_sDevice.device = (void *)DrvUSB_InstallClassDevice(&sUacUsbClass);
	g_UAC_sDevice.u8IsoOutPacketSize = UAC_GetIsoOutPackeSize(gau8ConfigDescriptor);
	
	g_UAC_sDevice.i16RecMaxVolume = 6144;   /* about 24dB */
	g_UAC_sDevice.i16RecMinVolume = -32767; /* about -128dB */
    g_UAC_sDevice.i16RecResVolume = 256;    /* 1dB step */

	g_UAC_sDevice.i16PlayMaxVolume = 768;   /* about 3dB */
	g_UAC_sDevice.i16PlayMinVolume = -8191; /* about -32dB */
    g_UAC_sDevice.i16PlayResVolume = 256;   /* 1dB step */
  
	DrvUSB_InstallCtrlHandler(g_UAC_sDevice.device, g_asCtrlCallbackEntry, 
					sizeof(g_asCtrlCallbackEntry) / sizeof(g_asCtrlCallbackEntry[0]));

    DrvUSB_EnableSelfPower();
    DrvUSB_DisableRemoteWakeup();

	return E_SUCCESS;
}

/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* FUNCTION                                                                                                */
/*      UAC_Close()	                       	                                                               */
/*                                                                                                         */
/* DESCRIPTION                                                                                             */
/*      None.                                                                                              */
/*                                                                                                         */
/* INPUTS                                                                                                  */
/*      None                                                                                               */
/*                                                                                                         */
/* OUTPUTS                                                                                                 */
/*      None                            				                                                   */
/*                                                                                                         */
/* RETURN                                                                                                  */
/*      E_SUCCESS                                                                                          */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
void UAC_Close(void)
{

}

/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* FUNCTION                                                                                                */
/*      UAC_Reset()	                       	                                                               */
/*                                                                                                         */
/* DESCRIPTION                                                                                             */
/*      The function to reset endpoint settings. It would be called at set configuration or set interface. */
/*                                                                                                         */
/* INPUTS                                                                                                  */
/*      psDevice   The function point of UAC device                                                        */
/*                                                                                                         */
/* OUTPUTS                                                                                                 */
/*      None                            				                                                   */
/*                                                                                                         */
/* RETURN                                                                                                  */
/*      E_SUCCESS                                                                                          */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
void UAC_Reset(void * *pVoid)
{
    uint32_t u32EpId;
    S_UAC_DEVICE *psDevice = (S_UAC_DEVICE *)pVoid;
    S_DRVUSB_DEVICE *psUsbDevice;

    psUsbDevice = (S_DRVUSB_DEVICE *)psDevice->device;
    
	/* Reset ISO IN endpoint setting */    
    u32EpId = DrvUSB_GetEpIdentity(ISO_IN_EP_NUM, EP_INPUT);
  	_DRVUSB_SET_CFG(u32EpId, CFG_ISO_IN);
	_DRVUSB_SET_CFGP(u32EpId, CFGPx_CFGP);
    _DRVUSB_SET_EP_BUF(u32EpId, (uint32_t)psUsbDevice->sEpCrl[u32EpId].u8SramBuffer);
    
    /* Reset ISO OUT endpoint setting */    
    u32EpId = DrvUSB_GetEpIdentity(ISO_OUT_EP_NUM, EP_OUTPUT);
	_DRVUSB_SET_CFG(u32EpId, CFG_ISO_OUT);
	_DRVUSB_SET_CFGP(u32EpId, CFGPx_CFGP);  
}

/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* FUNCTION                                                                                                */
/*      UAC_IsCfgId()	                  	                                                               */
/*                                                                                                         */
/* DESCRIPTION                                                                                             */
/*      To check if it is the specified bConfigurationValue in the confiuration descriptor.                */
/*                                                                                                         */
/* INPUTS                                                                                                  */
/*      u8ConfigureValue   The bConfigurationValue to check.                                               */
/*                                                                                                         */
/* OUTPUTS                                                                                                 */
/*      None                            				                                                   */
/*                                                                                                         */
/* RETURN                                                                                                  */
/*      E_SUCCESS                                                                                          */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
int32_t UAC_IsCfgId(uint8_t u8ConfiguationValue)
{
	return (u8ConfiguationValue == gau8ConfigDescriptor[5]);
}

/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* FUNCTION                                                                                                */
/*      UAC_SendOneAudioPacket()	       	                                                               */
/*                                                                                                         */
/* DESCRIPTION                                                                                             */
/*      Send one packet to host. This function is used for sending record data to host.                    */
/*                                                                                                         */
/* INPUTS                                                                                                  */
/*      pbyAudioData   The record data buffer pointer.                                                     */
/*      u8AudioSize    The record data size in byte.                                                       */
/*                                                                                                         */
/* OUTPUTS                                                                                                 */
/*      None                            				                                                   */
/*                                                                                                         */
/* RETURN                                                                                                  */
/*      None                                                                                               */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
void UAC_SendOneAudioPacket(uint8_t *pbyAudioData, uint8_t u8AudioSize)
{
    if (u8AudioSize > 0)
    {
        DrvUSB_DataIn(ISO_IN_EP_NUM, (uint8_t *)pbyAudioData, u8AudioSize);
    }
    else
    {
       _DRVUSB_TRIG_EP(DrvUSB_GetEpIdentity(ISO_IN_EP_NUM, EP_INPUT), 0);  
    }      
}


/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* FUNCTION                                                                                                */
/*      UAC_Init()	       	                                                                               */
/*                                                                                                         */
/* DESCRIPTION                                                                                             */
/*      Install the callback functions for device enable, disable, play and record.                        */
/*                                                                                                         */
/* INPUTS                                                                                                  */
/*      pfnDeviceEnable   The callback function to enable audio device (start play/record).                */
/*      pfnDeviceDisable  The callback function to disable audio device (stop play/record).                */
/*      pfnSendRecData    The callback function to prepare the data for ISO IN.                            */
/*      pfnGetPlayData    The callback function to get ISO OUT data.                                       */
/*                                                                                                         */
/* OUTPUTS                                                                                                 */
/*      None                            				                                                   */
/*                                                                                                         */
/* RETURN                                                                                                  */
/*      None                                                                                               */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
void UAC_Init(
	UAC_DEVICE_ENABLE   pfnDeviceEnable,
	UAC_DEVICE_DISABLE  pfnDeviceDisable,
	UAC_ISO_IN          pfnSendRecData,
    UAC_ISO_OUT         pfnGetPlayData
)
{
    pfnUacDeviceEnable  = pfnDeviceEnable;
    pfnUacDeviceDisable = pfnDeviceDisable;
    pfnUacSendRecData   = pfnSendRecData;
    pfnUacGetPlayData   = pfnGetPlayData;
}


/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* FUNCTION                                                                                                */
/*      UAC_CtrlSetupGetDescriptor()	       	                                                           */
/*                                                                                                         */
/* DESCRIPTION                                                                                             */
/*      The callback funciton for get descriptor request ack event.                                        */
/*                                                                                                         */
/* INPUTS                                                                                                  */
/*      pVoid   A pointer of UAC device.                                                                   */
/*                                                                                                         */
/* OUTPUTS                                                                                                 */
/*      None                            				                                                   */
/*                                                                                                         */
/* RETURN                                                                                                  */
/*      None                                                                                               */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
void UAC_CtrlSetupGetDescriptor(void * pVoid)
{
	S_UAC_DEVICE *psDevice = (S_UAC_DEVICE *) pVoid;
	S_DRVUSB_DEVICE *pInfraDevice = (S_DRVUSB_DEVICE *)psDevice->device;
	uint16_t u16Len;
	uint16_t u16ConfigLen;
	s_u8ConfigLenOver64 = 0;

	u16Len = 0;
	u16Len = pInfraDevice->au8Setup[7];
	u16Len <<= 8;
	u16Len += pInfraDevice->au8Setup[6];
	
	switch (pInfraDevice->au8Setup[3])
	{
		/* Get Device Descriptor */
		case DESC_DEVICE:
		{
			u16Len = Minimum(u16Len, LEN_DEVICE);
		
			DrvUSB_DataIn(0, gau8DeviceDescriptor, u16Len);
			break;
		}
		/* Get Configuration Descriptor */
		case DESC_CONFIG:
		{
			u16ConfigLen = gau8ConfigDescriptor[3];
			u16ConfigLen <<= 8;
			u16ConfigLen |= gau8ConfigDescriptor[2];

			s_u16Len = Minimum(u16Len, u16ConfigLen);
			s_u16SendLength = 64;
			s_u16CurPtr = 0;
			s_u16Toggle = 0;		

			if (s_u16Len > s_u16SendLength)
			{
				DrvUSB_DataIn(0, gau8ConfigDescriptor + s_u16CurPtr, s_u16SendLength);

				s_u16Len -= s_u16SendLength;
				s_u16CurPtr += s_u16SendLength;
				s_u8ConfigLenOver64 = 1;
			}
			else
			{
				/* Trigger next Control In DATA1 Transaction. */
				DrvUSB_DataIn(0, gau8ConfigDescriptor + s_u16CurPtr, s_u16Len);
			}
			break;
		}
		/* Get String Descriptor */
		case DESC_STRING:
		{
			/* Get Language */
			if (pInfraDevice->au8Setup[2] == 0)
			{
				u16Len = Minimum(u16Len, 4);
				/* Copy to USB SRAM. */
      			DrvUSB_DataIn(0, gau8StringLang, u16Len);
			}
			else
			{
				/* Get String Descriptor */
				switch (pInfraDevice->au8Setup[2])
				{
					case 1:
					{
						u16Len = Minimum(u16Len, gau8VendorStringDescriptor[0]);
						/* Copy to USB SRAM. */				 
						DrvUSB_DataIn(0, gau8VendorStringDescriptor, u16Len);
						break;
					}
					case 2:
					{
						u16Len = Minimum(u16Len, gau8ProductStringDescriptor[0]);
						/* Copy to USB SRAM. */
						DrvUSB_DataIn(0, gau8ProductStringDescriptor, u16Len);
						break;
					}
					case 3:
					{
						u16Len = Minimum(u16Len, gau8StringSerial[0]);
						/* Copy to USB SRAM. */
						DrvUSB_DataIn(0, gau8StringSerial, u16Len);
						break;
					}
					case 4:
					{
						u16Len = Minimum(u16Len, gau8StringAudio[0]);
						/* Copy to USB SRAM. */
						DrvUSB_DataIn(0,  gau8StringAudio, u16Len);
						break;
					}
					default:
						/* Not support. Reply STALL. */
						DrvUSB_ClrCtrlReadyAndTrigStall();
						break;
				}
			}
			break;
		}

		default:
			/* Not support. Reply STALL. */
			DrvUSB_ClrCtrlReadyAndTrigStall();
			break;
	}
}

/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* FUNCTION                                                                                                */
/*      UAC_CtrlDataInGetDescriptor()	       	                                                           */
/*                                                                                                         */
/* DESCRIPTION                                                                                             */
/*      DATA IN ACK call back function for Get descriptor command                                          */
/*                                                                                                         */
/* INPUTS                                                                                                  */
/*      pVoid   A pointer of UAC device.                                                                   */
/*                                                                                                         */
/* OUTPUTS                                                                                                 */
/*      None                            				                                                   */
/*                                                                                                         */
/* RETURN                                                                                                  */
/*      None                                                                                               */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
void UAC_CtrlDataInGetDescriptor(void * pVoid)
{
	S_DRVUSB_DEVICE *psDevice = &gsUsbDevice;
	
	if (psDevice->au8Setup[0] & 0x80)
	{
		if (s_u8ConfigLenOver64  ==  1)  // Configure descriptor over 64
		{
			if (s_u16Len >= s_u16SendLength)
			{				
				DrvUSB_DataIn(0, gau8ConfigDescriptor + s_u16CurPtr, s_u16SendLength);
				s_u16Len -= s_u16SendLength;
				s_u16CurPtr += s_u16SendLength;
				
				if (s_u16Len == 0)
					_DRVUSB_TRIG_EP(1,0x00); //Ctl data out
			}
			else
			{			
				DrvUSB_DataIn(0, gau8ConfigDescriptor + s_u16CurPtr, s_u16Len);
				s_u8ConfigLenOver64 = 0;		
			}
		}
		else
		{
			//_UAC_TRIG_CTRL_OUT(0x00);
			_DRVUSB_TRIG_EP(1,0x00);
		}
	}
}


void UAC_ClassCtrlSetCurRequest(void * pVoid)
{
  	S_UAC_DEVICE *psDevice = (S_UAC_DEVICE *) pVoid;
  	S_DRVUSB_DEVICE *psUsbDevice = (S_DRVUSB_DEVICE *)psDevice->device;
  	
  	if (REC_FEATURE_UNITID == psUsbDevice->au8Setup[5])
  	{
        switch ( psUsbDevice->au8Setup[3])
        {
            case MUTE_CONTROL:
               _DRVUSB_TRIG_EP(1,psUsbDevice->au8Setup[6]); 
               break;
            case VOLUME_CONTROL:
               _DRVUSB_TRIG_EP(1,psUsbDevice->au8Setup[6]); 
               break;
            default:   
                /* STALL control pipe */
        		_DRVUSB_CLEAR_EP_READY_AND_TRIG_STALL(0);
        		_DRVUSB_CLEAR_EP_READY_AND_TRIG_STALL(1);
       	        break;
        }       	      
    }
    else if (PLAY_FEATURE_UNITID == psUsbDevice->au8Setup[5])
  	{
        switch ( psUsbDevice->au8Setup[3])
        {
            case MUTE_CONTROL:
               _DRVUSB_TRIG_EP(1,psUsbDevice->au8Setup[6]); 
               break;
            case VOLUME_CONTROL:
               _DRVUSB_TRIG_EP(1,psUsbDevice->au8Setup[6]); 
               break;
            default:   
                /* STALL control pipe */
        		_DRVUSB_CLEAR_EP_READY_AND_TRIG_STALL(0);
        		_DRVUSB_CLEAR_EP_READY_AND_TRIG_STALL(1);
       	        break;
        }       	      
    }
    else
    {
        /* STALL control pipe */
		_DRVUSB_CLEAR_EP_READY_AND_TRIG_STALL(0);
		_DRVUSB_CLEAR_EP_READY_AND_TRIG_STALL(1);
    } 
}

void UAC_ClassCtrlGetCurRequest(void * pVoid)
{
  	S_UAC_DEVICE *psDevice = (S_UAC_DEVICE *) pVoid;
  	S_DRVUSB_DEVICE *psUsbDevice = (S_DRVUSB_DEVICE *)psDevice->device;

 	if(REC_FEATURE_UNITID == psUsbDevice->au8Setup[5])
  	{
        switch ( psUsbDevice->au8Setup[3])
        {
            case MUTE_CONTROL:
			{
      		    psUsbDevice->sEpCrl[0].u8SramBuffer[0] = psDevice->u8RecMute;
        		_DRVUSB_SET_EP_TOG_BIT(0, FALSE);
        		_DRVUSB_TRIG_EP(0, 1);
               break;
            }
			case VOLUME_CONTROL:
            {
			    psUsbDevice->sEpCrl[0].u8SramBuffer[0] = (uint8_t)(psDevice->i16RecVolume);    
                psUsbDevice->sEpCrl[0].u8SramBuffer[1] = (uint8_t)(psDevice->i16RecVolume >> 8);  
        		_DRVUSB_SET_EP_TOG_BIT(0, FALSE);
        		_DRVUSB_TRIG_EP(0, 2);
                break;
            }
			default:   
                /* STALL control pipe */
        		_DRVUSB_CLEAR_EP_READY_AND_TRIG_STALL(0);
        		_DRVUSB_CLEAR_EP_READY_AND_TRIG_STALL(1);
       	        break;
        }       	      
    }   	 
    else if (PLAY_FEATURE_UNITID == psUsbDevice->au8Setup[5])
  	{
        switch ( psUsbDevice->au8Setup[3])
        {
            case MUTE_CONTROL:
      		{
			    psUsbDevice->sEpCrl[0].u8SramBuffer[0] = psDevice->u8PlayMute;
        		_DRVUSB_SET_EP_TOG_BIT(0, FALSE);
        		_DRVUSB_TRIG_EP(0, 1);
               break;
            }
			case VOLUME_CONTROL:
            {
			    if(psUsbDevice->au8Setup[2] == 1)
                {
                    psUsbDevice->sEpCrl[0].u8SramBuffer[0] = (uint8_t)(psDevice->i16PlayVolumeL);    
                    psUsbDevice->sEpCrl[0].u8SramBuffer[1] = (uint8_t)(psDevice->i16PlayVolumeL >> 8);  
                }
                else
                {
                    psUsbDevice->sEpCrl[0].u8SramBuffer[0] = (uint8_t)(psDevice->i16PlayVolumeR);    
                    psUsbDevice->sEpCrl[0].u8SramBuffer[1] = (uint8_t)(psDevice->i16PlayVolumeR >> 8);  
                }
        		_DRVUSB_SET_EP_TOG_BIT(0, FALSE);
        		_DRVUSB_TRIG_EP(0, 2);
                break;
            }
			default:   
                /* STALL control pipe */
        		_DRVUSB_CLEAR_EP_READY_AND_TRIG_STALL(0);
        		_DRVUSB_CLEAR_EP_READY_AND_TRIG_STALL(1);
       	        break;
        }       	      
    }   	 
    else
    {
        /* STALL control pipe */
		_DRVUSB_CLEAR_EP_READY_AND_TRIG_STALL(0);
		_DRVUSB_CLEAR_EP_READY_AND_TRIG_STALL(1);
    } 
}


void UAC_ClassCtrlGetMinRequest(void * pVoid)
{
 	S_UAC_DEVICE *psDevice = (S_UAC_DEVICE *) pVoid;
  	S_DRVUSB_DEVICE *psUsbDevice = (S_DRVUSB_DEVICE *)psDevice->device;

 	if (REC_FEATURE_UNITID == psUsbDevice->au8Setup[5])
  	{
        switch (psUsbDevice->au8Setup[3])
        {
            case VOLUME_CONTROL:
                psUsbDevice->sEpCrl[0].u8SramBuffer[0] = (uint8_t)(psDevice->i16RecMinVolume);    
                psUsbDevice->sEpCrl[0].u8SramBuffer[1] = (uint8_t)(psDevice->i16RecMinVolume >> 8);  
        		_DRVUSB_SET_EP_TOG_BIT(0, FALSE);
        		_DRVUSB_TRIG_EP(0, 2);
               break;
            default:   
                /* STALL control pipe */
        		_DRVUSB_CLEAR_EP_READY_AND_TRIG_STALL(0);
        		_DRVUSB_CLEAR_EP_READY_AND_TRIG_STALL(1);
       	        break;
        }       	      
    }   	 
    else if (PLAY_FEATURE_UNITID == psUsbDevice->au8Setup[5])
  	{
        switch (psUsbDevice->au8Setup[3])
        {
            case VOLUME_CONTROL:
                psUsbDevice->sEpCrl[0].u8SramBuffer[0] = (uint8_t)(psDevice->i16PlayMinVolume);    
                psUsbDevice->sEpCrl[0].u8SramBuffer[1] = (uint8_t)(psDevice->i16PlayMinVolume >> 8);  
        		_DRVUSB_SET_EP_TOG_BIT(0, FALSE);
        		_DRVUSB_TRIG_EP(0, 2);
               break;
            default:   
                /* STALL control pipe */
        		_DRVUSB_CLEAR_EP_READY_AND_TRIG_STALL(0);
        		_DRVUSB_CLEAR_EP_READY_AND_TRIG_STALL(1);
       	        break;
        }       	      
    }   	 
    else
    {
        /* STALL control pipe */
		_DRVUSB_CLEAR_EP_READY_AND_TRIG_STALL(0);
		_DRVUSB_CLEAR_EP_READY_AND_TRIG_STALL(1);
    } 
}


void UAC_ClassCtrlGetMaxRequest(void * pVoid)
{
 	S_UAC_DEVICE *psDevice = (S_UAC_DEVICE *) pVoid;
  	S_DRVUSB_DEVICE *psUsbDevice = (S_DRVUSB_DEVICE *)psDevice->device;

 	if (REC_FEATURE_UNITID == psUsbDevice->au8Setup[5])
  	{
        switch (psUsbDevice->au8Setup[3])
        {
            case VOLUME_CONTROL:
                psUsbDevice->sEpCrl[0].u8SramBuffer[0] = (uint8_t)(psDevice->i16RecMaxVolume);    
                psUsbDevice->sEpCrl[0].u8SramBuffer[1] = (uint8_t)(psDevice->i16RecMaxVolume >> 8); 
        		_DRVUSB_SET_EP_TOG_BIT(0, FALSE);
        		_DRVUSB_TRIG_EP(0, 2);
               break;
            default:   
                /* STALL control pipe */
        		_DRVUSB_CLEAR_EP_READY_AND_TRIG_STALL(0);
        		_DRVUSB_CLEAR_EP_READY_AND_TRIG_STALL(1);
       	        break;
        }       	      
    }   	 
    else if (PLAY_FEATURE_UNITID == psUsbDevice->au8Setup[5])
  	{
        switch (psUsbDevice->au8Setup[3])
        {
            case VOLUME_CONTROL:
                psUsbDevice->sEpCrl[0].u8SramBuffer[0] = (uint8_t)(psDevice->i16PlayMaxVolume);    
                psUsbDevice->sEpCrl[0].u8SramBuffer[1] = (uint8_t)(psDevice->i16PlayMaxVolume >> 8); 
        		_DRVUSB_SET_EP_TOG_BIT(0, FALSE);
        		_DRVUSB_TRIG_EP(0, 2);
               break;
            default:   
                /* STALL control pipe */
        		_DRVUSB_CLEAR_EP_READY_AND_TRIG_STALL(0);
        		_DRVUSB_CLEAR_EP_READY_AND_TRIG_STALL(1);
       	        break;
        }       	      
    }   	 
    else
    {
        /* STALL control pipe */
		_DRVUSB_CLEAR_EP_READY_AND_TRIG_STALL(0);
		_DRVUSB_CLEAR_EP_READY_AND_TRIG_STALL(1);
    } 
}

void UAC_ClassCtrlGetResRequest(void * pVoid)
{
 	S_UAC_DEVICE *psDevice = (S_UAC_DEVICE *) pVoid;
  	S_DRVUSB_DEVICE *psUsbDevice = (S_DRVUSB_DEVICE *)psDevice->device;

 	if (REC_FEATURE_UNITID == psUsbDevice->au8Setup[5])
  	{
        switch (psUsbDevice->au8Setup[3])
        {
            case VOLUME_CONTROL:
                psUsbDevice->sEpCrl[0].u8SramBuffer[0] = (uint8_t)(psDevice->i16RecResVolume);    
                psUsbDevice->sEpCrl[0].u8SramBuffer[1] = (uint8_t)(psDevice->i16RecResVolume >> 8);  
        		_DRVUSB_SET_EP_TOG_BIT(0, FALSE);
        		_DRVUSB_TRIG_EP(0, 2);
               break;
            default:   
                /* STALL control pipe */
        		_DRVUSB_CLEAR_EP_READY_AND_TRIG_STALL(0);
        		_DRVUSB_CLEAR_EP_READY_AND_TRIG_STALL(1);
       	        break;
        }       	      
    }   	 
    else if (PLAY_FEATURE_UNITID == psUsbDevice->au8Setup[5])
  	{
        switch (psUsbDevice->au8Setup[3])
        {
            case VOLUME_CONTROL:
                psUsbDevice->sEpCrl[0].u8SramBuffer[0] = (uint8_t)(psDevice->i16PlayResVolume);    
                psUsbDevice->sEpCrl[0].u8SramBuffer[1] = (uint8_t)(psDevice->i16PlayResVolume >> 8);  
        		_DRVUSB_SET_EP_TOG_BIT(0, FALSE);
        		_DRVUSB_TRIG_EP(0, 2);
               break;
            default:   
                /* STALL control pipe */
        		_DRVUSB_CLEAR_EP_READY_AND_TRIG_STALL(0);
        		_DRVUSB_CLEAR_EP_READY_AND_TRIG_STALL(1);
       	        break;
        }       	      
    }   	 
    else
    {
        /* STALL control pipe */
		_DRVUSB_CLEAR_EP_READY_AND_TRIG_STALL(0);
		_DRVUSB_CLEAR_EP_READY_AND_TRIG_STALL(1);
    } 
}			

void UAC_ClassCtrlSetCurOutData(void * pVoid)
{
  	S_UAC_DEVICE *psDevice = (S_UAC_DEVICE *) pVoid;
  	S_DRVUSB_DEVICE *psUsbDevice = (S_DRVUSB_DEVICE *)psDevice->device;

 	if (REC_FEATURE_UNITID == psUsbDevice->au8Setup[5])
  	{
        if (psUsbDevice->au8Setup[3] == MUTE_CONTROL)
        {
            psDevice->u8RecMute = psUsbDevice->sEpCrl[0].u8SramBuffer[0];
        }   
        else if(psUsbDevice->au8Setup[3] == VOLUME_CONTROL)
        {
            psDevice->i16RecVolume =(int16_t) (psUsbDevice->sEpCrl[0].u8SramBuffer[0] | (psUsbDevice->sEpCrl[0].u8SramBuffer[1]<<8));
        }
    }   	 
    else if(PLAY_FEATURE_UNITID == psUsbDevice->au8Setup[5])
  	{
        if (psUsbDevice->au8Setup[3] == MUTE_CONTROL)
        {
            psDevice->u8PlayMute = psUsbDevice->sEpCrl[0].u8SramBuffer[0];
        }   
        else if(psUsbDevice->au8Setup[3] == VOLUME_CONTROL)
        {
            if(psUsbDevice->au8Setup[2] == 1)
            {
                psDevice->i16PlayVolumeL =(int16_t) (psUsbDevice->sEpCrl[0].u8SramBuffer[0] | (psUsbDevice->sEpCrl[0].u8SramBuffer[1]<<8));
            }
            else
            {
                psDevice->i16PlayVolumeR =(int16_t) (psUsbDevice->sEpCrl[0].u8SramBuffer[0] | (psUsbDevice->sEpCrl[0].u8SramBuffer[1]<<8));
            }
        }
    }
	_DRVUSB_SET_EP_TOG_BIT(0, FALSE);
	_DRVUSB_TRIG_EP(0, 0);
}


/* Translate the volume gain form dB value to Q12 integer. Output data is in Q12 */
int32_t UAC_GetRecVolume(void)
{
    int32_t volume;
    int32_t q, r;
    
    /* Just return 0 when MUTE */
    if (g_UAC_sDevice.u8RecMute)
        return 0;
    
    volume = g_UAC_sDevice.i16RecVolume;
    if (volume == -32768)
    {   
        /* MUTE control */
        volume = 0;
    }
    else
    {   
        volume -= g_UAC_sDevice.i16RecMinVolume;
        q = volume >> (8 + 1);
        r = volume & 0x1FF;
        
        volume = gVolumeTbl[q] + ((gVolumeTbl[q+1] - gVolumeTbl[q]) * r >> 9);
    }
    
    return volume;
}

/* Translate the volume gain form dB value to Q12 integer. Output data is in Q12 */
int32_t UAC_GetPlayVolume(int32_t bIsRight)
{
    int32_t volume;
    int32_t q, r;
    
    /* Just return 0 when MUTE */
    if (g_UAC_sDevice.u8PlayMute)
        return 0;
    
    if (bIsRight)
        volume = g_UAC_sDevice.i16PlayVolumeR;
    else        
        volume = g_UAC_sDevice.i16PlayVolumeL;
    
    
    if (volume == -32768)
    {   
        /* MUTE control */
        volume = 0;
    }
    else
    {   
        volume -= g_UAC_sDevice.i16RecMinVolume;
        q = volume >> (8 + 1);
        r = volume & 0x1FF;
        
        volume = gVolumeTbl[q] + ((gVolumeTbl[q+1] - gVolumeTbl[q]) * r >> 9);
    }
    
    return volume;
}

