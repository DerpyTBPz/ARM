/*
*********************************************************************************************************
*                                              EXAMPLE CODE
*
*                              (c) Copyright 2010; Micrium, Inc.; Weston, FL
*
*               All rights reserved.  Protected by international copyright laws.
*               Knowledge of the source code may NOT be used to develop a similar product.
*               Please help us continue to provide the Embedded community with the finest
*               software available.  Your honesty is greatly appreciated.
*********************************************************************************************************
*/

/*
*********************************************************************************************************
*
*                                              EXAMPLE CODE
*											      NUVOTON
*                                        NUC100 Evaluation Board
*
* Filename      : app.c
* Version       : V1.00
* Programmer(s) : Ken
*********************************************************************************************************
*/
#include <ucos_ii.h>
#include "app_cfg.h" 
#include "cpu.h"

#include <stdio.h>
#include "Driver\DrvUART.h"
#include "Driver\DrvGPIO.h"
#include "NUC100.h"

//#include <stdlib.h>

/*
*********************************************************************************************************
*                                             LOCAL DEFINES
*********************************************************************************************************
*/

/*
*********************************************************************************************************
*                                            LOCAL VARIABLES
*********************************************************************************************************
*/


#define STACKSIZE 128

#ifdef MBOX_TEST
OS_STK Task1_Stack[STACKSIZE]; 
void Task1(void *Id);
#define Task1_Prio     21

OS_STK Task2_Stack[STACKSIZE]; 
void Task2(void *Id); 
#define  Task2_Prio       22

typedef struct{
	char buffer[64];//msg
	int index;
}msg_t;

INT8U index;

#define MSG_COUNT	10
static msg_t msg[MSG_COUNT];

OS_EVENT *CommMbox;
#endif

#ifdef THREAD_TEST
OS_STK SYS_Task_Stack[STACKSIZE]; 
#define SYS_Task_Prio				21
void SYS_Task(void *Id);

OS_STK Task1_Stack[STACKSIZE]; 
void Task1(void *Id);
#define Task1_Prio     22

OS_STK Task2_Stack[STACKSIZE];
void Task2(void *Id); 
#define  Task2_Prio       20
#endif

#ifdef SEM_TEST

OS_STK Task1_Stack[STACKSIZE]; 
void Task1(void *Id);
#define Task1_Prio     51

OS_STK Task2_Stack[STACKSIZE]; 
void Task2(void *Id); 
#define  Task2_Prio       52

OS_EVENT *DispSem;
INT8S flag;
#endif

#ifdef FLAG_TEST
OS_STK SYS_Task_Stack[STACKSIZE]; 
#define SYS_Task_Prio				51
void SYS_Task(void *Id);

OS_STK Task1_Stack[STACKSIZE]; 
void Task1(void *Id);
#define Task1_Prio     52

OS_FLAG_GRP *EngineFlags;
INT8U EngineName[30];

#define ENGINE_OK 0x01
#endif

#ifdef MALLOC_TEST
#define	BLOCK_SIZE		(0x20)
#define	VERIFY_MASK		0x55

OS_STK Lib_Stack[STACKSIZE]; 
#define LibTask_Prio     52
void LibTask(void *Id);
#endif

#ifdef MEM_TEST
OS_STK Task1_Stack[STACKSIZE]; 
void Task1(void *Id);
#define Task1_Prio     52

OS_MEM *CommMem;
INT32U CommBuf[16][32];
#endif

#ifdef MUTEX_TEST
OS_STK Task1_Stack[STACKSIZE]; 
void Task1(void *Id);
#define Task1_Prio     22

OS_STK Task2_Stack[STACKSIZE]; 
void Task2(void *Id); 
#define  Task2_Prio       23

OS_EVENT *DispMutex;

INT32U cri1, cri2;
INT32U count;

#endif

#ifdef QUEUE_TEST
OS_STK Task1_Stack[STACKSIZE];
void Task1(void *Id);
#define Task1_Prio     52

OS_STK Task2_Stack[STACKSIZE]; 
void Task2(void *Id); 
#define  Task2_Prio       53

typedef struct{
	char buffer[64];//msg
	int index;
}msg_t;

INT8U index;

#define MSG_COUNT	10
static msg_t msg[MSG_COUNT];
static msg_t *pmsg[MSG_COUNT];

