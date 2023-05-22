#line 1 "..\\..\\..\\..\\NUC1XX_BSP\\NuvotonPlatform_Keil\\Src\\Driver\\DrvUART.c"
 
 
 
 
 
#line 1 "C:\\Keil\\ARM\\RV31\\INC\\stdio.h"
 
 
 





 






 









#line 34 "C:\\Keil\\ARM\\RV31\\INC\\stdio.h"


  
  typedef unsigned int size_t;    








 
 

 
  typedef struct __va_list __va_list;





   




 




typedef struct __fpos_t_struct {
    unsigned __int64 __pos;
    



 
    struct {
        unsigned int __state1, __state2;
    } __mbstate;
} fpos_t;
   


 


   

 

typedef struct __FILE FILE;
   






 

extern FILE __stdin, __stdout, __stderr;
extern FILE *__aeabi_stdin, *__aeabi_stdout, *__aeabi_stderr;

#line 125 "C:\\Keil\\ARM\\RV31\\INC\\stdio.h"
    

    

    





     



   


 


   


 

   



 

   


 




   


 





    


 






extern __declspec(__nothrow) int remove(const char *  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int rename(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   








 
extern __declspec(__nothrow) FILE *tmpfile(void);
   




 
extern __declspec(__nothrow) char *tmpnam(char *  );
   











 

extern __declspec(__nothrow) int fclose(FILE *  ) __attribute__((__nonnull__(1)));
   







 
extern __declspec(__nothrow) int fflush(FILE *  );
   







 
extern __declspec(__nothrow) FILE *fopen(const char * __restrict  ,
                           const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   








































 
extern __declspec(__nothrow) FILE *freopen(const char * __restrict  ,
                    const char * __restrict  ,
                    FILE * __restrict  ) __attribute__((__nonnull__(2,3)));
   








 
extern __declspec(__nothrow) void setbuf(FILE * __restrict  ,
                    char * __restrict  ) __attribute__((__nonnull__(1)));
   




 
extern __declspec(__nothrow) int setvbuf(FILE * __restrict  ,
                   char * __restrict  ,
                   int  , size_t  ) __attribute__((__nonnull__(1)));
   















 
#pragma __printf_args
extern __declspec(__nothrow) int fprintf(FILE * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   


















 
#pragma __printf_args
extern __declspec(__nothrow) int _fprintf(FILE * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 
#pragma __printf_args
extern __declspec(__nothrow) int printf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   




 
#pragma __printf_args
extern __declspec(__nothrow) int _printf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   



 
#pragma __printf_args
extern __declspec(__nothrow) int sprintf(char * __restrict  , const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   






 
#pragma __printf_args
extern __declspec(__nothrow) int _sprintf(char * __restrict  , const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 

#pragma __printf_args
extern __declspec(__nothrow) int snprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(3)));
   















 

#pragma __printf_args
extern __declspec(__nothrow) int _snprintf(char * __restrict  , size_t  ,
                      const char * __restrict  , ...) __attribute__((__nonnull__(3)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int fscanf(FILE * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   






























 
#pragma __scanf_args
extern __declspec(__nothrow) int _fscanf(FILE * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int scanf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   






 
#pragma __scanf_args
extern __declspec(__nothrow) int _scanf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int sscanf(const char * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   








 
#pragma __scanf_args
extern __declspec(__nothrow) int _sscanf(const char * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 

 
extern __declspec(__nothrow) int vfscanf(FILE * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int vscanf(const char * __restrict  , __va_list) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) int vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));

extern __declspec(__nothrow) int _vfscanf(FILE * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int _vscanf(const char * __restrict  , __va_list) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) int _vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));

extern __declspec(__nothrow) int vprintf(const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int _vprintf(const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) int vfprintf(FILE * __restrict  ,
                    const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int vsprintf(char * __restrict  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   






 

extern __declspec(__nothrow) int vsnprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));
   







 

extern __declspec(__nothrow) int _vsprintf(char * __restrict  ,
                      const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   



 
extern __declspec(__nothrow) int _vfprintf(FILE * __restrict  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   



 
extern __declspec(__nothrow) int _vsnprintf(char * __restrict  , size_t  ,
                      const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));
   



 
extern __declspec(__nothrow) int fgetc(FILE *  ) __attribute__((__nonnull__(1)));
   







 
extern __declspec(__nothrow) char *fgets(char * __restrict  , int  ,
                    FILE * __restrict  ) __attribute__((__nonnull__(1,3)));
   










 
extern __declspec(__nothrow) int fputc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   







 
extern __declspec(__nothrow) int fputs(const char * __restrict  , FILE * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) int getc(FILE *  ) __attribute__((__nonnull__(1)));
   







 




    extern __declspec(__nothrow) int (getchar)(void);

   





 
extern __declspec(__nothrow) char *gets(char *  ) __attribute__((__nonnull__(1)));
   









 
extern __declspec(__nothrow) int putc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   





 




    extern __declspec(__nothrow) int (putchar)(int  );

   



 
extern __declspec(__nothrow) int puts(const char *  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int ungetc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   






















 

extern __declspec(__nothrow) size_t fread(void * __restrict  ,
                    size_t  , size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,4)));
   











 

extern __declspec(__nothrow) size_t __fread_bytes_avail(void * __restrict  ,
                    size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,3)));
   











 

extern __declspec(__nothrow) size_t fwrite(const void * __restrict  ,
                    size_t  , size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,4)));
   







 

extern __declspec(__nothrow) int fgetpos(FILE * __restrict  , fpos_t * __restrict  ) __attribute__((__nonnull__(1,2)));
   








 
extern __declspec(__nothrow) int fseek(FILE *  , long int  , int  ) __attribute__((__nonnull__(1)));
   














 
extern __declspec(__nothrow) int fsetpos(FILE * __restrict  , const fpos_t * __restrict  ) __attribute__((__nonnull__(1,2)));
   










 
extern __declspec(__nothrow) long int ftell(FILE *  ) __attribute__((__nonnull__(1)));
   











 
extern __declspec(__nothrow) void rewind(FILE *  ) __attribute__((__nonnull__(1)));
   





 

extern __declspec(__nothrow) void clearerr(FILE *  ) __attribute__((__nonnull__(1)));
   




 

extern __declspec(__nothrow) int feof(FILE *  ) __attribute__((__nonnull__(1)));
   


 
extern __declspec(__nothrow) int ferror(FILE *  ) __attribute__((__nonnull__(1)));
   


 
extern __declspec(__nothrow) void perror(const char *  );
   









 

extern __declspec(__nothrow) int _fisatty(FILE *   ) __attribute__((__nonnull__(1)));
    
 

extern __declspec(__nothrow) void __use_no_semihosting_swi(void);
extern __declspec(__nothrow) void __use_no_semihosting(void);
    





 











#line 944 "C:\\Keil\\ARM\\RV31\\INC\\stdio.h"



 
#line 7 "..\\..\\..\\..\\NUC1XX_BSP\\NuvotonPlatform_Keil\\Src\\Driver\\DrvUART.c"
#line 1 "..\\..\\..\\..\\NUC1XX_BSP\\CMSIS\\CM0\\NUC100.h"
 
 
 
 
 









 
 
typedef enum IRQn
{
 
  NonMaskableInt_IRQn         = -14,     
  HardFault_IRQn		      = -13,     
  SVCall_IRQn                 = -5,      
  PendSV_IRQn                 = -2,      
  SysTick_IRQn                = -1,      

 
  BOD_IRQn                  = 0,
  WDT_IRQn                  = 1,
  EINT0_IRQn                = 2,
  EINT1_IRQn                = 3,
  GPAB_IRQn                 = 4,
  GPCDE_IRQn                = 5,
  PWMA_IRQn                 = 6,
  PWMB_IRQn                 = 7,
  TMR0_IRQn                 = 8,
  TMR1_IRQn                 = 9,
  TMR2_IRQn                 = 10,
  TMR3_IRQn                 = 11,
  UART0_IRQn                = 12,
  UART1_IRQn                = 13,
  SPI0_IRQn                 = 14,
  SPI1_IRQn                 = 15,
  SPI2_IRQn                 = 16,
  SPI3_IRQn                 = 17,
  I2C0_IRQn                 = 18,
  I2C1_IRQn                 = 19,
  CAN0_IRQn                 = 20,
  CAN1_IRQn                 = 21,
  SD_IRQn                   = 22,
  USBD_IRQn                 = 23,
  PS2_IRQn                  = 24,
  ACMP_IRQn                 = 25,
  PDMA_IRQn                 = 26,
  I2S_IRQn                  = 27,
  PWRWU_IRQn                = 28,
  ADC_IRQn                  = 29,
  DAC_IRQn                  = 30,
  RTC_IRQn                  = 31
         
                                         
} IRQn_Type;






 

 





#line 1 "..\\..\\..\\..\\NUC1XX_BSP\\CMSIS\\CM0\\core_cm0.h"



















 
















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



 


#line 38 "..\\..\\..\\..\\NUC1XX_BSP\\CMSIS\\CM0\\core_cm0.h"

















 









 


 








 
typedef struct
{
  volatile uint32_t ISER[1];                       
       uint32_t RESERVED0[31];
  volatile uint32_t ICER[1];                       
       uint32_t RSERVED1[31];
  volatile uint32_t ISPR[1];                       
       uint32_t RESERVED2[31];
  volatile uint32_t ICPR[1];                       
       uint32_t RESERVED3[31];
       uint32_t RESERVED4[64];
  volatile uint32_t IP[8];                         
}  NVIC_Type;


 
typedef struct
{
  volatile const  uint32_t CPUID;                         
  volatile uint32_t ICSR;                          
       uint32_t RESERVED0;
  volatile uint32_t AIRCR;                         
  volatile uint32_t SCR;                           
  volatile uint32_t CCR;                           
       uint32_t RESERVED1;
  volatile uint32_t SHP[2];                        
  volatile uint32_t SHCSR;                         
       uint32_t RESERVED2[2];
  volatile uint32_t DFSR;                          
} SCB_Type;


 
typedef struct
{
  volatile uint32_t CTRL;                          
  volatile uint32_t LOAD;                          
  volatile uint32_t VAL;                           
  volatile const  uint32_t CALIB;                         
} SysTick_Type;



 
typedef struct
{
  volatile uint32_t DHCSR;                         
  volatile  uint32_t DCRSR;                         
  volatile uint32_t DCRDR;                         
  volatile uint32_t DEMCR;                         
} CoreDebug_Type;


 














 






#line 163 "..\\..\\..\\..\\NUC1XX_BSP\\CMSIS\\CM0\\core_cm0.h"


 


 




#line 181 "..\\..\\..\\..\\NUC1XX_BSP\\CMSIS\\CM0\\core_cm0.h"


   
   









 
extern uint32_t __get_PSP(void);









 
extern void __set_PSP(uint32_t topOfProcStack);









 
extern uint32_t __get_MSP(void);









 
extern void __set_MSP(uint32_t topOfMainStack);








 
extern uint32_t __REV16(uint16_t value);








 
extern int32_t __REVSH(int16_t value);


#line 295 "..\\..\\..\\..\\NUC1XX_BSP\\CMSIS\\CM0\\core_cm0.h"










 
static __inline uint32_t __get_PRIMASK(void)
{
  register uint32_t __regPriMask         __asm("primask");
  return(__regPriMask);
}








 
static __inline void __set_PRIMASK(uint32_t priMask)
{
  register uint32_t __regPriMask         __asm("primask");
  __regPriMask = (priMask);
}








 
static __inline uint32_t __get_CONTROL(void)
{
  register uint32_t __regControl         __asm("control");
  return(__regControl);
}








 
static __inline void __set_CONTROL(uint32_t control)
{
  register uint32_t __regControl         __asm("control");
  __regControl = control;
}





#line 570 "..\\..\\..\\..\\NUC1XX_BSP\\CMSIS\\CM0\\core_cm0.h"



 

 
 
















 
static __inline void NVIC_SetPriorityGrouping(uint32_t priority_grouping)
{
  uint32_t reg_value=0;
  
  reg_value  = ((SCB_Type *) ((0xE000E000) + 0x0D00))->AIRCR;                                                                             
  reg_value &= ~((0xFFFFU << 16) | (0x0F << 8));                                                       
  reg_value  = ((reg_value | (0x5FA << 16) | (priority_grouping << 8)));                          
  ((SCB_Type *) ((0xE000E000) + 0x0D00))->AIRCR = reg_value;
}









 
static __inline void NVIC_EnableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ISER[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));                              
}









 
static __inline void NVIC_DisableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ICER[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));                              
}










 
static __inline IRQn_Type NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
  return((IRQn_Type) (((NVIC_Type *) ((0xE000E000) + 0x0100))->ISPR[(uint32_t)(IRQn) >> 5] & (1 << ((uint32_t)(IRQn) & 0x1F))));          
}









 
static __inline void NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ISPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));                              
}









 
static __inline void NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ICPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));                              
}













 
static __inline void NVIC_SetPriority(IRQn_Type IRQn, int32_t priority)
{
  if(IRQn < 0) {
    ((SCB_Type *) ((0xE000E000) + 0x0D00))->SHP[( ((((uint32_t)(IRQn) & 0x0F)-8) >> 2) )] = (((SCB_Type *) ((0xE000E000) + 0x0D00))->SHP[( ((((uint32_t)(IRQn) & 0x0F)-8) >> 2) )] & ~(0xFF << ( (((uint32_t)(IRQn) ) & 0x03) * 8 ))) | 
        (((priority << (8 - 2)) & 0xFF) << ( (((uint32_t)(IRQn) ) & 0x03) * 8 )); }
  else {
    ((NVIC_Type *) ((0xE000E000) + 0x0100))->IP[( ((uint32_t)(IRQn) >> 2) )] =  (((NVIC_Type *) ((0xE000E000) + 0x0100))->IP[( ((uint32_t)(IRQn) >> 2) )]  & ~(0xFF << ( (((uint32_t)(IRQn) ) & 0x03) * 8 ))) |
        (((priority << (8 - 2)) & 0xFF) << ( (((uint32_t)(IRQn) ) & 0x03) * 8 )); }
}















 
static __inline uint32_t NVIC_GetPriority(IRQn_Type IRQn)
{

  if(IRQn < 0) {
    return((uint32_t)((((SCB_Type *) ((0xE000E000) + 0x0D00))->SHP[( ((((uint32_t)(IRQn) & 0x0F)-8) >> 2) )] >> ( (((uint32_t)(IRQn) ) & 0x03) * 8 ) ) >> (8 - 2)));  }  
  else {
    return((uint32_t)((((NVIC_Type *) ((0xE000E000) + 0x0100))->IP[( ((uint32_t)(IRQn) >> 2) )]  >> ( (((uint32_t)(IRQn) ) & 0x03) * 8 ) ) >> (8 - 2)));  }  
}



 



 














 
static __inline uint32_t SysTick_Config(uint32_t ticks)
{ 
  if (ticks > ((1<<24) -1))  return (1);                                                 

  ((SysTick_Type *) ((0xE000E000) + 0x0010))->LOAD  =  (ticks & ((1<<24) -1)) - 1;                                          
  NVIC_SetPriority (SysTick_IRQn, (1<<2) - 1);                                
  ((SysTick_Type *) ((0xE000E000) + 0x0010))->VAL   =  (0x00);                                                                  
  ((SysTick_Type *) ((0xE000E000) + 0x0010))->CTRL = (1 << 2) | (1<<0) | (1<<1);     
  return (0);                                                                                
}







 








 
static __inline void NVIC_SystemReset(void)
{
  ((SCB_Type *) ((0xE000E000) + 0x0D00))->AIRCR  = ((0x5FA << 16) | (1<<2));                                
}



























