	INCLUDE reg_def.s
	AREA    |.text|, CODE, READONLY
				
__main			PROC
				EXPORT  __main             [WEAK]
		LDR		R0, =SCS_BA
Blinky_loop
		
		LDR		R1,	=500
;Blinky_inner_loop1
;Blinky_inner_loop2
		;LDR		R2,	=0x10000
		;LDR		R3,	[R0, #SYST_CSR]
		;TST		R3, R2
		;BEQ		Blinky_inner_loop2
		;SUBS		R1, R1, #1
		;BNE		Blinky_inner_loop1
		
		;; Toogle bits
		
		;LDR 	R1, =GP_BA 
		;LDR		R2, =GPIOC_DOUT
		;LDR		R3, [R1, R2] ;0x80 * 4 
		;;LDR		R3, [R1, R2]
		;MVNS		R3, R3
		;STR		R3, [R1, R2]

    LDR R0, =UART0_BA
	;Case0
	LDR R2, =0x10000000
Wait_TE_FLAG
	LDR R3, [R0, #UA_FSR]
	TST R3, R2
	BEQ Wait_TE_FLAG	
	LDR R4, ='\n'
	STR R4, [R0, #UA_THR]
	LDR R4, ='\r'
	STR R4, [R0, #UA_THR]
	;Case1
case1
	ADDS R5, #1 ; лічильник до 10
	MOVS R4, #0xA
	CMP R5, R4
	BNE skip
	MOVS R5, 0
skip
	LDR R4, =0x30
	ADDS R4, R5
	STR R4, [R0, #UA_THR] 	
	
		;;Check_FLAG_RX_EMPTY
	;LDR R0, =UART0_BA
	;LDR R2, =0x00004000 ; маска для біта RX_EMPTY
	;LDR R3, [R0, #UA_FSR]
	;ANDS R3, R2
	;CMP R3, R2
	;BEQ RX_empty ;якщо RX_EMPTY=1, то дані не отримувалися
	;LDR R4, [R0, #UA_RBR] ;зчитуємо прийнятий байт
	;STR R4, [R0, #UA_THR] ;відправляємо назад
;RX_empty

;movwf PORTB
;return
;case3
	;LDR R0, =UART0_BA
	;LDR R4, [R0, #UA_RBR] ;зчитуємо прийнятий байт
	;STR R4, [R0, #UA_THR] ;відправляємо назад
	
			
	B		Blinky_loop 
		;ADDS R6, R6, #1
				;BX LR
				ENDP		
	END			