#line 1 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.c"




















 

#line 1 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.h"




















 












 







 

#line 1 "..\\OS-Probe\\app_cfg.h"

















 














 









 



#line 1 "C:\\Keil\\ARM\\RV31\\INC\\stdint.h"
 
 





 









#line 25 "C:\\Keil\\ARM\\RV31\\INC\\stdint.h"







 

     

     
typedef   signed          char int8_t;
typedef   signed short     int int16_t;
typedef   signed           int int32_t;
typedef   signed       __int64 int64_t;

     
typedef unsigned          char uint8_t;
typedef unsigned short     int uint16_t;
typedef unsigned           int uint32_t;
typedef unsigned       __int64 uint64_t;

     

     
     
typedef   signed          char int_least8_t;
typedef   signed short     int int_least16_t;
typedef   signed           int int_least32_t;
typedef   signed       __int64 int_least64_t;

     
typedef unsigned          char uint_least8_t;
typedef unsigned short     int uint_least16_t;
typedef unsigned           int uint_least32_t;
typedef unsigned       __int64 uint_least64_t;

     

     
typedef   signed           int int_fast8_t;
typedef   signed           int int_fast16_t;
typedef   signed           int int_fast32_t;
typedef   signed       __int64 int_fast64_t;

     
typedef unsigned           int uint_fast8_t;
typedef unsigned           int uint_fast16_t;
typedef unsigned           int uint_fast32_t;
typedef unsigned       __int64 uint_fast64_t;

     
typedef   signed           int intptr_t;
typedef unsigned           int uintptr_t;

     
typedef   signed       __int64 intmax_t;
typedef unsigned       __int64 uintmax_t;




     

     





     





     





     

     





     





     





     

     





     





     





     

     


     


     


     

     


     


     


     

     



     



     


     
    
 



#line 196 "C:\\Keil\\ARM\\RV31\\INC\\stdint.h"

     







     










     











#line 260 "C:\\Keil\\ARM\\RV31\\INC\\stdint.h"



 


#line 48 "..\\OS-Probe\\app_cfg.h"



int32_t OS_UART_HANDLE(void);










#line 45 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.h"
#line 1 "..\\OS-Probe\\os_cfg.h"






















 





                                        










                                        













                                        





                                        
#line 72 "..\\OS-Probe\\os_cfg.h"


                                        
#line 82 "..\\OS-Probe\\os_cfg.h"


                                        
#line 92 "..\\OS-Probe\\os_cfg.h"


                                        





                                        






                                        
#line 117 "..\\OS-Probe\\os_cfg.h"


                                        
#line 126 "..\\OS-Probe\\os_cfg.h"


                                        






                                        






#line 46 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.h"
#line 1 "..\\..\\..\\..\\..\\uCOS-II\\Ports\\ARM-Cortex-M0\\RealView\\os_cpu.h"






















 




















 

typedef unsigned char  BOOLEAN;
typedef unsigned char  INT8U;                     
typedef signed   char  INT8S;                     
typedef unsigned short INT16U;                    
typedef signed   short INT16S;                    
typedef unsigned int   INT32U;                    
typedef signed   int   INT32S;                    
typedef float          FP32;                      
typedef double         FP64;                      

typedef unsigned int   OS_STK;                    
typedef unsigned int   OS_CPU_SR;                 





















 












 









 

extern  OS_STK   OS_CPU_ExceptStk[128];
extern  OS_STK  *OS_CPU_ExceptStkBase;
extern  BOOLEAN  OS_CPU_CtxSw;





 


OS_CPU_SR  OS_CPU_SR_Save        (void);
void       OS_CPU_SR_Restore     (OS_CPU_SR cpu_sr);


void       OSCtxSw               (void);
void       OSIntCtxSw            (void);
void       OSStartHighRdy        (void);

void       OS_CPU_CM0_ExceptHndlr(void);

                                                   
INT32U     OS_CPU_ExceptStkChk   (void);

                                                   
void       OS_CPU_ExceptHndlr    (void);
#line 47 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.h"





 




























#line 88 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.h"









 




 
#line 111 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.h"







 








 
#line 134 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.h"


                                             





 

























 











 









 









 









 









 












 









 


#line 254 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.h"

#line 264 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.h"












#line 290 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.h"

#line 297 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.h"

#line 308 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.h"



#line 317 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.h"



#line 334 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.h"





 
#line 380 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.h"

 




 


typedef struct os_event {
    INT8U    OSEventType;                     
    void    *OSEventPtr;                      
    INT16U   OSEventCnt;                      

    INT8U    OSEventGrp;                      
    INT8U    OSEventTbl[((63) / 8 + 1)];   






    INT8U    OSEventName[16];

} OS_EVENT;







 








typedef  INT16U   OS_FLAGS;







typedef struct os_flag_grp {                 
    INT8U         OSFlagType;                
    void         *OSFlagWaitList;            
    OS_FLAGS      OSFlagFlags;               

    INT8U         OSFlagName[16];

} OS_FLAG_GRP;



typedef struct os_flag_node {                
    void         *OSFlagNodeNext;            
    void         *OSFlagNodePrev;            
    void         *OSFlagNodeTCB;             
    void         *OSFlagNodeFlagGrp;         
    OS_FLAGS      OSFlagNodeFlags;           
    INT8U         OSFlagNodeWaitType;        
                                             
                                             
                                             
                                             
} OS_FLAG_NODE;


 




 


typedef struct os_mbox_data {
    void   *OSMsg;                          

    INT8U   OSEventTbl[((63) / 8 + 1)];  
    INT8U   OSEventGrp;                     




} OS_MBOX_DATA;






 


typedef struct os_mem {                    
    void   *OSMemAddr;                     
    void   *OSMemFreeList;                 
    INT32U  OSMemBlkSize;                  
    INT32U  OSMemNBlks;                    
    INT32U  OSMemNFree;                    

    INT8U   OSMemName[16];   

} OS_MEM;


typedef struct os_mem_data {
    void   *OSAddr;                     
    void   *OSFreeList;                 
    INT32U  OSBlkSize;                  
    INT32U  OSNBlks;                    
    INT32U  OSNFree;                    
    INT32U  OSNUsed;                    
} OS_MEM_DATA;


 




 


typedef struct os_mutex_data {

    INT8U   OSEventTbl[((63) / 8 + 1)];   
    INT8U   OSEventGrp;                      




    BOOLEAN OSValue;                         
    INT8U   OSOwnerPrio;                     
    INT8U   OSMutexPIP;                      
} OS_MUTEX_DATA;






 


typedef struct os_q {                    
    struct os_q   *OSQPtr;               
    void         **OSQStart;             
    void         **OSQEnd;               
    void         **OSQIn;                
    void         **OSQOut;               
    INT16U         OSQSize;              
    INT16U         OSQEntries;           
} OS_Q;


typedef struct os_q_data {
    void          *OSMsg;                
    INT16U         OSNMsgs;              
    INT16U         OSQSize;              

    INT8U          OSEventTbl[((63) / 8 + 1)];   
    INT8U          OSEventGrp;           




} OS_Q_DATA;






 


typedef struct os_sem_data {
    INT16U  OSCnt;                           

    INT8U   OSEventTbl[((63) / 8 + 1)];   
    INT8U   OSEventGrp;                      




} OS_SEM_DATA;






 


typedef struct os_stk_data {
    INT32U  OSFree;                     
    INT32U  OSUsed;                     
} OS_STK_DATA;


 




 

typedef struct os_tcb {
    OS_STK          *OSTCBStkPtr;            


    void            *OSTCBExtPtr;            
    OS_STK          *OSTCBStkBottom;         
    INT32U           OSTCBStkSize;           
    INT16U           OSTCBOpt;               
    INT16U           OSTCBId;                


    struct os_tcb   *OSTCBNext;              
    struct os_tcb   *OSTCBPrev;              


    OS_EVENT        *OSTCBEventPtr;          



    OS_EVENT       **OSTCBEventMultiPtr;     



    void            *OSTCBMsg;               




    OS_FLAG_NODE    *OSTCBFlagNode;          

    OS_FLAGS         OSTCBFlagsRdy;          


    INT16U           OSTCBDly;               
    INT8U            OSTCBStat;              
    INT8U            OSTCBStatPend;          
    INT8U            OSTCBPrio;              

    INT8U            OSTCBX;                 
    INT8U            OSTCBY;                 

    INT8U            OSTCBBitX;              
    INT8U            OSTCBBitY;              






    INT8U            OSTCBDelReq;            



    INT32U           OSTCBCtxSwCtr;          
    INT32U           OSTCBCyclesTot;         
    INT32U           OSTCBCyclesStart;       
    OS_STK          *OSTCBStkBase;           
    INT32U           OSTCBStkUsed;           



    INT8U            OSTCBTaskName[16];

} OS_TCB;

 




 


typedef  void (*OS_TMR_CALLBACK)(void *ptmr, void *parg);



typedef  struct  os_tmr {
    INT8U            OSTmrType;                        
    OS_TMR_CALLBACK  OSTmrCallback;                    
    void            *OSTmrCallbackArg;                 
    void            *OSTmrNext;                        
    void            *OSTmrPrev;
    INT32U           OSTmrMatch;                       
    INT32U           OSTmrDly;                         
    INT32U           OSTmrPeriod;                      

    INT8U            OSTmrName[16];  

    INT8U            OSTmrOpt;                         
    INT8U            OSTmrState;                       
                                                       
                                                       
                                                       
} OS_TMR;



typedef  struct  os_tmr_wheel {
    OS_TMR          *OSTmrFirst;                       
    INT16U           OSTmrEntries;
} OS_TMR_WHEEL;


 




 

  INT32U            OSCtxSwCtr;                


  OS_EVENT         *OSEventFreeList;           
  OS_EVENT          OSEventTbl[10]; 



  OS_FLAG_GRP       OSFlagTbl[5];   
  OS_FLAG_GRP      *OSFlagFreeList;            



  INT8U             OSCPUUsage;                
  INT32U            OSIdleCtrMax;              
  INT32U            OSIdleCtrRun;              
  BOOLEAN           OSStatRdy;                 
  OS_STK            OSTaskStatStk[128];       


  INT8U             OSIntNesting;              

  INT8U             OSLockNesting;             

  INT8U             OSPrioCur;                 
  INT8U             OSPrioHighRdy;             


  INT8U             OSRdyGrp;                         
  INT8U             OSRdyTbl[((63) / 8 + 1)];        





  BOOLEAN           OSRunning;                        

  INT8U             OSTaskCtr;                        

  volatile  INT32U  OSIdleCtr;                                  

  OS_STK            OSTaskIdleStk[128];       


  OS_TCB           *OSTCBCur;                         
  OS_TCB           *OSTCBFreeList;                    
  OS_TCB           *OSTCBHighRdy;                     
  OS_TCB           *OSTCBList;                        
  OS_TCB           *OSTCBPrioTbl[63 + 1]; 
  OS_TCB            OSTCBTbl[20 + 2u];    


  INT8U             OSTickStepState;           



  OS_MEM           *OSMemFreeList;             
  OS_MEM            OSMemTbl[5]; 



  OS_Q             *OSQFreeList;               
  OS_Q              OSQTbl[4];         



  volatile  INT32U  OSTime;                    



  INT16U            OSTmrFree;                 
  INT16U            OSTmrUsed;                 
  INT32U            OSTmrTime;                 

  OS_EVENT         *OSTmrSem;                  
  OS_EVENT         *OSTmrSemSignal;            

  OS_TMR            OSTmrTbl[16];  
  OS_TMR           *OSTmrFreeList;             
  OS_STK            OSTmrTaskStk[128];

  OS_TMR_WHEEL      OSTmrWheelTbl[8];


extern  INT8U   const     OSUnMapTbl[256];           

 





 





 




INT8U         OSEventNameGet          (OS_EVENT        *pevent,
                                       INT8U           *pname,
                                       INT8U           *perr);

void          OSEventNameSet          (OS_EVENT        *pevent,
                                       INT8U           *pname,
                                       INT8U           *perr);



INT16U        OSEventPendMulti        (OS_EVENT       **pevents_pend,
                                       OS_EVENT       **pevents_rdy,
                                       void           **pmsgs_rdy,
                                       INT16U           timeout,
                                       INT8U           *perr);








 




OS_FLAGS      OSFlagAccept            (OS_FLAG_GRP     *pgrp,
                                       OS_FLAGS         flags,
                                       INT8U            wait_type,
                                       INT8U           *perr);


OS_FLAG_GRP  *OSFlagCreate            (OS_FLAGS         flags,
                                      INT8U            *perr);


OS_FLAG_GRP  *OSFlagDel               (OS_FLAG_GRP     *pgrp,
                                       INT8U            opt,
                                       INT8U           *perr);



INT8U         OSFlagNameGet           (OS_FLAG_GRP     *pgrp,
                                       INT8U           *pname,
                                       INT8U           *perr);

void          OSFlagNameSet           (OS_FLAG_GRP     *pgrp,
                                       INT8U           *pname,
                                       INT8U           *perr);


OS_FLAGS      OSFlagPend              (OS_FLAG_GRP     *pgrp,
                                       OS_FLAGS         flags,
                                       INT8U            wait_type,
                                       INT16U           timeout,
                                       INT8U           *perr);

OS_FLAGS      OSFlagPendGetFlagsRdy   (void);
OS_FLAGS      OSFlagPost              (OS_FLAG_GRP     *pgrp,
                                       OS_FLAGS         flags,
                                       INT8U            opt,
                                       INT8U           *perr);


OS_FLAGS      OSFlagQuery             (OS_FLAG_GRP     *pgrp,
                                       INT8U           *perr);







 




void         *OSMboxAccept            (OS_EVENT        *pevent);


OS_EVENT     *OSMboxCreate            (void            *pmsg);


OS_EVENT     *OSMboxDel               (OS_EVENT        *pevent,
                                       INT8U            opt,
                                       INT8U           *perr);


void         *OSMboxPend              (OS_EVENT        *pevent,
                                       INT16U           timeout,
                                       INT8U           *perr);


INT8U         OSMboxPendAbort         (OS_EVENT        *pevent,
                                       INT8U            opt,
                                       INT8U           *perr);



INT8U         OSMboxPost              (OS_EVENT        *pevent,
                                       void            *pmsg);



INT8U         OSMboxPostOpt           (OS_EVENT        *pevent,
                                       void            *pmsg,
                                       INT8U            opt);



INT8U         OSMboxQuery             (OS_EVENT        *pevent,
                                       OS_MBOX_DATA    *p_mbox_data);







 



OS_MEM       *OSMemCreate             (void            *addr,
                                       INT32U           nblks,
                                       INT32U           blksize,
                                       INT8U           *perr);

void         *OSMemGet                (OS_MEM          *pmem,
                                       INT8U           *perr);

INT8U         OSMemNameGet            (OS_MEM          *pmem,
                                       INT8U           *pname,
                                       INT8U           *perr);

void          OSMemNameSet            (OS_MEM          *pmem,
                                       INT8U           *pname,
                                       INT8U           *perr);

INT8U         OSMemPut                (OS_MEM          *pmem,
                                       void            *pblk);


INT8U         OSMemQuery              (OS_MEM          *pmem,
                                       OS_MEM_DATA     *p_mem_data);








 




BOOLEAN       OSMutexAccept           (OS_EVENT        *pevent,
                                       INT8U           *perr);


OS_EVENT     *OSMutexCreate           (INT8U            prio,
                                       INT8U           *perr);


OS_EVENT     *OSMutexDel              (OS_EVENT        *pevent,
                                       INT8U            opt,
                                       INT8U           *perr);


void          OSMutexPend             (OS_EVENT        *pevent,
                                       INT16U           timeout,
                                       INT8U           *perr);

INT8U         OSMutexPost             (OS_EVENT        *pevent);


INT8U         OSMutexQuery            (OS_EVENT        *pevent,
                                       OS_MUTEX_DATA   *p_mutex_data);




 




 




void         *OSQAccept               (OS_EVENT        *pevent,
                                       INT8U           *perr);


OS_EVENT     *OSQCreate               (void           **start,
                                       INT16U           size);


OS_EVENT     *OSQDel                  (OS_EVENT        *pevent,
                                       INT8U            opt,
                                       INT8U           *perr);



INT8U         OSQFlush                (OS_EVENT        *pevent);


void         *OSQPend                 (OS_EVENT        *pevent,
                                       INT16U           timeout,
                                       INT8U           *perr);


INT8U         OSQPendAbort            (OS_EVENT        *pevent,
                                       INT8U            opt,
                                       INT8U           *perr);



INT8U         OSQPost                 (OS_EVENT        *pevent,
                                       void            *pmsg);



INT8U         OSQPostFront            (OS_EVENT        *pevent,
                                       void            *pmsg);



INT8U         OSQPostOpt              (OS_EVENT        *pevent,
                                       void            *pmsg,
                                       INT8U            opt);



INT8U         OSQQuery                (OS_EVENT        *pevent,
                                       OS_Q_DATA       *p_q_data);




 




 



INT16U        OSSemAccept             (OS_EVENT        *pevent);


OS_EVENT     *OSSemCreate             (INT16U           cnt);


OS_EVENT     *OSSemDel                (OS_EVENT        *pevent,
                                       INT8U            opt,
                                       INT8U           *perr);


void          OSSemPend               (OS_EVENT        *pevent,
                                       INT16U           timeout,
                                       INT8U           *perr);


INT8U         OSSemPendAbort          (OS_EVENT        *pevent,
                                       INT8U            opt,
                                       INT8U           *perr);


INT8U         OSSemPost               (OS_EVENT        *pevent);


INT8U         OSSemQuery              (OS_EVENT        *pevent,
                                       OS_SEM_DATA     *p_sem_data);



void          OSSemSet                (OS_EVENT        *pevent,
                                       INT16U           cnt,
                                       INT8U           *perr);




 




 

INT8U         OSTaskChangePrio        (INT8U            oldprio,
                                       INT8U            newprio);



INT8U         OSTaskCreate            (void           (*task)(void *p_arg),
                                       void            *p_arg,
                                       OS_STK          *ptos,
                                       INT8U            prio);



INT8U         OSTaskCreateExt         (void           (*task)(void *p_arg),
                                       void            *p_arg,
                                       OS_STK          *ptos,
                                       INT8U            prio,
                                       INT16U           id,
                                       OS_STK          *pbos,
                                       INT32U           stk_size,
                                       void            *pext,
                                       INT16U           opt);



INT8U         OSTaskDel               (INT8U            prio);
INT8U         OSTaskDelReq            (INT8U            prio);



INT8U         OSTaskNameGet           (INT8U            prio,
                                       INT8U           *pname,
                                       INT8U           *perr);

void          OSTaskNameSet           (INT8U            prio,
                                       INT8U           *pname,
                                       INT8U           *perr);



INT8U         OSTaskResume            (INT8U            prio);
INT8U         OSTaskSuspend           (INT8U            prio);



INT8U         OSTaskStkChk            (INT8U            prio,
                                       OS_STK_DATA     *p_stk_data);



INT8U         OSTaskQuery             (INT8U            prio,
                                       OS_TCB          *p_task_data);


 




 

void          OSTimeDly               (INT16U           ticks);


INT8U         OSTimeDlyHMSM           (INT8U            hours,
                                       INT8U            minutes,
                                       INT8U            seconds,
                                       INT16U           milli);



INT8U         OSTimeDlyResume         (INT8U            prio);



INT32U        OSTimeGet               (void);
void          OSTimeSet               (INT32U           ticks);


void          OSTimeTick              (void);





 


OS_TMR      *OSTmrCreate              (INT32U           dly,
                                       INT32U           period,
                                       INT8U            opt,
                                       OS_TMR_CALLBACK  callback,
                                       void            *callback_arg,
                                       INT8U           *pname,
                                       INT8U           *perr);

BOOLEAN      OSTmrDel                 (OS_TMR          *ptmr,
                                       INT8U           *perr);


INT8U        OSTmrNameGet             (OS_TMR          *ptmr,
                                       INT8U           *pdest,
                                       INT8U           *perr);

INT32U       OSTmrRemainGet           (OS_TMR          *ptmr,
                                       INT8U           *perr);

INT8U        OSTmrStateGet            (OS_TMR          *ptmr,
                                       INT8U           *perr);

BOOLEAN      OSTmrStart               (OS_TMR          *ptmr,
                                       INT8U           *perr);

BOOLEAN      OSTmrStop                (OS_TMR          *ptmr,
                                       INT8U            opt,
                                       void            *callback_arg,
                                       INT8U           *perr);

INT8U        OSTmrSignal              (void);






 

void          OSInit                  (void);

void          OSIntEnter              (void);
void          OSIntExit               (void);


void          OSSchedLock             (void);
void          OSSchedUnlock           (void);


void          OSStart                 (void);

void          OSStatInit              (void);

INT16U        OSVersion               (void);

 





 


void          OS_Dummy                (void);



INT8U         OS_EventTaskRdy         (OS_EVENT        *pevent,
                                       void            *pmsg,
                                       INT8U            msk,
                                       INT8U            pend_stat);