#line 77 "..\\..\\..\\..\\NUC1XX_BSP\\CMSIS\\CM0\\NUC100.h"
#line 1 "..\\..\\..\\..\\NUC1XX_BSP\\CMSIS\\CM0\\system_NUC100.h"



















 





extern uint32_t SystemFrequency;                    










 
extern                   void SystemInit     (void);
#line 78 "..\\..\\..\\..\\NUC1XX_BSP\\CMSIS\\CM0\\NUC100.h"
#line 1 "..\\..\\..\\..\\NUC1XX_BSP\\NuvotonPlatform_Keil\\Include\\System\\SysInfra.h"
 
 
 
 
 





 
 
 
#line 1 "..\\..\\..\\..\\NUC1XX_BSP\\NuvotonPlatform_Keil\\Include\\System\\ModuleID.h"
 
 
 
 
 





typedef enum
{
	 
	
	 
	MODULE_ID_DRVPROTECT		= 0,		 

	MODULE_ID_DRVADC			= 2,		 
	MODULE_ID_DRVAIC			= 4,		 
	MODULE_ID_DRVAPU			= 6,		 
	MODULE_ID_DRVAUDIOADC		= 8,		 
	MODULE_ID_DRVCACHE			= 10,		 
	MODULE_ID_DRVCAN			= 11,		 
	MODULE_ID_DRVEBI			= 12,		 
	MODULE_ID_DRVEDMA			= 13,		 
	MODULE_ID_DRVGDMA			= 14,		 
	MODULE_ID_DRVFSC			= 15,		 
	MODULE_ID_DRVGE				= 16,		 
	MODULE_ID_DRVFMC			= 17,		 
	MODULE_ID_DRVGPIO			= 18,		 
	
	MODULE_ID_DRVGPU			= 20,		 
	MODULE_ID_DRVI2C			= 22,		 
	MODULE_ID_DRVI2S			= 24,		 
	MODULE_ID_DRVI2SM			= 26,		 
	MODULE_ID_DRVMPU			= 28,		 
	MODULE_ID_DRVNAND			= 30,		 
	MODULE_ID_DRVNOR			= 32,		 
	MODULE_ID_DRVPDMA     		= 33,        
	MODULE_ID_DRVPWM			= 34,		 
	MODULE_ID_DRVPS2			= 35,		 
	MODULE_ID_DRVRTC			= 36,		 
	MODULE_ID_DRVSDCARD			= 38,		 
	MODULE_ID_DRVSIO			= 39,		 

	MODULE_ID_DRVSPI			= 40,		 
	MODULE_ID_DRVSPIMS			= 41,		 
	MODULE_ID_DRVSPIFLASH		= 42,		 
	MODULE_ID_DRVSPIM			= 43,		 
	MODULE_ID_DRVSYS			= 44,		 
	MODULE_ID_DRVSPU			= 45,		 
	MODULE_ID_DRVTIMER			= 46,		 
	MODULE_ID_DRVUART			= 48,		 
	MODULE_ID_DRVUSB			= 50,		 
	MODULE_ID_DRVUSBH			= 52,		 
	MODULE_ID_DRVVDMA			= 54,		 
	MODULE_ID_DRVVIDEOIN		= 56,		 
	MODULE_ID_DRVVPOST			= 58,		 

	MODULE_ID_DRVVRAM			= 60,		 
	MODULE_ID_DRVW55U02			= 62,		 
	MODULE_ID_DRVI2CH			= 64,		 
	MODULE_ID_DRVWDT			= 66,		 
	MODULE_ID_DRVJPEG			= 68,		 
	
	MODULE_ID_DRVZEROG			= 70,		 
	MODULE_ID_DRVSI2C			= 71,		 

	 
	MODULE_ID_AEC				= 81,		 
	MODULE_ID_BEATDET			= 82,		 
	MODULE_ID_SNDEFF			= 83,		 
	MODULE_ID_AUDIOSYN			= 84,		 
	MODULE_ID_G726ADPCM			= 85,		 
	MODULE_ID_IMAADPCM			= 86,		 
	MODULE_ID_MP3DEC			= 88,		 
	MODULE_ID_PITCHCHANGE		= 90,		 
	MODULE_ID_WAVFILEUTIL		= 92,		 
	MODULE_ID_WMADEC			= 96,		 
	MODULE_ID_WMADECDRM			= 98,		 
	MODULE_ID_AUDIOCTRL			= 100,		 
	MODULE_ID_EQ				= 106,		 
	MODULE_ID_OGGDEC			= 110,		 
	MODULE_ID_MP3ENC			= 112,		 
	MODULE_ID_UADEC				= 114,		 
	MODULE_ID_ULSPEECHDEC		= 115,		 
	MODULE_ID_USPEECHDEC		= 116,		 
	MODULE_ID_SPEECHRECOG		= 118,		 

	 
	MODULE_ID_FS				= 120,		 
	
	 
	MODULE_ID_FL				= 128,		 
	
	 
	MODULE_ID_KEYPAD			= 130,		 
	MODULE_ID_LWIP				= 132,		 
	MODULE_ID_WLANMGR			= 134,		 
	MODULE_ID_HTTPD				= 136,		 
	MODULE_ID_VIRTUALCOM		= 139,		 

	 
	MODULE_ID_GFXRESLDR			= 140,		 
	MODULE_ID_GFXLIB			= 141,		 
	MODULE_ID_IMGPROC			= 142,		 
	MODULE_ID_JPEG				= 144,		 
	MODULE_ID_PNGDEC			= 146,		 
	MODULE_ID_BARCODE2D			= 148,		 	 
	MODULE_ID_PTNRECOG			= 150,		 
	MODULE_ID_MOTIONDET			= 152,		 
	
	 
	MODULE_ID_STORIF			= 160,		 
	MODULE_ID_SDCARD			= 161,		 
	MODULE_ID_SYSNAND			= 162,		 
	MODULE_ID_SPIFLASH			= 163,		 
	MODULE_ID_WTRIF				= 164,		 
	MODULE_ID_NORFLASH			= 165,		 
	MODULE_ID_SYSNANDLITE		= 166,		 
	
	 
	MODULE_ID_INTMGR			= 180,		 
	MODULE_ID_BLKLDR			= 181,		 
	MODULE_ID_MEMMGR			= 182,		 
	MODULE_ID_EVTMGR			= 183,		 
	MODULE_ID_PROF				= 184,		 
	MODULE_ID_PROGLDR			= 186,		 
	MODULE_ID_SYSINFRA			= 188,		 
	MODULE_ID_TIMERCTRL			= 190,		 
	MODULE_ID_TIMEUTIL			= 192,		 
	MODULE_ID_CONPROGLDR		= 194,		 
	
	 
	MODULE_ID_USBCOREH			= 78,		 
	MODULE_ID_HID				= 220,		 
	MODULE_ID_MASSSTOR			= 222,		 
	MODULE_ID_MASSSTORHID		= 224,		 
	MODULE_ID_MASSSTORLITE		= 226,		 
	MODULE_ID_MTP				= 230,		 
	MODULE_ID_USBINFRA			= 232,		 
	MODULE_ID_UAC				= 234,		 
	MODULE_ID_UAVC				= 236,		 
	MODULE_ID_UVC				= 238,		 
	MODULE_ID_MASSSTORH			= 252,		 
	MODULE_ID_HIDH				= 254,		 

	 
	MODULE_ID_MSDRMPD			= 228,		 
	
	 
	MODULE_ID_AVICODEC			= 240,		 
	MODULE_ID_MJPEG				= 242,		 
	MODULE_ID_WIVICORE			= 244,		 
	MODULE_ID_WIVI				= 246,		 	
	MODULE_ID_AVCTRL			= 248,		 
	MODULE_ID_AVIUTIL			= 250,		 
	
	 
	MODULE_ID_WTCHAN			= 168,		 
	MODULE_ID_WTCMDSERV			= 170,		 
	MODULE_ID_WTDISPLAY			= 172,		 
	MODULE_ID_WTMEDIA			= 174,		 
	MODULE_ID_WTSYS				= 176,		 
	MODULE_ID_WTTRANS			= 178,		 
	
	
} E_SYSINFRA_MODULE_ID;


#line 15 "..\\..\\..\\..\\NUC1XX_BSP\\NuvotonPlatform_Keil\\Include\\System\\SysInfra.h"
#line 16 "..\\..\\..\\..\\NUC1XX_BSP\\NuvotonPlatform_Keil\\Include\\System\\SysInfra.h"
#line 17 "..\\..\\..\\..\\NUC1XX_BSP\\NuvotonPlatform_Keil\\Include\\System\\SysInfra.h"






 
 
 





 
 
 
 



 



 

 

 


 






 
 
 
 
















#line 79 "..\\..\\..\\..\\NUC1XX_BSP\\CMSIS\\CM0\\NUC100.h"










 
extern void SystemInit (void);


 
 
 

 
typedef struct
{
    volatile uint32_t PMD0:2;
    volatile uint32_t PMD1:2;
    volatile uint32_t PMD2:2;
    volatile uint32_t PMD3:2;
    volatile uint32_t PMD4:2;
    volatile uint32_t PMD5:2;
    volatile uint32_t PMD6:2;
    volatile uint32_t PMD7:2;
    volatile uint32_t PMD8:2;
    volatile uint32_t PMD9:2;
    volatile uint32_t PMD10:2;
    volatile uint32_t PMD11:2;
    volatile uint32_t PMD12:2;
    volatile uint32_t PMD13:2;
    volatile uint32_t PMD14:2;
    volatile uint32_t PMD15:2;
} GPIO_PMD_T;

typedef volatile uint32_t GPIO_SCH_T;

typedef volatile uint32_t GPIO_DOUT_T;

typedef volatile uint32_t GPIO_DMASK_T;

typedef volatile uint32_t GPIO_PIN_T;

typedef volatile uint32_t GPIO_DBEN_T;

typedef volatile uint32_t GPIO_IMD_T;

typedef volatile uint32_t GPIO_IEN_T;

typedef volatile uint32_t GPIO_ISRC_T;

typedef struct
{
    volatile uint32_t  DBCLKSEL:4;
    volatile uint32_t  DBCLKSRC:1;
    volatile uint32_t  ICLK_ON:1;
    volatile const  uint32_t  RESERVE:26;    
} GPIO_DBNCECON_T;

typedef struct
{
    GPIO_PMD_T      PMD;
    GPIO_SCH_T      SCH;
    GPIO_DOUT_T     DOUT;
    GPIO_DMASK_T    DMASK;
    GPIO_PIN_T      PIN;
    GPIO_DBEN_T     DBEN;
    GPIO_IMD_T      IMD;
    GPIO_IEN_T      IEN;
    GPIO_ISRC_T     ISRC;
    
} GPIO_T;


 

typedef volatile uint32_t UART_DATA_T;


typedef struct
{
    volatile uint32_t  RDA_IEN:1;
    volatile uint32_t  THRE_IEN:1;
    volatile uint32_t  RLS_IEN:1;
    volatile uint32_t  MS_IEN:1;
    volatile uint32_t  RTO_IEN:1;	  
    volatile uint32_t  BUF_ERR_IEN:1;
    volatile uint32_t  WAKE_IEN:1;
    volatile const  uint32_t  RESERVE0:4;
    volatile uint32_t  TOC_EN:1;       
    volatile uint32_t  AUTO_RTS_EN:1;
    volatile uint32_t  AUTO_CTS_EN:1;
    volatile uint32_t  DMA_TX_EN:1;
    volatile uint32_t  DMA_RX_EN:1;
    volatile const  uint32_t  RESERVE1:15;    
    volatile uint32_t  nDEBUGACK_EN:1;
} UART_IER_T;

typedef struct
{
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  RFR:1;
    volatile uint32_t  TFR:1;
    volatile const  uint32_t  RESERVE1:1;
    volatile uint32_t  RFITL:4;              
    volatile const  uint32_t  RESERVE2:8;
    volatile uint32_t  RTS_TRIG_LEVEL:4;
    volatile const  uint32_t  RESERVE3:12;
} UART_FCR_T;

typedef struct
{
    volatile uint32_t  WLS:2;                
    volatile uint32_t  NSB:1;                
    volatile uint32_t  PBE:1;                
    volatile uint32_t  EPE:1;                
    volatile uint32_t  SPE:1;                
    volatile uint32_t  BCB:1;                
    volatile const  uint32_t  RESERVE:25;
} UART_LCR_T;

typedef struct
{
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  RTS_INV:1;
    volatile const  uint32_t  RESERVE1:2;
    volatile uint32_t  LBME:1;
    volatile const  uint32_t  RESERVE2:4;
    volatile uint32_t  RTS_ACT_LEVEL:1;
    volatile const  uint32_t  RESERVE3:3;
    volatile const  uint32_t  RTS:1;                
    volatile const  uint32_t  RESERVE4:18;
} UART_MCR_T;

typedef struct
{
    volatile uint32_t  DCTS:1;
    volatile const  uint32_t  RESERVE0:3;
    volatile const  uint32_t  CTS:1;                
    volatile const  uint32_t  RESERVE1:3;
    volatile uint32_t  CTS_ACT_LEVEL:1;
    volatile const  uint32_t  RESERVE2:23;
} UART_MSR_T;

typedef struct
{
    volatile uint32_t  RX_OVERFLOW:1;
    volatile const  uint32_t  RESERVE0:3;
    volatile uint32_t  PEI:1;
    volatile uint32_t  FEI:1;
    volatile uint32_t  BII:1;
    volatile const  uint32_t  RESERVE1:1;
    volatile const  uint32_t  RX_POINTER:6;
    volatile const  uint32_t  RX_EMPTY:1;
    volatile const  uint32_t  RX_FULL:1;
    volatile const  uint32_t  TX_POINTER:6;
    volatile const  uint32_t  TX_EMPTY:1;
    volatile const  uint32_t  TX_FULL:1;
    volatile uint32_t  TX_OVERFLOW:1;
    volatile const  uint32_t  RESERVE2:3;
    volatile const  uint32_t  TE:1;                 
    volatile const  uint32_t  RESERVE3:3;
} UART_FSR_T;