OS_EVENT *CommQ;
OS_FLAG_GRP *EngineFlags;
#endif

#ifdef TMR_TEST
OS_STK SYS_Task_Stack[STACKSIZE]; 
#define SYS_Task_Prio				51
void SYS_Task(void *Id);

OS_TMR *TmrTest;
INT8U volatile TmrCnt;
#endif
/*
*********************************************************************************************************
*                                            LOCAL FUCTION
*********************************************************************************************************
*/
int32_t BSP_INIT_UART0(void)
{
	STR_UART_T param;

	/* SYSCLK =>12Mhz*/
	//UNLOCKREG();
    //SYSCLK->PWRCON.XTL12M_EN = 1;

	DrvGPIO_InitFunction(FUNC_UART0);
	
    param.u32BaudRate        = 115200;
    param.u8cDataBits        = DRVUART_DATABITS_8;
    param.u8cStopBits        = DRVUART_STOPBITS_1;
    param.u8cParity          = DRVUART_PARITY_NONE;
    param.u8cRxTriggerLevel  = DRVUART_FIFO_1BYTES;
    param.u8TimeOut        	 = 0;
    if(DrvUART_Open(UART_PORT0,&param) == 0)
		return TRUE;
	else
		return FALSE;
}

#ifdef UART_OS_TEST
OS_STK UART_Stack[STACKSIZE]; 
#define UARTTask_Prio     50

void UARTTask(void *Id)
{	
#if OS_CRITICAL_METHOD == 3                         /* Allocate storage for CPU status register           */
	OS_CPU_SR  cpu_sr;
#endif
	(void)Id;//remove warning

	OS_UART_HANDLE();
	
	while(1)OSTimeDly(3000);
}	// main
#endif

void SysTick_Handler(void)
{
	OS_CPU_SR  cpu_sr;

    OS_ENTER_CRITICAL();;                                       
    OSIntNesting++;
    OS_EXIT_CRITICAL();

	OSTimeTick();

	OSIntExit();
}

void Delay(uint32_t delayCnt)
{
    while(delayCnt--)
    {
        __NOP();
        __NOP();
    }
}

/*
*********************************************************************************************************
*                                                main()
*
* Description : This is the standard entry point for C code.  It is assumed that your code will call
*               main() once you have performed all necessary C initialization.
*
* Argument(s) : none.
*
* Return(s)   : none.
*********************************************************************************************************
*/

/*__ASM void __set_PRIMASK(uint32_t priMask)
{
  msr primask, r0
  bx lr
} */

