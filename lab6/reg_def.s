	;AREA    |.text|, CODE, READONLY

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GP_BA  			EQU		0x50004000;
GPIOC_PMD  		EQU		0x080;  R/W  GPIO Port C Pin I/O Mode Control  0xFFFF_FFFF
GPIOC_OFFD  	EQU		0x084;  R/W  GPIO Port C Pin Digital Input Path Disable Control  0x0000_0000 
GPIOC_DOUT  	EQU		0x088;  R/W  GPIO Port C Data Output Value  0x0000_FFFF
GPIOC_DMASK  	EQU		0x08C;  R/W  GPIO Port C Data Output Write Mask  0x0000_0000 
GPIOC_PIN  		EQU		0x090;  R    GPIO Port C Pin Value  0x0000_XXXX
GPIOC_DBEN  	EQU		0x094;  R/W  GPIO Port C De-bounce Enable  0x0000_0000 
GPIOC_IMD  		EQU		0x098;  R/W  GPIO Port C Interrupt Mode Control  0x0000_0000
GPIOC_IEN		EQU		0x09C;  R/W  GPIO Port C Interrupt Enable  0x0000_0000 
GPIOC_ISRC		EQU		0x0A0;  R/W  GPIO Port C Interrupt Source Flag  0xXXXX_XXXX

CLK_BA			EQU		0x50000200;
;PWRCON			EQU		0x00;  R/W  System Power Down Control Register  0x0000_001X
;AHBCLK			EQU		0x04;  R/W  AHB Devices Clock Enable Control Register  0x0000_000D
APBCLK			EQU		0x08;  R/W  APB Devices Clock Enable Control Register  0x0000_000X
CLKSTATUS		EQU		0x0C;  R/W  Clock status monitor Register  0x0000_00XX
CLKSEL0			EQU		0x10;  R/W  Clock Source Select Control Register 0  0x0000_003X
CLKSEL1		EQU		0x14;  R/W  Clock Source SelectControl Register 1  0xFFFF_FFFF
CLKSEL2			EQU		0x1C;  R/W  Clock Source Select Control Register 2  0x0000_00FF
CLKDIV			EQU		0x18;  R/W  Clock DividerNumber Register  0x0000_0000 
PLLCON			EQU		0x20;  R/W  PLL Control Register  0x0005_C22E
FRQDIV			EQU		0x24;  R/W  Frequency Divider Control Register  0x0000_0000

SCS_BA			EQU		0xE000E000 ;
SYST_CSR		EQU		0x10;  R/W  SysTick Control and Status Register  0x0000_0000
SYST_RVR		EQU		0x14;  R/W  SysTick Reload value Register  0xXXXX_XXXX
SYST_CVR		EQU		0x18;  R/W  SysTick Current value Register  0xXXXX_XXXX

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

UART0_BA		EQU		0x40050000 ;
UA_RBR			EQU		0x00 ;
UA_THR			EQU		0x00 ; W UART Transmit Holding Register Undefined
UA_IER			EQU		0x04 ; R/W UART Interrupt Enable Register 0x0000_0000
UA_FCR			EQU		0x08 ; R/W UART FIFO Control Register 0x0000_01 01
UA_LCR			EQU		0x0C ; R/W UART Line Control Register 0x0000_0000
UA_MCR			EQU		0x10 ; R/W UART Modem Control Register UART2: Reserved 0x0000_0200
UA_MSR			EQU		0x14 ; R/W UART Modem Status Register UART2: Reserved 0x0000_011 0
UA_FSR			EQU		0x18 ; R/W UART FIFO Status Register 0x1040_4000
UA_ISR			EQU		0x1C ; R/W UART Interrupt Status Register 0x0000_0002
UA_TOR			EQU		0x20 ; R/W UART Time Out Register 0x0000_0000
UA_BAUD			EQU		0x24 ; R/W UART Baud Rate Divisor Register 0x0F00_0000
UA_IRCR			EQU		0x28 ; R/W UART IrDA Control Register 0x0000_0040
UA_ALT_CSR		EQU		0x2C ; R/W UART Alternate Control/Status Register 0x0000_0000
UA_FUN_SEL		EQU		0x30 ; R/W UART Function Select Register

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GCR_BA			EQU		0x50000000;
GPB_MFP			EQU		0x34 ; R/W GPIOB Multiple Function and Input Type Control Register
IPRSTC1			EQU		0x08 ; R/W IP Reset Control Register1 0x0000_0000
IPRSTC2			EQU		0x0C ; R/W IP Reset Control Register2


	END 