typedef struct
{
    volatile uint32_t  RDA_IF:1;
    volatile uint32_t  THRE_IF:1;
    volatile uint32_t  RLS_IF:1;
    volatile uint32_t  MODEM_IF:1;
    volatile uint32_t  TOUT_IF:1;
    volatile uint32_t  BUF_ERR_IF:1;
    volatile uint32_t  WAKE_IF:1;
    volatile uint32_t  SW_TX:1;
    volatile uint32_t  RDA_INT:1;
    volatile uint32_t  THRE_INT:1;
    volatile uint32_t  RLS_INT:1;
    volatile uint32_t  MODEM_INT:1;
    volatile uint32_t  TOUT_INT:1;
    volatile uint32_t  BUF_ERR_INT:1;
    volatile uint32_t  WAKE_INT:1;
    volatile uint32_t  SW_RX:1;
    volatile const  uint32_t  RESERVE0:2;
    volatile uint32_t  HW_RLS_IF:1;
    volatile uint32_t  HW_MODEM_IF:1;
    volatile uint32_t  HW_TOUT_IF:1;
    volatile uint32_t  HW_BUF_ERR_IF:1;
    volatile uint32_t  HW_WAKE_IF:1;
    volatile uint32_t  EDMA_TX:1;
    volatile const  uint32_t  RESERVE1:2;
    volatile uint32_t  HW_RLS_INT:1;
    volatile uint32_t  HW_MODEM_INT:1;
    volatile uint32_t  HW_TOUT_INT:1;
    volatile uint32_t  HW_BUF_ERR_INT:1;
    volatile uint32_t  HW_WAKE_INT:1;
    volatile uint32_t  EDMA_RX:1;
} UART_ISR_T;

typedef volatile uint32_t UART_TOR_T;

typedef struct
{
    volatile uint32_t  DIV:16;
    volatile const  uint32_t  RESERVE0:8;
    volatile uint32_t  DIVX:4;
    volatile uint32_t  DIVX1:1;            
    volatile uint32_t  DIVX_EN:1;            
    volatile const  uint32_t  RESERVE1:2;
} UART_BAUD_T;

typedef struct
{
    volatile uint32_t  IrDA_EN:1;
    volatile const  uint32_t  RESERVE0:2;
    volatile uint32_t  RX_EN:1;
    volatile uint32_t  TX_EN:1;            
    volatile uint32_t  TX_INV_EN:1;            
    volatile uint32_t  RX_INV_EN:1;
    volatile const  uint32_t  RESERVE1:25;
} UART_IRCR_T;

typedef struct
{
    volatile uint32_t  LINBCNT:4;
    volatile const  uint32_t  RESERVE0:2;
    volatile uint32_t  LINRX_EN:1;
    volatile uint32_t  LINTX_EN:1;            
    volatile const  uint32_t  RESERVE1:24;
} UART_LINCON_T;



typedef struct
{
    volatile uint32_t  LIN_EN:2;
	volatile uint32_t  IrDA_EN:2;
    volatile const  uint32_t  RESERVE0:32;

} UART_FUNSEL_T;


typedef struct
{
    UART_DATA_T     DATA;
    UART_IER_T      IER;
    UART_FCR_T      FCR;
    UART_LCR_T      LCR;
    UART_MCR_T      MCR;
    UART_MSR_T      MSR;
    UART_FSR_T      FSR;
    UART_ISR_T      ISR;
    UART_TOR_T      TOR;
    UART_BAUD_T     BAUD;
    UART_IRCR_T     IRCR;
    UART_LINCON_T   LINCON;    
	UART_FUNSEL_T   FUNSEL;    
} UART_T;

 
typedef struct
{
    volatile uint32_t  PRESCALE:8;
    volatile const  uint32_t  RESERVE0:8;
    volatile uint32_t  TDR_EN:1;
    volatile const  uint32_t  RESERVE1:8;
    volatile uint32_t  CACT:1;
    volatile uint32_t  CRST:1;
    volatile uint32_t  MODE:2;
    volatile uint32_t  IE:1;
    volatile uint32_t  CEN:1;
    volatile uint32_t  nDBGACK_EN:1;
} TIMER_TCSR_T;

typedef volatile uint32_t TIMER_TICR_T;

typedef volatile uint32_t TIMER_TDR_T;

typedef struct
{
    volatile uint32_t  TIF:1;
    volatile const  uint32_t  RESERVE:31;
} TIMER_TISR_T;

typedef struct
{
    TIMER_TCSR_T     TCSR;
    TIMER_TICR_T     TICR;
    TIMER_TISR_T     TISR;    
    TIMER_TDR_T      TDR;
 } TIMER_T;


 
typedef struct
{
    volatile uint32_t  WTR:1;
	volatile uint32_t  WTRE:1;
	volatile uint32_t  WTRF:1;
	volatile uint32_t  WTIF:1;
	volatile const  uint32_t  RESERVE:2;
	volatile uint32_t  WTIE:1;
	volatile uint32_t  WTE:1;
	volatile uint32_t  WTIS:3;
    volatile const  uint32_t  RESERVE1:21;
} WDT_WTCR_T;

typedef struct
{
    WDT_WTCR_T     WTCR;
    
 } WDT_T;

 
typedef struct
{
    volatile uint32_t  GO_BUSY:1;
    volatile uint32_t  RX_NEG:1;
    volatile uint32_t  TX_NEG:1;
    volatile uint32_t  TX_BIT_LEN:5;
    volatile uint32_t  TX_NUM:2;
    volatile uint32_t  LSB:1;
    volatile uint32_t  CLKP:1;
    volatile uint32_t  SLEEP:4;
    volatile uint32_t  IF:1;
    volatile uint32_t  IE:1;
    volatile uint32_t  SLAVE:1;
    volatile uint32_t  BYTE_SLEEP:1;
    volatile uint32_t  BYTE_ENDIAN:1;
    volatile uint32_t  FOURB:1;
    volatile uint32_t  TWOB:1;
    volatile uint32_t  VARCLK_EN:1;
    volatile const  uint32_t  RESERVE:8;
} SPI_CNTRL_T;

typedef struct
{
    volatile uint32_t  DIVIDER:16;
    volatile uint32_t  DIVIDER2:16;
} SPI_DIVIDER_T;

typedef struct
{
    volatile uint32_t  SSR:2;
    volatile uint32_t  SS_LVL:1;
    volatile uint32_t  ASS:1;
    volatile uint32_t  SS_LTRIG:1;
    volatile uint32_t  LTRIG_FLAG:1;
    volatile const  uint32_t  RESERVE:26;
} SPI_SSR_T;


typedef volatile const  uint32_t   SPI_RX_T;
typedef volatile  uint32_t   SPI_TX_T;

typedef struct
{
    volatile uint32_t  JS:1;
    volatile const  uint32_t  RESERVE0:3;
    volatile uint32_t  JS_RW:1;
    volatile uint32_t  CS_ACT:1;
    volatile uint32_t  DATA_RDY:1;
    volatile uint32_t  CS_DEACT:1;
    volatile uint32_t  READYB:1;
    volatile const  uint32_t  RESERVE1:23;
} SPI_JS_T;

typedef volatile uint32_t SPI_VARCLK_T;

typedef struct
{
    volatile uint32_t  TX_DMA_GO:1;
    volatile uint32_t  RX_DMA_GO:1;
    volatile const  uint32_t  RESERVE:30;
} SPI_DMA_T;

typedef struct
{
    SPI_CNTRL_T     CNTRL;
    SPI_DIVIDER_T   DIVIDER;
    SPI_SSR_T       SSR;
    uint32_t        RESERVE0;
    SPI_RX_T        RX[2];
    uint32_t        RESERVE1;
    uint32_t        RESERVE2;
    SPI_TX_T        TX[2];
    uint32_t        RESERVE3;
    uint32_t        RESERVE4;
    SPI_JS_T        JS;
    SPI_VARCLK_T    VARCLK;
    SPI_DMA_T       DMA;
} SPI_T;

 
typedef struct
{
    volatile const  uint32_t  RESERVE0:2;
    volatile uint32_t  AA:1;
    volatile uint32_t  SI:1;
    volatile uint32_t  STO:1;
    volatile uint32_t  STA:1;
    volatile uint32_t  ENSI:1;
   	volatile uint32_t  EI:1;
    volatile const  uint32_t  RESERVE1:24;
} I2C_CON_T;

typedef struct
{
    volatile uint32_t  GC:1;
    volatile uint32_t  ADDR:7;
    volatile const  uint32_t  RESERVE:24;
} I2C_ADDR_T;

typedef volatile uint32_t I2C_DATA_T;

typedef volatile const  uint32_t I2C_STATUS_T;

typedef volatile uint32_t I2C_CLK_T;

typedef struct
{
    volatile uint32_t  TIF:1;
    volatile uint32_t  DIV4:1;
    volatile uint32_t  ENTI:1;
    volatile const  uint32_t  RESERVE:29;
} I2C_TOC_T;

typedef struct
{
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  ADM:7;
    volatile const  uint32_t  RESERVE1:24;
} I2C_ADRM_T;

typedef struct
{
    I2C_CON_T       CON;
    I2C_ADDR_T      ADDR0;
    I2C_DATA_T      DATA;
    I2C_STATUS_T    STATUS;
    I2C_CLK_T       CLK;
    I2C_TOC_T       TOC;
	I2C_ADDR_T	    ADDR1;
	I2C_ADDR_T	    ADDR2;
	I2C_ADDR_T	    ADDR3;
	I2C_ADRM_T		ADRM0;
	I2C_ADRM_T		ADRM1;
	I2C_ADRM_T		ADRM2;
	I2C_ADRM_T	    ADRM3;        
} I2C_T;


 

typedef volatile uint32_t RTC_INIR_T;

typedef struct
{
    volatile uint32_t  AER:16;
    volatile const  uint32_t  ENF:1;
    volatile const  uint32_t  RESERVE1:15;
} RTC_AER_T;

typedef struct
{
    volatile uint32_t  FRACTION:6;
    volatile const  uint32_t  RESERVE0:2;
    volatile uint32_t  INTEGER:4;
    volatile const  uint32_t  RESERVE1:20;
} RTC_FCR_T;

typedef struct
{
    volatile uint32_t  SEC1:4;
    volatile uint32_t  SEC10:3;
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  MIN1:4;
    volatile uint32_t  MIN10:3;
    volatile const  uint32_t  RESERVE1:1;
    volatile uint32_t  HR1:4;
    volatile uint32_t  HR10:2;
    volatile const  uint32_t  RESERVE2:10;
} RTC_TLR_T;

typedef struct
{
    volatile uint32_t  DAY1:4;
    volatile uint32_t  DAY10:2;
    volatile const  uint32_t  RESERVE0:2;
    volatile uint32_t  MON1:4;
    volatile uint32_t  MON10:1;
    volatile const  uint32_t  RESERVE1:3;
    volatile uint32_t  YEAR1:4;
    volatile uint32_t  YEAR10:4;
    volatile const  uint32_t  RESERVE2:8;
} RTC_CLR_T;

typedef struct
{
    volatile uint32_t  HR24:1;
    volatile const  uint32_t  RESERVE:31;
} RTC_TSSR_T;

typedef struct
{
    volatile uint32_t  DWR:3;
    volatile const  uint32_t  RESERVE:29;
} RTC_DWR_T;

typedef RTC_TLR_T   RTC_TAR_T;
typedef RTC_CLR_T   RTC_CAR_T;

typedef struct
{
    volatile uint32_t  LIR:1;
    volatile const  uint32_t  RESERVE:31;
} RTC_LIR_T;

typedef struct
{
    volatile uint32_t  AIER:1;
    volatile uint32_t  TIER:1;
    volatile const  uint32_t  RESERVE:30;
} RTC_RIER_T;




typedef struct
{
    volatile uint32_t  AI:1;
    volatile uint32_t  TI:1;
    volatile const  uint32_t  RESERVE:30;
} RTC_RIIR_T;

typedef struct
{
    volatile uint32_t  TTR:3;
    volatile const  uint32_t  RESERVE:30;
} RTC_TTR_T;

typedef struct
{
    volatile uint32_t  PTOUT:16;
    volatile const  uint32_t  RESERVE0:7;
    volatile uint32_t  PWROFF:1;
    volatile const  uint32_t  RESERVE1:8;
} RTC_PWRCON_T;

typedef struct
{
    RTC_INIR_T  INIR;
    RTC_AER_T   AER;
    RTC_FCR_T   FCR;
    RTC_TLR_T   TLR;
    RTC_CLR_T   CLR;
    RTC_TSSR_T  TSSR;
    RTC_DWR_T   DWR;
    RTC_TAR_T   TAR;
    RTC_CAR_T   CAR;
    RTC_LIR_T   LIR;
    RTC_RIER_T  RIER;
    RTC_RIIR_T  RIIR;
    RTC_TTR_T   TTR;
    RTC_PWRCON_T   PWRCON;
} RTC_T;


 
typedef struct
{
    volatile uint32_t  RSLT:16;
    volatile uint32_t  OVERRUN:1;
    volatile uint32_t  VALID:1;
    volatile const  uint32_t  RESERVE1:14;
} ADC_ADDR_T;

typedef struct
{
    volatile uint32_t  ADEN:1;
    volatile uint32_t  ADIE:1;
    volatile uint32_t  ADMD:2;
    volatile uint32_t  TRGS:2;
    volatile uint32_t  TRGCOND:2;
    volatile uint32_t  TRGEN:1;
    volatile uint32_t  PTEN:1;
    volatile uint32_t  DIFF:1;
    volatile uint32_t  ADST:1;
    volatile const  uint32_t  RESERVE0:4;
    volatile uint32_t  ADCLKDIV:7;
    volatile const  uint32_t  RESERVE1:9;
} ADC_ADCR_T;



typedef struct
{
    volatile uint32_t  CHEN:8;
    volatile uint32_t  PRESEL:2;
    volatile const  uint32_t  RESERVE:22;
} ADC_ADCHER_T;


typedef struct
{
    volatile uint32_t  CMPEN:1;
    volatile uint32_t  CMPIE:1;
    volatile uint32_t  CMPCOND:1;
    volatile uint32_t  CMPCH:3;
    volatile const  uint32_t  RESERVE0:2;
    volatile uint32_t  CMPMATCNT:4;
    volatile const  uint32_t  RESERVE1:4;
    volatile uint32_t  CMPD:12;
    volatile const  uint32_t  RESERVE2:4;
} ADC_ADCMPR_T;