int  main (void)
{
    CPU_INT08U  err;
	int i;
	//SysTick_Config(SYSTICK_MAXCOUNT);
	//__set_PRIMASK(1);
    //BSP_IntDisAll();                                            /* Dis all int until we are ready to accept them.       */
	UNLOCKREG();
	SYSCLK->PWRCON.OSC22M_EN = 1;//default is enabled 
	SYSCLK->PWRCON.XTL12M_EN = 1;
	SYSCLK->CLKSEL0.HCLK_S = 0;//using 12M as HCLK src
    Delay(100);
	SystemFrequency = 12000000;

	BSP_INIT_UART0();
    OSInit();
	UNLOCKREG();

	SysTick_Config(120000);
	                                                   /* Initialize "uC/OS-II, The Real-Time Kernel".         */
 #if 0
    OSTaskCreateExt(AppTaskStart,                               /* Create the start task.                               */
                    (void *)0,
                    (OS_STK *)&AppTaskStartStk[APP_TASK_START_STK_SIZE - 1],
                    APP_TASK_START_PRIO,
                    APP_TASK_START_PRIO,
                    (OS_STK *)&AppTaskStartStk[0],
                    APP_TASK_START_STK_SIZE,
                    (void *)0,
                    OS_TASK_OPT_STK_CHK | OS_TASK_OPT_STK_CLR);

#if (OS_TASK_NAME_SIZE > 13)
    OSTaskNameSet(APP_TASK_START_PRIO, "Start Task", &err);
#endif
#endif
#ifdef OS_UART_TEST
	OSTaskCreate(UARTTask,  (void *)0,  (OS_STK *)&UART_Stack[STACKSIZE-1],  UARTTask_Prio);
#endif
#ifdef MBOX_TEST
	printf("\msgbox Sample Demo. \n");

	CommMbox = OSMboxCreate((void *)0); /* Create COMM mailbox */
	for(i = 0; i < MSG_COUNT; i++)
	{
		sprintf(msg[i].buffer, "Msg Test %d", i);
		msg[i].index = i;
	}
	
	
	OSTaskCreate(Task2,  (void *)0,  (OS_STK *)&Task2_Stack[STACKSIZE-1],  Task2_Prio);
	OSTaskCreate(Task1,  (void *)0,  (OS_STK *)&Task1_Stack[STACKSIZE-1],  Task1_Prio);
#endif
#ifdef THREAD_TEST
	OSTaskCreate(SYS_Task,  (void *)0,  (OS_STK *)&SYS_Task_Stack[STACKSIZE-1],  SYS_Task_Prio);
    OSTaskCreate(Task2,  (void *)0,  (OS_STK *)&Task2_Stack[STACKSIZE-1],  Task2_Prio);
	OSTaskCreate(Task1,  (void *)0,  (OS_STK *)&Task1_Stack[STACKSIZE-1],  Task1_Prio);
#endif

#ifdef SEM_TEST
	DispSem = OSSemCreate(0); /* Create Semaphore*/
	
	OSTaskCreate(Task2,  (void *)0,  (OS_STK *)&Task2_Stack[STACKSIZE-1],  Task2_Prio);
	OSTaskCreate(Task1,  (void *)0,  (OS_STK *)&Task1_Stack[STACKSIZE-1],  Task1_Prio);
#endif

#ifdef FLAG_TEST
	OSTaskCreate(SYS_Task,  (void *)0,  (OS_STK *)&SYS_Task_Stack[STACKSIZE-1],  SYS_Task_Prio);
#endif
#ifdef MALLOC_TEST
	OSTaskCreate(LibTask, (void *)0, (OS_STK *)&Lib_Stack[STACKSIZE-1], LibTask_Prio);
#endif

#ifdef MEM_TEST
	CommMem = OSMemCreate(&CommBuf[0][0], 16, 32 * sizeof(INT32U), &err);
	
	OSTaskCreate(Task1,  (void *)0,  (OS_STK *)&Task1_Stack[STACKSIZE-1],  Task1_Prio);
#endif

#ifdef MUTEX_TEST
	DispMutex = OSMutexCreate(20/*pip*/, &err); /* Create Display Mutex */
	
	OSTaskCreate(Task2,  (void *)0,  (OS_STK *)&Task2_Stack[STACKSIZE-1],  Task2_Prio);
	OSTaskCreate(Task1,  (void *)0,  (OS_STK *)&Task1_Stack[STACKSIZE-1],  Task1_Prio);
#endif

#ifdef QUEUE_TEST
	CommQ = OSQCreate((void*)&pmsg[0], MSG_COUNT);
	EngineFlags = OSFlagCreate(0x00, &err);
	
	OSTaskCreate(Task2,  (void *)0,  (OS_STK *)&Task2_Stack[STACKSIZE-1],  Task2_Prio);
	OSTaskCreate(Task1,  (void *)0,  (OS_STK *)&Task1_Stack[STACKSIZE-1],  Task1_Prio);
#endif

#ifdef TMR_TEST
	OSTaskCreate(SYS_Task,  (void *)0,  (OS_STK *)&SYS_Task_Stack[STACKSIZE-1],  SYS_Task_Prio);
#endif
	OSStart();                                                  /* Start multitasking (i.e. give control to uC/OS-II).  */
}

#ifdef TMR_TEST
void TimerCallBack(void *ptmr, void *parg)
{
	printf("Timer expired %d\n", ++TmrCnt);
}

