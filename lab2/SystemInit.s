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

				LDR 	R0, =GP_BA
				LDR		R1, =0x55555555
				LDR		R2, =GPIOA_PMD
				STR		R1, [R0, R2]
				
				LDR		R1, =0x0000F000
				LDR		R2, =GPIOC_DOUT	
				STR		R1, [R0, R2]

				LDR 	R1, =0x00000FFF ; GPA0-5
				LDR 	R2, =GPIOA_PMD ; quasy-bidir
				STR 	R1, [R0, R2]
				LDR 	R1, =0x0000003F
				LDR 	R2, =GPIOA_DOUT
				STR 	R1, [R0, R2]
								
				;LDR		R1, =0x00009000
				;LDR		R2, =GPIOD_DOUT	
				;STR		R1, [R0, R2]	
				
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