typedef struct
{
    volatile uint32_t  ADF:1;
    volatile uint32_t  CMPF0:1;
    volatile uint32_t  CMPF1:1;
    volatile uint32_t  BUSY:1;
    volatile uint32_t  CHANNEL:3;
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  VALID:8;
    volatile uint32_t  OVERRUN:8;
    volatile const  uint32_t  RESERVE1:8;
} ADC_ADSR_T;

typedef struct
{
    volatile uint32_t  CALEN:1;
    volatile uint32_t  CALDONE:1;
    volatile const  uint32_t  RESERVE:30;
} ADC_ADCALR_T;

typedef struct
{
    ADC_ADDR_T      ADDR[8];
    ADC_ADCR_T      ADCR;
    ADC_ADCHER_T    ADCHER;
    ADC_ADCMPR_T    ADCMPR[2];
    ADC_ADSR_T      ADSR;
    ADC_ADCALR_T    ADCALR;

} ADC_T;

 
typedef struct
{
    volatile uint32_t  CMPEN:1;
    volatile uint32_t  CMPIE:1;
    volatile uint32_t  CMP_HYSEN:1;
    volatile uint32_t  CP:1;
    volatile uint32_t  CN:1;
    volatile uint32_t  COE:1;
    volatile const  uint32_t  RESERVE:26;
} ACMP_CMPCR_T;

typedef struct
{
    volatile uint32_t  CMPF1:1;
    volatile uint32_t  CMPF2:1;
    volatile uint32_t  CO1:1;
    volatile uint32_t  CO2:1;
    volatile const  uint32_t  RESERVE:28;
} ACMP_CMPSR_T;

typedef struct
{
    ACMP_CMPCR_T CMPCR[2];
    ACMP_CMPSR_T CMPSR;
} ACMP_T;

 
typedef struct
{
    volatile uint32_t  XTL12M_EN:1;
    volatile uint32_t  XTL32K_EN:1;
    volatile uint32_t  OSC22M_EN:1;
    volatile uint32_t  OSC10K_EN:1;
    volatile uint32_t  WU_DLY:1;
    volatile uint32_t  WINT_EN:1;
    volatile uint32_t  PD_WU_STS:1;
    volatile uint32_t  PWR_DOWN:1;
    volatile uint32_t  PD_WAIT_CPU:1;
    volatile const  uint32_t  RESERVE:23;
} SYSCLK_PWRCON_T;

typedef struct
{
    volatile uint32_t  CPU_EN:1;
    volatile uint32_t  PDMA_EN:1;
    volatile uint32_t  ISP_EN:1;
    volatile const  uint32_t  RESERVE:29;
} SYSCLK_AHBCLK_T;

typedef struct
{
    volatile uint32_t  WDG_EN:1;
    volatile uint32_t  RTC_EN:1;
    volatile uint32_t  TMR0_EN:1;
    volatile uint32_t  TMR1_EN:1;
    volatile uint32_t  TMR2_EN:1;
    volatile uint32_t  TMR3_EN:1;
    volatile const  uint32_t  RESERVE0:2;
    volatile uint32_t  I2C0_EN:1;
    volatile uint32_t  I2C1_EN:1;
    volatile const  uint32_t  RESERVE1:2;
    volatile uint32_t  SPI0_EN:1;
    volatile uint32_t  SPI1_EN:1;
    volatile uint32_t  SPI2_EN:1;
    volatile uint32_t  SPI3_EN:1;
    volatile uint32_t  UART0_EN:1;
    volatile uint32_t  UART1_EN:1;
    volatile const  uint32_t  RESERVE2:2;
    volatile uint32_t  PWM01_EN:1;
    volatile uint32_t  PWM23_EN:1;
    volatile const  uint32_t  RESERVE3:2;
    volatile uint32_t  CAN0_EN:1;
    volatile uint32_t  CAN1_EN:1;
    volatile const  uint32_t  RESERVE4:1;
    volatile uint32_t  USBD_EN:1;
    volatile uint32_t  ADC_EN:1;
    volatile const  uint32_t  RESERVE5:1;
    volatile uint32_t  ACMP_EN:1;
    volatile uint32_t  PS2_EN:1;
} SYSCLK_APBCLK_T;

typedef struct
{
    volatile uint32_t  HCLK_S:3;
    volatile uint32_t  STCLK_S:3;
    volatile const  uint32_t  RESERVE:26;
} SYSCLK_CLKSEL0_T;


typedef struct
{
    volatile uint32_t  WDG_S:2;
    volatile uint32_t  ADC_S:2;
    volatile const  uint32_t  RESERVE1:4;
    volatile uint32_t  TMR0_S:3;
    volatile const  uint32_t  RESERVE2:1;
    volatile uint32_t  TMR1_S:3;
    volatile const  uint32_t  RESERVE3:1;
    volatile uint32_t  TMR2_S:3;
    volatile const  uint32_t  RESERVE4:1;
    volatile uint32_t  TMR3_S:3;
    volatile const  uint32_t  RESERVE5:1;
    volatile uint32_t  UART_S:2;
    volatile uint32_t  CAN_S:2;
    volatile uint32_t  PWM10_S:2;
    volatile uint32_t  PWM32_S:2;
} SYSCLK_CLKSEL1_T;

typedef struct
{
    volatile uint32_t  HCLK_N:4;
    volatile uint32_t  USB_N:4;
    volatile uint32_t  UART_N:4;
    volatile uint32_t  CAN_N:4;
    volatile uint32_t  ADC_N:8;
    volatile const  uint32_t  RESERVE:8;
} SYSCLK_CLKDIV_T;

typedef struct
{
    volatile uint32_t  FB_DV:9;
    volatile uint32_t  IN_DV:5;
    volatile uint32_t  OUT_DV:2;
    volatile uint32_t  PD:1;
    volatile uint32_t  BP:1;
    volatile uint32_t  OE:1;
    volatile uint32_t  PLL_SRC:1;
    volatile const  uint32_t  RESERVE:12;
} SYSCLK_PLLCON_T;

typedef struct
{    
    volatile uint32_t  TEST_SEL:8;
    volatile const  uint32_t  RESERVE:24;
} SYSCLK_TREG_T;

typedef struct
{
    SYSCLK_PWRCON_T    PWRCON;
    SYSCLK_AHBCLK_T    AHBCLK;
    SYSCLK_APBCLK_T    APBCLK;
    uint32_t           RESERVED0;
    SYSCLK_CLKSEL0_T   CLKSEL0;
    SYSCLK_CLKSEL1_T   CLKSEL1;
    SYSCLK_CLKDIV_T    CLKDIV;
    uint32_t           RESERVED1;
	SYSCLK_PLLCON_T    PLLCON;
    
} SYSCLK_T;

 
typedef volatile const uint32_t GCR_PDID_T;  

typedef struct
{
    volatile uint32_t  RSTS_POR:1;
	volatile uint32_t  RSTS_PAD:1;
	volatile uint32_t  RSTS_WDG:1;
	volatile uint32_t  RSTS_LVR:1;
	volatile uint32_t  RSTS_BOD:1;
	volatile uint32_t  RSTS_MCU:1;
	volatile uint32_t  RSTS_PMU:1;    
	volatile const  uint32_t  RESERVE:25;
} GCR_RSTSRC_T;


typedef struct
{
    volatile uint32_t  CHIP_RST:1;
    volatile uint32_t  CPU_RST:1;
    volatile uint32_t  PDMA_RST:1;
    volatile const  uint32_t  RESERVE:29;
} GCR_IPRSTC1_T;

typedef struct
{
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  GPIO_RST:1;
    volatile uint32_t  TMR0_RST:1;
    volatile uint32_t  TMR1_RST:1;
    volatile uint32_t  TMR2_RST:1;
    volatile uint32_t  TMR3_RST:1;
    volatile const  uint32_t  RESERVE1:2;
    volatile uint32_t  I2C0_RST:1;
    volatile uint32_t  I2C1_RST:1;
    volatile const  uint32_t  RESERVE2:2;
    volatile uint32_t  SPI0_RST:1;
    volatile uint32_t  SPI1_RST:1;
    volatile uint32_t  SPI2_RST:1;
    volatile uint32_t  SPI3_RST:1;
    volatile uint32_t  UART0_RST:1;
    volatile uint32_t  UART1_RST:1;
    volatile const  uint32_t  RESERVE3:2;
    volatile uint32_t  PWM_RST:1;
    volatile const  uint32_t  RESERVE4:1;
    volatile uint32_t  ACMP_RST:1;
    volatile uint32_t  PS2_RST:1;
    volatile uint32_t  CAN0_RST:1;
    volatile uint32_t  CAN1_RST:1;
    volatile const  uint32_t  RESERVE5:1;
    volatile uint32_t  USBD_RST:1;
    volatile uint32_t  ADC_RST:1;
    volatile const  uint32_t  RESERVE6:3;
} GCR_IPRSTC2_T;

typedef volatile uint32_t GCR_MISCR_T; 


typedef struct
{
    volatile uint32_t  BOD_EN:1;
    volatile uint32_t  BOD_VL:2;
    volatile uint32_t  BOD_RSTEN:1;
    volatile uint32_t  BOD_BYP_EN:1;
    volatile uint32_t  BOD_LPM:1;
    volatile uint32_t  BOD_OUT:1;
	volatile uint32_t  LVR_EN:1;
	volatile uint32_t  VTEMP_EN:1;
	volatile uint32_t  LDO_BYP:1;
    volatile const  uint32_t  RESERVE1:22;
} GCR_BODCR_T;

typedef volatile uint32_t GCR_PORCR_T; 


typedef struct
{
    volatile uint32_t ADC0:1;
    volatile uint32_t ADC1:1;
    volatile uint32_t ADC2:1;
    volatile uint32_t ADC3:1;
    volatile uint32_t ADC4:1;
    volatile uint32_t ADC5:1;
    volatile uint32_t ADC6:1;
    volatile uint32_t ADC7:1;
    volatile uint32_t I2C0_SDA:1;
    volatile uint32_t I2C0_SCL:1;
    volatile uint32_t I2C1_SDA:1;
    volatile uint32_t I2C1_SCL:1;
    volatile uint32_t PWM0:1;
    volatile uint32_t PWM1:1;
    volatile uint32_t PWM2:1;
    volatile uint32_t PWM3:1;
    volatile uint32_t SCHMITT:16;    
} GCR_GPAMFP_T;

typedef struct
{
    volatile uint32_t UART0_RX:1;
    volatile uint32_t UART0_TX:1;
    volatile uint32_t UART0_nRTS:1;
    volatile uint32_t UART0_nCTS:1;
    volatile uint32_t UART1_RX:1;
    volatile uint32_t UART1_TX:1;
    volatile uint32_t UART1_nRTS:1;
    volatile uint32_t UART1_nCTS:1;
    volatile uint32_t TM0:1;
    volatile uint32_t TM1:1;
    volatile uint32_t TM2:1;
    volatile uint32_t TM3:1;
    volatile uint32_t CPO0:1;
    volatile uint32_t CPO1:1;
    volatile uint32_t INT0:1;
    volatile uint32_t INT1:1;
    volatile uint32_t SCHMITT:16;    
} GCR_GPBMFP_T;

typedef struct
{
    volatile uint32_t SPI0_SS0:1;
    volatile uint32_t SPI0_CLK:1;
    volatile uint32_t SPI0_MISO0:1;
    volatile uint32_t SPI0_MOSI0:1;
    volatile uint32_t SPI0_MISO1:1;
    volatile uint32_t SPI0_MOSI1:1;
    volatile uint32_t CPP0:1;
    volatile uint32_t CPN0:1;
    volatile uint32_t SPI1_SS0:1;
    volatile uint32_t SPI1_CLK:1;
    volatile uint32_t SPI1_MISO0:1;
    volatile uint32_t SPI1_MOSI0:1;
    volatile uint32_t SPI1_MISO1:1;
    volatile uint32_t SPI1_MOSI1:1;
    volatile uint32_t CPP1:1;
    volatile uint32_t CPN1:1;
    volatile uint32_t SCHMITT:16;    
} GCR_GPCMFP_T;

typedef struct
{
    volatile uint32_t SPI2_SS0:1;
    volatile uint32_t SPI2_CLK:1;
    volatile uint32_t SPI2_MISO0:1;
    volatile uint32_t SPI2_MOSI0:1;
    volatile uint32_t SPI2_MISO1:1;
    volatile uint32_t SPI2_MOSI1:1;
    volatile uint32_t CAN0_RX:1;
    volatile uint32_t CAN0_TX:1;
    volatile uint32_t SPI3_SS0:1;
    volatile uint32_t SPI3_CLK:1;
    volatile uint32_t SPI3_MISO0:1;
    volatile uint32_t SPI3_MOSI0:1;
    volatile uint32_t SPI3_MISO1:1;
    volatile uint32_t SPI3_MOSI1:1;
    volatile uint32_t CAN1_RX:1;
    volatile uint32_t CAN1_TX:1;
    volatile uint32_t SCHMITT:16;    
} GCR_GPDMFP_T;


typedef struct
{
    volatile const  uint32_t  RESERVE:16;
    volatile uint32_t  SCHMITT:16;
} GCR_GPEMFP_T;

typedef struct
{
    volatile uint32_t  SPI0_SS1:1;   
    volatile uint32_t  SPI1_SS1:1;   
    volatile uint32_t  SPI2_SS1:1;   
    volatile uint32_t  SPI3_SS1:1;   
    volatile const  uint32_t  RESERVE:28;
    
} GCR_USPIMFP_T;

typedef volatile uint32_t GCR_REGLOCK_T;
typedef volatile uint32_t GCR_RCADJ_T;


typedef struct
{
    volatile uint32_t  INTSRC:3;
    volatile const  uint32_t  RESERVE:29;
} GCR_INTSRC_T;

typedef struct
{
    volatile uint32_t  NMISEL:5;
    volatile const  uint32_t  RESERVE0:2;
    volatile uint32_t  INT_TEST:1;
    volatile const  uint32_t  RESERVE1:24;
} GCR_NMISEL_T;


typedef volatile uint32_t GCR_MCUIRQ_T;

typedef struct
{
    GCR_PDID_T      PDID;
    GCR_RSTSRC_T    RSTSRC;
    GCR_IPRSTC1_T   IPRSTC1;
    GCR_IPRSTC2_T   IPRSTC2;
    uint32_t        RESERVE0;
	GCR_MISCR_T     MISCR;
    GCR_BODCR_T     BODCR;
    GCR_PORCR_T		PORCR;
	uint32_t        RESERVE1[4];
    GCR_GPAMFP_T    GPAMFP;
    GCR_GPBMFP_T    GPBMFP;
    GCR_GPCMFP_T    GPCMFP;
    GCR_GPDMFP_T    GPDMFP;
    GCR_GPEMFP_T    GPEMFP;
    uint32_t        RESERVE2[3];
	GCR_USPIMFP_T   USPIMFP;
    uint32_t        RESERVE3[43];
    GCR_REGLOCK_T   REGLOCK;
	uint32_t        RESERVE4[3];
	GCR_RCADJ_T		RCADJ;
} GCR_T;