void          OS_EventTaskWait        (OS_EVENT        *pevent);

void          OS_EventTaskRemove      (OS_TCB          *ptcb,
                                       OS_EVENT        *pevent);


void          OS_EventTaskWaitMulti   (OS_EVENT       **pevents_wait);

void          OS_EventTaskRemoveMulti (OS_TCB          *ptcb,
                                       OS_EVENT       **pevents_multi);


void          OS_EventWaitListInit    (OS_EVENT        *pevent);



void          OS_FlagInit             (void);
void          OS_FlagUnlink           (OS_FLAG_NODE    *pnode);


void          OS_MemClr               (INT8U           *pdest,
                                       INT16U           size);

void          OS_MemCopy              (INT8U           *pdest,
                                       INT8U           *psrc,
                                       INT16U           size);


void          OS_MemInit              (void);



void          OS_QInit                (void);


void          OS_Sched                (void);


INT8U         OS_StrCopy              (INT8U           *pdest,
                                       INT8U           *psrc);

INT8U         OS_StrLen               (INT8U           *psrc);


void          OS_TaskIdle             (void            *p_arg);


void          OS_TaskStat             (void            *p_arg);



void          OS_TaskStkClr           (OS_STK          *pbos,
                                       INT32U           size,
                                       INT16U           opt);



void          OS_TaskStatStkChk       (void);


INT8U         OS_TCBInit              (INT8U            prio,
                                       OS_STK          *ptos,
                                       OS_STK          *pbos,
                                       INT16U           id,
                                       INT32U           stk_size,
                                       void            *pext,
                                       INT16U           opt);


void          OSTmr_Init              (void);


 





 





void          OSInitHookBegin         (void);
void          OSInitHookEnd           (void);

void          OSTaskCreateHook        (OS_TCB          *ptcb);
void          OSTaskDelHook           (OS_TCB          *ptcb);

void          OSTaskIdleHook          (void);

void          OSTaskStatHook          (void);
OS_STK       *OSTaskStkInit           (void           (*task)(void *p_arg),
                                       void            *p_arg,
                                       OS_STK          *ptos,
                                       INT16U           opt);


void          OSTaskSwHook            (void);


void          OSTCBInitHook           (OS_TCB          *ptcb);


void          OSTimeTickHook          (void);


 





 


void          App_TaskCreateHook      (OS_TCB          *ptcb);
void          App_TaskDelHook         (OS_TCB          *ptcb);
void          App_TaskIdleHook        (void);

void          App_TaskStatHook        (void);


void          App_TaskSwHook          (void);


void          App_TCBInitHook         (OS_TCB          *ptcb);


void          App_TimeTickHook        (void);









 

void          OSStartHighRdy          (void);
void          OSIntCtxSw              (void);
void          OSCtxSw                 (void);

 










 





 

#line 1444 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.h"






























 

#line 1482 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.h"


























 

#line 1520 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.h"














 

#line 1542 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.h"














 

#line 1568 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.h"






































 

#line 1614 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.h"






















 

#line 1644 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.h"



























































 





















 

#line 1734 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.h"

#line 1741 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.h"






#line 1753 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.h"
























 


























#line 1811 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.h"



































 

#line 1923 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.h"





#line 25 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.c"


#line 1 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_core.c"





















 













 

INT8U  const  OSUnMapTbl[256] = {
    0, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,        
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,        
    5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,        
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,        
    6, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,        
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,        
    5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,        
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,        
    7, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,        
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,        
    5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,        
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,        
    6, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,        
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,        
    5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,        
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0         
};

 




 

static  void  OS_InitEventList(void);

static  void  OS_InitMisc(void);

static  void  OS_InitRdyList(void);

static  void  OS_InitTaskIdle(void);


static  void  OS_InitTaskStat(void);


static  void  OS_InitTCBList(void);

static  void  OS_SchedNew(void);

 

























 


