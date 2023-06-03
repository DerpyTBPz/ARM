/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* Copyright (c) Nuvoton Technology Corp. All rights reserved.                                             */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
#include <string.h>

#include "Driver\DrvUSB.h"
#include "USB\HIDSys.h"
#include "HID_API.h"


#define Maximum(a,b)		((a)>(b) ? (a) : (b))


S_HID_DEVICE g_HID_sDevice;

/* Endpoint description */
S_DRVUSB_EP_CTRL sEpDescription[] = 
{
	{0x80, 64, NULL},   /* EP Num 0, EP Addr 0, input , max packe size = 64 */ 
	{0x00, 64, NULL},   /* EP Num 1, EP Addr 0, output, max packe size = 64 */ 
	{0x81,  8, NULL},   /* EP Num 2, EP Addr 1, input , max packe size =  8 */ 
	{0x00,  0, NULL}
};

/* bus event call back */
S_DRVUSB_EVENT_PROCESS g_sBusOps[6] = 
{
	{NULL, NULL},                               /* attach event callback */
	{NULL, NULL},                               /* detach event callback */
	{DrvUSB_BusResetCallback, &g_HID_sDevice},  /* bus reset event callback */
	{NULL, NULL},                               /* bus suspend event callback */
	{NULL, NULL},                               /* bus resume event callback */
	{DrvUSB_CtrlSetupAck, &g_HID_sDevice},      /* setup event callback */
};

/* USB event call back */
S_DRVUSB_EVENT_PROCESS g_sUsbOps[12] = 
{
	{DrvUSB_CtrlDataInAck   , &g_HID_sDevice},/* ctrl pipe0 (EP address 0) In ACK callback */
	{DrvUSB_CtrlDataOutAck  , &g_HID_sDevice},/* ctrl pipe0 (EP address 0) Out ACK callback */
	{HID_IntInCallback      , &g_HID_sDevice},/* EP address 1 In ACK callback */
	{NULL, NULL},                             /* EP address 1 Out ACK callback */
	{NULL, NULL},                             /* EP address 2 In ACK callback */  
	{NULL, NULL},                             /* EP address 2 Out ACK callback */  
	{NULL, NULL},                             /* EP address 3 In ACK callback */  
	{NULL, NULL},                             /* EP address 3 Out ACK callback */  
	{NULL, NULL},                             /* EP address 4 In ACK callback */  
	{NULL, NULL},                             /* EP address 4 Out ACK callback */  
	{NULL, NULL},                             /* EP address 5 In ACK callback */  
	{NULL, NULL},                             /* EP address 5 Out ACK callback */  
};

/*ctrl pipe call back.                                                                  */
/*it will be call by DrvUSB_CtrlSetupAck, DrvUSB_CtrlDataInAck and DrvUSB_CtrlDataOutAck*/
/*if in ack handler and out ack handler is 0, default handler will be called            */
S_DRVUSB_CTRL_CALLBACK_ENTRY g_asCtrlCallbackEntry[64] =
{   //request type,command     ,setup ack handler         , in ack handler      ,out ack handler,  parameter
	{REQ_STANDARD, SET_ADDRESS, DrvUSB_CtrlSetupSetAddress, DrvUSB_CtrlDataInSetAddress, 0, &g_HID_sDevice},
	{REQ_STANDARD, CLEAR_FEATURE, DrvUSB_CtrlSetupClearSetFeature, 0, 0, &g_HID_sDevice},
	{REQ_STANDARD, SET_FEATURE, DrvUSB_CtrlSetupClearSetFeature, 0, 0, &g_HID_sDevice},
	{REQ_STANDARD, GET_CONFIGURATION, DrvUSB_CtrlSetupGetConfiguration, 0, 0, &g_HID_sDevice},
	{REQ_STANDARD, GET_STATUS, DrvUSB_CtrlSetupGetStatus, 0, 0, &g_HID_sDevice},
	{REQ_STANDARD, GET_INTERFACE, DrvUSB_CtrlSetupGetInterface, 0, 0, &g_HID_sDevice},
	{REQ_STANDARD, SET_INTERFACE, DrvUSB_CtrlSetupSetInterface, 0, 0, &g_HID_sDevice},
	{REQ_STANDARD, GET_DESCRIPTOR, HID_CtrlSetupGetDescriptor, 0, 0, &g_HID_sDevice},
	{REQ_STANDARD, SET_CONFIGURATION, DrvUSB_CtrlSetupSetConfiguration, 0, 0, &g_HID_sDevice},
	/* To support boot protocol */
	{REQ_CLASS, SET_REPORT, HID_CtrlSetupSetReport, 0, 0, 0},
	{REQ_CLASS, SET_IDLE, HID_CtrlSetupSetIdle, 0, 0, 0},
	{REQ_CLASS, SET_PROTOCOL, HID_CtrlSetupSetProtocol, 0, 0, 0},
};