void SYS_Task(void *Id)
{   
	INT8U err;
	BOOLEAN status;
	
	TmrCnt = 0;
	
	printf("Start Timer Testing clock unit is %d.\n", OS_TMR_CFG_TICKS_PER_SEC);
	TmrTest = OSTmrCreate( 10,
							100,//100*OS_TICKS_PER_SEC / OS_TMR_CFG_TICKS_PER_SEC ticks=10s
							OS_TMR_OPT_PERIODIC,
							TimerCallBack,
							(void *)0,
							(INT8U*)"Door Close",
							&err);
	if (err == OS_ERR_NONE) {
		/* Timer was created but NOT started */
		status = OSTmrStart(TmrTest,&err);
		if (err == OS_ERR_NONE) {
			/* Timer was started */
			printf("Timer started.\n");
		}
		else
		{
			printf("Timer start failed.\n");
			goto out;
		}
	}
	else
	{
		printf("Timer create failed.\n");
		goto out;
	}
	for (;;)
	{
		if(TmrCnt >= 100)
		{
			printf("Timer happened %d times. stop it\n", TmrCnt);
			OSTmrStop(TmrTest, OS_TMR_OPT_CALLBACK, (void *)0, &err);
			break;
		}
	}
out:
	while(1) OSTimeDly(3000);
}	
#endif

#ifdef MUTEX_TEST
void Task1(void *Id)
{
	INT8U err;
	for(;;){
		OSMutexPend(DispMutex, 0, &err);
		if(cri1 != cri2)
			printf("Mutex lock error %d\n", err);
		else
			printf("Mutex lock count %d\n", count);
		count++;
		err = OSMutexPost(DispMutex);
		if(count % 100000 == 0)
			printf("Mutex lock/unlock %d times\n", count);
		OSTimeDly(30);
	}
}

void Task2(void *Id)
{
	INT8U err;
	for (;;)
	{
		OSMutexPend(DispMutex, 0, &err);
		cri1++;
		cri2++;
		err = OSMutexPost(DispMutex);
	}
}
	
#endif

#ifdef MBOX_TEST
void Task1(void *Id)
{
	INT8U err;
	msg_t *pmsg;
	
	(void)Id;
	
	for(;;){
		pmsg = (msg_t*)OSMboxPend(CommMbox, 10, &err);
		if (err == OS_ERR_NONE) {

			printf("get message:%s!\n", pmsg->buffer);
		} else {
			/* Code for message not received within timeout */
			printf("Task1 get message timeout\n");
		}
		//OSTimeDly(3000);
	}
}

void Task2(void *Id)
{
	INT8U err;
	for (;;)
	{
		printf("post msg index=%d\n", index);
		err = OSMboxPost(CommMbox, (void *)&msg[index++]);
		if(index >= MSG_COUNT)
			index = 0;

		//OSTimeDly(3000);
	}
}
#endif

#ifdef THREAD_TEST
void Task1(void *Id)
{
	for(;;){
		printf("Task1 is running\n");
		OSTimeDly(100);
	}
}

void Task2(void *Id)
{
	for (;;)
	{
		printf("\tTask2 is running\n");
		OSTimeDly(200);
	}
}

void SYS_Task(void *Id)
{   
	//OSTaskCreate(Task2,  (void *)0,  (OS_STK *)&Task2_Stack[STACKSIZE-1],  Task2_Prio);
	//OSTaskCreate(Task1,  (void *)0,  (OS_STK *)&Task1_Stack[STACKSIZE-1],  Task1_Prio);
	for (;;)
	{
		printf("Main_task is running.\n");
		OSTimeDly(150);
	}
}
#endif

#ifdef SEM_TEST
void Task1(void *Id)
{
	INT8U err;
	
	for(;;){
		OSSemPend(DispSem, 0, &err);
		if(flag <=0)
			printf("Sem get error\n");
		else
			flag--;
	}
}

void Task2(void *Id)
{
	INT8U err;

	for (;;)
	{
		flag++;
		err = OSSemPost(DispSem);
		switch (err) {
		case OS_ERR_NONE:
			/* Semaphore signaled */
			break;
		case OS_ERR_SEM_OVF:
			/* Semaphore has overflowed DispSem->OSEventCnt >= 65535*/
			printf("Semaphoe overflowed\n");
			break;
		}
	}
}
#endif

#ifdef FLAG_TEST
void Task1(void *Id)
{
	INT8U err;
	OS_FLAGS value;
	
	(void)Id;//remove warning
	
	for(;;){
		printf("\tTask1 is running\n");
		OSTimeDly(100);
		value = OSFlagPend(EngineFlags,
					ENGINE_OK,
					OS_FLAG_WAIT_SET_ALL + OS_FLAG_CONSUME,//clr flag after be read
					0,//0 for forever
					&err);
		if(err == OS_ERR_NONE)
		{
			printf("\tTask1 get flag %x\n", value);
		}
		else
			printf("\tTask1 wait flag error %d\n", err);
	}
}


