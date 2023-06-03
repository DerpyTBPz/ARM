/*

*********************************************************************************************************

*                                       APPLICATION CONFIGURATION

*

*                             (c) Copyright 2010, Micrium, Inc., Weston, FL

*                                          All Rights Reserved

*


*********************************************************************************************************

*/

/*
*********************************************************************************************************
*
*                                       APPLICATION CONFIGURATION
*
*                                             NUCVTON NUC1XX
*                                                on the
*                                  NUC100 Evaluation Board
*
* Filename      : app_cfg.h
* Version       : V1.00
* Programmer(s) : Ken
*********************************************************************************************************
*/

/*

*********************************************************************************************************

*                                            TASK PRIORITIES

*********************************************************************************************************

*/
#ifndef __UCOS_APP_CFG_H
#define __UCOS_APP_CFG_H

#include <stdint.h>

#define OS_TASK_TMR_PRIO	26//The priority of the Timer management task

int32_t OS_UART_HANDLE(void);

//#define SEM_TEST
//#define THREAD_TEST
//#define MBOX_TEST
//#define FLAG_TEST
//#define MALLOC_TEST
//#define MEM_TEST
#define MUTEX_TEST
//#define QUEUE_TEST
//#define TMR_TEST
#endif//__UCOS_APP_CFG_H