static void HID_UsbStartCallBack(void * pVoid);
static int32_t HID_IsConfigureValue(uint8_t u8ConfigureValue);
static void HID_Reset(S_HID_DEVICE *psDevice);
static void HID_Start(S_HID_DEVICE *psDevice);

/* The callback is called when Host issues the interrupt IN transfer to get report */
void (*pfHID_GetInReport)(uint8_t *buf) = NULL;

/* The callback is called when Host issues the interrupt OUT transfer to set report */
void (*pfHID_SetOutReport)(uint8_t *buf) = NULL;


//register to USB driver
S_DRVUSB_CLASS sHidUsbClass = 
{
	(void *)&g_HID_sDevice, 
	HID_UsbStartCallBack,
	HID_IsConfigureValue
};

__IO uint8_t *  g_HID_ar8UsbBufSetup;
__IO uint8_t *  g_HID_ar8UsbBuf0;
__IO uint8_t *  g_HID_ar8UsbBuf1;


//uint32_t HID_GetVersion(VOID)
//{
//	return HID_VERSION_NUM;
//}

/*************************************************************************/
/*                                                                       */
/* DESCRIPTION                                                           */
/*      To initial the descriptors and install the handlers.             */
/*                                                                       */
/* INPUTS                                                                */
/*      pVoid     not used now                                           */
/*                                                                       */
/* OUTPUTS                                                               */
/*      None                                                             */
/*                                                                       */
/* RETURN                                                                */
/*      0           Success                                              */
/*		Otherwise	error												 */
/*                                                                       */
/*************************************************************************/
int32_t HID_Open(uint32_t inReportSize, void *pfGetInReport, void *pfSetOutReport)
{
	int32_t i32Ret = 0;

    if ((uint32_t)pfGetInReport != NULL)
        pfHID_GetInReport = (void(*)(uint8_t *))pfGetInReport;
        
    if ((uint32_t)pfSetOutReport != NULL)
        pfHID_SetOutReport = (void(*)(uint8_t *))pfSetOutReport;

	g_HID_sDevice.device = (void *)DrvUSB_InstallClassDevice(&sHidUsbClass);
	
	g_HID_ar8UsbBufSetup = ( __IO uint8_t *) DrvUSB_GetSetupBuffer();
	g_HID_ar8UsbBuf0 	 = ((__IO uint8_t *) sEpDescription[0].u8SramBuffer);
	g_HID_ar8UsbBuf1 	 = ((__IO uint8_t *) sEpDescription[2].u8SramBuffer);

	g_HID_sDevice.au8DeviceDescriptor = g_HID_au8DeviceDescriptor;
	g_HID_sDevice.au8ConfigDescriptor = g_HID_au8ConfigDescriptor;
	
	// Device Descriptor.
	//my_memcpy(
	//    g_HID_sDevice.au8DeviceDescriptor,
	//    g_HID_au8DeviceDescriptor,
	//    sizeof(g_HID_sDevice.au8DeviceDescriptor) / sizeof(g_HID_sDevice.au8DeviceDescriptor[0])
	//);
	// Configuration Descriptor.
	//my_memcpy(
	//    g_HID_sDevice.au8ConfigDescriptor,
	//    g_HID_au8ConfigDescriptor,
	//    34
	//);
	
	g_HID_sDevice.pu8ReportDescriptor = g_HID_au8MouseReportDescriptor;
	g_HID_sDevice.u32ReportDescriptorSize = g_HID_u32MouseReportDescriptorSize;
	g_HID_sDevice.pu8HIDDescriptor = g_HID_sDevice.au8ConfigDescriptor + LEN_CONFIG + LEN_INTERFACE;	
	g_HID_sDevice.pu8IntInEPDescriptor = g_HID_sDevice.au8ConfigDescriptor + LEN_CONFIG + LEN_INTERFACE + LEN_HID;
	
	g_HID_sDevice.sVendorInfo.psVendorStringDesc = &g_HID_sVendorStringDesc;
	g_HID_sDevice.sVendorInfo.psProductStringDesc = &g_HID_sProductStringDesc;
	g_HID_sDevice.sVendorInfo.u16VendorId = *(uint16_t *)&g_HID_sDevice.au8DeviceDescriptor[8];
	g_HID_sDevice.sVendorInfo.u16ProductId = *(uint16_t *)&g_HID_sDevice.au8DeviceDescriptor[10];

	g_HID_sDevice.u32ReportSize = inReportSize;
	
	i32Ret = DrvUSB_InstallCtrlHandler(g_HID_sDevice.device, g_asCtrlCallbackEntry, 
					sizeof(g_asCtrlCallbackEntry) / sizeof(g_asCtrlCallbackEntry[0]));
	return i32Ret;
}