typedef struct
{
    GCR_INTSRC_T    INTSRC;
    GCR_NMISEL_T    NMISEL;
    GCR_MCUIRQ_T    MCUIRQ;   
} GCR_INT_T;

 
typedef struct
{
    volatile uint32_t  ISPEN:1;
    volatile uint32_t  BS:1;
    volatile const  uint32_t  RESERVE0:3;
    volatile uint32_t  LDUEN:1;
    volatile uint32_t  ISPFF:1;
    volatile uint32_t  SWRST:1;
    volatile uint32_t  PT:3;
	volatile const  uint32_t  RESERVE1:1;
	volatile uint32_t  ET:3;
    volatile const  uint32_t  RESERVE2:17;

} FMC_ISPCON_T;

typedef volatile uint32_t FMC_ISPADR_T;
typedef volatile uint32_t FMC_ISPDAT_T;

typedef struct
{
    volatile uint32_t  FCTRL:4;
    volatile uint32_t  FCEN:1;
    volatile uint32_t  FOEN:1;
    volatile const  uint32_t  RESERVE:26;
} FMC_ISPCMD_T;

typedef struct
{
    volatile uint32_t  ISPGO:1;
    volatile const  uint32_t  RESERVE:31;
} FMC_ISPTRG_T;

typedef volatile const uint32_t FMC_DFBADR_T;

typedef struct
{
    volatile uint32_t  FPSEN:1;
    volatile uint32_t  FATS:3;
    volatile const  uint32_t  RESERVE:28;
} FMC_FATCON_T;

typedef struct
{
    FMC_ISPCON_T ISPCON;
    FMC_ISPADR_T ISPADR;
    FMC_ISPDAT_T ISPDAT;
    FMC_ISPCMD_T ISPCMD;
    FMC_ISPTRG_T ISPTRG;
    FMC_DFBADR_T DFBADR;
    FMC_FATCON_T FATCON;
} FMC_T;


 
typedef struct
{
    volatile uint32_t  PS2EN:1;
    volatile uint32_t  TXINTEN:1;
    volatile uint32_t  RXINTEN:1;
    volatile uint32_t  TXFIFO_DEPTH:4;
    volatile uint32_t  ACK:1;
    volatile uint32_t  CLRFIFO:1;
    volatile uint32_t  OVERRIDE:1;
    volatile uint32_t  FPS2CLK:1;
    volatile uint32_t  FPS2DAT:1;
    volatile const  uint32_t  RESERVE:20;
} PS2_CON_T;

typedef volatile uint32_t PS2_DATA_T;

typedef struct
{
    volatile uint32_t  PS2CLK:1;
    volatile uint32_t  PS2DATA:1;
    volatile uint32_t  FRAMERR:1;
    volatile uint32_t  RXPARTY:1;
    volatile uint32_t  RXBUSY:1;
    volatile uint32_t  TXBUSY:1;
    volatile uint32_t  RXOVF:1;
    volatile uint32_t  TXEMPTY:1;
    volatile uint32_t  BYTEIDX:4;
    volatile const  uint32_t  RESERVE:20;
} PS2_STATUS_T;

typedef volatile uint32_t PS2_INTID_T;

typedef struct
{
    PS2_CON_T       PS2CON;
    PS2_DATA_T      TXDATA[4];
    PS2_DATA_T      RXDATA;
    PS2_STATUS_T    STATUS;
    PS2_INTID_T     INTID;
} PS2_T;

 
typedef struct
{
    volatile uint32_t  RSTM:1;
	volatile uint32_t  LOM:1;
    volatile const  uint32_t  RESERVE:30;
    
} CAN_OPMODE_T;

typedef struct
{
    volatile uint32_t  TR:1;
	volatile uint32_t  ABRT:1;
    volatile const  uint32_t  RESERVE2:3;
	volatile uint32_t  OVERFLOAD_EN:1;
	volatile uint32_t  WAKEUP_EN:1;
    volatile uint32_t  CAN_EN:1;
    volatile const  uint32_t  RESERVE:24;
} CAN_CMD_T;

typedef struct
{
    volatile const  uint32_t  RESERVE0:3;
    volatile uint32_t  TCS:1;
    volatile uint32_t  RS:1;
    volatile uint32_t  TS:1;
    volatile uint32_t  BS:1;
    volatile uint32_t  BS2:1;
    volatile uint32_t  EAS:1;
    volatile uint32_t  EPS:1;
    volatile const  uint32_t  RESERVE1:22;
} CAN_BSR_T;

typedef struct
{
    volatile uint32_t  RI:1;
    volatile uint32_t  TI:1;
    volatile const  uint32_t  RESERVE0:2;
    volatile uint32_t  WUI:1;
    volatile const  uint32_t  RESERVE1:1;
    volatile uint32_t  ALI:1;
    volatile uint32_t  BEI:1;
    volatile const  uint32_t  RESERVE2:24;
} CAN_INTR_T;

typedef struct
{
    volatile uint32_t  RIE:1;
    volatile uint32_t  TIE:1;
    volatile const  uint32_t  RESERVE0:2;
    volatile uint32_t  WUIE:1;
    volatile const  uint32_t  RESERVE1:1;
    volatile uint32_t  ALIE:1;
    volatile uint32_t  BEIE:1;
    volatile const  uint32_t  RESERVE2:24;
} CAN_INTEN_T;

typedef struct
{
    volatile uint32_t  BRP:4;
    volatile uint32_t  SJW:2;
    volatile uint32_t  TSEG1:5;
    volatile uint32_t  TSEG2:4;
    volatile uint32_t  SAMP:1;
    volatile const  uint32_t  RESERVE2:16;
} CAN_BTIMR_T;

typedef struct
{
    volatile uint32_t  BIT_ERR:4;
    volatile uint32_t  ACK_ERR:2;
    volatile uint32_t  CRC_ERR:5;
    volatile uint32_t  FORM_ERR:4;
    volatile uint32_t  STUFF_ERR:1;
    volatile const  uint32_t  RESERVE:16;
} CAN_ERRCR_T;

typedef struct
{
    volatile uint32_t  RECNT:8;
    volatile const  uint32_t  RESERVE:24;
} CAN_RECNTR_T;

typedef struct
{
    volatile uint32_t  TECNT:8;
    volatile const  uint32_t  RESERVE:24;
} CAN_TECNTR_T;

typedef struct
{
    volatile uint32_t  TXDLC:6;
    volatile uint32_t  TXRTR:1;
    volatile uint32_t  TXFF:1;
    volatile const  uint32_t  RESERVE:24;
} CAN_TXFINFO_T;

typedef struct
{
    volatile const  uint32_t  RESERVE:3;
    volatile uint32_t  TXID:29;
} CAN_TXID_T;

typedef volatile uint32_t CAN_TXDATA_T;

typedef struct
{
    volatile uint32_t  RXDLC:4;
    volatile const  uint32_t  RESERVE0:2;
    volatile uint32_t  RXRTR:1;
    volatile uint32_t  RXIDE:1;
    volatile const  uint32_t  RESERVE1:24;
} CAN_RXFINFO_T;

typedef struct
{
    volatile const  uint32_t  RESERVE:3;
    volatile uint32_t  RXID:29;
} CAN_RXID_T;

typedef volatile uint32_t CAN_RXDATA_T;

typedef struct
{
    volatile const  uint32_t  RESERVE:3;
    volatile uint32_t  ACR:29;
} CAN_ACR_T;

typedef struct
{
    volatile const  uint32_t  RESERVE:3;
    volatile uint32_t  AMR:29;
} CAN_AMR_T;


typedef struct
{
    volatile const  uint32_t  RESERVE:32;
} CAN_RESERVE_T;

typedef struct
{
    CAN_OPMODE_T    OPMODE;
    CAN_CMD_T       CMD;
	CAN_BSR_T       BSR;    
	CAN_INTR_T      INTR;

    CAN_INTEN_T     INTEN;
    CAN_BTIMR_T     BTIMR;
	CAN_RESERVE_T	PROTECT[2];

    CAN_ERRCR_T     ERRCR;
	CAN_RESERVE_T	PROTECT1;
    CAN_RECNTR_T    RECNTR;
    CAN_TECNTR_T    TECNTR;

    CAN_TXFINFO_T   TXFINFO;
    CAN_TXID_T      TXID;
    CAN_TXDATA_T    TXDATA[2];

    CAN_RXFINFO_T   RXFINFO;
    CAN_RXID_T      RXID;
    CAN_RXDATA_T    RX_DATA[2];
    CAN_ACR_T       ACR;
    CAN_AMR_T       AMR;    
} CAN_T;


 
typedef struct
{
    volatile uint32_t  BUS:1;
    volatile uint32_t  USB:1;
    volatile uint32_t  FLD:1;
    volatile uint32_t  WAKEUP:1;
    volatile const  uint32_t  RESERVE0:4;
    volatile uint32_t  WAKEUP_EN:1;
    volatile const  uint32_t  RESERVE1:6;
    volatile uint32_t  INNAK_EN:1;
    volatile const  uint32_t  RESERVE2:16;
} USBD_IEF_T;

typedef struct
{
    volatile uint32_t  BUS:1;
    volatile uint32_t  USB:1;
    volatile uint32_t  FLD:1;
    volatile uint32_t  WAKEUP:1;
    volatile const  uint32_t  RESERVE0:12;
    volatile uint32_t  EPTF:6;
    volatile const  uint32_t  RESERVE1:9;
    volatile uint32_t  SETUP:1;
} USBD_EVF_T;

typedef struct
{
    volatile uint32_t  FADDR:7;
    volatile const  uint32_t  RESERVE:25;
} USBD_FADDR_T;

typedef struct
{
    volatile const  uint32_t  RESERVE0:7;
    volatile uint32_t  OVERRUN:1;
    volatile uint32_t  STS0:3;
    volatile uint32_t  STS1:3;
    volatile uint32_t  STS2:3;
    volatile uint32_t  STS3:3;
    volatile uint32_t  STS4:3;
    volatile uint32_t  STS5:3;
    volatile const  uint32_t  RESERVE1:6;
} USBD_STS_T;



typedef struct
{
    volatile uint32_t  USBRST:1;
    volatile uint32_t  SUSPEND:1;
    volatile uint32_t  RESUME:1;
    volatile uint32_t  TIMEOUT:1;
    volatile uint32_t  PHY_EN:1;
    volatile uint32_t  RWAKEUP:1;
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  USB_EN:1;
	volatile uint32_t  DPPU_EN:1;
	volatile uint32_t  PDB:1;
    volatile const  uint32_t  RESERVE1:22;
} USBD_ATTR_T;



typedef struct
{
    volatile uint32_t  FLODET:1;
    volatile const  uint32_t  RESERVE:31;
} USBD_FLODET_T;

typedef struct
{
    volatile const  uint32_t  RESERVE0:3;
    volatile uint32_t  BUFSEG:6;
    volatile const  uint32_t  RESERVE:23;
} USBD_BUFSEG_T;

typedef struct
{
    volatile uint32_t  MXPLD:9;
    volatile const  uint32_t  RESERVE:23;
} USBD_MXPLD_T;

typedef struct
{
    volatile uint32_t  EPT:4;
    volatile uint32_t  ISOCH:1;
    volatile uint32_t  STATE:2;
    volatile uint32_t  DSQ:1;
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  STALL_CTL:1;
    volatile const  uint32_t  RESERVE1:22;
} USBD_CFG_T;

typedef struct
{
    volatile uint32_t  CFGP:1;
    volatile uint32_t  STALL:1;
    volatile const  uint32_t  RESERVE:30;
} USBD_CFGP_T;

typedef struct
{
    volatile uint32_t  DRVSE0:1;
    volatile const  uint32_t  RESERVE:31;
} USBD_DRVSE0_T;

typedef struct
{
    volatile uint32_t  BISTEN:1;
    volatile uint32_t  FINISH:1;
    volatile uint32_t  BISTFAIL:1;
    volatile const  uint32_t  RESERVE:29;
} USBD_BIST_T;

typedef struct
{
    volatile uint32_t  PDMA_RW:1;
    volatile uint32_t  PDMA_EN:1;
    volatile const  uint32_t  RESERVE:30;
} USBD_PDMA_T;


typedef struct
{
    USBD_BUFSEG_T   BUFSEG;
    USBD_MXPLD_T    MXPLD;
    USBD_CFG_T      CFG;
    USBD_CFGP_T     CFGP;
} USBD_EP_T;

typedef struct
{
    USBD_IEF_T      IEF;
    USBD_EVF_T      EVF;
    USBD_FADDR_T    FADDR;
    USBD_STS_T      STS;
    USBD_ATTR_T     ATTR;
    USBD_FLODET_T   FLODET;
    USBD_BUFSEG_T   BUFSEG;
    uint32_t        RESERVE0;
	USBD_EP_T       EP[6];
    uint32_t        RESERVE1[4];
	USBD_DRVSE0_T   DRVSE0;
    uint32_t        RESERVE2[3];
	USBD_BIST_T     BIST;
    USBD_PDMA_T     PDMA;
} USBD_T;


 
typedef struct
{
    volatile uint32_t  PDMACEN:1;
    volatile uint32_t  SW_RST:1;
    volatile uint32_t  MODE_SEL:2;
    volatile uint32_t  SAD_SEL:2;
    volatile uint32_t  DAD_SEL:2;
    volatile const  uint32_t  RESERVE0:4;
    volatile uint32_t  WAR_BCR_SEL:4;
    volatile const  uint32_t  RESERVE1:3;
    volatile uint32_t  APB_TWS:2;
    volatile const  uint32_t  RESERVE2:2;
    volatile uint32_t  TRIG_EN:1;
    volatile const  uint32_t  RESERVE3:8;
} PDMA_CSR_T;

typedef volatile uint32_t PDMA_SAR_T;
typedef volatile uint32_t PDMA_DAR_T;

typedef volatile uint32_t PDMA_BCR_T;

typedef volatile uint32_t PDMA_CSAR_T;
typedef volatile uint32_t PDMA_CDAR_T;

typedef struct
{
    volatile uint32_t  CBCR:24;
    volatile const  uint32_t  RESERVE:8;
} PDMA_CBCR_T;

typedef struct
{
    volatile uint32_t  TABORT_IE:1;
    volatile uint32_t  BLKD_IE:1;
    volatile uint32_t  WAR_IE:1;
    volatile const  uint32_t  RESERVE:29;
} PDMA_IER_T;



