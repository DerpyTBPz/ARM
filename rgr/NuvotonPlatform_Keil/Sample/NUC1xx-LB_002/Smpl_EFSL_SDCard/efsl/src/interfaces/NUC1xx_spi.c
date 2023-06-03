/*****************************************************************************\
*              efs - General purpose Embedded Filesystem library              *
*          --------------------- -----------------------------------          *
*                                                                             *
* Filename : NUC1xx_spi.c                                                     *
* Description : This file contains the functions needed to use efs for        *
*               accessing files on an SD-card connected to an NUC1xx.         *
*                                                                             *
* This program is free software; you can redistribute it and/or               *
* modify it under the terms of the GNU General Public License                 *
* as published by the Free Software Foundation; version 2                     *
* of the License.                                                             *
                                                                              *
* This program is distributed in the hope that it will be useful,             *
* but WITHOUT ANY WARRANTY; without even the implied warranty of              *
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the               *
* GNU General Public License for more details.                                *
*                                                                             *
* As a special exception, if other files instantiate templates or             *
* use macros or inline functions from this file, or you compile this          *
* file and link it with other works to produce a work based on this file,     *
* this file does not by itself cause the resulting work to be covered         *
* by the GNU General Public License. However the source code for this         *
* file must still be made available in accordance with section (3) of         *
* the GNU General Public License.                                             *
*                                                                             *
* This exception does not invalidate any other reasons why a work based       *
* on this file might be covered by the GNU General Public License.            *
*                                                                             *
*                                                    (c)2005 Martin Thomas    *
\*****************************************************************************/

/*****************************************************************************/
#include "NUC1xx.h"
#include "DrvSDCARD.h"
#include "interfaces/arm_spi.h"
#include "config.h"
/*****************************************************************************/

#ifndef HW_ENDPOINT_NUC1xx_SD
#error "HW_ENDPOINT_NUC1xx_SD has to be defined in config.h"
#endif



esint8 if_initInterface(hwInterface* file, eint8* opts)
{
	uint32_t sc;

	GPIOD->PMD.PMD12=1;
	GPIOD->DOUT&=0xEFFF;

	while((GPIOD->PIN&0x2000)!=0);	
	
	if(DrvSDCARD_Open()!=0)	{
		DBG((TXT("Card failed to init, breaking up...\n")));
		return(-1);
	}
	
	DrvSDCARD_GetCardSize(&sc);
	file->sectorCount = sc/512;
	
	DBG((TXT("Drive Size is %d MBytes (%d Sectors)\n"), sc/1024/1024, file->sectorCount));
	
	
	DBG((TXT("Init done...\n")));
	return(0);
}
/*****************************************************************************/ 

esint8 if_readBuf(hwInterface* file,euint32 address,euint8* buf)
{
	SpiRead(address, 512,buf);
	return(0);
	
}
/*****************************************************************************/

esint8 if_writeBuf(hwInterface* file,euint32 address,euint8* buf)
{
	SpiWrite(address, 512,buf);
	return(0);
}
/*****************************************************************************/ 

esint8 if_setPos(hwInterface* file,euint32 address)
{
	return(0);
}
/*****************************************************************************/ 