void HID_Close(void)
{

}

static void HID_UsbStartCallBack(void * pVoid)
{
	HID_Reset((S_HID_DEVICE *)pVoid);
	HID_Start((S_HID_DEVICE *)pVoid);
}

static void HID_Reset(S_HID_DEVICE *psDevice)
{	
	DrvUSB_Reset(1);
}

static void HID_Start(S_HID_DEVICE *psDevice)
{
	DrvUSB_DataIn(1, psDevice->pu8Report, psDevice->u32ReportSize);
}


/*************************************************************************/
/*                                                                       */
/* DESCRIPTION                                                           */
/*      interrupt pipe call back function                                */
/*                                                                       */
/* INPUTS                                                                */
/*      pVoid     parameter passed by g_sUsbOps[]                        */
/*                                                                       */
/* OUTPUTS                                                               */
/*      None                                                             */
/*                                                                       */
/* RETURN                                                                */
/*      None                                                             */
/*                                                                       */
/*************************************************************************/
void HID_IntInCallback(void * pVoid)
{
	S_HID_DEVICE* psDevice = (S_HID_DEVICE*) pVoid;
	
	if ((uint32_t)pfHID_GetInReport)
	    pfHID_GetInReport(psDevice->pu8Report);
	
	DrvUSB_DataIn(1, psDevice->pu8Report, psDevice->u32ReportSize);
}

int32_t HID_GetVendorInfo(S_VENDOR_INFO *psVendorInfo)
{
	if (! psVendorInfo)
	{
		//return (E_HID_NULL_POINTER);
		return -1;
	}

	psVendorInfo->u16VendorId = g_HID_sDevice.sVendorInfo.u16VendorId;
	psVendorInfo->u16ProductId = g_HID_sDevice.sVendorInfo.u16ProductId;
	psVendorInfo->psVendorStringDesc = g_HID_sDevice.sVendorInfo.psVendorStringDesc;
	psVendorInfo->psProductStringDesc = g_HID_sDevice.sVendorInfo.psProductStringDesc;
	
	return 0;
}