void SYS_Task(void *Id)
{   
	INT8U err, size;
	OS_FLAG_GRP *pgrp;
	
	(void)Id;//remove warning
	
	EngineFlags = OSFlagCreate(0x00, &err);
	size = OSFlagNameGet(EngineFlags,
			&EngineName[0],
			&err);
	if(err == OS_ERR_NONE)
	{
		printf("FlagName is %s\n", EngineName);
	}
	
	OSTaskCreate(Task1,  (void *)0,  (OS_STK *)&Task1_Stack[STACKSIZE-1],  Task1_Prio);
	for (;;)
	{
		printf("Main_task is running.\n");
		
		OSTimeDly(150);
		err = OSFlagPost(EngineFlags,
					ENGINE_OK,
					OS_FLAG_SET,
					&err);
	}
	
	pgrp = OSFlagDel(EngineFlags, OS_DEL_ALWAYS, &err);
	if (pgrp == (OS_FLAG_GRP *)0) {
		/* The event flag group was deleted */
	}
	
}
#endif

#ifdef MALLOC_TEST
void LibTask(void *Id)
{
	INT32U	u32TotalBytes = 0;

	(void)Id;//remove warning
	
	printf("Please wait a while.\n");
#if 0	
	while (1)
	{
		// try to malloc
		char *	pi8Mem;
		INT32U 	u32Index;
		
		pi8Mem = (char *)malloc(BLOCK_SIZE);
		//__heapstats((__heapprt)fprintf,stderr);
		
		if (pi8Mem == NULL)
		{
			printf("malloc(0x%X bytes): end, stop.\n", BLOCK_SIZE);
			break;
		} // if

		u32TotalBytes += BLOCK_SIZE;
		printf("malloc(0x%X bytes) at 0x%08X (total: 0x%0X bytes), verify: ",
			BLOCK_SIZE, (INT32U)pi8Mem, u32TotalBytes);
		
		// access verify
		for (u32Index = 0; u32Index < BLOCK_SIZE; u32Index++)
		{
			const INT8S	i8Char = (INT8S)(u32Index ^ VERIFY_MASK);

			pi8Mem[u32Index] = i8Char;
			if (pi8Mem[u32Index] != i8Char)
			{
				printf( "fail at 0x%08X, stop.\n", (INT32U)(pi8Mem + u32Index) );
				goto out;
			} // if
		} // for
		printf("pass.\n");
	} // while
out:
	//fflush(stdout);
#endif
	while(1) OSTimeDly(3000);

}
#endif

#ifdef MEM_TEST
void Task1(void *Id)
{
	INT8U *pmsg;
	INT8U err;
	
	for(;;){
		
		pmsg = OSMemGet(CommMem, &err);
		if (pmsg != (INT8U *)0) {
			/* Memory block allocated, use it. */
			printf("mem get success:%x\n", pmsg);
			strcpy((char*)pmsg, "mem test");
			err = OSMemPut(CommMem, (void *)pmsg);
			if (err == OS_ERR_NONE) {
				/* Memory block released */
			}
		}
	}
}
#endif
#ifdef QUEUE_TEST
void Task2(void *Id)
{
	INT8U err;
	msg_t *pmsg;
	
	for(;;){
		pmsg = (msg_t*)OSQPend(CommQ, 100, &err);
		if (err == OS_ERR_NONE) {
			/* Message received within 100 ticks! */
			printf("get message:%s!\n", pmsg->buffer);
			err = OSFlagPost(EngineFlags,
					1,//set bit 0 = 1
					OS_FLAG_SET,
					&err);

		} else {
			/* Message not received, must have timed out */
			printf("Task1 get message timeout\n");
		}
	}
}

void Task1(void *Id)
{
	INT8U err;
	OS_FLAGS value;
	
	for (;;)
	{
		printf("post msg index=%d\n", index);
		err = OSQPost(CommQ, (void *)&msg[index]);
		switch (err) {
		case OS_ERR_NONE:
			/* Message was deposited into queue */
			index++;
			break;
		case OS_ERR_Q_FULL:
			/* Queue is full */
			err = OSFlagPost(EngineFlags,
					0xFF,//clear 0-7 bit
					OS_FLAG_CLR,
					&err);
			value = OSFlagPend(EngineFlags,
					1,//wait bit 0 be set
					OS_FLAG_WAIT_SET_ALL + OS_FLAG_CONSUME,//clr flag after be read
					0,//0 for forever
					&err);
			break;

		}
		if(index >= MSG_COUNT)
			index = 0;
	}
}

