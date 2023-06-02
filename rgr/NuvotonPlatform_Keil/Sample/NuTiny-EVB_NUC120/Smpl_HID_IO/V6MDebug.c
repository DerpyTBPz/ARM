#include <stdio.h>
#include <stdint.h>
#include <string.h>

#include "DrvUSB.h"
#include "DrvGPIO.h"
#include "DrvSys.h"
#include "DrvUART.h"
#include "HIDSysIO.h"
#include "V6MDebug.h"


extern void USB_SendBackData(uint8_t bError, const uint8_t *pu8Buffer, uint32_t u32Size);

static void VCMD_AckCommand(uint32_t u32Errno, const uint8_t *pu8Buffer, uint32_t u32Len)
{
    USB_SendBackData((u32Errno == 0 ? FALSE : TRUE), pu8Buffer, u32Len);
}

static uint32_t VCMD_WillResetCommandSerial(const uint8_t *pu8Buffer, uint32_t u32Len)
{
    return 0;	//Reset in V6M_ProcessCommand
}

static uint32_t V6M_ProcessOneCommand(const uint8_t *pu8Buffer, uint32_t u32Len)
{
    uint32_t u32Cmd;

    memcpy(&u32Cmd, pu8Buffer, sizeof(u32Cmd));
    switch (u32Cmd)
    {
    case V6M_CMD_LED_ON:
        return LED_on(pu8Buffer, u32Len, 15);

    case V6M_CMD_LED5_ON:
        return LED_on(pu8Buffer, u32Len, 5);

    case V6M_CMD_LED6_ON:
        return LED_on(pu8Buffer, u32Len, 6);

    case V6M_CMD_LED7_ON:
        return LED_on(pu8Buffer, u32Len, 7);

    case V6M_CMD_LED8_ON:
        return LED_on(pu8Buffer, u32Len, 8);

    case V6M_CMD_LED_OFF:
        return LED_off(pu8Buffer, u32Len, 15);

    case V6M_CMD_LED5_OFF:
        return LED_off(pu8Buffer, u32Len, 5);

    case V6M_CMD_LED6_OFF:
        return LED_off(pu8Buffer, u32Len, 6);

    case V6M_CMD_LED7_OFF:
        return LED_off(pu8Buffer, u32Len, 7);

    case V6M_CMD_LED8_OFF:
        return LED_off(pu8Buffer, u32Len, 8);

    case V6M_CMD_RESET_CMD_SRIAL:
        return VCMD_WillResetCommandSerial(pu8Buffer, u32Len);

    default:
        //DrvSIO_printf("Unknown cmd: %02x\n", u32Cmd);

        return 1;
    }
}


void V6M_ProcessCommand(const uint8_t *pu8Buffer, uint32_t u32Len)
{

    static uint8_t au8CmdBuffer[V6M_MAX_COMMAND_LENGTH];
    static uint32_t u32BufferLen = 0;

    memcpy(au8CmdBuffer, pu8Buffer, 62);

    V6M_ProcessOneCommand(au8CmdBuffer, u32BufferLen);

}

uint32_t LED_on(const uint8_t *pu8Buffer, uint32_t u32Len, uint8_t u8LedNum)
{
    uint8_t i, au32Data[62] = {0};
    uint32_t u32Errno = 0;

    printf("PC Send command\n");

    if (u8LedNum == 5)
        printf("GPC0 Output Low\n");
    else if (u8LedNum == 6)
        printf("GPC1 Output Low\n");
    else if (u8LedNum == 7)
        printf("GPC2 Output Low\n");
    else if (u8LedNum == 8)
        printf("GPC3 Output Low\n");
    else
        printf("GPC0~3 Output Low\n");

    if (u8LedNum != 15)
    {
        //Defined GPC0~GPC3
        DrvGPIO_Open(E_GPC, u8LedNum - 5, E_IO_OUTPUT);
        DrvGPIO_ClrBit(E_GPC, u8LedNum - 5);
    }
    else
    {
        for (i = 0;i < 4;i++)
        {
            DrvGPIO_Open(E_GPC, i, E_IO_OUTPUT);
            DrvGPIO_ClrBit(E_GPC, i);
        }
    }

    VCMD_AckCommand(u32Errno, (const uint8_t *)&au32Data, 62);
    return 0;
}

uint32_t LED_off(const uint8_t *pu8Buffer, uint32_t u32Len, uint8_t u8LedNum)
{
    uint8_t i, au32Data[62] = {0};
    uint32_t u32Errno = 0;

    printf("PC Send command\n");

    if (u8LedNum == 5)
        printf("GPC0 Output High\n");
    else if (u8LedNum == 6)
        printf("GPC1 Output High\n");
    else if (u8LedNum == 7)
        printf("GPC2 Output High\n");
    else if (u8LedNum == 8)
        printf("GPC0 Output High\n");
    else
        printf("GPC0~3 Output High\n");

    if (u8LedNum != 15)
    {
        //Defined GPC0~GPC3
        DrvGPIO_Open(E_GPC, u8LedNum - 5, E_IO_OUTPUT);
        DrvGPIO_SetBit(E_GPC, u8LedNum - 5);
    }
    else
    {
        for (i = 0;i < 4;i++)
        {
            DrvGPIO_Open(E_GPC, i, E_IO_OUTPUT);
            DrvGPIO_SetBit(E_GPC, i);
        }
    }

    VCMD_AckCommand(u32Errno, (const uint8_t *)&au32Data, 62);
    return 0;
}