/*************************************************************************/
/*                                                                       */
/* DESCRIPTION                                                           */
/*      Set vendor and product ID, and the string descriptor respectively*/
/*                                                                       */
/* INPUTS                                                                */
/*      psVendorInfo     vendor info structure                           */
/*                                                                       */
/* OUTPUTS                                                               */
/*      None                                                             */
/*                                                                       */
/* RETURN                                                                */
/*      0           Success                                              */
/*		Otherwise	error												 */
/*                                                                       */
/*************************************************************************/
int32_t HID_SetVendorInfo(const S_VENDOR_INFO *psVendorInfo)
{
	if (! psVendorInfo ||
	        ! psVendorInfo->psVendorStringDesc ||
	        ! psVendorInfo->psProductStringDesc)
	{
		//return (E_HID_NULL_POINTER);
		return -1;
	}

	g_HID_sDevice.sVendorInfo.u16VendorId = psVendorInfo->u16VendorId;
	g_HID_sDevice.sVendorInfo.u16ProductId = psVendorInfo->u16ProductId;
	g_HID_sDevice.sVendorInfo.psVendorStringDesc = psVendorInfo->psVendorStringDesc;
	g_HID_sDevice.sVendorInfo.psProductStringDesc = psVendorInfo->psProductStringDesc;

	return 0;
}


/*************************************************************************/
/*                                                                       */
/* DESCRIPTION                                                           */
/*      Set report descriptor. if not set, default will be used          */
/*      default HID report descriptor is mouse.                          */
/*                                                                       */
/* INPUTS                                                                */
/*      pu8ReportDescriptor     report descriptor buffer                 */
/*      u32ReportDescriptorSize report descriptor size                   */
/*                                                                       */
/* OUTPUTS                                                               */
/*      None                                                             */
/*                                                                       */
/* RETURN                                                                */
/*      0           Success                                              */
/*		Otherwise	error												 */
/*                                                                       */
/*************************************************************************/
int32_t HID_SetReportDescriptor(const uint8_t* pu8ReportDescriptor, uint32_t u32ReportDescriptorSize)
{
	if (pu8ReportDescriptor == NULL)
	{
		//return (E_HID_NULL_POINTER);
		return -1;
	}
	if (u32ReportDescriptorSize >= HID_MAX_PACKET_SIZE_EP0)
	{
		//return (E_HID_MUST_LESS_THAN_PACKET0_SIZE);
		return -1;
	}

	g_HID_sDevice.pu8ReportDescriptor = pu8ReportDescriptor;
	g_HID_sDevice.u32ReportDescriptorSize = u32ReportDescriptorSize;
	
	return 0;
}

/*************************************************************************/
/*                                                                       */
/* DESCRIPTION                                                           */
/*      Set report buffer and size for interrupt pipe                    */
/*                                                                       */
/* INPUTS                                                                */
/*      pu8Report     buffer that will be sent to host when interupt IN  */
/*						happen                                           */
/*      u32ReportSize     buffer size                                    */
/*                                                                       */
/* OUTPUTS                                                               */
/*      None                                                             */
/*                                                                       */
/* RETURN                                                                */
/*      0           Success                                              */
/*		Otherwise	error												 */
/*                                                                       */
/*************************************************************************/
int32_t HID_SetReportBuf(uint8_t* pu8Report, uint32_t u32ReportSize)
{
	if (pu8Report == NULL)
	{
		//return (E_HID_NULL_POINTER);
		return -1;
	}
	if (u32ReportSize > HID_MAX_PACKET_SIZE_EP1)
	{
		//return (E_HID_EXCEED_INT_IN_PACKET_SIZE);
		return -1;
	}

	g_HID_sDevice.pu8Report = pu8Report;
	g_HID_sDevice.u32ReportSize = u32ReportSize;

	return 0;
}