#endif
/*
*********************************************************************************************************
*********************************************************************************************************
**                                         uC/OS-II APP HOOKS
*********************************************************************************************************
*********************************************************************************************************
*/


/*
*********************************************************************************************************
*                                      TASK CREATION HOOK (APPLICATION)
*
* Description : This function is called when a task is created.
*
* Argument(s) : ptcb   is a pointer to the task control block of the task being created.
*
* Note(s)     : (1) Interrupts are disabled during this call.
*********************************************************************************************************
*/
#if OS_APP_HOOKS_EN > 0
void  App_TaskCreateHook (OS_TCB *ptcb)
{
	(void)ptcb;
}
#endif
/*
*********************************************************************************************************
*                                    TASK DELETION HOOK (APPLICATION)
*
* Description : This function is called when a task is deleted.
*
* Argument(s) : ptcb   is a pointer to the task control block of the task being deleted.
*
* Note(s)     : (1) Interrupts are disabled during this call.
*********************************************************************************************************
*/
#if OS_APP_HOOKS_EN > 0
void  App_TaskDelHook (OS_TCB *ptcb)
{
    (void)ptcb;
}
#endif
/*
*********************************************************************************************************
*                                      IDLE TASK HOOK (APPLICATION)
*
* Description : This function is called by OSTaskIdleHook(), which is called by the idle task.  This hook
*               has been added to allow you to do such things as STOP the CPU to conserve power.
*
* Argument(s) : none.
*
* Note(s)     : (1) Interrupts are enabled during this call.
*********************************************************************************************************
*/
#if OS_APP_HOOKS_EN > 0 && OS_VERSION >= 251
void  App_TaskIdleHook (void)
{
}
#endif
/*
*********************************************************************************************************
*                                        STATISTIC TASK HOOK (APPLICATION)
*
* Description : This function is called by OSTaskStatHook(), which is called every second by uC/OS-II's
*               statistics task.  This allows your application to add functionality to the statistics task.
*
* Argument(s) : none.
*********************************************************************************************************
*/
#if OS_APP_HOOKS_EN > 0
void  App_TaskStatHook (void)
{
}
#endif
/*
*********************************************************************************************************
*                                        TASK SWITCH HOOK (APPLICATION)
*
* Description : This function is called when a task switch is performed.  This allows you to perform other
*               operations during a context switch.
*
* Argument(s) : none.
*
* Note(s)     : (1) Interrupts are disabled during this call.
*
*               (2) It is assumed that the global pointer 'OSTCBHighRdy' points to the TCB of the task that
*                   will be 'switched in' (i.e. the highest priority task) and, 'OSTCBCur' points to the
*                  task being switched out (i.e. the preempted task).
*********************************************************************************************************
*/

#if OS_APP_HOOKS_EN > 0 && OS_TASK_SW_HOOK_EN > 0
void  App_TaskSwHook (void)
{
}
#endif

/*
*********************************************************************************************************
*                                     OS_TCBInit() HOOK (APPLICATION)
*
* Description : This function is called by OSTCBInitHook(), which is called by OS_TCBInit() after setting
*               up most of the TCB.
*
* Argument(s) : ptcb    is a pointer to the TCB of the task being created.
*
* Note(s)     : (1) Interrupts may or may not be ENABLED during this call.
*********************************************************************************************************
*/

#if OS_APP_HOOKS_EN > 0 && OS_VERSION >= 204
void  App_TCBInitHook (OS_TCB *ptcb)
{
    (void)ptcb;
}
#endif

/*
*********************************************************************************************************
*                                        TICK HOOK (APPLICATION)
*
* Description : This function is called every tick.
*
* Argument(s) : none.
*
* Note(s)     : (1) Interrupts may or may not be ENABLED during this call.
*********************************************************************************************************
*/

#if OS_TIME_TICK_HOOK_EN > 0
void  App_TimeTickHook (void)
{
}
#endif
