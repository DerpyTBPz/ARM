	INCLUDE reg_def.s
	AREA    |.text|, CODE, READONLY
				
__main			PROC
				EXPORT  __main             [WEAK]
					
Kol  EQU  180
	
	
	
	MOVS R5, #Kol
count1
	MOVS R4, #5	
Blinky_loop1
	LDR		R0, =SCS_BA
	LDR		R1,	=5
Blinky_inner_loop11
Blinky_inner_loop12
	LDR	R2,	=0x10000
	LDR	R3,	[R0, #SYST_CSR]
	TST	R3, R2
	BEQ	Blinky_inner_loop12
	SUBS R1, R1, #1
	BNE	Blinky_inner_loop11
	
	
	LDR R1, =GP_BA
	LDR R2, =GPIOA_DOUT ; Step Motor
	CMP R4, #1
	BNE subcount13
	MOVS R3, #8
	STR R3, [R1, R2]
subcount13
	CMP R4, #2
	BNE subcount12
	MOVS R3, #1
	STR R3, [R1, R2]
subcount12
	CMP R4, #3
	BNE subcount11
	MOVS R3, #4
	STR R3, [R1, R2]
subcount11
	CMP R4, #4
	BNE subcount10
	MOVS R3, #2
	STR R3, [R1, R2]
subcount10
	SUBS R5, #1
	BEQ count2_2
	SUBS R4, #1
	CMP R4, #0
	BEQ count1
	B Blinky_loop1 

count2_2
	MOVS R4, #4		
Blinky_loop2
	LDR	R0, =SCS_BA
	LDR	R1,	=5
Blinky_inner_loop21
Blinky_inner_loop22
	LDR	R2,	=0x10000
	LDR	R3,	[R0, #SYST_CSR]
	TST	R3, R2
	BEQ	Blinky_inner_loop22
	SUBS R1, R1, #1
	BNE	Blinky_inner_loop21

	LDR R1, =GP_BA
	LDR R2, =GPIOA_DOUT ; Step Motor
	CMP R4, #1
	BNE subcount23
	MOVS R3, #2
	STR R3, [R1, R2]
subcount23
	CMP R4, #2
	BNE subcount22
	MOVS R3, #4
	STR R3, [R1, R2]
subcount22
	CMP R4, #3
	BNE subcount21
	MOVS R3, #1
	STR R3, [R1, R2]
subcount21
	CMP R4, #4
	BNE subcount20
	MOVS R3, #8
	STR R3, [R1, R2]
subcount20
	ADDS R5, #1
	CMP R5, #Kol
	BEQ count1
	
	SUBS R4, #1
	CMP R4, #0
	BEQ count2_2
	
	B Blinky_loop2

	ENDP
	END