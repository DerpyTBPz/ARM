/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* Copyright(c) 2009 Nuvoton Technology Corp. All rights reserved.                                         */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/
#include <stdio.h>
#include "NUC1xx.h"
#include "DrvSPI.h"
#include "DrvSYS.h"
#include "DrvSDCARD.h"


#include "efs.h"
#include "ls.h"
#include "mkfs.h"


//#define DBG_PRINTF(...)		
//#define DBG_PRINTF debug
#define DBG_PRINTF printf

uint8_t Storage_Block[512];


void Delay(uint32_t delayCnt)
{
    while(delayCnt--)
    {
        __NOP();
        __NOP();
    }
}
void EFSL_test(void)
{
	EmbeddedFileSystem efs;
	EmbeddedFile file_r,file_w;
	DirList list;
	int16_t	e; 	
	
	if(efs_init(&efs,0)!=0){
		DBG_PRINTF("failed with\n");
		while(1);
	}else
	{
		DBG_PRINTF("ok\n");
		DBG_PRINTF("Directory of 'root':\n");
		ls_openDir( &list, &(efs.myFs) , "/");
		while ( ls_getNext( &list ) == 0 ) 
		{
			list.currentEntry.FileName[LIST_MAXLENFILENAME-1] = '\0';
			DBG_PRINTF( "%s ( %li bytes )\n" ,list.currentEntry.FileName,list.currentEntry.FileSize ) ;
		}
	}


	if(file_fopen(&file_r,&efs.myFs,"orig.txt",'r')!=0){
		DBG_PRINTF("Don't find 'orig.txt'\n");
		while(1);
	}

	if(file_fopen(&file_w,&efs.myFs,"append.txt",'a')!=0){
		DBG_PRINTF("Don't find 'append.txt'\n");
		while(1);
	}
	

	do
	{
		e=file_read(&file_r,512,Storage_Block);
		file_write(&file_w,e,Storage_Block);
	}while(e);

	file_fclose(&file_r);
	file_fclose(&file_w);

	fs_umount(&efs.myFs);	
}
/*----------------------------------------------------------------------------
  MAIN function
 *----------------------------------------------------------------------------*/
int32_t main(void)
{

	UNLOCKREG();
	SYSCLK->PWRCON.XTL12M_EN = 1;

	DrvSYS_SetPLLMode(0);
	Delay(5000);	  
	
	DrvSYS_SelectHCLKSource(2);   
	Delay(100);
	LOCKREG();

	debug_init();
	DBG_PRINTF("\n\nPlease Change Stack size to 0x1000\n");

	EFSL_test();
  while(1);
}



