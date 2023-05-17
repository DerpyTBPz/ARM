;AREA    |.text|, CODE, READONLY

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GP_BA  		EQU		0x50004000;

GPIOA_PMD 	EQU		0x000;  R/W   GPIO Port A Pin I/O Mode Control  0xFFFF_FFFF 
GPIOA_OFFD	EQU		0x004;  R/W   GPIO Port A Pin Digital Input Path Disable Control  0x0000_0000  
GPIOA_DOUT	EQU		0x008;  R/W   GPIO Port A Data Output Value  0x0000_FFFF 
GPIOA_DMASK	EQU		0x00C;  R/W   GPIO Port A Data Output Write Mask  0xXXXX_0000  
GPIOA_PIN	EQU		0x010;  R  GPIO Port A Pin Value   0x0000_XXXX 
GPIOA_DBEN	EQU		0x014;  R/W   GPIO Port A De - bounce Enable  0xXXXX_0000  
GPIOA_IMD	EQU		0x018;  R/W   GPIO Port A Interrupt Mode Control  0xXXXX_0000  
GPIOA_IEN	EQU		0x01C;  R/W   GPIO Port A Interrupt Enable  0x0000_0000  
GPIOA_ISRC	EQU		0x020;  R/W   GPIO Port A Interrupt Source Flag  0xXXXX_XXXX  
GPIOB_PMD 	EQU		0x040;  R/W   GPIO Port B Pin I/O Mode Control  0xFFFF_FFFF 
GPIOB_OFFD	EQU		0x044;  R/W   GPIO Port  B Pin Digital Input Path Disable Control  0x0000_0000  
GPIOB_DOUT	EQU		0x048;  R/W   GPIO Port B Data Output Value  0x0000_FFFF 
GPIOB_DMASK	EQU		0x04C;  R/W   GPIO Port B Data Output Write Mask  0xXXXX_0000  
GPIOB_PIN	EQU		0x050;  R  GPIO Port B Pin Value   0x0000_XXXX 
GPIOB_DBEN	EQU		0x054;  R/W   GPIO Port B De - bounce Enable  0xXXXX_0000  
GPIOB_IMD	EQU		0x058;  R/W   GPIO Port B Interrupt Mode Control   0xXXXX_0000  
GPIOB_IEN	EQU		0x05C;  R/W   GPIO Port B Interrupt Enable  0x0000_0000  
GPIOB_ISRC	EQU		0x060;  R/W   GPIO Port B Interrupt Source Flag   0xXXXX_XXXX  
GPIOC_PMD 	EQU		0x080;  R/W   GPIO Port C  Pin I/O Mode Control  0xFFFF_FFFF 
GPIOC_OFFD	EQU		0x084;  R/W   GPIO Port  C  Pin Digital Input Path Disable Control  0x0000_0000  
GPIOC_DOUT	EQU		0x088;  R/W   GPIO Port C Data Output Value   0x0000_FFFF 
GPIOC_DMASK	EQU		0x08C;  R/W   GPIO Port C Data Output Write Mask  0xXXXX_0000  
GPIOC_PIN	EQU		0x090;  R  GPIO Port C Pin Value   0x0000_XXXX 
GPIOC_DBEN	EQU		0x094;  R/W   GPIO Port C De- bounce Enable  0xXXXX_0000  
GPIOC_IMD	EQU		0x098;  R/W   GPIO Port C Interrupt Mode Control  0xXXXX_0000  
GPIOC_IEN	EQU		0x09C;  R/W   GPIO Port C Interrupt Enable  0x0000_0000  
GPIOC_ISRC	EQU		0x0A0;  R/W   GPIO Port C Interrupt Source Flag  0xXXXX_XXXX  
GPIOD_PMD 	EQU		0x0C0;  R/W   GPIO Port D  Pin I/O Mode Control  0xFFFF_FFFF 
GPIOD_OFFD	EQU		0x0C4;  R/W   GPIO Port  D  Pin Digital Input Path Disable Control  0x0000_0000  
GPIOD_DOUT	EQU		0x0C8;  R/W   GPIO Port D Data Output Value   0x0000_FFFF 
GPIOD_DMASK	EQU		0x0CC ;  R/W   GPIO Port D Data Output Write Mask  0xXXXX_0000  
GPIOD_PIN	EQU		0x0D0;  R  GPIO Port D Pin Value   0x0000_XXXX 
GPIOD_DBEN	EQU		0x0D4;  R/W   GPIO Port D De- bounce Enable   0xXXXX_0000  
GPIOD_IMD	EQU		0x0D8;  R/W   GPIO Port D Interrupt Mode Control  0xXXXX_0000  
GPIOD_IEN	EQU		0x0DC ;  R/W   GPIO Port D Interrupt Enable  0x0000_0000  
GPIOD_ISRC	EQU		0x0E0;  R/W   GPIO Port D Interrupt Source Flag  0xXXXX_XXXX  
GPIOE_PMD 	EQU		0x100;  R/W   GPIO Port E Pin I/O Mode Control  0xFFFF_FFFF 
GPIOE_OFFD	EQU		0x104;  R/W   GPIO Port  E Pin Digital Input Path Disable Control  0x0000_0000  
GPIOE_DOUT	EQU		0x108;  R/W   GPIO Port E Data Output Value  0x0000_FFFF 
GPIOE_DMASK	EQU		0x10C;  R/W   GPIO Port E Data Output Write Mask  0xXXX X_0000  
GPIOE_PIN	EQU		0x110;  R  GPIO Port E Pin Value   0x0000_XXXX 
GPIOE_DBEN	EQU		0x114;  R/W   GPIO Port E De - bounce Enable  0xXXXX_0000  
GPIOE_IMD	EQU		0x118;  R/W   GPIO Port E Interrupt Mode Control  0xXXXX_0000  
GPIOE_IEN	EQU		0x11C;  R/W   GPIO Port E Interrupt Enable  0x0000_0000  
GPIOE_ISRC 	EQU		0x120;  R/W   GPIO Port E Interrupt Source Flag   0xXXXX_XXX


CLK_BA			EQU		0x50000200;
;PWRCON			EQU		0x00;  R/W  System Power Down Control Register  0x0000_001X
;AHBCLK			EQU		0x04;  R/W  AHB Devices Clock Enable Control Register  0x0000_000D
;APBCLK			EQU		0x08;  R/W  APB Devices Clock Enable Control Register  0x0000_000X
CLKSTATUS		EQU		0x0C;  R/W  Clock status monitor Register  0x0000_00XX
CLKSEL0			EQU		0x10;  R/W  Clock Source Select Control Register 0  0x0000_003X
;CLKSEL1		EQU		0x14;  R/W  Clock Source SelectControl Register 1  0xFFFF_FFFF
CLKSEL2			EQU		0x1C;  R/W  Clock Source Select Control Register 2  0x0000_00FF
CLKDIV			EQU		0x18;  R/W  Clock DividerNumber Register  0x0000_0000 
PLLCON			EQU		0x20;  R/W  PLL Control Register  0x0005_C22E
FRQDIV			EQU		0x24;  R/W  Frequency Divider Control Register  0x0000_0000

SCS_BA			EQU		0xE000E000 ;
SYST_CSR		EQU		0x10;  R/W  SysTick Control and Status Register  0x0000_0000
SYST_RVR		EQU		0x14;  R/W  SysTick Reload value Register  0xXXXX_XXXX
SYST_CVR		EQU		0x18;  R/W  SysTick Current value Register  0xXXXX_XXXX

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	END 