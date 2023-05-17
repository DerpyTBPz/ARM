	INCLUDE reg_def.s
	AREA    |.text|, CODE, READONLY
				
__main			PROC
				EXPORT  __main             [WEAK]
		LDR		R0, =SCS_BA
Blinky_loop
		
		LDR		R1,	=500
Blinky_inner_loop1
Blinky_inner_loop2
		LDR		R2,	=0x00010000
		LDR		R3,	[R0, #SYST_CSR]
		TST		R3, R2
		BEQ		Blinky_inner_loop2
		SUBS		R1, R1, #5
		BNE		Blinky_inner_loop1
		
		; Toogle bits
		
		LDR 	R1, =GP_BA 
		LDR		R2, =GPIOC_DOUT
		LDR		R3, [R1, R2] ;0x80 * 4 
		;LDR		R3, [R1, R2]
		MVNS		R3, R3
		STR		R3, [R1, R2]
		B		Blinky_loop 		
				ENDP		
	END