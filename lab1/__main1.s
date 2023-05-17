	INCLUDE reg_def.s
	AREA    |.text|, CODE, READONLY
				
__main1			PROC
				EXPORT  __main1             [WEAK]
		LDR		R0, =SCS_BA
Blinky_loop
		
		;LDR		R5,	=500
		LDR 	R1, =GP_BA
		LDR 	R2, =GPIOC_DOUT
		LDR		R3, [R1, R2]

;;;; LOOP 1		
		LDR		R5,	=500
Blinky_inner_loop1
Blinky_inner_loop2
		LDR		R6,	=0x00010000
		LDR		R7,	[R0, #SYST_CSR]
		TST		R7, R6
		BEQ		Blinky_inner_loop2
		SUBS		R5, R5, #10
		BNE		Blinky_inner_loop1		
		
		LDR		R3, =0x00007000
		STR		R3, [R1, R2]
		
;;;; LOOP 2
		LDR		R5,	=500
Blinky_inner_loop3
Blinky_inner_loop4
		LDR		R6,	=0x00010000
		LDR		R7,	[R0, #SYST_CSR]
		TST		R7, R6
		BEQ		Blinky_inner_loop3
		SUBS		R5, R5, #10
		BNE		Blinky_inner_loop4
		
		LDR		R3, =0x0000B000
		STR		R3, [R1, R2]
		
;;;; LOOP 3
		LDR		R5,	=500
Blinky_inner_loop5
Blinky_inner_loop6
		LDR		R6,	=0x00010000
		LDR		R7,	[R0, #SYST_CSR]
		TST		R7, R6
		BEQ		Blinky_inner_loop5
		SUBS		R5, R5, #10
		BNE		Blinky_inner_loop6		
		
		LDR		R3, =0x0000D000
		STR		R3, [R1, R2]
		
;;;; LOOP 4		
		LDR		R5,	=500
Blinky_inner_loop7
Blinky_inner_loop8
		LDR		R6,	=0x00010000
		LDR		R7,	[R0, #SYST_CSR]
		TST		R7, R6
		BEQ		Blinky_inner_loop7
		SUBS		R5, R5, #10
		BNE		Blinky_inner_loop8
		
		LDR		R3, =0x0000E000
		STR		R3, [R1, R2]
		B		Blinky_loop 
		
				ENDP		
	END			