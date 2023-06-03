	INCLUDE reg_def.s
	AREA    |.text|, CODE, READONLY
	
SystemInit		PROC
				EXPORT  SystemInit             [WEAK]
				;IMPORT  ref_def
                LDR     R0, =0x50000100
                ; Unlock Register                
                LDR     R1, =0x59
                STR     R1, [R0]
                LDR     R1, =0x16
                STR     R1, [R0]
                LDR     R1, =0x88
                STR     R1, [R0]
				
;Init Clock Gen for 48 MHz
	LDR		R0, =CLK_BA
	LDR		R1, =0x1D   ; Enable external 4~24 MHz high speed crystal
	STR		R1, [R0] ; XTL12M_EN = 1
	
	LDR		R1, =0x0000C220 ; IN_DV = 0x1, OUT_DV = 0x3, FB_DV = 0x2E
	STR		R1, [R0, #PLLCON] ; PLLFOUT = 48 MHz from PLL  
	
	MOVS	R1, #0x3 ; SysTick clock source select HCLK/2 
	LSLS	R1, R1, #3
	MOVS	R2, #0x2
	ORRS	R1, R2  ; CLK SRC for CPUCLK, HCLK, PCLK - PLLFOUT
	STR		R1, [R0, #CLKSEL0]
	
	MOVS	R1, #0			  ; HCLK_N = 0, divide by 1 	
	STR		R1, [R0, #CLKDIV] ; PLLFOUT = 48 MHz from PLL 
;Init GPIO for LED's	
	LDR 	R0, =GP_BA
	LDR		R1, =0x55000000
	LDR		R2, =GPIOC_PMD
	STR		R1, [R0, R2]
	
	;LDR 	R0, =GP_BA
	;LDR		R1, =0x00000000
	;LDR		R2, =GPIOB_PMD
	;STR		R1, [R0, R2]
	
    ;LDR R1, =0x00000FFF ; GPA0-5
    ;LDR R2, =GPIOA_PMD ; quasy-bidir
    ;STR R1, [R0, R2]
    ;LDR R1, =0x0000003F
    ;LDR R2, =GPIOA_DOUT
    ;STR R1, [R0, R2]
	
	LDR 	R0, =GP_BA
	LDR		R1, =0x55555555
	LDR		R2, =GPIOB_PMD
	STR		R1, [R0, R2]
	
	LDR		R1, =0x0000F000
	LDR		R2, =GPIOC_DOUT	
	STR		R1, [R0, R2]
	;LDR		R1, =0x00009000
	;LDR		R2, =GPIOD_DOUT	
	;STR		R1, [R0, R2]	
	
	;LDR		R1, =0x00009000
	;LDR		R2, =GPIOC_DOUT	
	;STR		R1, [R0, R2]	
	
	;Init UART0
; ???????????? ??????? ?? ??? ?????? ? UART
	LDR R0, =GCR_BA ; PB.0 & PB.1 Pin Function Selection
	MOVS R2, #0x3 ; 1 - UART0 TXD & RXD
	STR R2, [R0, #GPB_MFP]
	; ?????????? ?????? ?????? ?????? UART0
	LDR R0, =UART0_BA
	MOVS R2, #0
	STR R2, [R0, #UA_FUN_SEL]
	; ?????? Reset ??? UART0
	LDR R0, =GCR_BA ; SYS->IPRSTC2.UART0_RST = 1;
	MOVS R2, #0x1 ; SYS->IPRSTC2.UART0_RST = 0;
	LSLS R2, #16
	STR R2, [R0, #IPRSTC2]
	MOVS R2, #0x0
	STR R2, [R0, #IPRSTC2]
	; ?????????? UART0
	LDR R0, =CLK_BA ; SYSCLK->APBCLK.UART0_EN = 1;
	MOVS R2, #0x1;
	LSLS R2, #16
	STR R2, [R0, #APBCLK]
	; ?????? ???????? ??? ??????? Tx ?? Rx FIFO
	LDR R0, =UART0_BA ; Set Rx Trigger Level (FCR.RFITL)
	MOVS R2, #0x6;
	STR R2, [R0, #UA_FCR]
	; ????? ?????: ?-?? ????. ?????, ???????? ???,
	LDR R0, =UART0_BA ; ????????? ?? ????????
	MOVS R2, #0x3 ; 1 StopBits; No Parity;
	STR R2, [R0, #UA_LCR]
	; Set Time-Out (TOR.TOIC)
	LDR R0, =UART0_BA
	MOVS R2, #0x1;
	LSLS R2, #12 ; TX Delay Time Value
	STR R2, [R0, #UA_TOR]	
	;???????????? ????????? ??????? ??? ?????? UART0
	LDR R0, =CLK_BA ; SYSCLK->CLKSEL1.UART_S = 0;
	LDR R1, =0x00000000 ; XTL12M to UART
	STR R1, [R0, #CLKSEL1]
	; Mode 2, Baud rate = UART_CLK / (A+2), A must >=3
	LDR R0, =UART0_BA ; Baud rate = 115200
	LDR R2, =0x3f000066 ; DIV_X_EN=1 ; DIV_X_ONE=1 ; A=0x66
	STR R2, [R0, #UA_BAUD]	
				

;SysTick Timer Init to form 1 ms						
	LDR		R0, =SCS_BA
	LDR		R1, =47999
	STR		R1, [R0, #SYST_RVR]
	MOVS 	R1, #0
	STR		R1, [R0, #SYST_CVR]
	MOVS		R1, #5
	STR		R1, [R0, #SYST_CSR]
		
		
		        ; Lock register
				LDR     R0, =0x50000100
                MOVS    R1, #0
                STR     R1, [R0]

				BX LR
				ENDP
				
				
	END 