typedef struct
{
    volatile uint32_t  TABORT_IF:1;
    volatile uint32_t  BLKD_IF:1;
    volatile const  uint32_t  RESERVE:6;
	volatile uint32_t  WAR_IF:4;
    volatile const  uint32_t  RESERVE1:3;
	volatile uint32_t  BUSY:1;
	volatile const  uint32_t  RESERVE2:15;
	volatile uint32_t  INTR:1;
} PDMA_ISR_T;

typedef volatile uint32_t PDMA_SBUF_T;

typedef struct
{
    volatile uint32_t  PDMA_RST:1;
    volatile const  uint32_t  RESERVE0:7;
    volatile uint32_t  HCLK0_EN:1;
    volatile uint32_t  HCLK1_EN:1;
    volatile uint32_t  HCLK2_EN:1;
    volatile uint32_t  HCLK3_EN:1;
    volatile uint32_t  HCLK4_EN:1;
    volatile uint32_t  HCLK5_EN:1;
    volatile uint32_t  HCLK6_EN:1;
    volatile uint32_t  HCLK7_EN:1;
    volatile uint32_t  HCLK8_EN:1;
    volatile uint32_t  HCLK9_EN:1;
    volatile uint32_t  HCLK10_EN:1;
    volatile uint32_t  HCLK11_EN:1;
    volatile const  uint32_t  RESERVE1:12;
} PDMA_GCRCSR_T;

typedef struct
{
    volatile uint32_t  UART0_RXSEL:4;
    volatile uint32_t  UART0_TXSEL:4;
    volatile uint32_t  UART1_RXSEL:4;
    volatile uint32_t  UART1_TXSEL:4;
    volatile uint32_t  USBD_RXSEL:4;
    volatile uint32_t  USBD_TXSEL:4;
    volatile uint32_t  ADC_RXSEL:4;
    volatile uint32_t  ADC_TXSEL:4;
} PDMA_PDSSR1_T;
                                                        

typedef struct
{
    volatile uint32_t  SPI0_RXSEL:4;
    volatile uint32_t  SPI0_TXSEL:4;
    volatile uint32_t  SPI1_RXSEL:4;
    volatile uint32_t  SPI1_TXSEL:4;
    volatile uint32_t  SPI2_RXSEL:4;
    volatile uint32_t  SPI2_TXSEL:4;
    volatile uint32_t  SPI3_RXSEL:4;
    volatile uint32_t  SPI3_TXSEL:4;
} PDMA_PDSSR0_T;

typedef volatile uint32_t PDMA_GCRISR_T;

typedef struct
{
    PDMA_GCRCSR_T   GCRCSR;
    PDMA_PDSSR0_T   PDSSR0;
    PDMA_PDSSR1_T   PDSSR1;  
    PDMA_GCRISR_T   GCRISR;  
} PDMA_GCR_T;

typedef struct 
{
    PDMA_CSR_T      CSR;
    PDMA_SAR_T      SAR;
    PDMA_DAR_T      DAR;
    PDMA_BCR_T      BCR;
    uint32_t        POINT;
    PDMA_CSAR_T     CSAR;
    PDMA_CDAR_T     CDAR;
    PDMA_CBCR_T     CBCR;
    PDMA_IER_T      IER;
    PDMA_ISR_T      ISR;
    PDMA_SBUF_T     SBUF[4];
} PDMA_T;

 
typedef struct
{
    volatile uint32_t  CP0:8;
    volatile uint32_t  CP1:8;
    volatile uint32_t  DZI0:8;
    volatile uint32_t  DZI1:8;
} PWM_PPR_T;

typedef struct
{
    volatile uint32_t  CSR0:3;
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  CSR1:3;
    volatile const  uint32_t  RESERVE1:1;
    volatile uint32_t  CSR2:3;
    volatile const  uint32_t  RESERVE2:1;
    volatile uint32_t  CSR3:3;
    volatile const  uint32_t  RESERVE:17;
} PWM_CSR_T;

typedef struct
{
    volatile uint32_t  CH0EN:1;
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  CH0INV:1;
    volatile uint32_t  CH0MOD:1;
    volatile uint32_t  DZEN0:1;
    volatile uint32_t  DZEN1:1;
    volatile const  uint32_t  RESERVE1:2;
    volatile uint32_t  CH1EN:1;
    volatile const  uint32_t  RESERVE2:1;
    volatile uint32_t  CH1INV:1;
    volatile uint32_t  CH1MOD:1;
    volatile const  uint32_t  RESERVE3:4;
    volatile uint32_t  CH2EN:1;
    volatile const  uint32_t  RESERVE4:1;
    volatile uint32_t  CH2INV:1;
    volatile uint32_t  CH2MOD:1;
    volatile const  uint32_t  RESERVE5:4;
    volatile uint32_t  CH3EN:1;
    volatile const  uint32_t  RESERVE6:1;
    volatile uint32_t  CH3INV:1;
    volatile uint32_t  CH3MOD:1;
    volatile const  uint32_t  RESERVE7:4;   
} PWM_PCR_T;

typedef volatile uint32_t PWM_CNR_T;

typedef volatile uint32_t PWM_CMR_T;

typedef volatile uint32_t PWM_PDR_T;

typedef struct
{
    volatile uint32_t  PWMIE0:1;
    volatile uint32_t  PWMIE1:1;
    volatile uint32_t  PWMIE2:1;
    volatile uint32_t  PWMIE3:1;
	volatile const  uint32_t  RESERVE:28;
} PWM_PIER_T;


typedef struct
{
    volatile uint32_t  PWMIF0:1;
    volatile uint32_t  PWMIF1:1;
    volatile uint32_t  PWMIF2:1;
    volatile uint32_t  PWMIF3:1;
	volatile const  uint32_t  RESERVE:28;
} PWM_PIIR_T;


typedef struct
{
    volatile uint32_t  INV0:1;
    volatile uint32_t  CRL_IE0:1;
    volatile uint32_t  CFL_IE0:1;
    volatile uint32_t  CAPCH0EN:1;
    volatile uint32_t  CAPIF0:1;
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  CRLRI0:1;
    volatile uint32_t  CFLRI0:1;
    volatile const  uint32_t  RESERVE1:8;
    volatile uint32_t  INV1:1;
    volatile uint32_t  CRL_IE1:1;
    volatile uint32_t  CFL_IE1:1;
    volatile uint32_t  CAPCH1EN:1;
    volatile uint32_t  CAPIF1:1;
    volatile const  uint32_t  RESERVE2:1;
    volatile uint32_t  CRLRI1:1;
    volatile uint32_t  CFLRI1:1;
    volatile const  uint32_t  RESERVE3:8;
} PWM_CCR0_T;


typedef struct
{
    volatile uint32_t  INV2:1;
    volatile uint32_t  CRL_IE2:1;
    volatile uint32_t  CFL_IE2:1;
    volatile uint32_t  CAPCH2EN:1;
    volatile uint32_t  CAPIF2:1;
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  CRLRI2:1;
    volatile uint32_t  CFLRI2:1;
    volatile const  uint32_t  RESERVE1:8;
    volatile uint32_t  INV3:1;
    volatile uint32_t  CRL_IE3:1;
    volatile uint32_t  CFL_IE3:1;
    volatile uint32_t  CAPCH3EN:1;
    volatile uint32_t  CAPIF3:1;
    volatile const  uint32_t  RESERVE2:1;
    volatile uint32_t  CRLRI3:1;
    volatile uint32_t  CFLRI3:1;
    volatile const  uint32_t  RESERVE3:8;
} PWM_CCR1_T;


typedef volatile uint32_t PWM_CRLR_T;

typedef volatile uint32_t PWM_CFLR_T;

typedef volatile uint32_t PWM_CAPENR_T;

typedef struct
{
    volatile uint32_t  PWM0:1;
    volatile uint32_t  PWM1:1;
    volatile uint32_t  PWM2:1;
    volatile uint32_t  PWM3:1;
	volatile const  uint32_t  RESERVE:28;
} PWM_POE_T;


typedef struct
{
    PWM_PPR_T       PPR;
    PWM_CSR_T       CSR;
    PWM_PCR_T       PCR;
    PWM_CNR_T       CNR0;
    PWM_CMR_T       CMR0;
    PWM_PDR_T       PDR0;
    PWM_CNR_T       CNR1;
    PWM_CMR_T       CMR1;
    PWM_PDR_T       PDR1;
    PWM_CNR_T       CNR2;
    PWM_CMR_T       CMR2;
    PWM_PDR_T       PDR2;
    PWM_CNR_T       CNR3;
    PWM_CMR_T       CMR3;
    PWM_PDR_T       PDR3;
    volatile const uint32_t    RESERVE0;
    PWM_PIER_T      PIER;
    PWM_PIIR_T      PIIR;
    volatile const uint32_t    RESERVE1[2];
    PWM_CCR0_T      CCR0;
    PWM_CCR1_T      CCR1;
    PWM_CRLR_T      CRLR0;
    PWM_CFLR_T      CFLR0;
    PWM_CRLR_T      CRLR1;
    PWM_CFLR_T      CFLR1;
    PWM_CRLR_T      CRLR2;
    PWM_CFLR_T      CFLR2;
    PWM_CRLR_T      CRLR3;
    PWM_CFLR_T      CFLR3;
    PWM_CAPENR_T    CAPENR;
    PWM_POE_T       POE;    
        
    
} PWM_T;




 
 
 
 






 


#line 1842 "..\\..\\..\\..\\NUC1XX_BSP\\CMSIS\\CM0\\NUC100.h"









































#line 1896 "..\\..\\..\\..\\NUC1XX_BSP\\CMSIS\\CM0\\NUC100.h"



 
 
 
#line 1908 "..\\..\\..\\..\\NUC1XX_BSP\\CMSIS\\CM0\\NUC100.h"








































#line 1961 "..\\..\\..\\..\\NUC1XX_BSP\\CMSIS\\CM0\\NUC100.h"










typedef volatile unsigned char  vu8;
typedef volatile unsigned long  vu32;
typedef volatile unsigned short vu16;




#line 1984 "..\\..\\..\\..\\NUC1XX_BSP\\CMSIS\\CM0\\NUC100.h"











#line 2027 "..\\..\\..\\..\\NUC1XX_BSP\\CMSIS\\CM0\\NUC100.h"


                                                                                                 
#line 8 "..\\..\\..\\..\\NUC1XX_BSP\\NuvotonPlatform_Keil\\Src\\Driver\\DrvUART.c"

 
 
 
#line 1 "..\\..\\..\\..\\NUC1XX_BSP\\NuvotonPlatform_Keil\\Include\\Driver/DrvUART.h"
 
 
 
 
 



#line 10 "..\\..\\..\\..\\NUC1XX_BSP\\NuvotonPlatform_Keil\\Include\\Driver/DrvUART.h"






 
 
 




 
 
 

							   
 
 
 







#line 45 "..\\..\\..\\..\\NUC1XX_BSP\\NuvotonPlatform_Keil\\Include\\Driver/DrvUART.h"


typedef void (PFN_DRVUART_CALLBACK)(uint32_t userData);

 
 
 




 
 
 
#line 67 "..\\..\\..\\..\\NUC1XX_BSP\\NuvotonPlatform_Keil\\Include\\Driver/DrvUART.h"

 
 
 





 
 
 






 
 
 




 
 
 
#line 102 "..\\..\\..\\..\\NUC1XX_BSP\\NuvotonPlatform_Keil\\Include\\Driver/DrvUART.h"

 
 
 





 
 
 
#line 122 "..\\..\\..\\..\\NUC1XX_BSP\\NuvotonPlatform_Keil\\Include\\Driver/DrvUART.h"
										 



 
 
 
typedef enum 
{
	MODE_UART =0, 
	MODE_IRCR =1, 
	MODE_LIN =2 
} MODE_SEL;


typedef struct DRVUART_STRUCT
{
    uint32_t        u32BaudRate;
    uint8_t	        u8cDataBits;
    uint8_t   	    u8cStopBits;
    uint8_t			u8cParity;
    uint8_t	        u8cRxTriggerLevel;
    uint8_t         u8TimeOut;
}STR_UART_T;


typedef struct IRCR_STRUCT
{
    uint8_t	        u8cRXSelect;
    uint8_t   	    u8cTXSelect;
    uint8_t			u8cInvTX;
    uint8_t	        u8cInvRX;
}STR_IRCR_T;

typedef enum 
{
	UART_PORT0 = 0x000, 
	UART_PORT1 = 0x100000
} UART_PORT;

 
 
 
 
void DrvUART_Close(UART_PORT Port);
void DrvUART_DisableInt(UART_PORT u16Port,uint32_t u32InterruptFlag);
void DrvUART_GetClcok(uint8_t *pu8ClcokSrc, uint8_t *pu8ClcokDiv);
void DrvUART_GetCTS(UART_PORT u16Port,uint8_t *pu8CTSValue,uint8_t *pu8CTSChangeState);
void DrvUART_SetClcok(uint8_t u8ClcokSrc, uint8_t u8ClcokDiv);
void DrvUART_SetFIFOTriggerLevel(UART_PORT u16Port,uint16_t u32TriggerLevel);
void DrvUART_SetRTS(UART_PORT u16Port,uint8_t	u8Value);
void DrvUART_SetRxTimeOut(UART_PORT u16Port,uint8_t u8TimeOut);
void DrvUART_OpenIRCR(UART_PORT u16Port,STR_IRCR_T str_IRCR );
void DrvUART_OpenLIN(UART_PORT u16Port,uint16_t DIRECTION,uint16_t BCNT);

int8_t DrvUART_GetIntStatus(UART_PORT u16Port,uint32_t u32InterruptFlag);
int32_t DrvUART_Read(UART_PORT u16Port,uint8_t *pu8RxBuf,uint32_t	u32ReadBytes);
int32_t DrvUART_Open(UART_PORT port, STR_UART_T *sParam);
int32_t DrvUART_Write(UART_PORT u16Port,uint8_t *pu8TxBuf,uint32_t u32WriteBytes);
int32_t DrvUART_EnableInt(UART_PORT port,uint32_t u32InterruptFlag,PFN_DRVUART_CALLBACK pfncallback);
int32_t DrvUART_GetVersion(void);
int32_t DrvUART_kbhit(void);
uint32_t DrvUART_IsIntEnabled(UART_PORT u16Port,uint32_t u32InterruptFlag);
uint32_t DrvUART_ClearInt(UART_PORT u16Port,uint32_t u32InterruptFlag);
void DrvUART_SetPDMA(UART_PORT u16Port,uint16_t IsEnable);


















#line 13 "..\\..\\..\\..\\NUC1XX_BSP\\NuvotonPlatform_Keil\\Src\\Driver\\DrvUART.c"
#line 1 "..\\..\\..\\..\\NUC1XX_BSP\\NuvotonPlatform_Keil\\Include\\Driver/DrvSYS.h"
 
 
 
 
 