/*************************************************************************/
/*                                                                       */
/* DESCRIPTION                                                           */
/*      whether or not the configure value is configure value of HID     */
/*                                                                       */
/* INPUTS                                                                */
/*      pVoid     parameter passed by DrvUSB_RegisterCtrl                */
/*                                                                       */
/* OUTPUTS                                                               */
/*      None                                                             */
/*                                                                       */
/* RETURN                                                                */
/*      0           Success                                              */
/*		Otherwise	error												 */
/*                                                                       */
/*************************************************************************/
static int32_t HID_IsConfigureValue(uint8_t u8ConfigureValue)
{
	return (u8ConfigureValue == g_HID_au8ConfigDescriptor[5]);
}


/*************************************************************************/
/*                                                                       */
/* DESCRIPTION                                                           */
/*      The handler of Set Report request of HID request.                */
/*                                                                       */
/* INPUTS                                                                */
/*      pVoid     parameter passed by DrvUSB_InstallCtrlHandler          */
/*                                                                       */
/* OUTPUTS                                                               */
/*      None                                                             */
/*                                                                       */
/* RETURN                                                                */
/*      0           Success                                              */
/*		Otherwise	error												 */
/*                                                                       */
/*************************************************************************/
void HID_CtrlSetupSetReport(void * pVoid)
{
	S_DRVUSB_DEVICE *psDevice = (S_DRVUSB_DEVICE *)((S_HID_DEVICE *)pVoid)->device;

    //DBG_PRINTF("HID - Set Report");
	if(psDevice->au8Setup[3] == 1)
	{
        /* Report Type = input */

		// Trigger next Control Out DATA1 Transaction.
		_DRVUSB_SET_EP_TOG_BIT(1,0);
		_DRVUSB_TRIG_EP(1, 0);

        //DBG_PRINTF(" - Input\n");
	}
	else if (psDevice->au8Setup[3] == 2)
	{
		_DRVUSB_SET_EP_TOG_BIT(1, 0);
		_DRVUSB_TRIG_EP(1, 0x00);

        //DBG_PRINTF(" - Output\n");
	}
	else if (psDevice->au8Setup[3] == 3)
	{
        /* Request Type = Feature */
		_DRVUSB_SET_EP_TOG_BIT(1,0);
		_DRVUSB_TRIG_EP(1,0x00);

        //DBG_PRINTF(" - Feature\n");
	}
	else
	{
		// Not support. Reply STALL.       
        //DBG_PRINTF(" - Unknown\n");
		_HID_CLR_CTRL_READY_AND_TRIG_STALL();
	}
}

/*************************************************************************/
/*                                                                       */
/* DESCRIPTION                                                           */
/*      The handler of Set Idle request of HID request.                  */
/*                                                                       */
/* INPUTS                                                                */
/*      pVoid     parameter passed by DrvUSB_InstallCtrlHandler          */
/*                                                                       */
/* OUTPUTS                                                               */
/*      None                                                             */
/*                                                                       */
/* RETURN                                                                */
/*      0           Success                                              */
/*		Otherwise	error												 */
/*                                                                       */
/*************************************************************************/
void HID_CtrlSetupSetIdle(void * pVoid)
{
	_DRVUSB_SET_EP_TOG_BIT(0, 0);
	_DRVUSB_TRIG_EP(0,0x00);
    
	//DBG_PRINTF("Set idle\n");
}

/*************************************************************************/
/*                                                                       */
/* DESCRIPTION                                                           */
/*      The handler of Set Protocol request of HID request.              */
/*                                                                       */
/* INPUTS                                                                */
/*      pVoid     parameter passed by DrvUSB_InstallCtrlHandler          */
/*                                                                       */
/* OUTPUTS                                                               */
/*      None                                                             */
/*                                                                       */
/* RETURN                                                                */
/*      0           Success                                              */
/*		Otherwise	error												 */
/*                                                                       */
/*************************************************************************/
void HID_CtrlSetupSetProtocol(void * pVoid)
{
	_DRVUSB_SET_EP_TOG_BIT(0,0);
	_DRVUSB_TRIG_EP(0,0x00);

    //DBG_PRINTF("Set protocol");
}

