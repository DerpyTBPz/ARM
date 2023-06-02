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

    LDR 	R0, =UART0_BA	
	LDR 	R2, =0x10000000
Wait_TE_FLAG
	LDR 	R3, [R0, #UA_FSR]
	TST 	R3, R2
	BEQ Wait_TE_FLAG	
	LDR 	R4, ='\n'
	STR 	R4, [R0, #UA_THR]
	LDR 	R4, ='\r'
	STR 	R4, [R0, #UA_THR]	
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


;;;-----------------------------------------------------------------

	INCLUDE reg_def.s
	AREA    |.text|, CODE, READONLY
				
__main			PROC
				EXPORT  __main             [WEAK]
				LDR		R0, =SCS_BA
				
Blinky_loop

				LDR		R0, =SCS_BA
				LDR		R1,	=500
				
Blinky_inner_loop1
Blinky_inner_loop2

				LDR		R2,	=0x10000
				LDR		R3,	[R0, #SYST_CSR]
				TST		R3, R2
				BEQ		Blinky_inner_loop2
				SUBS	R1, R1, #5
				BNE		Blinky_inner_loop1
				
	
	;;---------------------------------	Возможно вне Blinky_loop			
		LDR 	R0, =UART0_BA	
		LDR 	R2, =0x10000000
	Wait_TE_FLAG
		LDR 	R3, [R0, #UA_FSR]
		TST 	R3, R2
		BEQ Wait_TE_FLAG	
		LDR 	R4, ='O'
		STR 	R4, [R0, #UA_THR]
		LDR 	R4, ='k'
		STR 	R4, [R0, #UA_THR]
		LDR 	R4, ='!'
		STR 	R4, [R0, #UA_THR]
		LDR 	R4, ='\n'
		STR 	R4, [R0, #UA_THR]
		LDR 	R4, ='\r'
		STR 	R4, [R0, #UA_THR]
	;;----------------------------------	
case0

				MOVS 	R2, #0
				LDR 	R1, =GP_BA
				LDR 	R3, =GPIOC_PIN
				LDR 	R3, [R1, R3]		; read GPIOB to R3
				LDR 	R0, =0x8000			; mask for pin15
				ADDS 	R3, R0 ;
				BEQ 	but_pressed			
	
				; ScanKey
		
				LDR 	R1, =ScanKey
				BLX 	R1
	
				MVNS 	R0, R0 
				LSLS 	R0, #12 
				LDR 	R1, =GP_BA
				LDR 	R2, =GPIOC_DOUT
				STR 	R0, [R1, R2]		; output to LED

but_pressed		
				;ADDS	R2, R2, #1
				;MOVS	R0, R2
				;MVNS	R0, R0
				;LSLS	R0, #12
				;LDR		R1,	=GP_BA
				;LDR		R3, =GPIOC_DOUT
				;STR		R0, [R1, R3]
				B		Blinky_loop 
				
			ENDP
		
ScanKey 		PROC
	
; 1, 4, 7---------------------------------------------------------------------------
	
				LDR 	R1, =GP_BA
				LDR 	R2, =0x0000003B 	; active bt 1, 4, 7
				LDR 	R3, =GPIOA_DOUT
				STR		R2, [R1, R3]
				LDR 	R4, =10				; Delay for 10 Tmcu
				
Wait

				SUBS	R4, R4,	#1
				BNE 	Wait
				LDR 	R3, =GPIOA_PIN
				LDR 	R3, [R1, R3]
				LDR 	R0, =0x38 ;
				ANDS 	R3, R0 				; mask for GPA3, GPA4, GPA5
				LDR 	R0, =0x30 			; if 110 then GPA3
				CMP 	R3, R0
				BEQ 	ret_but1
				LDR 	R0, =0x28 			; if 101 then GPA4
				CMP 	R3, R0
				BEQ		ret_but4
				LDR 	R0, =0x18 			; if 011 then GPA5
				CMP 	R3, R0
				BEQ 	ret_but7
				
				;UART0 Output##################

				LDR 	R4, =0x30
				ADDS 	R4, R5
				STR 	R4, [R0, #UA_THR] 
				
				;##################################
				
; 2, 5, 8------------------------------------------------------------------------
				
				LDR 	R2, =0x0000003D		; activete btn 2, 5, 8
				LDR 	R3, =GPIOA_DOUT
				STR		R2, [R1, R3]
				LDR 	R4, =10
				
Wait1

				SUBS 	R4,R4,#1
				BNE 	Wait1
				LDR 	R3, =GPIOA_PIN
				LDR 	R3, [R1, R3]
				LDR 	R0, =0x38 
				ANDS 	R3, R0 				; mask for GPA3, GPA4, GPA5
				LDR 	R0, =0x30 			; if 110 then GPA3
				CMP 	R3, R0
				BEQ 	ret_but2
				LDR 	R0, =0x28 			; if 101 then GPA4
				CMP 	R3, R0
				BEQ 	ret_but5
				LDR 	R0, =0x18 			; if 011 then GPA5
				CMP 	R3, R0
				BEQ 	ret_but8

; 3, 6, 9--------------------------------------------------------------------
			
				LDR 	R2, =0x0000003E		; activate btn 3, 6, 9
				LDR 	R3, =GPIOA_DOUT
				STR		R2, [R1, R3]
				LDR 	R4, =10
				
Wait2

				SUBS 	R4, R4, #1
				BNE 	Wait2
				LDR 	R3, =GPIOA_PIN
				LDR 	R3, [R1, R3]
				LDR 	R0, =0x38 ;
				ANDS 	R3, R0				; mask for GPA3, GPA4, GPA5
				LDR 	R0, =0x30 			; if 110 then GPA3
				CMP 	R3, R0
				BEQ 	ret_but3
				LDR 	R0, =0x28 			; if 101 then GPA4
				CMP 	R3, R0
				BEQ 	ret_but6
				LDR 	R0, =0x18 			; if 011 then GPA5
				CMP 	R3, R0
				BEQ 	ret_but9
				MOVS 	R0, #0
				BX 		LR	
	
ret_but1

				LDR 	R0, =0x1
				BX 		LR
	
ret_but2

				LDR 	R0, =0x2
				BX 		LR
	
ret_but3

				LDR 	R0, =0x3
				BX 		LR		
	
ret_but4

				LDR 	R0, =0x4
				BX 		LR
	
ret_but5

				LDR 	R0, =0x5
				BX 		LR
	
ret_but6

				LDR 	R0, =0x6
				BX 		LR
	
ret_but7

				LDR 	R0, =0x7
				BX 		LR
	
ret_but8

				LDR 	R0, =0x8
				BX 		LR
			
ret_but9

				LDR		R0, =0x9
				BX		LR				
		
		;ADDS R6, R6, #1
				;BX LR
				
		ENDP	
	END