#line 10 "..\\..\\..\\..\\NUC1XX_BSP\\NuvotonPlatform_Keil\\Include\\Driver/DrvSYS.h"


 
 
 

















 
 
 
typedef enum 
{
	E_DRVSYS_EXT_12M = 0,
	E_DRVSYS_INT_22M = 1,	
}E_DRVSYS_SRC_CLK;


 
 
 
typedef enum 
{
	E_SYS_GPIO_RST  = 1,
	E_SYS_TMR0_RST  = 2,
	E_SYS_TMR1_RST  = 3,
	E_SYS_TMR2_RST  = 4,
	E_SYS_TMR3_RST  = 5,
	E_SYS_I2C0_RST  = 8,
	E_SYS_I2C1_RST  = 9,
	E_SYS_SPI0_RST  = 12,
	E_SYS_SPI1_RST  = 13,
	E_SYS_SPI2_RST  = 14,
	E_SYS_SPI3_RST  = 15,
	E_SYS_UART0_RST = 16,
	E_SYS_UART1_RST = 17,	
	E_SYS_PWM_RST   = 20,
	E_SYS_ACMP_RST  = 22,
	E_SYS_PS2_RST   = 23,
	E_SYS_CAN0_RST  = 24,
	E_SYS_CAN1_RST  = 25,
	E_SYS_USBD_RST  = 27,
	E_SYS_ADC_RST   = 28,	
	E_SYS_PDMA_RST  = 32,
}E_SYS_IP_RST;

 
 
 

typedef enum 
{
	E_SYS_WD_CLK    = 0,
	E_SYS_RTC_CLK   = 1,
	E_SYS_TMR0_CLK  = 2,
	E_SYS_TMR1_CLK  = 3,
	E_SYS_TMR2_CLK  = 4,
	E_SYS_TMR3_CLK  = 5,
	E_SYS_I2C0_CLK  = 8,
	E_SYS_I2C1_CLK  = 9,
	E_SYS_SPI0_CLK  = 12,
	E_SYS_SPI1_CLK  = 13,
	E_SYS_SPI2_CLK  = 14,
	E_SYS_SPI3_CLK  = 15,
	E_SYS_UART0_CLK = 16,
	E_SYS_UART1_CLK = 17,	
	E_SYS_PWM10_CLK = 20,
	E_SYS_PWM32_CLK = 21,
	E_SYS_CAN0_CLK  = 24,
	E_SYS_CAN1_CLK  = 25,	
	E_SYS_USBD_CLK  = 27,
	E_SYS_ADC_CLK   = 28,
	E_SYS_ACMP_CLK  = 30,
	E_SYS_PS2_CLK   = 31,
	E_SYS_PDMA_CLK  = 33,
	E_SYS_ISP_CLK   = 34

}E_SYS_IP_CLK;


 
 
 
typedef enum 
{
	E_SYS_ADC_DIV,
	E_SYS_CAN_DIV,
	E_SYS_UART_DIV,
	E_SYS_USB_DIV,
	E_SYS_HCLK_DIV

}E_SYS_IP_DIV;


 
 
 
typedef enum 
{
	E_SYS_PWM32_CLKSRC,
	E_SYS_PWM10_CLKSRC,
	E_SYS_CAN_CLKSRC,
	E_SYS_UART_CLKSRC,
	E_SYS_TMR3_CLKSRC,
	E_SYS_TMR2_CLKSRC,
	E_SYS_TMR1_CLKSRC,
	E_SYS_TMR0_CLKSRC,
	E_SYS_ADC_CLKSRC,
	E_SYS_WDG_CLKSRC

}E_SYS_IP_CLKSRC;


 
 
 
typedef enum 
{
	E_SYS_XTL12M,
	E_SYS_XTL32K,
	E_SYS_OSC22M,
	E_SYS_OSC10K
}E_SYS_OSC_CTRL;


typedef void (*BOD_CALLBACK)(void);
typedef void (*PWRWU_CALLBACK)(void);

 
 
 
void 	 DrvSYS_ResetIP(E_SYS_IP_RST eIpRst);
void 	 DrvSYS_ResetCPU(void);
void 	 DrvSYS_ResetChip(void);
void 	 DrvSYS_EnableBOD(int32_t i32Enable);
void 	 DrvSYS_SelectBODVolt(uint8_t u8Volt);
void 	 DrvSYS_EnableBODRst(int32_t i32Enable, BOD_CALLBACK bodcallbackFn);
void 	 DrvSYS_EnableBODLowPowerMode(int32_t i32Enable);
void 	 DrvSYS_EnableLowVoltRst(int32_t i32Enable);
void 	 DrvSYS_EnableTempatureSensor(int32_t i32Enable);
void 	 DrvSYS_SetPORDisCode(uint32_t u32Code);
void 	 DrvSYS_SetRCAdjValue(uint32_t u32Adj);
void 	 DrvSYS_SetIPClock(E_SYS_IP_CLK eIpClk, int32_t i32Enable);
uint32_t DrvSYS_GetEXTClock(void);
int32_t  DrvSYS_UnlockKeyAddr(void);
int32_t  DrvSYS_LockKeyAddr(void);
uint32_t DrvSYS_ReadProductID(void);
uint32_t DrvSYS_GetRstSrc(void);
uint32_t DrvSYS_ClearRstSrc(uint32_t u32Src);
uint32_t DrvSYS_GetBODState(void);

void 	 DrvSYS_SetIPClock(E_SYS_IP_CLK eIpClk, int32_t i32Enable);
int32_t  DrvSYS_SetHCLKSource(uint8_t u8ClkSrcSel);
int32_t  DrvSYS_SetSysTickSource(uint8_t u8ClkSrcSel);
int32_t  DrvSYS_SetIPClockSource(E_SYS_IP_CLKSRC eIpClkSrc, uint8_t u8ClkSrcSel);
int32_t  DrvSYS_SetClockDivider(E_SYS_IP_DIV eIpDiv , int32_t i32value);
int32_t  DrvSYS_SetOscCtrl(E_SYS_OSC_CTRL eOscCtrl, int32_t i32Enable);
void     DrvSYS_EnablePWRWUInt(int32_t i32Enable, PWRWU_CALLBACK pdwucallbackFn, int32_t i32enWUDelay);
void 	 DrvSYS_EnablePowerDown(int32_t i32Enable);
void 	 DrvSYS_SetPowerDownWaitCPU(int32_t i32Enable);
void 	 DrvSYS_SetPllSrc(E_DRVSYS_SRC_CLK ePllSrc);
void 	 DrvSYS_SetPLLPowerDown(int32_t i32Enable);

uint32_t DrvSYS_GetPllContent(uint32_t u32ExtClockKHz, uint32_t u32PllClockKHz);
uint32_t DrvSYS_GetPLLClock(void);
uint32_t DrvSYS_GetHCLK(void);
int32_t  DrvSYS_Open(uint32_t u32ExtClockKHz, uint32_t u32PllClockKHz);



#line 14 "..\\..\\..\\..\\NUC1XX_BSP\\NuvotonPlatform_Keil\\Src\\Driver\\DrvUART.c"


 
 
 


 
 
 
static PFN_DRVUART_CALLBACK *g_pfnUART0callback = 0;
static PFN_DRVUART_CALLBACK *g_pfnUART1callback = 0;



 
 
 
void UART0_IRQHandler(void)