static uint16_t Minimum(uint16_t a, uint16_t b)
{
	if (a > b)
		return b;
	else
		return a;
}


/*************************************************************************/
/*                                                                       */
/* DESCRIPTION                                                           */
/*      setup ACK handler for Get descriptor command                     */
/*                                                                       */
/* INPUTS                                                                */
/*      pVoid     parameter passed by DrvUSB_RegisterCtrl                */
/*                                                                       */
/* OUTPUTS                                                               */
/*      None                                                             */
/*                                                                       */
/* RETURN                                                                */
/*      0           Success                                              */
/*		Otherwise	error												 */
/*                                                                       */
/*************************************************************************/
void HID_CtrlSetupGetDescriptor(void * pVoid)
{
	S_HID_DEVICE *psDevice = (S_HID_DEVICE *) pVoid;
	S_DRVUSB_DEVICE *pUsbDevice = (S_DRVUSB_DEVICE *)psDevice->device;
	uint16_t u16Len;

	u16Len = 0;
	u16Len = pUsbDevice->au8Setup[7];
	u16Len <<= 8;
	u16Len += pUsbDevice->au8Setup[6];
	
	switch (pUsbDevice->au8Setup[3])
	{
		// Get Device Descriptor
		case DESC_DEVICE:
		{
			u16Len = Minimum(u16Len, LEN_DEVICE);

			DrvUSB_DataIn(0, g_HID_sDevice.au8DeviceDescriptor, u16Len);
			break;
		}
		// Get Configuration Descriptor
		case DESC_CONFIG:
		{
			u16Len = Minimum(u16Len, g_HID_au8ConfigDescriptor[2]);		
			DrvUSB_DataIn(0, g_HID_sDevice.au8ConfigDescriptor, u16Len);
			break;
		}
		// Get HID Descriptor
		case DESC_HID:
		{
			u16Len = Minimum(u16Len, LEN_HID);
			DrvUSB_DataIn(0, g_HID_sDevice.pu8HIDDescriptor, u16Len);
			break;
		}
		// Get Report Descriptor
		case DESC_HID_RPT:
		{
			u16Len = Minimum(u16Len, g_HID_sDevice.u32ReportDescriptorSize);
			DrvUSB_DataIn(0, g_HID_sDevice.pu8ReportDescriptor, u16Len);
			break;
		}
		// Get String Descriptor
		case DESC_STRING:
		{
			// Get Language
			if (pUsbDevice->au8Setup[2] == 0)
			{
				u16Len = Minimum(u16Len, 4);

				DrvUSB_DataIn(0, g_HID_au8StringLang, u16Len);
			}
			else
			{
				// Get String Descriptor
				switch (pUsbDevice->au8Setup[2])
				{
					case 1:
					{
						u16Len = Minimum(u16Len, g_HID_sDevice.sVendorInfo.psVendorStringDesc->byLength);
						DrvUSB_DataIn(0, (const uint8_t *)g_HID_sDevice.sVendorInfo.psVendorStringDesc, u16Len);
						break;
					}
					case 2:
					{
						u16Len = Minimum(u16Len, g_HID_sDevice.sVendorInfo.psProductStringDesc->byLength);
						DrvUSB_DataIn(0, (const uint8_t *)g_HID_sDevice.sVendorInfo.psProductStringDesc, u16Len);
						break;
					}
					case 3:
					{
						u16Len = Minimum(u16Len, g_HID_au8StringSerial[0]);
						DrvUSB_DataIn(0, g_HID_au8StringSerial, u16Len);
						break;
					}
					default:
						// Not support. Reply STALL.
						DrvUSB_ClrCtrlReadyAndTrigStall();
				}
			}
			break;
		}
		default:
			// Not support. Reply STALL.
			DrvUSB_ClrCtrlReadyAndTrigStall();
	}
}