INT8U  OSEventNameGet (OS_EVENT *pevent, INT8U *pname, INT8U *perr)
{
    INT8U      len;

    OS_CPU_SR  cpu_sr = 0;




#line 131 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_core.c"
    if (OSIntNesting > 0) {                       
        *perr  = 17u;
        return (0);
    }
    switch (pevent->OSEventType) {
        case 3u:
        case 4u:
        case 1u:
        case 2u:
             break;

        default:
             *perr = 1u;
             return (0);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    len   = OS_StrCopy(pname, pevent->OSEventName);    
    {OS_CPU_SR_Restore(cpu_sr);};
    *perr = 0u;
    return (len);
}


 

























 


void  OSEventNameSet (OS_EVENT *pevent, INT8U *pname, INT8U *perr)
{
    INT8U      len;

    OS_CPU_SR  cpu_sr = 0;




#line 205 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_core.c"
    if (OSIntNesting > 0) {                       
        *perr = 18u;
        return;
    }
    switch (pevent->OSEventType) {
        case 3u:
        case 4u:
        case 1u:
        case 2u:
             break;

        default:
             *perr = 1u;
             return;
    }
    {cpu_sr = OS_CPU_SR_Save();};
    len = OS_StrLen(pname);                            
    if (len > (16 - 1)) {              
        {OS_CPU_SR_Restore(cpu_sr);};
        *perr = 11u;
        return;
    }
    (void)OS_StrCopy(pevent->OSEventName, pname);      
    {OS_CPU_SR_Restore(cpu_sr);};
    *perr = 0u;
}


 





































































 
 

INT16U  OSEventPendMulti (OS_EVENT **pevents_pend, OS_EVENT **pevents_rdy, void **pmsgs_rdy, INT16U timeout, INT8U *perr)
{
    OS_EVENT  **pevents;
    OS_EVENT   *pevent;

    OS_Q       *pq;

    BOOLEAN     events_rdy;
    INT16U      events_rdy_nbr;
    INT8U       events_stat;

    OS_CPU_SR   cpu_sr = 0;




#line 339 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_core.c"

   *pevents_rdy = (OS_EVENT *)0;                         

    pevents     =  pevents_pend;
    pevent      = *pevents;
    while  (pevent != (OS_EVENT *)0) {
        switch (pevent->OSEventType) {                   

            case 3u:
                 break;


            case 1u:
                 break;


            case 2u:
                 break;


            case 4u:                                            
            case 5u:
            default:           
                *perr = 1u;
                 return (0);
        }
        pevents++;
        pevent = *pevents;
    }

    if (OSIntNesting  > 0) {                             
       *perr =  2u;                         
        return (0);
    }
    if (OSLockNesting > 0) {                             
       *perr =  13u;                      
        return (0);
    }

 
    {cpu_sr = OS_CPU_SR_Save();};
    events_rdy     =  0u;
    events_rdy_nbr =  0;
    events_stat    =  0x00u;
    pevents        =  pevents_pend;
    pevent         = *pevents;
    while (pevent != (OS_EVENT *)0) {                    
        switch (pevent->OSEventType) {

            case 3u:
                 if (pevent->OSEventCnt > 0) {           
                     pevent->OSEventCnt--;               
                    *pevents_rdy++ =  pevent;            
                      events_rdy   =  1u;
                    *pmsgs_rdy++   = (void *)0;          
                      events_rdy_nbr++;

                 } else {
                      events_stat |=  0x01u;       
                 }
                 break;



            case 1u:
                 if (pevent->OSEventPtr != (void *)0) {  
                                                         
                    *pmsgs_rdy++         = (void *)pevent->OSEventPtr;
                     pevent->OSEventPtr  = (void *)0;
                    *pevents_rdy++       =  pevent;      
                      events_rdy         =  1u;
                      events_rdy_nbr++;

                 } else {
                      events_stat |= 0x02u;       
                 }
                 break;



            case 2u:
                 pq = (OS_Q *)pevent->OSEventPtr;
                 if (pq->OSQEntries > 0) {               
                                                         
                    *pmsgs_rdy++ = (void *)*pq->OSQOut++;
                     if (pq->OSQOut == pq->OSQEnd) {     
                         pq->OSQOut  = pq->OSQStart;     
                     }
                     pq->OSQEntries--;                   
                    *pevents_rdy++ = pevent;             
                      events_rdy   = 1u;
                      events_rdy_nbr++;

                 } else {
                      events_stat |= 0x04u;          
                 }
                 break;


            case 4u:                                            
            case 5u:
            default:           
                 {OS_CPU_SR_Restore(cpu_sr);};
                *pevents_rdy = (OS_EVENT *)0;            
                *perr        =  1u;
                 return (events_rdy_nbr);
        }
        pevents++;
        pevent = *pevents;
    }

    if ( events_rdy == 1u) {                        
       *pevents_rdy = (OS_EVENT *)0;                     
        {OS_CPU_SR_Restore(cpu_sr);};
       *perr        =  0u;
        return (events_rdy_nbr);
    }
 
                                                         
    OSTCBCur->OSTCBStat     |= events_stat  |            
                               0x80u;            
    OSTCBCur->OSTCBStatPend  = 0u;
    OSTCBCur->OSTCBDly       = timeout;                  
    OS_EventTaskWaitMulti(pevents_pend);                 

    {OS_CPU_SR_Restore(cpu_sr);};
    OS_Sched();                                          
    {cpu_sr = OS_CPU_SR_Save();};

    switch (OSTCBCur->OSTCBStatPend) {                   
        case 0u:
        case 2u:
             pevent = OSTCBCur->OSTCBEventPtr;
             if (pevent != (OS_EVENT *)0) {              
                *pevents_rdy++ =  pevent;                
                *pevents_rdy   = (OS_EVENT *)0;          
                  events_rdy_nbr++;

             } else {                                    
                 OSTCBCur->OSTCBStatPend = 1u;
                 OS_EventTaskRemoveMulti(OSTCBCur, pevents_pend);
             }
			 break;

        case 1u:
        default:                                         
             OS_EventTaskRemoveMulti(OSTCBCur, pevents_pend);
             break;
    }

    switch (OSTCBCur->OSTCBStatPend) {
        case 0u:
             switch (pevent->OSEventType) {              

                 case 3u:
                     *pmsgs_rdy++ = (void *)0;           
                      break;




                 case 1u:
                 case 2u:
                     *pmsgs_rdy++ = (void *)OSTCBCur->OSTCBMsg;      
                      break;


                 case 4u:                                       
                 case 5u:
                 default:           
                      {OS_CPU_SR_Restore(cpu_sr);};
                     *pevents_rdy = (OS_EVENT *)0;       
                     *perr        =  1u;
                      return (events_rdy_nbr);
             }
            *perr = 0u;
             break;

        case 2u:
            *pmsgs_rdy++ = (void *)0;                    
            *perr        =  14u;           
             break;
                                                        
        case 1u:                                                
        default:        
            *pmsgs_rdy++ = (void *)0;                    
            *perr        =  10u;              
             break;
    }

    OSTCBCur->OSTCBStat          =  0x00u;         
    OSTCBCur->OSTCBStatPend      =  0u;     
    OSTCBCur->OSTCBEventPtr      = (OS_EVENT  *)0;       
    OSTCBCur->OSTCBEventMultiPtr = (OS_EVENT **)0;
    OSTCBCur->OSTCBMsg           = (void      *)0;       
    {OS_CPU_SR_Restore(cpu_sr);};

    return (events_rdy_nbr);
}


 











 

void  OSInit (void)
{
    OSInitHookBegin();                                            

    OS_InitMisc();                                                

    OS_InitRdyList();                                             

    OS_InitTCBList();                                             

    OS_InitEventList();                                           


    OS_FlagInit();                                                



    OS_MemInit();                                                 



    OS_QInit();                                                   


    OS_InitTaskIdle();                                            

    OS_InitTaskStat();                                            



    OSTmr_Init();                                                 


    OSInitHookEnd();                                              




}
 























 

void  OSIntEnter (void)
{
    if (OSRunning == 1u) {
        if (OSIntNesting < 255u) {
            OSIntNesting++;                       
        }
    }
}
 

















 

void  OSIntExit (void)
{

    OS_CPU_SR  cpu_sr = 0;




    if (OSRunning == 1u) {
        {cpu_sr = OS_CPU_SR_Save();};
        if (OSIntNesting > 0) {                             
            OSIntNesting--;
        }
        if (OSIntNesting == 0) {                            
            if (OSLockNesting == 0) {                       
                OS_SchedNew();
                if (OSPrioHighRdy != OSPrioCur) {           
                    OSTCBHighRdy  = OSTCBPrioTbl[OSPrioHighRdy];

                    OSTCBHighRdy->OSTCBCtxSwCtr++;          

                    OSCtxSwCtr++;                           
                    OSIntCtxSw();                           
                }
            }
        }
        {OS_CPU_SR_Restore(cpu_sr);};
    }
}
 














 


void  OSSchedLock (void)
{

    OS_CPU_SR  cpu_sr = 0;




    if (OSRunning == 1u) {                   
        {cpu_sr = OS_CPU_SR_Save();};
        if (OSIntNesting == 0) {                  
            if (OSLockNesting < 255u) {           
                OSLockNesting++;                  
            }
        }
        {OS_CPU_SR_Restore(cpu_sr);};
    }
}


 













 


void  OSSchedUnlock (void)
{

    OS_CPU_SR  cpu_sr = 0;




    if (OSRunning == 1u) {                             
        {cpu_sr = OS_CPU_SR_Save();};
        if (OSLockNesting > 0) {                            
            OSLockNesting--;                                
            if (OSLockNesting == 0) {                       
                if (OSIntNesting == 0) {                    
                    {OS_CPU_SR_Restore(cpu_sr);};
                    OS_Sched();                             
                } else {
                    {OS_CPU_SR_Restore(cpu_sr);};
                }
            } else {
                {OS_CPU_SR_Restore(cpu_sr);};
            }
        } else {
            {OS_CPU_SR_Restore(cpu_sr);};
        }
    }
}


 


















 

void  OSStart (void)
{
    if (OSRunning == 0u) {
        OS_SchedNew();                                
        OSPrioCur     = OSPrioHighRdy;
        OSTCBHighRdy  = OSTCBPrioTbl[OSPrioHighRdy];  
        OSTCBCur      = OSTCBHighRdy;
        OSStartHighRdy();                             
    }
}
 


















 


void  OSStatInit (void)
{

    OS_CPU_SR  cpu_sr = 0;




    OSTimeDly(2);                                 
    {cpu_sr = OS_CPU_SR_Save();};
    OSIdleCtr    = 0L;                            
    {OS_CPU_SR_Restore(cpu_sr);};
    OSTimeDly(100 / 10);             
    {cpu_sr = OS_CPU_SR_Save();};
    OSIdleCtrMax = OSIdleCtr;                     
    OSStatRdy    = 1u;
    {OS_CPU_SR_Restore(cpu_sr);};
}

 












 

void  OSTimeTick (void)
{
    OS_TCB    *ptcb;

    BOOLEAN    step;


    OS_CPU_SR  cpu_sr = 0;





    OSTimeTickHook();                                       


    {cpu_sr = OS_CPU_SR_Save();};                                    
    OSTime++;
    {OS_CPU_SR_Restore(cpu_sr);};

    if (OSRunning == 1u) {

        switch (OSTickStepState) {                          
            case 0u:                          
                 step = 1u;
                 break;

            case 1u:                         
                 step = 0u;                           
                 break;

            case 2u:                         
                 step            = 1u;                 
                 OSTickStepState = 1u;
                 break;

            default:                                        
                 step            = 1u;
                 OSTickStepState = 0u;
                 break;
        }
        if (step == 0u) {                             
            return;
        }

        ptcb = OSTCBList;                                   
        while (ptcb->OSTCBPrio != (63)) {      
            {cpu_sr = OS_CPU_SR_Save();};
            if (ptcb->OSTCBDly != 0) {                      
                if (--ptcb->OSTCBDly == 0) {                
                                                            
                    if ((ptcb->OSTCBStat & (0x01u | 0x02u | 0x04u | 0x10u | 0x20u)) != 0x00u) {
                        ptcb->OSTCBStat  &= ~(INT8U)(0x01u | 0x02u | 0x04u | 0x10u | 0x20u);           
                        ptcb->OSTCBStatPend = 1u;                  
                    } else {
                        ptcb->OSTCBStatPend = 0u;
                    }

                    if ((ptcb->OSTCBStat & 0x08u) == 0x00u) {   
                        OSRdyGrp               |= ptcb->OSTCBBitY;              
                        OSRdyTbl[ptcb->OSTCBY] |= ptcb->OSTCBBitX;
                    }
                }
            }
            ptcb = ptcb->OSTCBNext;                         
            {OS_CPU_SR_Restore(cpu_sr);};
        }
    }
}

 












 

INT16U  OSVersion (void)
{
    return (286u);
}

 










 


void  OS_Dummy (void)
{
}


 


























 

INT8U  OS_EventTaskRdy (OS_EVENT *pevent, void *pmsg, INT8U msk, INT8U pend_stat)
{
    OS_TCB  *ptcb;
    INT8U    y;
    INT8U    x;
    INT8U    prio;






    y    = OSUnMapTbl[pevent->OSEventGrp];               
    x    = OSUnMapTbl[pevent->OSEventTbl[y]];
    prio = (INT8U)((y << 3) + x);                        
#line 1014 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_core.c"

    ptcb                  =  OSTCBPrioTbl[prio];         
    ptcb->OSTCBDly        =  0;                          

    ptcb->OSTCBMsg        =  pmsg;                       



    ptcb->OSTCBStat      &= ~msk;                        
    ptcb->OSTCBStatPend   =  pend_stat;                  
                                                         
    if ((ptcb->OSTCBStat &   0x08u) == 0x00u) {
        OSRdyGrp         |=  ptcb->OSTCBBitY;            
        OSRdyTbl[y]      |=  ptcb->OSTCBBitX;
    }

    OS_EventTaskRemove(ptcb, pevent);                    

    if (ptcb->OSTCBEventMultiPtr != (OS_EVENT **)0) {    
        OS_EventTaskRemoveMulti(ptcb, ptcb->OSTCBEventMultiPtr);
        ptcb->OSTCBEventPtr       = (OS_EVENT  *)pevent; 
    }


    return (prio);
}

 













 

void  OS_EventTaskWait (OS_EVENT *pevent)
{
    INT8U  y;


    OSTCBCur->OSTCBEventPtr               = pevent;                  

    pevent->OSEventTbl[OSTCBCur->OSTCBY] |= OSTCBCur->OSTCBBitX;     
    pevent->OSEventGrp                   |= OSTCBCur->OSTCBBitY;

    y             =  OSTCBCur->OSTCBY;             
    OSRdyTbl[y]  &= ~OSTCBCur->OSTCBBitX;
    if (OSRdyTbl[y] == 0) {
        OSRdyGrp &= ~OSTCBCur->OSTCBBitY;          
    }
}

 














 

void  OS_EventTaskWaitMulti (OS_EVENT **pevents_wait)
{
    OS_EVENT **pevents;
    OS_EVENT  *pevent;
    INT8U      y;


    OSTCBCur->OSTCBEventPtr      = (OS_EVENT  *)0;
    OSTCBCur->OSTCBEventMultiPtr = (OS_EVENT **)pevents_wait;        

    pevents =  pevents_wait;
    pevent  = *pevents;
    while (pevent != (OS_EVENT *)0) {                                
        pevent->OSEventTbl[OSTCBCur->OSTCBY] |= OSTCBCur->OSTCBBitX;
        pevent->OSEventGrp                   |= OSTCBCur->OSTCBBitY;
        pevents++;
        pevent = *pevents;
    }

    y             =  OSTCBCur->OSTCBY;             
    OSRdyTbl[y]  &= ~OSTCBCur->OSTCBBitX;
    if (OSRdyTbl[y] == 0) {
        OSRdyGrp &= ~OSTCBCur->OSTCBBitY;          
    }
}

 














 

void  OS_EventTaskRemove (OS_TCB   *ptcb,
                          OS_EVENT *pevent)
{
    INT8U  y;


    y                       =  ptcb->OSTCBY;
    pevent->OSEventTbl[y]  &= ~ptcb->OSTCBBitX;          
    if (pevent->OSEventTbl[y] == 0) {
        pevent->OSEventGrp &= ~ptcb->OSTCBBitY;
    }
}

 














 

void  OS_EventTaskRemoveMulti (OS_TCB    *ptcb,
                               OS_EVENT **pevents_multi)
{
    OS_EVENT **pevents;
    OS_EVENT  *pevent;
    INT8U      y;

    INT8U      bity;
    INT8U      bitx;






    y       =  ptcb->OSTCBY;
    bity    =  ptcb->OSTCBBitY;
    bitx    =  ptcb->OSTCBBitX;
    pevents =  pevents_multi;
    pevent  = *pevents;
    while (pevent != (OS_EVENT *)0) {                    
        pevent->OSEventTbl[y]  &= ~bitx;
        if (pevent->OSEventTbl[y] == 0) {
            pevent->OSEventGrp &= ~bity;
        }
        pevents++;
        pevent = *pevents;
    }
}

 












 

void  OS_EventWaitListInit (OS_EVENT *pevent)
{

    INT8U  *ptbl;



    INT8U   i;


    pevent->OSEventGrp = 0;                       
    ptbl               = &pevent->OSEventTbl[0];

    for (i = 0; i < ((63) / 8 + 1); i++) {
        *ptbl++ = 0;
    }
}

 











 

static  void  OS_InitEventList (void)
{


    INT16U     i;
    OS_EVENT  *pevent1;
    OS_EVENT  *pevent2;


    OS_MemClr((INT8U *)&OSEventTbl[0], sizeof(OSEventTbl));  
    pevent1 = &OSEventTbl[0];
    pevent2 = &OSEventTbl[1];
    for (i = 0; i < (10 - 1); i++) {              
        pevent1->OSEventType    = 0u;
        pevent1->OSEventPtr     = pevent2;

        pevent1->OSEventName[0] = '?';                       
        pevent1->OSEventName[1] = (INT8U)0;

        pevent1++;
        pevent2++;
    }
    pevent1->OSEventType            = 0u;
    pevent1->OSEventPtr             = (OS_EVENT *)0;

    pevent1->OSEventName[0]         = '?';
    pevent1->OSEventName[1]         = (INT8U)0;

    OSEventFreeList                 = &OSEventTbl[0];
#line 1280 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_core.c"
}
 











 

static  void  OS_InitMisc (void)
{

    OSTime        = 0L;                                     


    OSIntNesting  = 0;                                      
    OSLockNesting = 0;                                      

    OSTaskCtr     = 0;                                      

    OSRunning     = 0u;                               

    OSCtxSwCtr    = 0;                                      
    OSIdleCtr     = 0L;                                     


    OSIdleCtrRun  = 0L;
    OSIdleCtrMax  = 0L;
    OSStatRdy     = 0u;                               

}
 











 

static  void  OS_InitRdyList (void)
{
    INT8U    i;

    INT8U   *prdytbl;





    OSRdyGrp      = 0;                                      
    prdytbl       = &OSRdyTbl[0];
    for (i = 0; i < ((63) / 8 + 1); i++) {
        *prdytbl++ = 0;
    }

    OSPrioCur     = 0;
    OSPrioHighRdy = 0;

    OSTCBHighRdy  = (OS_TCB *)0;
    OSTCBCur      = (OS_TCB *)0;
}

 











 

static  void  OS_InitTaskIdle (void)
{

    INT8U  err;





    (void)OSTaskCreateExt(OS_TaskIdle,
                          (void *)0,                                  
                          &OSTaskIdleStk[128 - 1],  
                          (63),                          
                          65535u,
                          &OSTaskIdleStk[0],                          
                          128,
                          (void *)0,                                  
                          0x0001u | 0x0002u); 
#line 1410 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_core.c"


    OSTaskNameSet((63), (INT8U *)"uC/OS-II Idle", &err);





}
 











 


static  void  OS_InitTaskStat (void)
{

    INT8U  err;





    (void)OSTaskCreateExt(OS_TaskStat,
                          (void *)0,                                    
                          &OSTaskStatStk[128 - 1],    
                          (63 - 1),                            
                          65534u,
                          &OSTaskStatStk[0],                            
                          128,
                          (void *)0,                                    
                          0x0001u | 0x0002u);   
#line 1476 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_core.c"


    OSTaskNameSet((63 - 1), (INT8U *)"uC/OS-II Stat", &err);





}

 











 

static  void  OS_InitTCBList (void)
{
    INT8U    i;
    OS_TCB  *ptcb1;
    OS_TCB  *ptcb2;


    OS_MemClr((INT8U *)&OSTCBTbl[0],     sizeof(OSTCBTbl));       
    OS_MemClr((INT8U *)&OSTCBPrioTbl[0], sizeof(OSTCBPrioTbl));   
    ptcb1 = &OSTCBTbl[0];
    ptcb2 = &OSTCBTbl[1];
    for (i = 0; i < (20 + 2u - 1); i++) {   
        ptcb1->OSTCBNext = ptcb2;

        ptcb1->OSTCBTaskName[0] = '?';                            
        ptcb1->OSTCBTaskName[1] = (INT8U)0;

        ptcb1++;
        ptcb2++;
    }
    ptcb1->OSTCBNext = (OS_TCB *)0;                               

    ptcb1->OSTCBTaskName[0] = '?';                                
    ptcb1->OSTCBTaskName[1] = (INT8U)0;

    OSTCBList               = (OS_TCB *)0;                        
    OSTCBFreeList           = &OSTCBTbl[0];
}
 


















 

void  OS_MemClr (INT8U *pdest, INT16U size)
{
    while (size > 0) {
        *pdest++ = (INT8U)0;
        size--;
    }
}
 






















 

void  OS_MemCopy (INT8U *pdest, INT8U *psrc, INT16U size)
{
    while (size > 0) {
        *pdest++ = *psrc++;
        size--;
    }
}
 















 

void  OS_Sched (void)
{

    OS_CPU_SR  cpu_sr = 0;




    {cpu_sr = OS_CPU_SR_Save();};
    if (OSIntNesting == 0) {                            
        if (OSLockNesting == 0) {                       
            OS_SchedNew();
            if (OSPrioHighRdy != OSPrioCur) {           
                OSTCBHighRdy = OSTCBPrioTbl[OSPrioHighRdy];

                OSTCBHighRdy->OSTCBCtxSwCtr++;          

                OSCtxSwCtr++;                           
                OSCtxSw();                           
            }
        }
    }
    {OS_CPU_SR_Restore(cpu_sr);};
}
















 

static  void  OS_SchedNew (void)
{

    INT8U   y;


    y             = OSUnMapTbl[OSRdyGrp];
    OSPrioHighRdy = (INT8U)((y << 3) + OSUnMapTbl[OSRdyTbl[y]]);
#line 1673 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_core.c"
}

 

















 


INT8U  OS_StrCopy (INT8U *pdest, INT8U *psrc)
{
    INT8U  len;


    len = 0;
    while (*psrc != (INT8U)0) {
        *pdest++ = *psrc++;
        len++;
    }
    *pdest = (INT8U)0;
    return (len);
}

 














 


INT8U  OS_StrLen (INT8U *psrc)
{
    INT8U  len;


    len = 0;
    while (*psrc != (INT8U)0) {
        psrc++;
        len++;
    }
    return (len);
}

 



















 

void  OS_TaskIdle (void *p_arg)
{

    OS_CPU_SR  cpu_sr = 0;




    (void)p_arg;                                  
    for (;;) {
        {cpu_sr = OS_CPU_SR_Save();};
        OSIdleCtr++;
        {OS_CPU_SR_Restore(cpu_sr);};
        OSTaskIdleHook();                         
    }
}
 






















 


void  OS_TaskStat (void *p_arg)
{

    OS_CPU_SR  cpu_sr = 0;




    (void)p_arg;                                  
    while (OSStatRdy == 0u) {
        OSTimeDly(2 * 100 / 10);     
    }
    OSIdleCtrMax /= 100L;
    if (OSIdleCtrMax == 0L) {
        OSCPUUsage = 0;
        (void)OSTaskSuspend(0xFFu);
    }
    for (;;) {
        {cpu_sr = OS_CPU_SR_Save();};
        OSIdleCtrRun = OSIdleCtr;                 
        OSIdleCtr    = 0L;                        
        {OS_CPU_SR_Restore(cpu_sr);};
        OSCPUUsage   = (INT8U)(100L - OSIdleCtrRun / OSIdleCtrMax);
        OSTaskStatHook();                         

        OS_TaskStatStkChk();                      

        OSTimeDly(100 / 10);         
    }
}

 










 


void  OS_TaskStatStkChk (void)
{
    OS_TCB      *ptcb;
    OS_STK_DATA  stk_data;
    INT8U        err;
    INT8U        prio;


    for (prio = 0; prio <= (63); prio++) {
        err = OSTaskStkChk(prio, &stk_data);
        if (err == 0u) {
            ptcb = OSTCBPrioTbl[prio];
            if (ptcb != (OS_TCB *)0) {                                
                if (ptcb != ((OS_TCB *)1)) {                        


                    ptcb->OSTCBStkBase = ptcb->OSTCBStkBottom + ptcb->OSTCBStkSize;



                    ptcb->OSTCBStkUsed = stk_data.OSUsed;             

                }
            }
        }
    }
}

 









































 

INT8U  OS_TCBInit (INT8U prio, OS_STK *ptos, OS_STK *pbos, INT16U id, INT32U stk_size, void *pext, INT16U opt)
{
    OS_TCB    *ptcb;

    OS_CPU_SR  cpu_sr = 0;




    {cpu_sr = OS_CPU_SR_Save();};
    ptcb = OSTCBFreeList;                                   
    if (ptcb != (OS_TCB *)0) {
        OSTCBFreeList            = ptcb->OSTCBNext;         
        {OS_CPU_SR_Restore(cpu_sr);};
        ptcb->OSTCBStkPtr        = ptos;                    
        ptcb->OSTCBPrio          = prio;                    
        ptcb->OSTCBStat          = 0x00u;             
        ptcb->OSTCBStatPend      = 0u;         
        ptcb->OSTCBDly           = 0;                       


        ptcb->OSTCBExtPtr        = pext;                    
        ptcb->OSTCBStkSize       = stk_size;                
        ptcb->OSTCBStkBottom     = pbos;                    
        ptcb->OSTCBOpt           = opt;                     
        ptcb->OSTCBId            = id;                      
#line 1955 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_core.c"


        ptcb->OSTCBDelReq        = 0u;



        ptcb->OSTCBY             = (INT8U)(prio >> 3);           
        ptcb->OSTCBX             = (INT8U)(prio & 0x07);
        ptcb->OSTCBBitY          = (INT8U)(1 << ptcb->OSTCBY);
        ptcb->OSTCBBitX          = (INT8U)(1 << ptcb->OSTCBX);
#line 1971 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_core.c"


        ptcb->OSTCBEventPtr      = (OS_EVENT  *)0;          

        ptcb->OSTCBEventMultiPtr = (OS_EVENT **)0;          




        ptcb->OSTCBFlagNode  = (OS_FLAG_NODE *)0;           



        ptcb->OSTCBMsg       = (void *)0;                   



        ptcb->OSTCBCtxSwCtr    = 0L;                        
        ptcb->OSTCBCyclesStart = 0L;
        ptcb->OSTCBCyclesTot   = 0L;
        ptcb->OSTCBStkBase     = (OS_STK *)0;
        ptcb->OSTCBStkUsed     = 0L;



        ptcb->OSTCBTaskName[0] = '?';                       
        ptcb->OSTCBTaskName[1] = (INT8U)0;


        OSTCBInitHook(ptcb);

        OSTaskCreateHook(ptcb);                             

        {cpu_sr = OS_CPU_SR_Save();};
        OSTCBPrioTbl[prio] = ptcb;
        ptcb->OSTCBNext    = OSTCBList;                     
        ptcb->OSTCBPrev    = (OS_TCB *)0;
        if (OSTCBList != (OS_TCB *)0) {
            OSTCBList->OSTCBPrev = ptcb;
        }
        OSTCBList               = ptcb;
        OSRdyGrp               |= ptcb->OSTCBBitY;          
        OSRdyTbl[ptcb->OSTCBY] |= ptcb->OSTCBBitX;
        OSTaskCtr++;                                        
        {OS_CPU_SR_Restore(cpu_sr);};
        return (0u);
    }
    {OS_CPU_SR_Restore(cpu_sr);};
    return (66u);
}
#line 29 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.c"
#line 1 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_flag.c"





















 










 

static  void     OS_FlagBlock(OS_FLAG_GRP *pgrp, OS_FLAG_NODE *pnode, OS_FLAGS flags, INT8U wait_type, INT16U timeout);
static  BOOLEAN  OS_FlagTaskRdy(OS_FLAG_NODE *pnode, OS_FLAGS flags_rdy);

 




















































 


OS_FLAGS  OSFlagAccept (OS_FLAG_GRP *pgrp, OS_FLAGS flags, INT8U wait_type, INT8U *perr)
{
    OS_FLAGS      flags_rdy;
    INT8U         result;
    BOOLEAN       consume;

    OS_CPU_SR     cpu_sr = 0;




#line 114 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_flag.c"
    if (pgrp->OSFlagType != 5u) {           
        *perr = 1u;
        return ((OS_FLAGS)0);
    }
    result = (INT8U)(wait_type & 0x80u);
    if (result != (INT8U)0) {                               
        wait_type &= ~0x80u;
        consume    = 1u;
    } else {
        consume    = 0u;
    }
 
    *perr = 0u;                                    
    {cpu_sr = OS_CPU_SR_Save();};
    switch (wait_type) {
        case 2u:                          
             flags_rdy = (OS_FLAGS)(pgrp->OSFlagFlags & flags);      
             if (flags_rdy == flags) {                      
                 if (consume == 1u) {                  
                     pgrp->OSFlagFlags &= ~flags_rdy;       
                 }
             } else {
                 *perr = 112u;
             }
             {OS_CPU_SR_Restore(cpu_sr);};
             break;

        case 3u:
             flags_rdy = (OS_FLAGS)(pgrp->OSFlagFlags & flags);      
             if (flags_rdy != (OS_FLAGS)0) {                
                 if (consume == 1u) {                  
                     pgrp->OSFlagFlags &= ~flags_rdy;       
                 }
             } else {
                 *perr = 112u;
             }
             {OS_CPU_SR_Restore(cpu_sr);};
             break;


        case 0u:                          
             flags_rdy = (OS_FLAGS)(~pgrp->OSFlagFlags & flags);   
             if (flags_rdy == flags) {                      
                 if (consume == 1u) {                  
                     pgrp->OSFlagFlags |= flags_rdy;        
                 }
             } else {
                 *perr = 112u;
             }
             {OS_CPU_SR_Restore(cpu_sr);};
             break;

        case 1u:
             flags_rdy = (OS_FLAGS)(~pgrp->OSFlagFlags & flags);  
             if (flags_rdy != (OS_FLAGS)0) {                
                 if (consume == 1u) {                  
                     pgrp->OSFlagFlags |= flags_rdy;        
                 }
             } else {
                 *perr = 112u;
             }
             {OS_CPU_SR_Restore(cpu_sr);};
             break;


        default:
             {OS_CPU_SR_Restore(cpu_sr);};
             flags_rdy = (OS_FLAGS)0;
             *perr     = 111u;
             break;
    }
    return (flags_rdy);
}


 


















 

OS_FLAG_GRP  *OSFlagCreate (OS_FLAGS flags, INT8U *perr)
{
    OS_FLAG_GRP *pgrp;

    OS_CPU_SR    cpu_sr = 0;









    if (OSIntNesting > 0) {                          
        *perr = 16u;                   
        return ((OS_FLAG_GRP *)0);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    pgrp = OSFlagFreeList;                           
    if (pgrp != (OS_FLAG_GRP *)0) {                  
                                                     
        OSFlagFreeList       = (OS_FLAG_GRP *)OSFlagFreeList->OSFlagWaitList;
        pgrp->OSFlagType     = 5u;   
        pgrp->OSFlagFlags    = flags;                
        pgrp->OSFlagWaitList = (void *)0;            

        pgrp->OSFlagName[0]  = '?';
        pgrp->OSFlagName[1]  = (INT8U)0;

        {OS_CPU_SR_Restore(cpu_sr);};
        *perr                = 0u;
    } else {
        {OS_CPU_SR_Restore(cpu_sr);};
        *perr                = 114u;
    }
    return (pgrp);                                   
}

 


































 


OS_FLAG_GRP  *OSFlagDel (OS_FLAG_GRP *pgrp, INT8U opt, INT8U *perr)
{
    BOOLEAN       tasks_waiting;
    OS_FLAG_NODE *pnode;
    OS_FLAG_GRP  *pgrp_return;

    OS_CPU_SR     cpu_sr = 0;




#line 307 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_flag.c"
    if (OSIntNesting > 0) {                                 
        *perr = 15u;                             
        return (pgrp);
    }
    if (pgrp->OSFlagType != 5u) {           
        *perr = 1u;
        return (pgrp);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    if (pgrp->OSFlagWaitList != (void *)0) {                
        tasks_waiting = 1u;                            
    } else {
        tasks_waiting = 0u;                           
    }
    switch (opt) {
        case 0u:                                
             if (tasks_waiting == 0u) {

                 pgrp->OSFlagName[0]  = '?';                
                 pgrp->OSFlagName[1]  = (INT8U)0;

                 pgrp->OSFlagType     = 0u;
                 pgrp->OSFlagWaitList = (void *)OSFlagFreeList;  
                 pgrp->OSFlagFlags    = (OS_FLAGS)0;
                 OSFlagFreeList       = pgrp;
                 {OS_CPU_SR_Restore(cpu_sr);};
                 *perr                = 0u;
                 pgrp_return          = (OS_FLAG_GRP *)0;   
             } else {
                 {OS_CPU_SR_Restore(cpu_sr);};
                 *perr                = 73u;
                 pgrp_return          = pgrp;
             }
             break;

        case 1u:                                 
             pnode = (OS_FLAG_NODE *)pgrp->OSFlagWaitList;
             while (pnode != (OS_FLAG_NODE *)0) {           
                 (void)OS_FlagTaskRdy(pnode, (OS_FLAGS)0);
                 pnode = (OS_FLAG_NODE *)pnode->OSFlagNodeNext;
             }

             pgrp->OSFlagName[0]  = '?';                    
             pgrp->OSFlagName[1]  = (INT8U)0;

             pgrp->OSFlagType     = 0u;
             pgrp->OSFlagWaitList = (void *)OSFlagFreeList; 
             pgrp->OSFlagFlags    = (OS_FLAGS)0;
             OSFlagFreeList       = pgrp;
             {OS_CPU_SR_Restore(cpu_sr);};
             if (tasks_waiting == 1u) {                
                 OS_Sched();                                
             }
             *perr = 0u;
             pgrp_return          = (OS_FLAG_GRP *)0;       
             break;

        default:
             {OS_CPU_SR_Restore(cpu_sr);};
             *perr                = 7u;
             pgrp_return          = pgrp;
             break;
    }
    return (pgrp_return);
}

 





















 


INT8U  OSFlagNameGet (OS_FLAG_GRP *pgrp, INT8U *pname, INT8U *perr)
{
    INT8U      len;

    OS_CPU_SR  cpu_sr = 0;




#line 420 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_flag.c"
    if (OSIntNesting > 0) {                       
        *perr = 17u;
        return (0);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    if (pgrp->OSFlagType != 5u) {
        {OS_CPU_SR_Restore(cpu_sr);};
        *perr = 1u;
        return (0);
    }
    len   = OS_StrCopy(pname, pgrp->OSFlagName);  
    {OS_CPU_SR_Restore(cpu_sr);};
    *perr = 0u;
    return (len);
}


 





















 


void  OSFlagNameSet (OS_FLAG_GRP *pgrp, INT8U *pname, INT8U *perr)
{
    INT8U      len;

    OS_CPU_SR  cpu_sr = 0;




#line 484 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_flag.c"
    if (OSIntNesting > 0) {                       
        *perr = 18u;
        return;
    }
    {cpu_sr = OS_CPU_SR_Save();};
    if (pgrp->OSFlagType != 5u) {
        {OS_CPU_SR_Restore(cpu_sr);};
        *perr = 1u;
        return;
    }
    len = OS_StrLen(pname);                       
    if (len > (16 - 1)) {          
        {OS_CPU_SR_Restore(cpu_sr);};
        *perr = 115u;
        return;
    }
    (void)OS_StrCopy(pgrp->OSFlagName, pname);    
    {OS_CPU_SR_Restore(cpu_sr);};
    *perr = 0u;
    return;
}


 




















































 

OS_FLAGS  OSFlagPend (OS_FLAG_GRP *pgrp, OS_FLAGS flags, INT8U wait_type, INT16U timeout, INT8U *perr)
{
    OS_FLAG_NODE  node;
    OS_FLAGS      flags_rdy;
    INT8U         result;
    INT8U         pend_stat;
    BOOLEAN       consume;

    OS_CPU_SR     cpu_sr = 0;




#line 584 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_flag.c"
    if (OSIntNesting > 0) {                                 
        *perr = 2u;                            
        return ((OS_FLAGS)0);
    }
    if (OSLockNesting > 0) {                                
        *perr = 13u;                         
        return ((OS_FLAGS)0);
    }
    if (pgrp->OSFlagType != 5u) {           
        *perr = 1u;
        return ((OS_FLAGS)0);
    }
    result = (INT8U)(wait_type & 0x80u);
    if (result != (INT8U)0) {                              
        wait_type &= ~(INT8U)0x80u;
        consume    = 1u;
    } else {
        consume    = 0u;
    }
 
    {cpu_sr = OS_CPU_SR_Save();};
    switch (wait_type) {
        case 2u:                          
             flags_rdy = (OS_FLAGS)(pgrp->OSFlagFlags & flags);    
             if (flags_rdy == flags) {                      
                 if (consume == 1u) {                  
                     pgrp->OSFlagFlags &= ~flags_rdy;       
                 }
                 OSTCBCur->OSTCBFlagsRdy = flags_rdy;       
                 {OS_CPU_SR_Restore(cpu_sr);};                        
                 *perr                   = 0u;
                 return (flags_rdy);
             } else {                                       
                 OS_FlagBlock(pgrp, &node, flags, wait_type, timeout);
                 {OS_CPU_SR_Restore(cpu_sr);};
             }
             break;

        case 3u:
             flags_rdy = (OS_FLAGS)(pgrp->OSFlagFlags & flags);     
             if (flags_rdy != (OS_FLAGS)0) {                
                 if (consume == 1u) {                  
                     pgrp->OSFlagFlags &= ~flags_rdy;       
                 }
                 OSTCBCur->OSTCBFlagsRdy = flags_rdy;       
                 {OS_CPU_SR_Restore(cpu_sr);};                        
                 *perr                   = 0u;
                 return (flags_rdy);
             } else {                                       
                 OS_FlagBlock(pgrp, &node, flags, wait_type, timeout);
                 {OS_CPU_SR_Restore(cpu_sr);};
             }
             break;


        case 0u:                          
             flags_rdy = (OS_FLAGS)(~pgrp->OSFlagFlags & flags);   
             if (flags_rdy == flags) {                      
                 if (consume == 1u) {                  
                     pgrp->OSFlagFlags |= flags_rdy;        
                 }
                 OSTCBCur->OSTCBFlagsRdy = flags_rdy;       
                 {OS_CPU_SR_Restore(cpu_sr);};                        
                 *perr                   = 0u;
                 return (flags_rdy);
             } else {                                       
                 OS_FlagBlock(pgrp, &node, flags, wait_type, timeout);
                 {OS_CPU_SR_Restore(cpu_sr);};
             }
             break;

        case 1u:
             flags_rdy = (OS_FLAGS)(~pgrp->OSFlagFlags & flags);  
             if (flags_rdy != (OS_FLAGS)0) {                
                 if (consume == 1u) {                  
                     pgrp->OSFlagFlags |= flags_rdy;        
                 }
                 OSTCBCur->OSTCBFlagsRdy = flags_rdy;       
                 {OS_CPU_SR_Restore(cpu_sr);};                        
                 *perr                   = 0u;
                 return (flags_rdy);
             } else {                                       
                 OS_FlagBlock(pgrp, &node, flags, wait_type, timeout);
                 {OS_CPU_SR_Restore(cpu_sr);};
             }
             break;


        default:
             {OS_CPU_SR_Restore(cpu_sr);};
             flags_rdy = (OS_FLAGS)0;
             *perr      = 111u;
             return (flags_rdy);
    }
 
    OS_Sched();                                          
    {cpu_sr = OS_CPU_SR_Save();};
    if (OSTCBCur->OSTCBStatPend != 0u) {       
        pend_stat                = OSTCBCur->OSTCBStatPend;
        OSTCBCur->OSTCBStatPend  = 0u;
        OS_FlagUnlink(&node);
        OSTCBCur->OSTCBStat      = 0x00u;             
        {OS_CPU_SR_Restore(cpu_sr);};
        flags_rdy                = (OS_FLAGS)0;
        switch (pend_stat) {
            case 2u:
                 *perr = 14u;                  
                 break;

            case 1u:
            default:
                 *perr = 10u;                     
                 break;
        }
        return (flags_rdy);
    }
    flags_rdy = OSTCBCur->OSTCBFlagsRdy;
    if (consume == 1u) {                               
        switch (wait_type) {
            case 2u:
            case 3u:                      
                 pgrp->OSFlagFlags &= ~flags_rdy;
                 break;


            case 0u:
            case 1u:                      
                 pgrp->OSFlagFlags |=  flags_rdy;
                 break;

            default:
                 {OS_CPU_SR_Restore(cpu_sr);};
                 *perr = 111u;
                 return ((OS_FLAGS)0);
        }
    }
    {OS_CPU_SR_Restore(cpu_sr);};
    *perr = 0u;                                    
    return (flags_rdy);
}
 













 

OS_FLAGS  OSFlagPendGetFlagsRdy (void)
{
    OS_FLAGS      flags;

    OS_CPU_SR     cpu_sr = 0;




    {cpu_sr = OS_CPU_SR_Save();};
    flags = OSTCBCur->OSTCBFlagsRdy;
    {OS_CPU_SR_Restore(cpu_sr);};
    return (flags);
}

 








































 
OS_FLAGS  OSFlagPost (OS_FLAG_GRP *pgrp, OS_FLAGS flags, INT8U opt, INT8U *perr)
{
    OS_FLAG_NODE *pnode;
    BOOLEAN       sched;
    OS_FLAGS      flags_cur;
    OS_FLAGS      flags_rdy;
    BOOLEAN       rdy;

    OS_CPU_SR     cpu_sr = 0;




#line 819 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_flag.c"
    if (pgrp->OSFlagType != 5u) {     
        *perr = 1u;
        return ((OS_FLAGS)0);
    }
 
    {cpu_sr = OS_CPU_SR_Save();};
    switch (opt) {
        case 0u:
             pgrp->OSFlagFlags &= ~flags;             
             break;

        case 1u:
             pgrp->OSFlagFlags |=  flags;             
             break;

        default:
             {OS_CPU_SR_Restore(cpu_sr);};                      
             *perr = 113u;
             return ((OS_FLAGS)0);
    }
    sched = 0u;                                 
    pnode = (OS_FLAG_NODE *)pgrp->OSFlagWaitList;
    while (pnode != (OS_FLAG_NODE *)0) {              
        switch (pnode->OSFlagNodeWaitType) {
            case 2u:                
                 flags_rdy = (OS_FLAGS)(pgrp->OSFlagFlags & pnode->OSFlagNodeFlags);
                 if (flags_rdy == pnode->OSFlagNodeFlags) {
                     rdy = OS_FlagTaskRdy(pnode, flags_rdy);   
                     if (rdy == 1u) {
                         sched = 1u;                      
                     }
                 }
                 break;

            case 3u:                
                 flags_rdy = (OS_FLAGS)(pgrp->OSFlagFlags & pnode->OSFlagNodeFlags);
                 if (flags_rdy != (OS_FLAGS)0) {
                     rdy = OS_FlagTaskRdy(pnode, flags_rdy);   
                     if (rdy == 1u) {
                         sched = 1u;                      
                     }
                 }
                 break;


            case 0u:                
                 flags_rdy = (OS_FLAGS)(~pgrp->OSFlagFlags & pnode->OSFlagNodeFlags);
                 if (flags_rdy == pnode->OSFlagNodeFlags) {
                     rdy = OS_FlagTaskRdy(pnode, flags_rdy);   
                     if (rdy == 1u) {
                         sched = 1u;                      
                     }
                 }
                 break;

            case 1u:                
                 flags_rdy = (OS_FLAGS)(~pgrp->OSFlagFlags & pnode->OSFlagNodeFlags);
                 if (flags_rdy != (OS_FLAGS)0) {
                     rdy = OS_FlagTaskRdy(pnode, flags_rdy);   
                     if (rdy == 1u) {
                         sched = 1u;                      
                     }
                 }
                 break;

            default:
                 {OS_CPU_SR_Restore(cpu_sr);};
                 *perr = 111u;
                 return ((OS_FLAGS)0);
        }
        pnode = (OS_FLAG_NODE *)pnode->OSFlagNodeNext;  
    }
    {OS_CPU_SR_Restore(cpu_sr);};
    if (sched == 1u) {
        OS_Sched();
    }
    {cpu_sr = OS_CPU_SR_Save();};
    flags_cur = pgrp->OSFlagFlags;
    {OS_CPU_SR_Restore(cpu_sr);};
    *perr     = 0u;
    return (flags_cur);
}
 

















 


OS_FLAGS  OSFlagQuery (OS_FLAG_GRP *pgrp, INT8U *perr)
{
    OS_FLAGS   flags;

    OS_CPU_SR  cpu_sr = 0;




#line 940 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_flag.c"
    if (pgrp->OSFlagType != 5u) {  
        *perr = 1u;
        return ((OS_FLAGS)0);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    flags = pgrp->OSFlagFlags;
    {OS_CPU_SR_Restore(cpu_sr);};
    *perr = 0u;
    return (flags);                                
}


 



































 

static  void  OS_FlagBlock (OS_FLAG_GRP *pgrp, OS_FLAG_NODE *pnode, OS_FLAGS flags, INT8U wait_type, INT16U timeout)
{
    OS_FLAG_NODE  *pnode_next;
    INT8U          y;


    OSTCBCur->OSTCBStat      |= 0x20u;
    OSTCBCur->OSTCBStatPend   = 0u;
    OSTCBCur->OSTCBDly        = timeout;               

    OSTCBCur->OSTCBFlagNode   = pnode;                 

    pnode->OSFlagNodeFlags    = flags;                 
    pnode->OSFlagNodeWaitType = wait_type;             
    pnode->OSFlagNodeTCB      = (void *)OSTCBCur;      
    pnode->OSFlagNodeNext     = pgrp->OSFlagWaitList;  
    pnode->OSFlagNodePrev     = (void *)0;
    pnode->OSFlagNodeFlagGrp  = (void *)pgrp;          
    pnode_next                = (OS_FLAG_NODE *)pgrp->OSFlagWaitList;
    if (pnode_next != (void *)0) {                     
        pnode_next->OSFlagNodePrev = pnode;            
    }
    pgrp->OSFlagWaitList = (void *)pnode;

    y            =  OSTCBCur->OSTCBY;                  
    OSRdyTbl[y] &= ~OSTCBCur->OSTCBBitX;
    if (OSRdyTbl[y] == 0x00) {
        OSRdyGrp &= ~OSTCBCur->OSTCBBitY;
    }
}

 













 

void  OS_FlagInit (void)
{
#line 1049 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_flag.c"


    INT16U       i;
    OS_FLAG_GRP *pgrp1;
    OS_FLAG_GRP *pgrp2;


    OS_MemClr((INT8U *)&OSFlagTbl[0], sizeof(OSFlagTbl));            
    pgrp1 = &OSFlagTbl[0];
    pgrp2 = &OSFlagTbl[1];
    for (i = 0; i < (5 - 1); i++) {                       
        pgrp1->OSFlagType     = 0u;
        pgrp1->OSFlagWaitList = (void *)pgrp2;

        pgrp1->OSFlagName[0]  = '?';                                 
        pgrp1->OSFlagName[1]  = (INT8U)0;

        pgrp1++;
        pgrp2++;
    }
    pgrp1->OSFlagType     = 0u;
    pgrp1->OSFlagWaitList = (void *)0;

    pgrp1->OSFlagName[0]  = '?';                                     
    pgrp1->OSFlagName[1]  = (INT8U)0;

    OSFlagFreeList        = &OSFlagTbl[0];

}

 





















 

static  BOOLEAN  OS_FlagTaskRdy (OS_FLAG_NODE *pnode, OS_FLAGS flags_rdy)
{
    OS_TCB   *ptcb;
    BOOLEAN   sched;


    ptcb                 = (OS_TCB *)pnode->OSFlagNodeTCB;  
    ptcb->OSTCBDly       = 0;
    ptcb->OSTCBFlagsRdy  = flags_rdy;
    ptcb->OSTCBStat     &= ~(INT8U)0x20u;
    ptcb->OSTCBStatPend  = 0u;
    if (ptcb->OSTCBStat == 0x00u) {                   
        OSRdyGrp               |= ptcb->OSTCBBitY;          
        OSRdyTbl[ptcb->OSTCBY] |= ptcb->OSTCBBitX;
        sched                   = 1u;
    } else {
        sched                   = 0u;
    }
    OS_FlagUnlink(pnode);
    return (sched);
}

 



















 

void  OS_FlagUnlink (OS_FLAG_NODE *pnode)
{

    OS_TCB       *ptcb;

    OS_FLAG_GRP  *pgrp;
    OS_FLAG_NODE *pnode_prev;
    OS_FLAG_NODE *pnode_next;


    pnode_prev = (OS_FLAG_NODE *)pnode->OSFlagNodePrev;
    pnode_next = (OS_FLAG_NODE *)pnode->OSFlagNodeNext;
    if (pnode_prev == (OS_FLAG_NODE *)0) {                       
        pgrp                 = (OS_FLAG_GRP *)pnode->OSFlagNodeFlagGrp;
        pgrp->OSFlagWaitList = (void *)pnode_next;               
        if (pnode_next != (OS_FLAG_NODE *)0) {
            pnode_next->OSFlagNodePrev = (OS_FLAG_NODE *)0;      
        }
    } else {                                                     
        pnode_prev->OSFlagNodeNext = pnode_next;                 
        if (pnode_next != (OS_FLAG_NODE *)0) {                   
            pnode_next->OSFlagNodePrev = pnode_prev;             
        }
    }

    ptcb                = (OS_TCB *)pnode->OSFlagNodeTCB;
    ptcb->OSTCBFlagNode = (OS_FLAG_NODE *)0;

}
#line 30 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.c"
#line 1 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_mbox.c"





















 





















 


void  *OSMboxAccept (OS_EVENT *pevent)
{
    void      *pmsg;

    OS_CPU_SR  cpu_sr = 0;









    if (pevent->OSEventType != 1u) {       
        return ((void *)0);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    pmsg               = pevent->OSEventPtr;
    pevent->OSEventPtr = (void *)0;                        
    {OS_CPU_SR_Restore(cpu_sr);};
    return (pmsg);                                         
}

 














 

OS_EVENT  *OSMboxCreate (void *pmsg)
{
    OS_EVENT  *pevent;

    OS_CPU_SR  cpu_sr = 0;




    if (OSIntNesting > 0) {                       
        return ((OS_EVENT *)0);                   
    }
    {cpu_sr = OS_CPU_SR_Save();};
    pevent = OSEventFreeList;                     
    if (OSEventFreeList != (OS_EVENT *)0) {       
        OSEventFreeList = (OS_EVENT *)OSEventFreeList->OSEventPtr;
    }
    {OS_CPU_SR_Restore(cpu_sr);};
    if (pevent != (OS_EVENT *)0) {
        pevent->OSEventType    = 1u;
        pevent->OSEventCnt     = 0;
        pevent->OSEventPtr     = pmsg;            

        pevent->OSEventName[0] = '?';
        pevent->OSEventName[1] = (INT8U)0;

        OS_EventWaitListInit(pevent);
    }
    return (pevent);                              
}
 


































 


OS_EVENT  *OSMboxDel (OS_EVENT *pevent, INT8U opt, INT8U *perr)
{
    BOOLEAN    tasks_waiting;
    OS_EVENT  *pevent_return;

    OS_CPU_SR  cpu_sr = 0;




#line 175 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_mbox.c"
    if (pevent->OSEventType != 1u) {        
        *perr = 1u;
        return (pevent);
    }
    if (OSIntNesting > 0) {                                 
        *perr = 15u;                             
        return (pevent);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    if (pevent->OSEventGrp != 0) {                          
        tasks_waiting = 1u;                            
    } else {
        tasks_waiting = 0u;                           
    }
    switch (opt) {
        case 0u:                                
             if (tasks_waiting == 0u) {

                 pevent->OSEventName[0] = '?';              
                 pevent->OSEventName[1] = (INT8U)0;

                 pevent->OSEventType = 0u;
                 pevent->OSEventPtr  = OSEventFreeList;     
                 pevent->OSEventCnt  = 0;
                 OSEventFreeList     = pevent;              
                 {OS_CPU_SR_Restore(cpu_sr);};
                 *perr               = 0u;
                 pevent_return       = (OS_EVENT *)0;       
             } else {
                 {OS_CPU_SR_Restore(cpu_sr);};
                 *perr               = 73u;
                 pevent_return       = pevent;
             }
             break;

        case 1u:                                 
             while (pevent->OSEventGrp != 0) {              
                 (void)OS_EventTaskRdy(pevent, (void *)0, 0x02u, 0u);
             }

             pevent->OSEventName[0] = '?';                  
             pevent->OSEventName[1] = (INT8U)0;

             pevent->OSEventType    = 0u;
             pevent->OSEventPtr     = OSEventFreeList;      
             pevent->OSEventCnt     = 0;
             OSEventFreeList        = pevent;               
             {OS_CPU_SR_Restore(cpu_sr);};
             if (tasks_waiting == 1u) {                
                 OS_Sched();                                
             }
             *perr         = 0u;
             pevent_return = (OS_EVENT *)0;                 
             break;

        default:
             {OS_CPU_SR_Restore(cpu_sr);};
             *perr         = 7u;
             pevent_return = pevent;
             break;
    }
    return (pevent_return);
}


 































 
 
void  *OSMboxPend (OS_EVENT *pevent, INT16U timeout, INT8U *perr)
{
    void      *pmsg;

    OS_CPU_SR  cpu_sr = 0;




#line 292 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_mbox.c"
    if (pevent->OSEventType != 1u) {   
        *perr = 1u;
        return ((void *)0);
    }
    if (OSIntNesting > 0) {                            
        *perr = 2u;                       
        return ((void *)0);
    }
    if (OSLockNesting > 0) {                           
        *perr = 13u;                    
        return ((void *)0);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    pmsg = pevent->OSEventPtr;
    if (pmsg != (void *)0) {                           
        pevent->OSEventPtr = (void *)0;                
        {OS_CPU_SR_Restore(cpu_sr);};
        *perr = 0u;
        return (pmsg);                                 
    }
    OSTCBCur->OSTCBStat     |= 0x02u;           
    OSTCBCur->OSTCBStatPend  = 0u;
    OSTCBCur->OSTCBDly       = timeout;                
    OS_EventTaskWait(pevent);                          
    {OS_CPU_SR_Restore(cpu_sr);};
    OS_Sched();                                        
    {cpu_sr = OS_CPU_SR_Save();};
    switch (OSTCBCur->OSTCBStatPend) {                 
        case 0u:
             pmsg =  OSTCBCur->OSTCBMsg;
            *perr =  0u;
             break;

        case 2u:
             pmsg = (void *)0;
            *perr =  14u;                
             break;

        case 1u:
        default:
             OS_EventTaskRemove(OSTCBCur, pevent);
             pmsg = (void *)0;
            *perr =  10u;                   
             break;
    }
    OSTCBCur->OSTCBStat          =  0x00u;       
    OSTCBCur->OSTCBStatPend      =  0u;   
    OSTCBCur->OSTCBEventPtr      = (OS_EVENT  *)0;     

    OSTCBCur->OSTCBEventMultiPtr = (OS_EVENT **)0;

    OSTCBCur->OSTCBMsg           = (void      *)0;     
    {OS_CPU_SR_Restore(cpu_sr);};
    return (pmsg);                                     
}
 






























 


INT8U  OSMboxPendAbort (OS_EVENT *pevent, INT8U opt, INT8U *perr)
{
    INT8U      nbr_tasks;

    OS_CPU_SR  cpu_sr = 0;




#line 399 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_mbox.c"
    if (pevent->OSEventType != 1u) {        
        *perr = 1u;
        return (0);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    if (pevent->OSEventGrp != 0) {                          
        nbr_tasks = 0;
        switch (opt) {
            case 1u:                     
                 while (pevent->OSEventGrp != 0) {          
                     (void)OS_EventTaskRdy(pevent, (void *)0, 0x02u, 2u);
                     nbr_tasks++;
                 }
                 break;
             
            case 0u:
            default:                                        
                 (void)OS_EventTaskRdy(pevent, (void *)0, 0x02u, 2u);
                 nbr_tasks++;
                 break;
        }
        {OS_CPU_SR_Restore(cpu_sr);};
        OS_Sched();                                         
        *perr = 14u;
        return (nbr_tasks);
    }
    {OS_CPU_SR_Restore(cpu_sr);};
    *perr = 0u;
    return (0);                                             
}


 




















 


INT8U  OSMboxPost (OS_EVENT *pevent, void *pmsg)
{

    OS_CPU_SR  cpu_sr = 0;




#line 471 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_mbox.c"
    if (pevent->OSEventType != 1u) {   
        return (1u);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    if (pevent->OSEventGrp != 0) {                     
                                                       
        (void)OS_EventTaskRdy(pevent, pmsg, 0x02u, 0u);
        {OS_CPU_SR_Restore(cpu_sr);};
        OS_Sched();                                    
        return (0u);
    }
    if (pevent->OSEventPtr != (void *)0) {             
        {OS_CPU_SR_Restore(cpu_sr);};
        return (20u);
    }
    pevent->OSEventPtr = pmsg;                         
    {OS_CPU_SR_Restore(cpu_sr);};
    return (0u);
}


 






























 


INT8U  OSMboxPostOpt (OS_EVENT *pevent, void *pmsg, INT8U opt)
{

    OS_CPU_SR  cpu_sr = 0;




#line 542 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_mbox.c"
    if (pevent->OSEventType != 1u) {   
        return (1u);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    if (pevent->OSEventGrp != 0) {                     
        if ((opt & 0x01u) != 0x00) {   
            while (pevent->OSEventGrp != 0) {          
                (void)OS_EventTaskRdy(pevent, pmsg, 0x02u, 0u);
            }
        } else {                                       
            (void)OS_EventTaskRdy(pevent, pmsg, 0x02u, 0u);
        }
        {OS_CPU_SR_Restore(cpu_sr);};
        if ((opt & 0x04u) == 0) {	   
            OS_Sched();                                
        }
        return (0u);
    }
    if (pevent->OSEventPtr != (void *)0) {             
        {OS_CPU_SR_Restore(cpu_sr);};
        return (20u);
    }
    pevent->OSEventPtr = pmsg;                         
    {OS_CPU_SR_Restore(cpu_sr);};
    return (0u);
}


 
















 


INT8U  OSMboxQuery (OS_EVENT *pevent, OS_MBOX_DATA *p_mbox_data)
{
    INT8U      i;

    INT8U     *psrc;
    INT8U     *pdest;





    OS_CPU_SR  cpu_sr = 0;




#line 614 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_mbox.c"
    if (pevent->OSEventType != 1u) {        
        return (1u);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    p_mbox_data->OSEventGrp = pevent->OSEventGrp;           
    psrc                    = &pevent->OSEventTbl[0];
    pdest                   = &p_mbox_data->OSEventTbl[0];
    for (i = 0; i < ((63) / 8 + 1); i++) {
        *pdest++ = *psrc++;
    }
    p_mbox_data->OSMsg = pevent->OSEventPtr;                
    {OS_CPU_SR_Restore(cpu_sr);};
    return (0u);
}
#line 31 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.c"
#line 1 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_mem.c"





















 


































 

OS_MEM  *OSMemCreate (void *addr, INT32U nblks, INT32U blksize, INT8U *perr)
{
    OS_MEM    *pmem;
    INT8U     *pblk;
    void     **plink;
    INT32U     i;

    OS_CPU_SR  cpu_sr = 0;




#line 92 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_mem.c"
    {cpu_sr = OS_CPU_SR_Save();};
    pmem = OSMemFreeList;                              
    if (OSMemFreeList != (OS_MEM *)0) {                
        OSMemFreeList = (OS_MEM *)OSMemFreeList->OSMemFreeList;
    }
    {OS_CPU_SR_Restore(cpu_sr);};
    if (pmem == (OS_MEM *)0) {                         
        *perr = 90u;
        return ((OS_MEM *)0);
    }
    plink = (void **)addr;                             
    pblk  = (INT8U *)((INT32U)addr + blksize);
    for (i = 0; i < (nblks - 1); i++) {
       *plink = (void *)pblk;                          
        plink = (void **)pblk;                         
        pblk  = (INT8U *)((INT32U)pblk + blksize);     
    }
    *plink              = (void *)0;                   
    pmem->OSMemAddr     = addr;                        
    pmem->OSMemFreeList = addr;                        
    pmem->OSMemNFree    = nblks;                       
    pmem->OSMemNBlks    = nblks;
    pmem->OSMemBlkSize  = blksize;                     
    *perr               = 0u;
    return (pmem);
}
 


















 

void  *OSMemGet (OS_MEM *pmem, INT8U *perr)
{
    void      *pblk;

    OS_CPU_SR  cpu_sr = 0;




#line 157 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_mem.c"
    {cpu_sr = OS_CPU_SR_Save();};
    if (pmem->OSMemNFree > 0) {                        
        pblk                = pmem->OSMemFreeList;     
        pmem->OSMemFreeList = *(void **)pblk;          
        pmem->OSMemNFree--;                            
        {OS_CPU_SR_Restore(cpu_sr);};
        *perr = 0u;                           
        return (pblk);                                 
    }
    {OS_CPU_SR_Restore(cpu_sr);};
    *perr = 93u;                   
    return ((void *)0);                                
}
 



















 


INT8U  OSMemNameGet (OS_MEM *pmem, INT8U *pname, INT8U *perr)
{
    INT8U      len;

    OS_CPU_SR  cpu_sr = 0;




#line 215 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_mem.c"
    if (OSIntNesting > 0) {                       
        *perr = 17u;
        return (0);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    len   = OS_StrCopy(pname, pmem->OSMemName);   
    {OS_CPU_SR_Restore(cpu_sr);};
    *perr = 0u;
    return (len);
}


 




















 


void  OSMemNameSet (OS_MEM *pmem, INT8U *pname, INT8U *perr)
{
    INT8U      len;

    OS_CPU_SR  cpu_sr = 0;




#line 273 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_mem.c"
    if (OSIntNesting > 0) {                       
        *perr = 18u;
        return;
    }
    {cpu_sr = OS_CPU_SR_Save();};
    len = OS_StrLen(pname);                       
    if (len > (16 - 1)) {           
        {OS_CPU_SR_Restore(cpu_sr);};
        *perr = 99u;
        return;
    }
    (void)OS_StrCopy(pmem->OSMemName, pname);     
    {OS_CPU_SR_Restore(cpu_sr);};
    *perr = 0u;
}


 
















 

INT8U  OSMemPut (OS_MEM *pmem, void *pblk)
{

    OS_CPU_SR  cpu_sr = 0;




#line 325 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_mem.c"
    {cpu_sr = OS_CPU_SR_Save();};
    if (pmem->OSMemNFree >= pmem->OSMemNBlks) {   
        {OS_CPU_SR_Restore(cpu_sr);};
        return (94u);
    }
    *(void **)pblk      = pmem->OSMemFreeList;    
    pmem->OSMemFreeList = pblk;
    pmem->OSMemNFree++;                           
    {OS_CPU_SR_Restore(cpu_sr);};
    return (0u);                         
}
 
















 


INT8U  OSMemQuery (OS_MEM *pmem, OS_MEM_DATA *p_mem_data)
{

    OS_CPU_SR  cpu_sr = 0;




#line 372 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_mem.c"
    {cpu_sr = OS_CPU_SR_Save();};
    p_mem_data->OSAddr     = pmem->OSMemAddr;
    p_mem_data->OSFreeList = pmem->OSMemFreeList;
    p_mem_data->OSBlkSize  = pmem->OSMemBlkSize;
    p_mem_data->OSNBlks    = pmem->OSMemNBlks;
    p_mem_data->OSNFree    = pmem->OSMemNFree;
    {OS_CPU_SR_Restore(cpu_sr);};
    p_mem_data->OSNUsed    = p_mem_data->OSNBlks - p_mem_data->OSNFree;
    return (0u);
}

 













 

void  OS_MemInit (void)
{
#line 409 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_mem.c"


    OS_MEM  *pmem;
    INT16U   i;


    OS_MemClr((INT8U *)&OSMemTbl[0], sizeof(OSMemTbl));    
    pmem = &OSMemTbl[0];                                   
    for (i = 0; i < (5 - 1); i++) {          
        pmem->OSMemFreeList = (void *)&OSMemTbl[i+1];      

        pmem->OSMemName[0]  = '?';                         
        pmem->OSMemName[1]  = (INT8U)0;

        pmem++;
    }
    pmem->OSMemFreeList = (void *)0;                       

    pmem->OSMemName[0]  = '?';                             
    pmem->OSMemName[1]  = (INT8U)0;


    OSMemFreeList       = &OSMemTbl[0];                    

}
#line 32 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.c"
#line 1 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_mutex.c"





















 











 










 

static  void  OSMutex_RdyAtPrio(OS_TCB *ptcb, INT8U prio);

 































 


BOOLEAN  OSMutexAccept (OS_EVENT *pevent, INT8U *perr)
{
    INT8U      pip;                                     

    OS_CPU_SR  cpu_sr = 0;




#line 102 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_mutex.c"
    if (pevent->OSEventType != 4u) {   
        *perr = 1u;
        return (0u);
    }
    if (OSIntNesting > 0) {                             
        *perr = 2u;
        return (0u);
    }
    {cpu_sr = OS_CPU_SR_Save();};                                
    pip = (INT8U)(pevent->OSEventCnt >> 8);             
    if ((pevent->OSEventCnt & ((INT16U)0x00FFu)) == ((INT16U)0x00FFu)) {
        pevent->OSEventCnt &= ((INT16U)0xFF00u);    
        pevent->OSEventCnt |= OSTCBCur->OSTCBPrio;      
        pevent->OSEventPtr  = (void *)OSTCBCur;         
        if (OSTCBCur->OSTCBPrio <= pip) {               
            {OS_CPU_SR_Restore(cpu_sr);};                         
            *perr = 120u;
        } else {
            {OS_CPU_SR_Restore(cpu_sr);};
            *perr = 0u;
        }
        return (1u);
    }
    {OS_CPU_SR_Restore(cpu_sr);};
    *perr = 0u;
    return (0u);
}


 
































 

OS_EVENT  *OSMutexCreate (INT8U prio, INT8U *perr)
{
    OS_EVENT  *pevent;

    OS_CPU_SR  cpu_sr = 0;




#line 184 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_mutex.c"
    if (OSIntNesting > 0) {                                 
        *perr = 16u;                          
        return ((OS_EVENT *)0);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    if (OSTCBPrioTbl[prio] != (OS_TCB *)0) {                
        {OS_CPU_SR_Restore(cpu_sr);};                                 
        *perr = 40u;                          
        return ((OS_EVENT *)0);
    }
    OSTCBPrioTbl[prio] = ((OS_TCB *)1);                   
    pevent             = OSEventFreeList;                   
    if (pevent == (OS_EVENT *)0) {                          
        OSTCBPrioTbl[prio] = (OS_TCB *)0;                   
        {OS_CPU_SR_Restore(cpu_sr);};
        *perr              = 4u;            
        return (pevent);
    }
    OSEventFreeList        = (OS_EVENT *)OSEventFreeList->OSEventPtr;    
    {OS_CPU_SR_Restore(cpu_sr);};
    pevent->OSEventType    = 4u;
    pevent->OSEventCnt     = (INT16U)((INT16U)prio << 8) | ((INT16U)0x00FFu);  
    pevent->OSEventPtr     = (void *)0;                                  

    pevent->OSEventName[0] = '?';
    pevent->OSEventName[1] = (INT8U)0;

    OS_EventWaitListInit(pevent);
    *perr                  = 0u;
    return (pevent);
}

 






































 


OS_EVENT  *OSMutexDel (OS_EVENT *pevent, INT8U opt, INT8U *perr)
{
    BOOLEAN    tasks_waiting;
    OS_EVENT  *pevent_return;
    INT8U      pip;                                         
    INT8U      prio;
    OS_TCB    *ptcb;

    OS_CPU_SR  cpu_sr = 0;




#line 280 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_mutex.c"
    if (pevent->OSEventType != 4u) {       
        *perr = 1u;
        return (pevent);
    }
    if (OSIntNesting > 0) {                                 
        *perr = 15u;                              
        return (pevent);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    if (pevent->OSEventGrp != 0) {                          
        tasks_waiting = 1u;                            
    } else {
        tasks_waiting = 0u;                           
    }
    switch (opt) {
        case 0u:                                
             if (tasks_waiting == 0u) {

                 pevent->OSEventName[0] = '?';              
                 pevent->OSEventName[1] = (INT8U)0;

                 pip                 = (INT8U)(pevent->OSEventCnt >> 8);
                 OSTCBPrioTbl[pip]   = (OS_TCB *)0;         
                 pevent->OSEventType = 0u;
                 pevent->OSEventPtr  = OSEventFreeList;     
                 pevent->OSEventCnt  = 0;
                 OSEventFreeList     = pevent;
                 {OS_CPU_SR_Restore(cpu_sr);};
                 *perr               = 0u;
                 pevent_return       = (OS_EVENT *)0;       
             } else {
                 {OS_CPU_SR_Restore(cpu_sr);};
                 *perr               = 73u;
                 pevent_return       = pevent;
             }
             break;

        case 1u:                                 
             pip  = (INT8U)(pevent->OSEventCnt >> 8);                      
             prio = (INT8U)(pevent->OSEventCnt & ((INT16U)0x00FFu));   
             ptcb = (OS_TCB *)pevent->OSEventPtr;
             if (ptcb != (OS_TCB *)0) {                     
                 if (ptcb->OSTCBPrio == pip) {              
                     OSMutex_RdyAtPrio(ptcb, prio);         
                 }
             }
             while (pevent->OSEventGrp != 0) {              
                 (void)OS_EventTaskRdy(pevent, (void *)0, 0x10u, 0u);
             }

             pevent->OSEventName[0] = '?';                  
             pevent->OSEventName[1] = (INT8U)0;

             pip                 = (INT8U)(pevent->OSEventCnt >> 8);
             OSTCBPrioTbl[pip]   = (OS_TCB *)0;             
             pevent->OSEventType = 0u;
             pevent->OSEventPtr  = OSEventFreeList;         
             pevent->OSEventCnt  = 0;
             OSEventFreeList     = pevent;                  
             {OS_CPU_SR_Restore(cpu_sr);};
             if (tasks_waiting == 1u) {                
                 OS_Sched();                                
             }
             *perr         = 0u;
             pevent_return = (OS_EVENT *)0;                 
             break;

        default:
             {OS_CPU_SR_Restore(cpu_sr);};
             *perr         = 7u;
             pevent_return = pevent;
             break;
    }
    return (pevent_return);
}


 






































 

void  OSMutexPend (OS_EVENT *pevent, INT16U timeout, INT8U *perr)
{
    INT8U      pip;                                         
    INT8U      mprio;                                       
    BOOLEAN    rdy;                                         
    OS_TCB    *ptcb;
    OS_EVENT  *pevent2;
    INT8U      y;

    OS_CPU_SR  cpu_sr = 0;




#line 421 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_mutex.c"
    if (pevent->OSEventType != 4u) {       
        *perr = 1u;
        return;
    }
    if (OSIntNesting > 0) {                                 
        *perr = 2u;                            
        return;
    }
    if (OSLockNesting > 0) {                                
        *perr = 13u;                         
        return;
    }
 
    {cpu_sr = OS_CPU_SR_Save();};
    pip = (INT8U)(pevent->OSEventCnt >> 8);                 
                                                            
    if ((INT8U)(pevent->OSEventCnt & ((INT16U)0x00FFu)) == ((INT16U)0x00FFu)) {
        pevent->OSEventCnt &= ((INT16U)0xFF00u);        
        pevent->OSEventCnt |= OSTCBCur->OSTCBPrio;          
        pevent->OSEventPtr  = (void *)OSTCBCur;             
        if (OSTCBCur->OSTCBPrio <= pip) {                   
            {OS_CPU_SR_Restore(cpu_sr);};                             
            *perr = 120u;
        } else {
            {OS_CPU_SR_Restore(cpu_sr);};
            *perr = 0u;
        }
        return;
    }
    mprio = (INT8U)(pevent->OSEventCnt & ((INT16U)0x00FFu));   
    ptcb  = (OS_TCB *)(pevent->OSEventPtr);                        
    if (ptcb->OSTCBPrio > pip) {                                   
        if (mprio > OSTCBCur->OSTCBPrio) {
            y = ptcb->OSTCBY;
            if ((OSRdyTbl[y] & ptcb->OSTCBBitX) != 0) {            
                OSRdyTbl[y] &= ~ptcb->OSTCBBitX;                   
                if (OSRdyTbl[y] == 0) {                            
                    OSRdyGrp &= ~ptcb->OSTCBBitY;
                }
                rdy = 1u;
            } else {
                pevent2 = ptcb->OSTCBEventPtr;
                if (pevent2 != (OS_EVENT *)0) {                    
                    if ((pevent2->OSEventTbl[ptcb->OSTCBY] &= ~ptcb->OSTCBBitX) == 0) {
                        pevent2->OSEventGrp &= ~ptcb->OSTCBBitY;
                    }
                }
                rdy = 0u;                             
            }
            ptcb->OSTCBPrio = pip;                          

            ptcb->OSTCBY    = (INT8U)( ptcb->OSTCBPrio >> 3);
            ptcb->OSTCBX    = (INT8U)( ptcb->OSTCBPrio & 0x07);
            ptcb->OSTCBBitY = (INT8U)(1 << ptcb->OSTCBY);
            ptcb->OSTCBBitX = (INT8U)(1 << ptcb->OSTCBX);
#line 482 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_mutex.c"
            if (rdy == 1u) {                           
                OSRdyGrp               |= ptcb->OSTCBBitY;  
                OSRdyTbl[ptcb->OSTCBY] |= ptcb->OSTCBBitX;
            } else {
                pevent2 = ptcb->OSTCBEventPtr;
                if (pevent2 != (OS_EVENT *)0) {             
                    pevent2->OSEventGrp               |= ptcb->OSTCBBitY;
                    pevent2->OSEventTbl[ptcb->OSTCBY] |= ptcb->OSTCBBitX;
                }
            }
            OSTCBPrioTbl[pip] = ptcb;
        }
    }
    OSTCBCur->OSTCBStat     |= 0x10u;          
    OSTCBCur->OSTCBStatPend  = 0u;
    OSTCBCur->OSTCBDly       = timeout;                
    OS_EventTaskWait(pevent);                          
    {OS_CPU_SR_Restore(cpu_sr);};
    OS_Sched();                                        
    {cpu_sr = OS_CPU_SR_Save();};
    switch (OSTCBCur->OSTCBStatPend) {                 
        case 0u:
             *perr = 0u;
             break;

        case 2u:
             *perr = 14u;                
             break;
             
        case 1u:
        default:
             OS_EventTaskRemove(OSTCBCur, pevent);
             *perr = 10u;                   
             break;
    }
    OSTCBCur->OSTCBStat          =  0x00u;       
    OSTCBCur->OSTCBStatPend      =  0u;   
    OSTCBCur->OSTCBEventPtr      = (OS_EVENT  *)0;     

    OSTCBCur->OSTCBEventMultiPtr = (OS_EVENT **)0;

    {OS_CPU_SR_Restore(cpu_sr);};
}
 






















 

INT8U  OSMutexPost (OS_EVENT *pevent)
{
    INT8U      pip;                                    
    INT8U      prio;

    OS_CPU_SR  cpu_sr = 0;




    if (OSIntNesting > 0) {                            
        return (5u);                      
    }





    if (pevent->OSEventType != 4u) {  
        return (1u);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    pip  = (INT8U)(pevent->OSEventCnt >> 8);           
    prio = (INT8U)(pevent->OSEventCnt & ((INT16U)0x00FFu));   
    if (OSTCBCur != (OS_TCB *)pevent->OSEventPtr) {    
        {OS_CPU_SR_Restore(cpu_sr);};
        return (100u);
    }
    if (OSTCBCur->OSTCBPrio == pip) {                  
        OSMutex_RdyAtPrio(OSTCBCur, prio);             
    }
    OSTCBPrioTbl[pip] = ((OS_TCB *)1);               
    if (pevent->OSEventGrp != 0) {                     
                                                       
        prio                = OS_EventTaskRdy(pevent, (void *)0, 0x10u, 0u);
        pevent->OSEventCnt &= ((INT16U)0xFF00u);   
        pevent->OSEventCnt |= prio;
        pevent->OSEventPtr  = OSTCBPrioTbl[prio];      
        if (prio <= pip) {                             
            {OS_CPU_SR_Restore(cpu_sr);};                        
            OS_Sched();                                
            return (120u);
        } else {
            {OS_CPU_SR_Restore(cpu_sr);};
            OS_Sched();                                
            return (0u);
        }
    }
    pevent->OSEventCnt |= ((INT16U)0x00FFu);          
    pevent->OSEventPtr  = (void *)0;
    {OS_CPU_SR_Restore(cpu_sr);};
    return (0u);
}
 
















 


INT8U  OSMutexQuery (OS_EVENT *pevent, OS_MUTEX_DATA *p_mutex_data)
{
    INT8U      i;

    INT8U     *psrc;
    INT8U     *pdest;





    OS_CPU_SR  cpu_sr = 0;




    if (OSIntNesting > 0) {                                 
        return (6u);                          
    }
#line 650 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_mutex.c"
    if (pevent->OSEventType != 4u) {       
        return (1u);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    p_mutex_data->OSMutexPIP  = (INT8U)(pevent->OSEventCnt >> 8);
    p_mutex_data->OSOwnerPrio = (INT8U)(pevent->OSEventCnt & ((INT16U)0x00FFu));
    if (p_mutex_data->OSOwnerPrio == 0xFF) {
        p_mutex_data->OSValue = 1u;
    } else {
        p_mutex_data->OSValue = 0u;
    }
    p_mutex_data->OSEventGrp  = pevent->OSEventGrp;         
    psrc                      = &pevent->OSEventTbl[0];
    pdest                     = &p_mutex_data->OSEventTbl[0];
    for (i = 0; i < ((63) / 8 + 1); i++) {
        *pdest++ = *psrc++;
    }
    {OS_CPU_SR_Restore(cpu_sr);};
    return (0u);
}


 












 

static  void  OSMutex_RdyAtPrio (OS_TCB *ptcb, INT8U prio)
{
    INT8U   y;


    y            =  ptcb->OSTCBY;                           
    OSRdyTbl[y] &= ~ptcb->OSTCBBitX;
    if (OSRdyTbl[y] == 0) {
        OSRdyGrp &= ~ptcb->OSTCBBitY;
    }
    ptcb->OSTCBPrio         = prio;

    ptcb->OSTCBY            = (INT8U)((prio >> (INT8U)3) & (INT8U)0x07);
    ptcb->OSTCBX            = (INT8U) (prio & (INT8U)0x07);
    ptcb->OSTCBBitY         = (INT8U)(1 << ptcb->OSTCBY);
    ptcb->OSTCBBitX         = (INT8U)(1 << ptcb->OSTCBX);
#line 709 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_mutex.c"
    OSRdyGrp               |= ptcb->OSTCBBitY;              
    OSRdyTbl[ptcb->OSTCBY] |= ptcb->OSTCBBitX;
    OSTCBPrioTbl[prio]      = ptcb;
}


#line 33 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.c"
#line 1 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_q.c"





















 



































 


void  *OSQAccept (OS_EVENT *pevent, INT8U *perr)
{
    void      *pmsg;
    OS_Q      *pq;

    OS_CPU_SR  cpu_sr = 0;




#line 80 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_q.c"
    if (pevent->OSEventType != 2u) { 
        *perr = 1u;
        return ((void *)0);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    pq = (OS_Q *)pevent->OSEventPtr;              
    if (pq->OSQEntries > 0) {                     
        pmsg = *pq->OSQOut++;                     
        pq->OSQEntries--;                         
        if (pq->OSQOut == pq->OSQEnd) {           
            pq->OSQOut = pq->OSQStart;
        }
        *perr = 0u;
    } else {
        *perr = 31u;
        pmsg  = (void *)0;                        
    }
    {OS_CPU_SR_Restore(cpu_sr);};
    return (pmsg);                                
}

 

















 

OS_EVENT  *OSQCreate (void **start, INT16U size)
{
    OS_EVENT  *pevent;
    OS_Q      *pq;

    OS_CPU_SR  cpu_sr = 0;




    if (OSIntNesting > 0) {                       
        return ((OS_EVENT *)0);                   
    }
    {cpu_sr = OS_CPU_SR_Save();};
    pevent = OSEventFreeList;                     
    if (OSEventFreeList != (OS_EVENT *)0) {       
        OSEventFreeList = (OS_EVENT *)OSEventFreeList->OSEventPtr;
    }
    {OS_CPU_SR_Restore(cpu_sr);};
    if (pevent != (OS_EVENT *)0) {                
        {cpu_sr = OS_CPU_SR_Save();};
        pq = OSQFreeList;                         
        if (pq != (OS_Q *)0) {                    
            OSQFreeList            = OSQFreeList->OSQPtr;  
            {OS_CPU_SR_Restore(cpu_sr);};
            pq->OSQStart           = start;                
            pq->OSQEnd             = &start[size];
            pq->OSQIn              = start;
            pq->OSQOut             = start;
            pq->OSQSize            = size;
            pq->OSQEntries         = 0;
            pevent->OSEventType    = 2u;
            pevent->OSEventCnt     = 0;
            pevent->OSEventPtr     = pq;

            pevent->OSEventName[0] = '?';                   
            pevent->OSEventName[1] = (INT8U)0;

            OS_EventWaitListInit(pevent);                  
        } else {
            pevent->OSEventPtr = (void *)OSEventFreeList;  
            OSEventFreeList    = pevent;
            {OS_CPU_SR_Restore(cpu_sr);};
            pevent = (OS_EVENT *)0;
        }
    }
    return (pevent);
}
 







































 


OS_EVENT  *OSQDel (OS_EVENT *pevent, INT8U opt, INT8U *perr)
{
    BOOLEAN    tasks_waiting;
    OS_EVENT  *pevent_return;
    OS_Q      *pq;

    OS_CPU_SR  cpu_sr = 0;




#line 232 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_q.c"
    if (pevent->OSEventType != 2u) {           
        *perr = 1u;
        return (pevent);
    }
    if (OSIntNesting > 0) {                                 
        *perr = 15u;                             
        return (pevent);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    if (pevent->OSEventGrp != 0) {                          
        tasks_waiting = 1u;                            
    } else {
        tasks_waiting = 0u;                           
    }
    switch (opt) {
        case 0u:                                
             if (tasks_waiting == 0u) {

                 pevent->OSEventName[0] = '?';              
                 pevent->OSEventName[1] = (INT8U)0;

                 pq                     = (OS_Q *)pevent->OSEventPtr;   
                 pq->OSQPtr             = OSQFreeList;
                 OSQFreeList            = pq;
                 pevent->OSEventType    = 0u;
                 pevent->OSEventPtr     = OSEventFreeList;  
                 pevent->OSEventCnt     = 0;
                 OSEventFreeList        = pevent;           
                 {OS_CPU_SR_Restore(cpu_sr);};
                 *perr                  = 0u;
                 pevent_return          = (OS_EVENT *)0;    
             } else {
                 {OS_CPU_SR_Restore(cpu_sr);};
                 *perr                  = 73u;
                 pevent_return          = pevent;
             }
             break;

        case 1u:                                 
             while (pevent->OSEventGrp != 0) {              
                 (void)OS_EventTaskRdy(pevent, (void *)0, 0x04u, 0u);
             }

             pevent->OSEventName[0] = '?';                  
             pevent->OSEventName[1] = (INT8U)0;

             pq                     = (OS_Q *)pevent->OSEventPtr;    
             pq->OSQPtr             = OSQFreeList;
             OSQFreeList            = pq;
             pevent->OSEventType    = 0u;
             pevent->OSEventPtr     = OSEventFreeList;      
             pevent->OSEventCnt     = 0;
             OSEventFreeList        = pevent;               
             {OS_CPU_SR_Restore(cpu_sr);};
             if (tasks_waiting == 1u) {                
                 OS_Sched();                                
             }
             *perr                  = 0u;
             pevent_return          = (OS_EVENT *)0;        
             break;

        default:
             {OS_CPU_SR_Restore(cpu_sr);};
             *perr                  = 7u;
             pevent_return          = pevent;
             break;
    }
    return (pevent_return);
}


 

















 


INT8U  OSQFlush (OS_EVENT *pevent)
{
    OS_Q      *pq;

    OS_CPU_SR  cpu_sr = 0;




#line 341 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_q.c"
    {cpu_sr = OS_CPU_SR_Save();};
    pq             = (OS_Q *)pevent->OSEventPtr;       
    pq->OSQIn      = pq->OSQStart;
    pq->OSQOut     = pq->OSQStart;
    pq->OSQEntries = 0;
    {OS_CPU_SR_Restore(cpu_sr);};
    return (0u);
}


 


































 

void  *OSQPend (OS_EVENT *pevent, INT16U timeout, INT8U *perr)
{
    void      *pmsg;
    OS_Q      *pq;

    OS_CPU_SR  cpu_sr = 0;




#line 407 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_q.c"
    if (pevent->OSEventType != 2u) { 
        *perr = 1u;
        return ((void *)0);
    }
    if (OSIntNesting > 0) {                       
        *perr = 2u;                  
        return ((void *)0);
    }
    if (OSLockNesting > 0) {                      
        *perr = 13u;               
        return ((void *)0);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    pq = (OS_Q *)pevent->OSEventPtr;              
    if (pq->OSQEntries > 0) {                     
        pmsg = *pq->OSQOut++;                     
        pq->OSQEntries--;                         
        if (pq->OSQOut == pq->OSQEnd) {           
            pq->OSQOut = pq->OSQStart;
        }
        {OS_CPU_SR_Restore(cpu_sr);};
        *perr = 0u;
        return (pmsg);                            
    }
    OSTCBCur->OSTCBStat     |= 0x04u;         
    OSTCBCur->OSTCBStatPend  = 0u;
    OSTCBCur->OSTCBDly       = timeout;           
    OS_EventTaskWait(pevent);                     
    {OS_CPU_SR_Restore(cpu_sr);};
    OS_Sched();                                   
    {cpu_sr = OS_CPU_SR_Save();};
    switch (OSTCBCur->OSTCBStatPend) {                 
        case 0u:                          
             pmsg =  OSTCBCur->OSTCBMsg;
            *perr =  0u;
             break;

        case 2u:
             pmsg = (void *)0;
            *perr =  14u;                
             break;

        case 1u:
        default:
             OS_EventTaskRemove(OSTCBCur, pevent);
             pmsg = (void *)0;
            *perr =  10u;                   
             break;
    }
    OSTCBCur->OSTCBStat          =  0x00u;       
    OSTCBCur->OSTCBStatPend      =  0u;   
    OSTCBCur->OSTCBEventPtr      = (OS_EVENT  *)0;     

    OSTCBCur->OSTCBEventMultiPtr = (OS_EVENT **)0;

    OSTCBCur->OSTCBMsg           = (void      *)0;     
    {OS_CPU_SR_Restore(cpu_sr);};
    return (pmsg);                                     
}
 






























 


INT8U  OSQPendAbort (OS_EVENT *pevent, INT8U opt, INT8U *perr)
{
    INT8U      nbr_tasks;

    OS_CPU_SR  cpu_sr = 0;




#line 518 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_q.c"
    if (pevent->OSEventType != 2u) {           
        *perr = 1u;
        return (0);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    if (pevent->OSEventGrp != 0) {                          
        nbr_tasks = 0;
        switch (opt) {
            case 1u:                     
                 while (pevent->OSEventGrp != 0) {          
                     (void)OS_EventTaskRdy(pevent, (void *)0, 0x04u, 2u);
                     nbr_tasks++;
                 }
                 break;
               
            case 0u:
            default:                                        
                 (void)OS_EventTaskRdy(pevent, (void *)0, 0x04u, 2u);
                 nbr_tasks++;
                 break;
        }
        {OS_CPU_SR_Restore(cpu_sr);};
        OS_Sched();                                         
        *perr = 14u;
        return (nbr_tasks);
    }
    {OS_CPU_SR_Restore(cpu_sr);};
    *perr = 0u;
    return (0);                                             
}


 

















 


INT8U  OSQPost (OS_EVENT *pevent, void *pmsg)
{
    OS_Q      *pq;

    OS_CPU_SR  cpu_sr = 0;









    if (pevent->OSEventType != 2u) {       
        return (1u);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    if (pevent->OSEventGrp != 0) {                      
                                                        
        (void)OS_EventTaskRdy(pevent, pmsg, 0x04u, 0u);
        {OS_CPU_SR_Restore(cpu_sr);};
        OS_Sched();                                     
        return (0u);
    }
    pq = (OS_Q *)pevent->OSEventPtr;                    
    if (pq->OSQEntries >= pq->OSQSize) {                
        {OS_CPU_SR_Restore(cpu_sr);};
        return (30u);
    }
    *pq->OSQIn++ = pmsg;                                
    pq->OSQEntries++;                                   
    if (pq->OSQIn == pq->OSQEnd) {                      
        pq->OSQIn = pq->OSQStart;
    }
    {OS_CPU_SR_Restore(cpu_sr);};
    return (0u);
}

 



















 


INT8U  OSQPostFront (OS_EVENT *pevent, void *pmsg)
{
    OS_Q      *pq;

    OS_CPU_SR  cpu_sr = 0;









    if (pevent->OSEventType != 2u) {      
        return (1u);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    if (pevent->OSEventGrp != 0) {                     
                                                       
        (void)OS_EventTaskRdy(pevent, pmsg, 0x04u, 0u);
        {OS_CPU_SR_Restore(cpu_sr);};
        OS_Sched();                                    
        return (0u);
    }
    pq = (OS_Q *)pevent->OSEventPtr;                   
    if (pq->OSQEntries >= pq->OSQSize) {               
        {OS_CPU_SR_Restore(cpu_sr);};
        return (30u);
    }
    if (pq->OSQOut == pq->OSQStart) {                  
        pq->OSQOut = pq->OSQEnd;
    }
    pq->OSQOut--;
    *pq->OSQOut = pmsg;                                
    pq->OSQEntries++;                                  
    {OS_CPU_SR_Restore(cpu_sr);};
    return (0u);
}

 



























 


INT8U  OSQPostOpt (OS_EVENT *pevent, void *pmsg, INT8U opt)
{
    OS_Q      *pq;

    OS_CPU_SR  cpu_sr = 0;









    if (pevent->OSEventType != 2u) {      
        return (1u);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    if (pevent->OSEventGrp != 0x00) {                  
        if ((opt & 0x01u) != 0x00) {   
            while (pevent->OSEventGrp != 0) {          
                (void)OS_EventTaskRdy(pevent, pmsg, 0x04u, 0u);
            }
        } else {                                       
            (void)OS_EventTaskRdy(pevent, pmsg, 0x04u, 0u);
        }
        {OS_CPU_SR_Restore(cpu_sr);};
        if ((opt & 0x04u) == 0) {	   
            OS_Sched();                                
        }
        return (0u);
    }
    pq = (OS_Q *)pevent->OSEventPtr;                   
    if (pq->OSQEntries >= pq->OSQSize) {               
        {OS_CPU_SR_Restore(cpu_sr);};
        return (30u);
    }
    if ((opt & 0x02u) != 0x00) {           
        if (pq->OSQOut == pq->OSQStart) {              
            pq->OSQOut = pq->OSQEnd;                   
        }
        pq->OSQOut--;
        *pq->OSQOut = pmsg;                            
    } else {                                           
        *pq->OSQIn++ = pmsg;                           
        if (pq->OSQIn == pq->OSQEnd) {                 
            pq->OSQIn = pq->OSQStart;
        }
    }
    pq->OSQEntries++;                                  
    {OS_CPU_SR_Restore(cpu_sr);};
    return (0u);
}

 
















 


INT8U  OSQQuery (OS_EVENT *pevent, OS_Q_DATA *p_q_data)
{
    OS_Q      *pq;
    INT8U      i;

    INT8U     *psrc;
    INT8U     *pdest;





    OS_CPU_SR  cpu_sr = 0;




#line 803 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_q.c"
    if (pevent->OSEventType != 2u) {       
        return (1u);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    p_q_data->OSEventGrp = pevent->OSEventGrp;          
    psrc                 = &pevent->OSEventTbl[0];
    pdest                = &p_q_data->OSEventTbl[0];
    for (i = 0; i < ((63) / 8 + 1); i++) {
        *pdest++ = *psrc++;
    }
    pq = (OS_Q *)pevent->OSEventPtr;
    if (pq->OSQEntries > 0) {
        p_q_data->OSMsg = *pq->OSQOut;                  
    } else {
        p_q_data->OSMsg = (void *)0;
    }
    p_q_data->OSNMsgs = pq->OSQEntries;
    p_q_data->OSQSize = pq->OSQSize;
    {OS_CPU_SR_Restore(cpu_sr);};
    return (0u);
}


 













 

void  OS_QInit (void)
{






    INT16U  i;
    OS_Q   *pq1;
    OS_Q   *pq2;



    OS_MemClr((INT8U *)&OSQTbl[0], sizeof(OSQTbl));   
    pq1 = &OSQTbl[0];
    pq2 = &OSQTbl[1];
    for (i = 0; i < (4 - 1); i++) {           
        pq1->OSQPtr = pq2;
        pq1++;
        pq2++;
    }
    pq1->OSQPtr = (OS_Q *)0;
    OSQFreeList = &OSQTbl[0];

}
#line 34 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.c"
#line 1 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_sem.c"





















 






 
















 


INT16U  OSSemAccept (OS_EVENT *pevent)
{
    INT16U     cnt;

    OS_CPU_SR  cpu_sr = 0;









    if (pevent->OSEventType != 3u) {    
        return (0);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    cnt = pevent->OSEventCnt;
    if (cnt > 0) {                                     
        pevent->OSEventCnt--;                          
    }
    {OS_CPU_SR_Restore(cpu_sr);};
    return (cnt);                                      
}


 















 

OS_EVENT  *OSSemCreate (INT16U cnt)
{
    OS_EVENT  *pevent;

    OS_CPU_SR  cpu_sr = 0;




    if (OSIntNesting > 0) {                                 
        return ((OS_EVENT *)0);                             
    }
    {cpu_sr = OS_CPU_SR_Save();};
    pevent = OSEventFreeList;                               
    if (OSEventFreeList != (OS_EVENT *)0) {                 
        OSEventFreeList = (OS_EVENT *)OSEventFreeList->OSEventPtr;
    }
    {OS_CPU_SR_Restore(cpu_sr);};
    if (pevent != (OS_EVENT *)0) {                          
        pevent->OSEventType    = 3u;
        pevent->OSEventCnt     = cnt;                       
        pevent->OSEventPtr     = (void *)0;                 

        pevent->OSEventName[0] = '?';                       
        pevent->OSEventName[1] = (INT8U)0;

        OS_EventWaitListInit(pevent);                       
    }
    return (pevent);
}

 



































 


OS_EVENT  *OSSemDel (OS_EVENT *pevent, INT8U opt, INT8U *perr)
{
    BOOLEAN    tasks_waiting;
    OS_EVENT  *pevent_return;

    OS_CPU_SR  cpu_sr = 0;




#line 183 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_sem.c"
    if (pevent->OSEventType != 3u) {         
        *perr = 1u;
        return (pevent);
    }
    if (OSIntNesting > 0) {                                 
        *perr = 15u;                              
        return (pevent);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    if (pevent->OSEventGrp != 0) {                          
        tasks_waiting = 1u;                            
    } else {
        tasks_waiting = 0u;                           
    }
    switch (opt) {
        case 0u:                                
             if (tasks_waiting == 0u) {

                 pevent->OSEventName[0] = '?';              
                 pevent->OSEventName[1] = (INT8U)0;

                 pevent->OSEventType    = 0u;
                 pevent->OSEventPtr     = OSEventFreeList;  
                 pevent->OSEventCnt     = 0;
                 OSEventFreeList        = pevent;           
                 {OS_CPU_SR_Restore(cpu_sr);};
                 *perr                  = 0u;
                 pevent_return          = (OS_EVENT *)0;    
             } else {
                 {OS_CPU_SR_Restore(cpu_sr);};
                 *perr                  = 73u;
                 pevent_return          = pevent;
             }
             break;

        case 1u:                                 
             while (pevent->OSEventGrp != 0) {              
                 (void)OS_EventTaskRdy(pevent, (void *)0, 0x01u, 0u);
             }

             pevent->OSEventName[0] = '?';                  
             pevent->OSEventName[1] = (INT8U)0;

             pevent->OSEventType    = 0u;
             pevent->OSEventPtr     = OSEventFreeList;      
             pevent->OSEventCnt     = 0;
             OSEventFreeList        = pevent;               
             {OS_CPU_SR_Restore(cpu_sr);};
             if (tasks_waiting == 1u) {                
                 OS_Sched();                                
             }
             *perr                  = 0u;
             pevent_return          = (OS_EVENT *)0;        
             break;

        default:
             {OS_CPU_SR_Restore(cpu_sr);};
             *perr                  = 7u;
             pevent_return          = pevent;
             break;
    }
    return (pevent_return);
}


 






























 
 


void  OSSemPend (OS_EVENT *pevent, INT16U timeout, INT8U *perr)
{

    OS_CPU_SR  cpu_sr = 0;




#line 300 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_sem.c"
    if (pevent->OSEventType != 3u) {    
        *perr = 1u;
        return;
    }
    if (OSIntNesting > 0) {                            
        *perr = 2u;                       
        return;
    }
    if (OSLockNesting > 0) {                           
        *perr = 13u;                    
        return;
    }

	
    {cpu_sr = OS_CPU_SR_Save();};
    if (pevent->OSEventCnt > 0) {                      
        pevent->OSEventCnt--;                          
        {OS_CPU_SR_Restore(cpu_sr);};
        *perr = 0u;
        return;
    }
                                                       
    OSTCBCur->OSTCBStat     |= 0x01u;            
    OSTCBCur->OSTCBStatPend  = 0u;
    OSTCBCur->OSTCBDly       = timeout;                
    OS_EventTaskWait(pevent);                          
    {OS_CPU_SR_Restore(cpu_sr);};
    OS_Sched();                                        
    {cpu_sr = OS_CPU_SR_Save();};
    switch (OSTCBCur->OSTCBStatPend) {                 
        case 0u:
             *perr = 0u;
             break;

        case 2u:
             *perr = 14u;                
             break;

        case 1u:
        default:        
             OS_EventTaskRemove(OSTCBCur, pevent);
             *perr = 10u;                   
             break;
    }
    OSTCBCur->OSTCBStat          =  0x00u;       
    OSTCBCur->OSTCBStatPend      =  0u;   
    OSTCBCur->OSTCBEventPtr      = (OS_EVENT  *)0;     

    OSTCBCur->OSTCBEventMultiPtr = (OS_EVENT **)0;

    {OS_CPU_SR_Restore(cpu_sr);};
}

 































 


INT8U  OSSemPendAbort (OS_EVENT *pevent, INT8U opt, INT8U *perr)
{
    INT8U      nbr_tasks;

    OS_CPU_SR  cpu_sr = 0;




#line 406 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_sem.c"
    if (pevent->OSEventType != 3u) {    
        *perr = 1u;
        return (0);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    if (pevent->OSEventGrp != 0) {                     
        nbr_tasks = 0;
        switch (opt) {
            case 1u:                
                 while (pevent->OSEventGrp != 0) {     
                     (void)OS_EventTaskRdy(pevent, (void *)0, 0x01u, 2u);
                     nbr_tasks++;
                 }
                 break;
                 
            case 0u:
            default:                                   
                 (void)OS_EventTaskRdy(pevent, (void *)0, 0x01u, 2u);
                 nbr_tasks++;
                 break;
        }
        {OS_CPU_SR_Restore(cpu_sr);};
        OS_Sched();                                    
        *perr = 14u;
        return (nbr_tasks);
    }
    {OS_CPU_SR_Restore(cpu_sr);};
    *perr = 0u;
    return (0);                                        
}


 
















 

INT8U  OSSemPost (OS_EVENT *pevent)
{

    OS_CPU_SR  cpu_sr = 0;









    if (pevent->OSEventType != 3u) {    
        return (1u);
    }

	
    {cpu_sr = OS_CPU_SR_Save();};
    if (pevent->OSEventGrp != 0) {                     
                                                       
        (void)OS_EventTaskRdy(pevent, (void *)0, 0x01u, 0u);
        {OS_CPU_SR_Restore(cpu_sr);};
        OS_Sched();                                    
        return (0u);
    }
    if (pevent->OSEventCnt < 65535u) {                 
        pevent->OSEventCnt++;                          
        {OS_CPU_SR_Restore(cpu_sr);};
        return (0u);
    }
    {OS_CPU_SR_Restore(cpu_sr);};                                
    return (50u);
}

 

















 


INT8U  OSSemQuery (OS_EVENT *pevent, OS_SEM_DATA *p_sem_data)
{

    INT8U     *psrc;
    INT8U     *pdest;




    INT8U      i;

    OS_CPU_SR  cpu_sr = 0;




#line 537 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_sem.c"
    if (pevent->OSEventType != 3u) {         
        return (1u);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    p_sem_data->OSEventGrp = pevent->OSEventGrp;            
    psrc                   = &pevent->OSEventTbl[0];
    pdest                  = &p_sem_data->OSEventTbl[0];
    for (i = 0; i < ((63) / 8 + 1); i++) {
        *pdest++ = *psrc++;
    }
    p_sem_data->OSCnt = pevent->OSEventCnt;                 
    {OS_CPU_SR_Restore(cpu_sr);};
    return (0u);
}


 






















 


void  OSSemSet (OS_EVENT *pevent, INT16U cnt, INT8U *perr)
{

    OS_CPU_SR  cpu_sr = 0;




#line 596 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_sem.c"
    if (pevent->OSEventType != 3u) {    
        *perr = 1u;
        return;
    }
    {cpu_sr = OS_CPU_SR_Save();};
    *perr = 0u;
    if (pevent->OSEventCnt > 0) {                      
        pevent->OSEventCnt = cnt;                      
    } else {                                           
        if (pevent->OSEventGrp == 0) {                 
            pevent->OSEventCnt = cnt;                  
        } else {
            *perr              = 73u;
        }
    }
    {OS_CPU_SR_Restore(cpu_sr);};
}


#line 35 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.c"
#line 1 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_task.c"





















 





 



















 


INT8U  OSTaskChangePrio (INT8U oldprio, INT8U newprio)
{

    OS_EVENT  *pevent;

    OS_EVENT **pevents;


    OS_TCB    *ptcb;
    INT8U      y_new;
    INT8U      x_new;
    INT8U      y_old;

    INT8U      bity_new;
    INT8U      bitx_new;
    INT8U      bity_old;
    INT8U      bitx_old;
#line 75 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_task.c"
    OS_CPU_SR  cpu_sr = 0;                                   



 
#line 90 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_task.c"
    {cpu_sr = OS_CPU_SR_Save();};
    if (OSTCBPrioTbl[newprio] != (OS_TCB *)0) {              
        {OS_CPU_SR_Restore(cpu_sr);};
        return (40u);
    }
    if (oldprio == 0xFFu) {                           
        oldprio = OSTCBCur->OSTCBPrio;                       
    }
    ptcb = OSTCBPrioTbl[oldprio];
    if (ptcb == (OS_TCB *)0) {                               
        {OS_CPU_SR_Restore(cpu_sr);};                                  
        return (41u);
    }
    if (ptcb == ((OS_TCB *)1)) {                           
        {OS_CPU_SR_Restore(cpu_sr);};                                  
        return (67u);
    }

    y_new                 = (INT8U)(newprio >> 3);           
    x_new                 = (INT8U)(newprio & 0x07);
    bity_new              = (INT8U)(1 << y_new);
    bitx_new              = (INT8U)(1 << x_new);
#line 118 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_task.c"

    OSTCBPrioTbl[oldprio] = (OS_TCB *)0;                     
    OSTCBPrioTbl[newprio] =  ptcb;                           
    y_old                 =  ptcb->OSTCBY;
    bity_old              =  ptcb->OSTCBBitY;
    bitx_old              =  ptcb->OSTCBBitX;
    if ((OSRdyTbl[y_old] &   bitx_old) != 0) {               
         OSRdyTbl[y_old] &= ~bitx_old;
         if (OSRdyTbl[y_old] == 0) {
             OSRdyGrp &= ~bity_old;
         }
         OSRdyGrp        |= bity_new;                        
         OSRdyTbl[y_new] |= bitx_new;
    }


    pevent = ptcb->OSTCBEventPtr;
    if (pevent != (OS_EVENT *)0) {
        pevent->OSEventTbl[y_old] &= ~bitx_old;              
        if (pevent->OSEventTbl[y_old] == 0) {
            pevent->OSEventGrp    &= ~bity_old;
        }
        pevent->OSEventGrp        |= bity_new;               
        pevent->OSEventTbl[y_new] |= bitx_new;
    }

    if (ptcb->OSTCBEventMultiPtr != (OS_EVENT **)0) {
        pevents =  ptcb->OSTCBEventMultiPtr;
        pevent  = *pevents;
        while (pevent != (OS_EVENT *)0) {
            pevent->OSEventTbl[y_old] &= ~bitx_old;          
            if (pevent->OSEventTbl[y_old] == 0) {
                pevent->OSEventGrp    &= ~bity_old;
            }
            pevent->OSEventGrp        |= bity_new;           
            pevent->OSEventTbl[y_new] |= bitx_new;
            pevents++;
            pevent                     = *pevents;
        }
    }



    ptcb->OSTCBPrio = newprio;                               
    ptcb->OSTCBY    = y_new;
    ptcb->OSTCBX    = x_new;
    ptcb->OSTCBBitY = bity_new;
    ptcb->OSTCBBitX = bitx_new;
    {OS_CPU_SR_Restore(cpu_sr);};
    if (OSRunning == 1u) {
        OS_Sched();                                          
    }
    return (0u);
}

 






































 


INT8U  OSTaskCreate (void (*task)(void *p_arg), void *p_arg, OS_STK *ptos, INT8U prio)
{
    OS_STK    *psp;
    INT8U      err;

    OS_CPU_SR  cpu_sr = 0;









    {cpu_sr = OS_CPU_SR_Save();};
    if (OSIntNesting > 0) {                   
        {OS_CPU_SR_Restore(cpu_sr);};
        return (60u);
    }
    if (OSTCBPrioTbl[prio] == (OS_TCB *)0) {  
        OSTCBPrioTbl[prio] = ((OS_TCB *)1); 
                                              
        {OS_CPU_SR_Restore(cpu_sr);};
        psp = OSTaskStkInit(task, p_arg, ptos, 0);               
        err = OS_TCBInit(prio, psp, (OS_STK *)0, 0, 0, (void *)0, 0);
        if (err == 0u) {
            if (OSRunning == 1u) {       
                OS_Sched();
            }
        } else {
            {cpu_sr = OS_CPU_SR_Save();};
            OSTCBPrioTbl[prio] = (OS_TCB *)0; 
            {OS_CPU_SR_Restore(cpu_sr);};
        }
        return (err);
    }
    {OS_CPU_SR_Restore(cpu_sr);};
    return (40u);
}

 




































































 
 

INT8U  OSTaskCreateExt (void   (*task)(void *p_arg),
                        void    *p_arg,
                        OS_STK  *ptos,
                        INT8U    prio,
                        INT16U   id,
                        OS_STK  *pbos,
                        INT32U   stk_size,
                        void    *pext,
                        INT16U   opt)
{
    OS_STK    *psp;
    INT8U      err;

    OS_CPU_SR  cpu_sr = 0;









    {cpu_sr = OS_CPU_SR_Save();};
    if (OSIntNesting > 0) {                   
        {OS_CPU_SR_Restore(cpu_sr);};
        return (60u);
    }
    if (OSTCBPrioTbl[prio] == (OS_TCB *)0) {  
        OSTCBPrioTbl[prio] = ((OS_TCB *)1); 
                                              
        {OS_CPU_SR_Restore(cpu_sr);};


        OS_TaskStkClr(pbos, stk_size, opt);                     


        psp = OSTaskStkInit(task, p_arg, ptos, opt);            
        err = OS_TCBInit(prio, psp, pbos, id, stk_size, pext, opt);
        if (err == 0u) {
            if (OSRunning == 1u) {                         
                OS_Sched();
            }
        } else {
            {cpu_sr = OS_CPU_SR_Save();};
            OSTCBPrioTbl[prio] = (OS_TCB *)0;                   
            {OS_CPU_SR_Restore(cpu_sr);};
        }
        return (err);
    }
    {OS_CPU_SR_Restore(cpu_sr);};
    return (40u);
}

 


































 


INT8U  OSTaskDel (INT8U prio)
{

    OS_FLAG_NODE *pnode;

    OS_TCB       *ptcb;

    OS_CPU_SR     cpu_sr = 0;




    if (OSIntNesting > 0) {                              
        return (64u);
    }
    if (prio == (63)) {                     
        return (62u);
    }
#line 445 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_task.c"

 
    {cpu_sr = OS_CPU_SR_Save();};
    if (prio == 0xFFu) {                          
        prio = OSTCBCur->OSTCBPrio;                      
    }
    ptcb = OSTCBPrioTbl[prio];
    if (ptcb == (OS_TCB *)0) {                           
        {OS_CPU_SR_Restore(cpu_sr);};
        return (67u);
    }
    if (ptcb == ((OS_TCB *)1)) {                       
        {OS_CPU_SR_Restore(cpu_sr);};
        return (61u);
    }

    OSRdyTbl[ptcb->OSTCBY] &= ~ptcb->OSTCBBitX;
    if (OSRdyTbl[ptcb->OSTCBY] == 0) {                   
        OSRdyGrp           &= ~ptcb->OSTCBBitY;
    }
    

    if (ptcb->OSTCBEventPtr != (OS_EVENT *)0) {
        OS_EventTaskRemove(ptcb, ptcb->OSTCBEventPtr);   
    }

    if (ptcb->OSTCBEventMultiPtr != (OS_EVENT **)0) {    
        OS_EventTaskRemoveMulti(ptcb, ptcb->OSTCBEventMultiPtr);
    }




    pnode = ptcb->OSTCBFlagNode;
    if (pnode != (OS_FLAG_NODE *)0) {                    
        OS_FlagUnlink(pnode);                            
    }


    ptcb->OSTCBDly      = 0;                             
    ptcb->OSTCBStat     = 0x00u;                   
    ptcb->OSTCBStatPend = 0u;
    if (OSLockNesting < 255u) {                          
        OSLockNesting++;
    }
    {OS_CPU_SR_Restore(cpu_sr);};                                  
    OS_Dummy();                                          
    {cpu_sr = OS_CPU_SR_Save();};                                 
    if (OSLockNesting > 0) {                             
        OSLockNesting--;
    }
    OSTaskDelHook(ptcb);                                 
    OSTaskCtr--;                                         
    OSTCBPrioTbl[prio] = (OS_TCB *)0;                    
    if (ptcb->OSTCBPrev == (OS_TCB *)0) {                
        ptcb->OSTCBNext->OSTCBPrev = (OS_TCB *)0;
        OSTCBList                  = ptcb->OSTCBNext;
    } else {
        ptcb->OSTCBPrev->OSTCBNext = ptcb->OSTCBNext;
        ptcb->OSTCBNext->OSTCBPrev = ptcb->OSTCBPrev;
    }
    ptcb->OSTCBNext   = OSTCBFreeList;                   
    OSTCBFreeList     = ptcb;

    ptcb->OSTCBTaskName[0] = '?';                        
    ptcb->OSTCBTaskName[1] = (INT8U)0;

    {OS_CPU_SR_Restore(cpu_sr);};
    if (OSRunning == 1u) {
        OS_Sched();                                      
    }
    return (0u);
}

 












































 
 

INT8U  OSTaskDelReq (INT8U prio)
{
    INT8U      stat;
    OS_TCB    *ptcb;

    OS_CPU_SR  cpu_sr = 0;




    if (prio == (63)) {                             
        return (62u);
    }
#line 587 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_task.c"
    if (prio == 0xFFu) {                                  
        {cpu_sr = OS_CPU_SR_Save();};                                     
        stat = OSTCBCur->OSTCBDelReq;                            
        {OS_CPU_SR_Restore(cpu_sr);};
        return (stat);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    ptcb = OSTCBPrioTbl[prio];
    if (ptcb == (OS_TCB *)0) {                                   
        {OS_CPU_SR_Restore(cpu_sr);};
        return (67u);                          
    }
    if (ptcb == ((OS_TCB *)1)) {                               
        {OS_CPU_SR_Restore(cpu_sr);};
        return (61u);
    }
    ptcb->OSTCBDelReq = 63u;                     
    {OS_CPU_SR_Restore(cpu_sr);};
    return (0u);
}

 























 


INT8U  OSTaskNameGet (INT8U prio, INT8U *pname, INT8U *perr)
{
    OS_TCB    *ptcb;
    INT8U      len;

    OS_CPU_SR  cpu_sr = 0;




#line 660 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_task.c"
    if (OSIntNesting > 0) {                               
        *perr = 17u;
        return (0);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    if (prio == 0xFFu) {                           
        prio = OSTCBCur->OSTCBPrio;
    }
    ptcb = OSTCBPrioTbl[prio];
    if (ptcb == (OS_TCB *)0) {                            
        {OS_CPU_SR_Restore(cpu_sr);};                               
        *perr = 67u;
        return (0);
    }
    if (ptcb == ((OS_TCB *)1)) {                        
        {OS_CPU_SR_Restore(cpu_sr);};                               
        *perr = 67u;
        return (0);
    }
    len   = OS_StrCopy(pname, ptcb->OSTCBTaskName);       
    {OS_CPU_SR_Restore(cpu_sr);};
    *perr = 0u;
    return (len);
}


 

























 

void  OSTaskNameSet (INT8U prio, INT8U *pname, INT8U *perr)
{
    INT8U      len;
    OS_TCB    *ptcb;

    OS_CPU_SR  cpu_sr = 0;




#line 739 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_task.c"
    if (OSIntNesting > 0) {                           
        *perr = 18u;
        return;
    }
    {cpu_sr = OS_CPU_SR_Save();};
    if (prio == 0xFFu) {                       
        prio = OSTCBCur->OSTCBPrio;
    }
    ptcb = OSTCBPrioTbl[prio];
    if (ptcb == (OS_TCB *)0) {                        
        {OS_CPU_SR_Restore(cpu_sr);};                           
        *perr = 67u;
        return;
    }
    if (ptcb == ((OS_TCB *)1)) {                    
        {OS_CPU_SR_Restore(cpu_sr);};                           
        *perr = 67u;
        return;
    }
    len = OS_StrLen(pname);                           
    if (len > (16 - 1)) {              
        {OS_CPU_SR_Restore(cpu_sr);};
        *perr = 65u;
        return;
    }
    (void)OS_StrCopy(ptcb->OSTCBTaskName, pname);     
    {OS_CPU_SR_Restore(cpu_sr);};
    *perr = 0u;
}


 
















 


INT8U  OSTaskResume (INT8U prio)
{
    OS_TCB    *ptcb;

    OS_CPU_SR  cpu_sr = 0;









    {cpu_sr = OS_CPU_SR_Save();};
    ptcb = OSTCBPrioTbl[prio];
    if (ptcb == (OS_TCB *)0) {                                 
        {OS_CPU_SR_Restore(cpu_sr);};
        return (70u);
    }
    if (ptcb == ((OS_TCB *)1)) {                             
        {OS_CPU_SR_Restore(cpu_sr);};
        return (67u);
    }
    if ((ptcb->OSTCBStat & 0x08u) != 0x00u) {  
        ptcb->OSTCBStat &= ~(INT8U)0x08u;            
        if (ptcb->OSTCBStat == 0x00u) {                  
            if (ptcb->OSTCBDly == 0) {
                OSRdyGrp               |= ptcb->OSTCBBitY;     
                OSRdyTbl[ptcb->OSTCBY] |= ptcb->OSTCBBitX;
                {OS_CPU_SR_Restore(cpu_sr);};
                if (OSRunning == 1u) {
                    OS_Sched();                                
                }
            } else {
                {OS_CPU_SR_Restore(cpu_sr);};
            }
        } else {                                               
            {OS_CPU_SR_Restore(cpu_sr);};
        }
        return (0u);
    }
    {OS_CPU_SR_Restore(cpu_sr);};
    return (68u);
}

 


















 

INT8U  OSTaskStkChk (INT8U prio, OS_STK_DATA *p_stk_data)
{
    OS_TCB    *ptcb;
    OS_STK    *pchk;
    INT32U     nfree;
    INT32U     size;

    OS_CPU_SR  cpu_sr = 0;




#line 879 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_task.c"
    p_stk_data->OSFree = 0;                             
    p_stk_data->OSUsed = 0;
    {cpu_sr = OS_CPU_SR_Save();};
    if (prio == 0xFFu) {                         
        prio = OSTCBCur->OSTCBPrio;
    }
    ptcb = OSTCBPrioTbl[prio];
    if (ptcb == (OS_TCB *)0) {                          
        {OS_CPU_SR_Restore(cpu_sr);};
        return (67u);
    }
    if (ptcb == ((OS_TCB *)1)) {
        {OS_CPU_SR_Restore(cpu_sr);};
        return (67u);
    }
    if ((ptcb->OSTCBOpt & 0x0001u) == 0) {  
        {OS_CPU_SR_Restore(cpu_sr);};
        return (69u);
    }
    nfree = 0;
    size  = ptcb->OSTCBStkSize;
    pchk  = ptcb->OSTCBStkBottom;
    {OS_CPU_SR_Restore(cpu_sr);};

    while (*pchk++ == (OS_STK)0) {                     
        nfree++;
    }





    p_stk_data->OSFree = nfree * sizeof(OS_STK);           
    p_stk_data->OSUsed = (size - nfree) * sizeof(OS_STK);  
    return (0u);
}

 





















 


INT8U  OSTaskSuspend (INT8U prio)
{
    BOOLEAN    self;
    OS_TCB    *ptcb;
    INT8U      y;

    OS_CPU_SR  cpu_sr = 0;




#line 962 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_task.c"
    {cpu_sr = OS_CPU_SR_Save();};
    if (prio == 0xFFu) {                                  
        prio = OSTCBCur->OSTCBPrio;
        self = 1u;
    } else if (prio == OSTCBCur->OSTCBPrio) {                    
        self = 1u;
    } else {
        self = 0u;                                         
    }
    ptcb = OSTCBPrioTbl[prio];
    if (ptcb == (OS_TCB *)0) {                                   
        {OS_CPU_SR_Restore(cpu_sr);};
        return (72u);
    }
    if (ptcb == ((OS_TCB *)1)) {                               
        {OS_CPU_SR_Restore(cpu_sr);};
        return (67u);
    }
    y            = ptcb->OSTCBY;
    OSRdyTbl[y] &= ~ptcb->OSTCBBitX;                             
    if (OSRdyTbl[y] == 0) {
        OSRdyGrp &= ~ptcb->OSTCBBitY;
    }
    ptcb->OSTCBStat |= 0x08u;                          
    {OS_CPU_SR_Restore(cpu_sr);};
    if (self == 1u) {                                       
        OS_Sched();                                              
    }
    return (0u);
}

 

















 


INT8U  OSTaskQuery (INT8U prio, OS_TCB *p_task_data)
{
    OS_TCB    *ptcb;

    OS_CPU_SR  cpu_sr = 0;




#line 1033 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_task.c"
    {cpu_sr = OS_CPU_SR_Save();};
    if (prio == 0xFFu) {                   
        prio = OSTCBCur->OSTCBPrio;
    }
    ptcb = OSTCBPrioTbl[prio];
    if (ptcb == (OS_TCB *)0) {                    
        {OS_CPU_SR_Restore(cpu_sr);};
        return (41u);
    }
    if (ptcb == ((OS_TCB *)1)) {                
        {OS_CPU_SR_Restore(cpu_sr);};
        return (67u);
    }
                                                  
    OS_MemCopy((INT8U *)p_task_data, (INT8U *)ptcb, sizeof(OS_TCB));
    {OS_CPU_SR_Restore(cpu_sr);};
    return (0u);
}

 





















 

void  OS_TaskStkClr (OS_STK *pbos, INT32U size, INT16U opt)
{
    if ((opt & 0x0001u) != 0x0000) {        
        if ((opt & 0x0002u) != 0x0000) {    

            while (size > 0) {                          
                size--;
                *pbos++ = (OS_STK)0;                    
            }
#line 1091 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_task.c"
        }
    }
}

#line 36 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.c"
#line 1 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_time.c"





















 



















 

void  OSTimeDly (INT16U ticks)
{
    INT8U      y;

    OS_CPU_SR  cpu_sr = 0;




    if (OSIntNesting > 0) {                       
        return;
    }
    if (ticks > 0) {                              
        {cpu_sr = OS_CPU_SR_Save();};
        y            =  OSTCBCur->OSTCBY;         
        OSRdyTbl[y] &= ~OSTCBCur->OSTCBBitX;
        if (OSRdyTbl[y] == 0) {
            OSRdyGrp &= ~OSTCBCur->OSTCBBitY;
        }
        OSTCBCur->OSTCBDly = ticks;               
        {OS_CPU_SR_Restore(cpu_sr);};
        OS_Sched();                               
    }
}
 
























 


INT8U  OSTimeDlyHMSM (INT8U hours, INT8U minutes, INT8U seconds, INT16U ms)
{
    INT32U ticks;
    INT16U loops;


    if (OSIntNesting > 0) {                       
        return (85u);
    }
#line 125 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_time.c"
                                                  
                                                  
    ticks = ((INT32U)hours * 3600L + (INT32U)minutes * 60L + (INT32U)seconds) * 100
          + 100 * ((INT32U)ms + 500L / 100) / 1000L;
    loops = (INT16U)(ticks >> 16);                
    ticks = ticks & 0xFFFFL;                      
    OSTimeDly((INT16U)ticks);
    while (loops > 0) {
        OSTimeDly((INT16U)32768u);
        OSTimeDly((INT16U)32768u);
        loops--;
    }
    return (0u);
}

 























 


INT8U  OSTimeDlyResume (INT8U prio)
{
    OS_TCB    *ptcb;

    OS_CPU_SR  cpu_sr = 0;




    if (prio >= 63) {
        return (42u);
    }
    {cpu_sr = OS_CPU_SR_Save();};
    ptcb = OSTCBPrioTbl[prio];                                  
    if (ptcb == (OS_TCB *)0) {
        {OS_CPU_SR_Restore(cpu_sr);};
        return (67u);                         
    }
    if (ptcb == ((OS_TCB *)1)) {
        {OS_CPU_SR_Restore(cpu_sr);};
        return (67u);                         
    }
    if (ptcb->OSTCBDly == 0) {                                  
        {OS_CPU_SR_Restore(cpu_sr);};
        return (80u);                           
    }

    ptcb->OSTCBDly = 0;                                         
    if ((ptcb->OSTCBStat & (0x01u | 0x02u | 0x04u | 0x10u | 0x20u)) != 0x00u) {
        ptcb->OSTCBStat     &= ~(0x01u | 0x02u | 0x04u | 0x10u | 0x20u);               
        ptcb->OSTCBStatPend  =  1u;                
    } else {
        ptcb->OSTCBStatPend  =  0u;
    }
    if ((ptcb->OSTCBStat & 0x08u) == 0x00u) {   
        OSRdyGrp               |= ptcb->OSTCBBitY;              
        OSRdyTbl[ptcb->OSTCBY] |= ptcb->OSTCBBitX;
        {OS_CPU_SR_Restore(cpu_sr);};
        OS_Sched();                                             
    } else {
        {OS_CPU_SR_Restore(cpu_sr);};                                     
    }
    return (0u);
}

 











 


INT32U  OSTimeGet (void)
{
    INT32U     ticks;

    OS_CPU_SR  cpu_sr = 0;




    {cpu_sr = OS_CPU_SR_Save();};
    ticks = OSTime;
    {OS_CPU_SR_Restore(cpu_sr);};
    return (ticks);
}












 


void  OSTimeSet (INT32U ticks)
{

    OS_CPU_SR  cpu_sr = 0;




    {cpu_sr = OS_CPU_SR_Save();};
    OSTime = ticks;
    {OS_CPU_SR_Restore(cpu_sr);};
}
#line 37 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.c"
#line 1 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_tmr.c"






















 

#line 26 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_tmr.c"












 





 








 


static  OS_TMR  *OSTmr_Alloc         (void);
static  void     OSTmr_Free          (OS_TMR *ptmr);
static  void     OSTmr_InitTask      (void);
static  void     OSTmr_Link          (OS_TMR *ptmr, INT8U type);
static  void     OSTmr_Unlink        (OS_TMR *ptmr);
static  void     OSTmr_Lock          (void);
static  void     OSTmr_Unlock        (void);
static  void     OSTmr_Task          (void   *p_arg);


 











































 


OS_TMR  *OSTmrCreate (INT32U           dly,
                      INT32U           period,
                      INT8U            opt,
                      OS_TMR_CALLBACK  callback,
                      void            *callback_arg,
                      INT8U           *pname,
                      INT8U           *perr)
{
    OS_TMR   *ptmr;

    INT8U     len;



#line 151 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_tmr.c"
    if (OSIntNesting > 0) {                                  
        *perr  = 139u;
        return ((OS_TMR *)0);
    }
    OSTmr_Lock();
    ptmr = OSTmr_Alloc();                                    
    if (ptmr == (OS_TMR *)0) {
        OSTmr_Unlock();
        *perr = 134u;
        return ((OS_TMR *)0);
    }
    ptmr->OSTmrState       = 1u;           
    ptmr->OSTmrDly         = dly;
    ptmr->OSTmrPeriod      = period;
    ptmr->OSTmrOpt         = opt;
    ptmr->OSTmrCallback    = callback;
    ptmr->OSTmrCallbackArg = callback_arg;

    if (pname !=(INT8U *)0) {
        len = OS_StrLen(pname);                              
        if (len < 16) {
            (void)OS_StrCopy(ptmr->OSTmrName, pname);
        } else {

            ptmr->OSTmrName[0] = '#';                        
            ptmr->OSTmrName[1] = (INT8U)0;

            *perr              = 140u;
            OSTmr_Unlock();
            return (ptmr);
        }
    }

    OSTmr_Unlock();
    *perr = 0u;
    return (ptmr);
}


 



















 


BOOLEAN  OSTmrDel (OS_TMR  *ptmr,
                   INT8U   *perr)
{
#line 225 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_tmr.c"
    if (ptmr->OSTmrType != 100u) {                    
        *perr = 137u;
        return (0u);
    }
    if (OSIntNesting > 0) {                                  
        *perr  = 139u;
        return (0u);
    }
    OSTmr_Lock();
    switch (ptmr->OSTmrState) {
        case 3u:
             OSTmr_Unlink(ptmr);                             
             OSTmr_Free(ptmr);                               
             OSTmr_Unlock();
             *perr = 0u;
             return (1u);

        case 1u:                           
        case 2u:                         
             OSTmr_Free(ptmr);                               
             OSTmr_Unlock();
             *perr = 0u;
             return (1u);

        case 0u:                            
             OSTmr_Unlock();
             *perr = 135u;
             return (0u);

        default:
             OSTmr_Unlock();
             *perr = 141u;
             return (0u);
    }
}


 






















 


INT8U  OSTmrNameGet (OS_TMR  *ptmr,
                     INT8U   *pdest,
                     INT8U   *perr)
{
    INT8U  len;


#line 308 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_tmr.c"
    if (ptmr->OSTmrType != 100u) {               
        *perr = 137u;
        return (0);
    }
    if (OSIntNesting > 0) {                             
        *perr = 17u;
        return (0);
    }
    OSTmr_Lock();
    switch (ptmr->OSTmrState) {
        case 3u:
        case 1u:
        case 2u:
             len   = OS_StrCopy(pdest, ptmr->OSTmrName);
             OSTmr_Unlock();
             *perr = 0u;
             return (len);

        case 0u:                       
             OSTmr_Unlock();
             *perr = 135u;
             return (0);

        default:
             OSTmr_Unlock();
             *perr = 141u;
             return (0);
    }
}


 




















 


INT32U  OSTmrRemainGet (OS_TMR  *ptmr,
                        INT8U   *perr)
{
    INT32U  remain;


#line 378 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_tmr.c"
    if (ptmr->OSTmrType != 100u) {               
        *perr = 137u;
        return (0);
    }
    if (OSIntNesting > 0) {                             
        *perr = 139u;
        return (0);
    }
    OSTmr_Lock();
    switch (ptmr->OSTmrState) {
        case 3u:
             remain = ptmr->OSTmrMatch - OSTmrTime;     
             OSTmr_Unlock();
             *perr  = 0u;
             return (remain);

        case 1u:                      
             switch (ptmr->OSTmrOpt) {
                 case 2u:
                      if (ptmr->OSTmrDly == 0) {
                          remain = ptmr->OSTmrPeriod;
                      } else {
                          remain = ptmr->OSTmrDly;
                      }
                      OSTmr_Unlock();
                      *perr  = 0u;
                      break;

                 case 1u:
                 default:
                      remain = ptmr->OSTmrDly;
                      OSTmr_Unlock();
                      *perr  = 0u;
                      break;
             }
             return (remain);

        case 2u:                    
             OSTmr_Unlock();
             *perr = 0u;
             return (0);

        case 0u:
             OSTmr_Unlock();
             *perr = 135u;
             return (0);

        default:
             OSTmr_Unlock();
             *perr = 141u;
             return (0);
    }
}


 























 


INT8U  OSTmrStateGet (OS_TMR  *ptmr,
                      INT8U   *perr)
{
    INT8U  state;


#line 475 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_tmr.c"
    if (ptmr->OSTmrType != 100u) {               
        *perr = 137u;
        return (0);
    }
    if (OSIntNesting > 0) {                             
        *perr = 139u;
        return (0);
    }
    OSTmr_Lock();
    state = ptmr->OSTmrState;
    switch (state) {
        case 0u:   
        case 1u:  
        case 2u:
        case 3u:  
             *perr = 0u;
             break;
             
        default:
             *perr = 141u;
             break;
    }
    OSTmr_Unlock();
    return (state);
}


 



















 


BOOLEAN  OSTmrStart (OS_TMR   *ptmr,
                     INT8U    *perr)
{
#line 537 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_tmr.c"
    if (ptmr->OSTmrType != 100u) {                    
        *perr = 137u;
        return (0u);
    }
    if (OSIntNesting > 0) {                                  
        *perr  = 139u;
        return (0u);
    }
    OSTmr_Lock();
    switch (ptmr->OSTmrState) {
        case 3u:                           
             OSTmr_Unlink(ptmr);                             
             OSTmr_Link(ptmr, 0);              
             OSTmr_Unlock();
             *perr = 0u;
             return (1u);

        case 1u:                           
        case 2u:
             OSTmr_Link(ptmr, 0);              
             OSTmr_Unlock();
             *perr = 0u;
             return (1u);

        case 0u:                            
             OSTmr_Unlock();
             *perr = 135u;
             return (0u);

        default:
             OSTmr_Unlock();
             *perr = 141u;
             return (0u);
    }
}


 


































 


BOOLEAN  OSTmrStop (OS_TMR  *ptmr,
                    INT8U    opt,
                    void    *callback_arg,
                    INT8U   *perr)
{
    OS_TMR_CALLBACK  pfnct;


#line 629 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_tmr.c"
    if (ptmr->OSTmrType != 100u) {                          
        *perr = 137u;
        return (0u);
    }
    if (OSIntNesting > 0) {                                        
        *perr  = 139u;
        return (0u);
    }
    OSTmr_Lock();
    switch (ptmr->OSTmrState) {
        case 3u:
             OSTmr_Unlink(ptmr);                                   
             *perr = 0u;
             switch (opt) {
                 case 3u:
                      pfnct = ptmr->OSTmrCallback;                 
                      if (pfnct != (OS_TMR_CALLBACK)0) {
                          (*pfnct)((void *)ptmr, ptmr->OSTmrCallbackArg);   
                      } else {
                          *perr = 143u;
                      }
                      break;

                 case 4u:
                      pfnct = ptmr->OSTmrCallback;                 
                      if (pfnct != (OS_TMR_CALLBACK)0) {
                          (*pfnct)((void *)ptmr, callback_arg);    
                      } else {
                          *perr = 143u;
                      }
                      break;

                 case 0u:
                      break;

                 default:
                     *perr = 132u;
                     break;
             }
             OSTmr_Unlock();
             return (1u);

        case 2u:                               
        case 1u:                                 
             OSTmr_Unlock();
             *perr = 142u;
             return (1u);

        case 0u:                                  
             OSTmr_Unlock();
             *perr = 135u;
             return (0u);

        default:
             OSTmr_Unlock();
             *perr = 141u;
             return (0u);
    }
}


 

















 


INT8U  OSTmrSignal (void)
{
    INT8U  err;


    err = OSSemPost(OSTmrSemSignal);
    return (err);
}


 










 


static  OS_TMR  *OSTmr_Alloc (void)
{
    OS_TMR *ptmr;


    if (OSTmrFreeList == (OS_TMR *)0) {
        return ((OS_TMR *)0);
    }
    ptmr            = (OS_TMR *)OSTmrFreeList;
    OSTmrFreeList   = (OS_TMR *)ptmr->OSTmrNext;
    ptmr->OSTmrNext = (OS_TCB *)0;
    ptmr->OSTmrPrev = (OS_TCB *)0;
    OSTmrUsed++;
    OSTmrFree--;
    return (ptmr);
}













 


static  void  OSTmr_Free (OS_TMR *ptmr)
{
    ptmr->OSTmrState       = 0u;       
    ptmr->OSTmrOpt         = 0u;
    ptmr->OSTmrPeriod      = 0;
    ptmr->OSTmrMatch       = 0;
    ptmr->OSTmrCallback    = (OS_TMR_CALLBACK)0;
    ptmr->OSTmrCallbackArg = (void *)0;

    ptmr->OSTmrName[0]     = '?';                       
    ptmr->OSTmrName[1]     = (INT8U)0;


    ptmr->OSTmrPrev        = (OS_TCB *)0;               
    ptmr->OSTmrNext        = OSTmrFreeList;
    OSTmrFreeList          = ptmr;

    OSTmrUsed--;                                        
    OSTmrFree++;
}


 











 


void  OSTmr_Init (void)
{

    INT8U    err;

    INT16U   i;
    OS_TMR  *ptmr1;
    OS_TMR  *ptmr2;


    OS_MemClr((INT8U *)&OSTmrTbl[0],      sizeof(OSTmrTbl));             
    OS_MemClr((INT8U *)&OSTmrWheelTbl[0], sizeof(OSTmrWheelTbl));        

    ptmr1 = &OSTmrTbl[0];
    ptmr2 = &OSTmrTbl[1];
    for (i = 0; i < (16 - 1); i++) {                         
        ptmr1->OSTmrType    = 100u;
        ptmr1->OSTmrState   = 0u;                       
        ptmr1->OSTmrNext    = (void *)ptmr2;                             

        ptmr1->OSTmrName[0] = '?';                                       
        ptmr1->OSTmrName[1] = (INT8U)0;

        ptmr1++;
        ptmr2++;
    }
    ptmr1->OSTmrType    = 100u;
    ptmr1->OSTmrState   = 0u;                           
    ptmr1->OSTmrNext    = (void *)0;                                     

    ptmr1->OSTmrName[0] = '?';                                           
    ptmr1->OSTmrName[1] = (INT8U)0;

    OSTmrTime           = 0;
    OSTmrUsed           = 0;
    OSTmrFree           = 16;
    OSTmrFreeList       = &OSTmrTbl[0];
    OSTmrSem            = OSSemCreate(1);
    OSTmrSemSignal      = OSSemCreate(0);





    OSEventNameSet(OSTmrSem,       (INT8U *)"OS-TmrLock",         &err);







    OSEventNameSet(OSTmrSemSignal, (INT8U *)"OS-TmrSig",          &err);



    OSTmr_InitTask();
}


 










 


static  void  OSTmr_InitTask (void)
{

    INT8U  err;





    (void)OSTaskCreateExt(OSTmr_Task,
                          (void *)0,                                        
                          &OSTmrTaskStk[128 - 1],          
                          26,
                          65533u,
                          &OSTmrTaskStk[0],                                 
                          128,
                          (void *)0,                                        
                          0x0001u | 0x0002u);       
#line 920 "..\\..\\..\\..\\..\\uCOS-II\\Source\\os_tmr.c"


    OSTaskNameSet(26, (INT8U *)"uC/OS-II Tmr", &err);





}


 















 


static  void  OSTmr_Link (OS_TMR *ptmr, INT8U type)
{
    OS_TMR       *ptmr1;
    OS_TMR_WHEEL *pspoke;
    INT16U        spoke;


    ptmr->OSTmrState = 3u;
    if (type == 1) {                             
        ptmr->OSTmrMatch = ptmr->OSTmrPeriod + OSTmrTime;
    } else {
        if (ptmr->OSTmrDly == 0) {
            ptmr->OSTmrMatch = ptmr->OSTmrPeriod + OSTmrTime;
        } else {
            ptmr->OSTmrMatch = ptmr->OSTmrDly    + OSTmrTime;
        }
    }
    spoke  = (INT16U)(ptmr->OSTmrMatch % 8);
    pspoke = &OSTmrWheelTbl[spoke];

    if (pspoke->OSTmrFirst == (OS_TMR *)0) {                        
        pspoke->OSTmrFirst   = ptmr;
        ptmr->OSTmrNext      = (OS_TMR *)0;
        pspoke->OSTmrEntries = 1;
    } else {
        ptmr1                = pspoke->OSTmrFirst;                  
        pspoke->OSTmrFirst   = ptmr;
        ptmr->OSTmrNext      = (void *)ptmr1;
        ptmr1->OSTmrPrev     = (void *)ptmr;
        pspoke->OSTmrEntries++;
    }
    ptmr->OSTmrPrev = (void *)0;                                    
}


 










 


static  void  OSTmr_Unlink (OS_TMR *ptmr)
{
    OS_TMR        *ptmr1;
    OS_TMR        *ptmr2;
    OS_TMR_WHEEL  *pspoke;
    INT16U         spoke;


    spoke  = (INT16U)(ptmr->OSTmrMatch % 8);
    pspoke = &OSTmrWheelTbl[spoke];

    if (pspoke->OSTmrFirst == ptmr) {                        
        ptmr1              = (OS_TMR *)ptmr->OSTmrNext;
        pspoke->OSTmrFirst = (OS_TMR *)ptmr1;
        if (ptmr1 != (OS_TMR *)0) {
            ptmr1->OSTmrPrev = (void *)0;
        }
    } else {
        ptmr1            = (OS_TMR *)ptmr->OSTmrPrev;        
        ptmr2            = (OS_TMR *)ptmr->OSTmrNext;
        ptmr1->OSTmrNext = ptmr2;
        if (ptmr2 != (OS_TMR *)0) {
            ptmr2->OSTmrPrev = (void *)ptmr1;
        }
    }
    ptmr->OSTmrState = 1u;
    ptmr->OSTmrNext  = (void *)0;
    ptmr->OSTmrPrev  = (void *)0;
    pspoke->OSTmrEntries--;
}


 










 


static  void  OSTmr_Lock (void)
{
    INT8U  err;


    OSSemPend(OSTmrSem, 0, &err);
    (void)err;
}





static  void  OSTmr_Unlock (void)
{
    (void)OSSemPost(OSTmrSem);
}


 










 


static  void  OSTmr_Task (void *p_arg)
{
    INT8U            err;
    OS_TMR          *ptmr;
    OS_TMR          *ptmr_next;
    OS_TMR_CALLBACK  pfnct;
    OS_TMR_WHEEL    *pspoke;
    INT16U           spoke;


    (void)p_arg;                                                  
    for (;;) {
        OSSemPend(OSTmrSemSignal, 0, &err);                       
        OSTmr_Lock();
        OSTmrTime++;                                              
        spoke  = (INT16U)(OSTmrTime % 8);     
        pspoke = &OSTmrWheelTbl[spoke];
        ptmr   = pspoke->OSTmrFirst;
        while (ptmr != (OS_TMR *)0) {
            ptmr_next = (OS_TMR *)ptmr->OSTmrNext;                
                                                                  
            if (OSTmrTime == ptmr->OSTmrMatch) {                  
                pfnct = ptmr->OSTmrCallback;                      
                if (pfnct != (OS_TMR_CALLBACK)0) {
                    (*pfnct)((void *)ptmr, ptmr->OSTmrCallbackArg);
                }
                OSTmr_Unlink(ptmr);                               
                if (ptmr->OSTmrOpt == 2u) {
                    OSTmr_Link(ptmr, 1);       
                } else {
                    ptmr->OSTmrState = 2u;    
                }
            }
            ptmr = ptmr_next;
        }
        OSTmr_Unlock();
    }
}
#line 38 "..\\..\\..\\..\\..\\uCOS-II\\Source\\ucos_ii.c"