{
    uint32_t u32IntStatus;

    u32IntStatus = (*((volatile unsigned int *)(&((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->ISR))) ;
	
    if(g_pfnUART0callback != 0)
    {
        g_pfnUART0callback(u32IntStatus);
    }
}


void UART1_IRQHandler(void)
{
    uint32_t u32IntStatus;

	u32IntStatus = (*((volatile unsigned int *)(&((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->ISR))) ;

    if(g_pfnUART1callback != 0)
    {
       g_pfnUART1callback(u32IntStatus);
    }

}


 
 
 
 
 	
 
 
 
 
 
 
 
 
static void BaudRateCalculator(uint32_t clk, uint32_t baudRate, UART_BAUD_T *baud)
{
  	int32_t tmp;
	int32_t div;

	if(((clk / baudRate)%16)<3)	        
	{
		baud->DIVX_EN = 0;
	    baud->DIVX1   = 0;
		tmp = clk / baudRate/16  -2;
	}
	else							   
	{
	    baud->DIVX_EN = 1;			   
	    baud->DIVX1   = 1;
		tmp = clk / baudRate  -2;

		if(tmp > 0xFFFF)			   
		{
			baud->DIVX_EN = 1;		   
			
			for(div = 8; div <16;div++)
			{
				if(((clk / baudRate)%(div+1))<3)
				{
					baud->DIVX1   = div;
					tmp = clk / baudRate / (div+1) -2;
					break;
				}
			}
		}
	}

	baud->DIV = tmp; 

}


 
 
 
 	
 
 
 
 
 
 
 
 
static uint32_t GetUartCLk(void)
{
	uint32_t clk =0 , div;
											 
	if(((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->CLKSEL1.UART_S == 0)			
	{
		clk = DrvSYS_GetEXTClock() * 1000;			 
	}
	else if(((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->CLKSEL1.UART_S == 1)
	{
	 	div = ((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->CLKDIV.UART_N;		 
	
		clk = DrvSYS_GetPLLClock() * 1000 / (div+1);
	}
	else
		clk = 22000000;						 

	return clk;
}

 

 
 
 
 	
 
 
 
 
 
 
 
 
void DrvUART_SetRTS(UART_PORT port,uint8_t u8Value)
{
	if(port == 0x000)
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->MCR.RTS_INV = u8Value;
	else	
		((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->MCR.RTS_INV = u8Value;
}	



 
 
 
 	
 
 
 
 									        
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
int32_t DrvUART_Open(UART_PORT port, STR_UART_T *sParam)
{
   
     
     
     
    if ((port != UART_PORT0) &&
        (port != UART_PORT1))
    {

		return (((1) ? 0xFFFF0000 : 0x00000000) | ((((MODULE_ID_DRVUART) & 0xFF) | ((1) ? 0x100 : 0x00)) << 7) | ((2) & 0x7F));
    }


     
     
     
    if ((sParam->u8cParity != 0x00) &&
        (sParam->u8cParity != 0x18) &&
        (sParam->u8cParity != 0x08)  &&
        (sParam->u8cParity != 0x28) &&
        (sParam->u8cParity != 0x38))
    {
 		return (((1) ? 0xFFFF0000 : 0x00000000) | ((((MODULE_ID_DRVUART) & 0xFF) | ((1) ? 0x100 : 0x00)) << 7) | ((3) & 0x7F));		
    }
     
     
     
    else if ((sParam->u8cDataBits != 0x0) &&
             (sParam->u8cDataBits != 0x1) &&
             (sParam->u8cDataBits != 0x2) &&
             (sParam->u8cDataBits != 0x3))
    {
 		return (((1) ? 0xFFFF0000 : 0x00000000) | ((((MODULE_ID_DRVUART) & 0xFF) | ((1) ? 0x100 : 0x00)) << 7) | ((4) & 0x7F));	 
    }
     
     
     
    else if ((sParam->u8cStopBits != 0x0) &&
             (sParam->u8cStopBits != 0x4) &&
             (sParam->u8cStopBits != 0x4)
             )
    {
      	return (((1) ? 0xFFFF0000 : 0x00000000) | ((((MODULE_ID_DRVUART) & 0xFF) | ((1) ? 0x100 : 0x00)) << 7) | ((5) & 0x7F));	 
    }


     
     
     
    else if ((sParam->u8cRxTriggerLevel != 0x00) &&
             (sParam->u8cRxTriggerLevel != 0x10) &&
             (sParam->u8cRxTriggerLevel != 0x20) &&
             (sParam->u8cRxTriggerLevel != 0x30) &&
             (sParam->u8cRxTriggerLevel != 0x40) &&
             (sParam->u8cRxTriggerLevel != 0x50) &&
             (sParam->u8cRxTriggerLevel != 0x60))
    {
		return (((1) ? 0xFFFF0000 : 0x00000000) | ((((MODULE_ID_DRVUART) & 0xFF) | ((1) ? 0x100 : 0x00)) << 7) | ((6) & 0x7F));		 
    }				

	if(port == UART_PORT0)
	{
		
		 
		((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->IPRSTC2.UART0_RST = 1;
		((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->IPRSTC2.UART0_RST = 0;
		
		 
	    ((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->APBCLK.UART0_EN = 1;
	     
	    ((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->CLKSEL1.UART_S = 0;
	    ((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->PWRCON.XTL12M_EN = 1;
	     
	    ((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->CLKSEL1.UART_S = 0;
		
	}
	else
	{
		 
		((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->IPRSTC2.UART1_RST = 1;
		((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->IPRSTC2.UART1_RST = 0;
		
		 
	    ((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->APBCLK.UART1_EN = 1;
		((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->PWRCON.XTL12M_EN = 1;
	     
	    ((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->CLKSEL1.UART_S = 0;
		
	}
    
	 
	if(port == UART_PORT0)	
	{
	  	((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->FCR.TFR =1;
	  	((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->FCR.RFR =1;
	}
	else
	{
	  	((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->FCR.TFR =1;
	  	((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->FCR.RFR =1;
	}

	if (port == UART_PORT0)
	{
		 
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->FCR.RFITL = sParam->u8cRxTriggerLevel;  
	
		 
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->LCR.PBE	=sParam->u8cParity 	;
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->LCR.WLS	=sParam->u8cDataBits;
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->LCR.NSB	=sParam->u8cStopBits;
		
		 
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->TOR 		=sParam->u8TimeOut;

		 
		BaudRateCalculator(GetUartCLk(), sParam->u32BaudRate, &((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->BAUD);
		
	
	}
	else
	{
	 	 
		((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->FCR.RFITL = sParam->u8cRxTriggerLevel;  
	
		 
		((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->LCR.PBE	=sParam->u8cParity ;
		((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->LCR.WLS	=sParam->u8cDataBits;
		((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->LCR.NSB	=sParam->u8cStopBits;
		
		 
		((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->TOR 		=sParam->u8TimeOut;
	    
		 
		BaudRateCalculator(GetUartCLk(), sParam->u32BaudRate, &((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->BAUD);
	}

	
	return 0;
}



 
 
 
 
 
 
 
 
 
 

void DrvUART_Close(UART_PORT Port)
{
	if(Port)	
	{
		while(!((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->FSR.TX_EMPTY);
		
		((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->APBCLK.UART1_EN = 0;
		((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->APBCLK.UART1_EN = 0;
		g_pfnUART1callback = 0;
        NVIC_DisableIRQ (UART1_IRQn); 
	}
	else
	{
		while(!((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->FSR.TX_EMPTY);
		((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->APBCLK.UART0_EN = 0;
		g_pfnUART0callback = 0;
        NVIC_DisableIRQ(UART0_IRQn);      
	}
}



 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
int32_t
DrvUART_EnableInt(
	UART_PORT   port,
	uint32_t  u32InterruptFlag,
	PFN_DRVUART_CALLBACK pfncallback
)
{
    if((port != UART_PORT0) && (port != UART_PORT1))
    {
        return (((1) ? 0xFFFF0000 : 0x00000000) | ((((MODULE_ID_DRVUART) & 0xFF) | ((1) ? 0x100 : 0x00)) << 7) | ((7) & 0x7F));
    }

 	if(port == UART_PORT0)											   	 
	{
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->IER.RDA_IEN		=u32InterruptFlag & 0x00000001 ;
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->IER.THRE_IEN		=u32InterruptFlag & 0x00000002;
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->IER.RLS_IEN		=u32InterruptFlag & 0x00000004;
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->IER.MS_IEN		=u32InterruptFlag & 0x00000008;
		
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->IER.TOC_EN		=u32InterruptFlag & 0x00000010;   	 
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->IER.RTO_IEN		=u32InterruptFlag & 0x00000010;	 

		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->IER.BUF_ERR_IEN	=u32InterruptFlag & 0x00000020;
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->IER.WAKE_IEN		=u32InterruptFlag & 0x00000040;
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->IER.WAKE_IEN		=u32InterruptFlag & 0x00000100;

	}
	else
	{
		((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->IER.RDA_IEN		=u32InterruptFlag & 0x00000001 ;
		((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->IER.THRE_IEN		=u32InterruptFlag & 0x00000002;
		((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->IER.RLS_IEN		=u32InterruptFlag & 0x00000004;
		((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->IER.MS_IEN		=u32InterruptFlag & 0x00000008;
		
		((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->IER.TOC_EN		=u32InterruptFlag & 0x00000010;	 
		((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->IER.RTO_IEN		=u32InterruptFlag & 0x00000010;	 
		
		((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->IER.BUF_ERR_IEN	=u32InterruptFlag & 0x00000020;
		((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->IER.WAKE_IEN		=u32InterruptFlag & 0x00000040;
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->IER.WAKE_IEN		=u32InterruptFlag & 0x00000100;

	}

	

    if(port == UART_PORT0)											   	 
    {
		g_pfnUART0callback = pfncallback;        
		NVIC_EnableIRQ(UART0_IRQn); 
    }
    else
    {
		g_pfnUART1callback = pfncallback;
		NVIC_EnableIRQ(UART1_IRQn); 
    }
	return 0;

}

																  
 
 
 
 
 
 
 
 
 
 
 
 
uint32_t DrvUART_IsIntEnabled(UART_PORT	u16Port,uint32_t u32InterruptFlag)
{
	if(u16Port == UART_PORT0)					 
		return ((*((volatile unsigned int *)(&((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->IER))) &
		 (u32InterruptFlag & (0x00000100 | 0x00000040 | 0x00000020 | 
		 		0x00000010 | 0x00000008 | 0x00000004 | 0x00000002 | 0x00000001)));
	else
		return ((*((volatile unsigned int *)(&((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->IER))) & 
		(u32InterruptFlag & (0x00000100 | 0x00000040 | 0x00000020 | 
		 		0x00000010 | 0x00000008 | 0x00000004 | 0x00000002 | 0x00000001)));

}


 
 
 
 
 
 
 
 
 
 
 
 
void DrvUART_DisableInt(UART_PORT u16Port,uint32_t u32InterruptFlag)
{
	if(u16Port == UART_PORT0)			   
	{
		*((volatile unsigned int *)(&((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->IER + u16Port))=((*((volatile unsigned int *)(&((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->IER + u16Port))) | (0x00000100 | 0x00000040 | 0x00000010 | 0x00000008 | 0x00000004 | 0x00000002 | 0x00000001 |0x00000020 )) & ~(u32InterruptFlag & (0x00000010 | 0x00000008 | 0x00000004 | 0x00000002 | 0x00000001 |0x00000100 | 0x00000040 | 0x00000020));




	}
	
	if(u32InterruptFlag & 0x00000010)
	{
		if(u16Port == 0x000)
			((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->IER.RTO_IEN = 0;
		else
			((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->IER.RTO_IEN = 0;
	}
	
	switch (u16Port)
    {
        case 0x000:
			g_pfnUART0callback = 0;
            NVIC_DisableIRQ(UART0_IRQn);   
            break;

        case 0x100000:
			g_pfnUART1callback = 0;
           	NVIC_DisableIRQ(UART1_IRQn);    
            break;

        default:
            break;
    }

}


 
 
 
 
 
 
 
 
 
 
 
 
uint32_t DrvUART_ClearInt(UART_PORT	u16Port,uint32_t u32InterruptFlag)
{
	if((u32InterruptFlag & 0x00000001) == 0x00000001)    			 	   
		(*((volatile unsigned int *)(&((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->DATA + u16Port)));

	if((u32InterruptFlag & 0x00000004) == 0x00000004)					 	   
		*((volatile unsigned int *)(&((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->FSR + u16Port))=(*((volatile unsigned int *)(&((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->FSR + u16Port))) | 0x70; 
	
	if((u32InterruptFlag & 0x00000008) == 0x00000008)				 	   
		*((volatile unsigned int *)(&((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->MSR + u16Port))=(*((volatile unsigned int *)(&((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->MSR + u16Port))) | 0x1;	   

	if((u32InterruptFlag & 0x00000010) == 0x00000010)				 	   
	{
		(*((volatile unsigned int *)(&((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->DATA + u16Port)));
	}

	return 0;


}	


 
 
 
 
 
 
 
 
 
 
 
 
 
int8_t DrvUART_GetIntStatus(UART_PORT u16Port,uint32_t u32InterruptFlag)

{
	if(u16Port == 0x000)	
	{
	
		switch(u32InterruptFlag)
		{
			case 0x00000008:				  	 
		
				if(((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->ISR.MODEM_IF==1)		  	
					return 1;
				break;
			case 0x00000004:						 
	
				if(((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->ISR.RLS_IF==1)		    
					return 1;
				break;
			case 0x00000002:					 
				if(((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->ISR.THRE_IF==1)			
					return 1;
				break;
			case 0x00000001:					 
				if(((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->ISR.RDA_IF==1)			
					return 1;
				break;
			case 0x00000010:					 
				if(((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->ISR.TOUT_IF==1)			
					return 1;
				break;
			default:
				break;
		}
	}
	else
	{
		switch(u32InterruptFlag)
		{
			case 0x00000008:					 
				if(((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->ISR.MODEM_IF==1)			
					return 1;
				break;
			case 0x00000004:						 
				if(((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->ISR.RLS_IF==1)			
					return 1;
				break;
			case 0x00000002:					 
				if(((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->ISR.THRE_IF==1)			
					return 1;
				break;
			case 0x00000001:					 
				if(((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->ISR.RDA_IF==1)			
					return 1;
				break;
			case 0x00000010:					 
				if(((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->ISR.TOUT_IF==1)			
					return 1;
				break;
			default:
				break;
		}	
	}
	return 0;
}


 
 
 
 	
 
 
 
 
 
 
 
 
void DrvUART_SetFIFOTriggerLevel(UART_PORT	u16Port,uint16_t u32TriggerLevel)
{
	if(u16Port == 0x000)
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->FCR.RFITL = u32TriggerLevel;
	else
		((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->FCR.RFITL = u32TriggerLevel;
		
}



 
 
 
 	
 
 
 
 
 
 
 
 
void DrvUART_GetCTS(UART_PORT u16Port,uint8_t *pu8CTSValue,	uint8_t	*pu8CTSChangeState)
{
	if(u16Port == 0x000)
	{
		*pu8CTSValue 		= ((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->MSR.CTS;
		*pu8CTSChangeState 	= ((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->MSR.DCTS;
	}
	else
	{
		*pu8CTSValue 		= ((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->MSR.CTS;
		*pu8CTSChangeState 	= ((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->MSR.DCTS;	
	}
}	

 
 
 
 	
 
 
 
 
 
 
 
 
void DrvUART_SetRxTimeOut(UART_PORT	u16Port, uint8_t u8TimeOut)
{
	if(u16Port == 0x000)
	{
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->TOR = u8TimeOut;							 
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->IER.TOC_EN =1;							 
	}
	else
	{
		((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->TOR = u8TimeOut;
		((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->IER.TOC_EN = 1;
	}
}	

 
 
 
 
 
 
 
 
 
 
 
 
 
int32_t DrvUART_Read(UART_PORT	u16Port,uint8_t	*pu8RxBuf, uint32_t	u32ReadBytes)
{
    uint32_t  u32Count, u32delayno;
    
	if(u16Port == 0x000)
	{
	    for (u32Count=0; u32Count < u32ReadBytes; u32Count++)
	    {
	    	 u32delayno = 0;
	         while (((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->FSR.RX_EMPTY ==1)					   	   
	         {
	             u32delayno++;        
	             if ( u32delayno >= 0x40000000 )        
	                return (((1) ? 0xFFFF0000 : 0x00000000) | ((((MODULE_ID_DRVUART) & 0xFF) | ((1) ? 0x100 : 0x00)) << 7) | ((1) & 0x7F));               
					
	         }
	         pu8RxBuf[u32Count] = ((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->DATA;					   
	    }
	}
	else     
	{
		for (u32Count=0; u32Count < u32ReadBytes; u32Count++)
	    {
	    	 u32delayno = 0;
	         while (((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->FSR.RX_EMPTY ==1)
	         {
	             u32delayno++;        
	             if ( u32delayno >= 0x40000000 )        
	                return (((1) ? 0xFFFF0000 : 0x00000000) | ((((MODULE_ID_DRVUART) & 0xFF) | ((1) ? 0x100 : 0x00)) << 7) | ((1) & 0x7F));               
					
	         }
	         pu8RxBuf[u32Count] = ((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->DATA;
	    }
	
	}
    return 0;
	
}



 
 
 
 
 
 
 
 
 
 
 
 
 
int32_t DrvUART_Write(UART_PORT	u16Port,uint8_t	*pu8TxBuf, 	uint32_t u32WriteBytes)
{
    uint32_t  u32Count, u32delayno;
    
	if(u16Port == 0x000)
	{
	    for (u32Count=0; u32Count<u32WriteBytes; u32Count++)
	    {
	       u32delayno = 0;
		   while (((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->FSR.TX_EMPTY !=1)							 
	       {
	       	    u32delayno++;
	       	    if ( u32delayno >= 0x40000000 )     	    
	       	       return (((1) ? 0xFFFF0000 : 0x00000000) | ((((MODULE_ID_DRVUART) & 0xFF) | ((1) ? 0x100 : 0x00)) << 7) | ((1) & 0x7F));     	       
				   
	       }
		   ((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->DATA = pu8TxBuf[u32Count];						 
	    }
	}
	else
	{
		for (u32Count=0; u32Count<u32WriteBytes; u32Count++)
	    {
	       u32delayno = 0;
	    
		   while (((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->FSR.TX_EMPTY !=1)
	       {
	       	    u32delayno++;
	       	    if ( u32delayno >= 0x40000000 )     	    
	       	       return (((1) ? 0xFFFF0000 : 0x00000000) | ((((MODULE_ID_DRVUART) & 0xFF) | ((1) ? 0x100 : 0x00)) << 7) | ((1) & 0x7F));     	       
	       }
	       
		   ((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->DATA = pu8TxBuf[u32Count];					 	 
	    }
	
	}
    return 0;
	
  
}


 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
void DrvUART_OpenIRCR(UART_PORT u16Port,STR_IRCR_T str_IRCR )
{
	if(u16Port == 0x000)
	{
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->FUNSEL.LIN_EN 	= 0;
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->FUNSEL.IrDA_EN 	= 1;	
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->IRCR.RX_EN 		= str_IRCR.u8cRXSelect ;
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->IRCR.TX_EN 		= str_IRCR.u8cTXSelect ;
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->IRCR.TX_INV_EN	= str_IRCR.u8cInvTX ;
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->IRCR.RX_INV_EN	= str_IRCR.u8cInvRX ;
		
	}
	else
	{
	   	((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->FUNSEL.LIN_EN 	= 0;
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->FUNSEL.IrDA_EN 	= 1;
		((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->IRCR.RX_EN 		= str_IRCR.u8cRXSelect ;
		((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->IRCR.TX_EN 		= str_IRCR.u8cTXSelect ;
		((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->IRCR.TX_INV_EN	= str_IRCR.u8cInvTX ;
		((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->IRCR.RX_INV_EN	= str_IRCR.u8cInvRX ;			
	}
}


 
 
 
 
 
 
 
 
 
 
 
 
 
void DrvUART_OpenLIN(UART_PORT u16Port,uint16_t DIRECTION,uint16_t BCNT)
{

	
	if(u16Port == 0x000)
	{
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->FUNSEL.LIN_EN 	= 1;
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->FUNSEL.IrDA_EN 	= 0;	
		if(DIRECTION ==0 )
		{
			((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->LINCON.LINTX_EN	= 1;
			((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->LINCON.LINRX_EN	= 0;
		}else
		{
			((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->LINCON.LINTX_EN	= 0;
			((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->LINCON.LINRX_EN	= 1;		
		}
	}
	else
	{
	   	((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->FUNSEL.LIN_EN 	= 1;
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->FUNSEL.IrDA_EN 	= 0;
		if(DIRECTION == 0 )
		{
			((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->LINCON.LINTX_EN	= 1;
			((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->LINCON.LINRX_EN	= 0;
		}else
		{
			((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->LINCON.LINTX_EN	= 0;
			((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->LINCON.LINRX_EN	= 1;		
		}
	}
}

 
 
 
 
 
 
 
 
 
 
int32_t DrvUART_kbhit(void)
{
    
    if(((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->ISR.RDA_IF ==1)
    {
        return 1;
    }

    return 0;
}


 
 
 
 
 
 
 
 
 
 
 
 
void DrvUART_SetPDMA(UART_PORT u16Port,uint16_t IsEnable)
{

	
	if(u16Port == 0x000)
	{
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->IER.DMA_TX_EN 	= IsEnable ?1:0;
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->IER.DMA_RX_EN	= IsEnable ?1:0;	
	
	}
	else
	{
		((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->IER.DMA_TX_EN 	= IsEnable ?1:0;
		((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->IER.DMA_RX_EN	= IsEnable ?1:0;
	}
}
 
 
 
 
 	
 
 
 
 
 
 
 
 
int32_t	DrvUART_GetVersion(void)
{
	return (((1) << 16) | ((00) << 8) | (1));
	
}






