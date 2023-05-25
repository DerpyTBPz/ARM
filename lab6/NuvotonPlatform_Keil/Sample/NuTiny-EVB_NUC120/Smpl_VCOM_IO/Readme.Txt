/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* Copyright(c) 2010 Nuvoton Technology Corp. All rights reserved.                                         */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/

NuTiny-EVB_NUC120 Board V1.0

Rx0		Pin17 / GPB0
TX1 	Pin18 / GPB1

USB 	Pin16 /	D+
USB 	Pin15 /	D-


/*----------------------- Block Diagram -------------------------------------------------------------------*/

	NuTiny-EVB_NUC120         		PC
	---------------------		 	----------------- 
	|	GND				|<-------->	|	GND			| 
	| 	Rx0	Pin17		|<-------->	|  	Rx0 	P17	|
	| 	TX1	Pin18		|<-------->	|  	TX1 	P18	|
	|   VDD    			|<--------> |	VDD			|
	|					|			|				|
	|	USB Connector	|<-------->	|	USB PORT	|
	---------------------        	----------------- 

	ScanKey GPA0~GPA5
	Key Value = 1	,GPA2 <--> GPA3
	Key Value = 2	,GPA1 <--> GPA3 
	Key Value = 3	,GPA0 <--> GPA3 
	Key Value = 4	,GPA2 <--> GPA4 
	Key Value = 5	,GPA1 <--> GPA4 
	Key Value = 6	,GPA0 <--> GPA4 
	Key Value = 7	,GPA2 <--> GPA5 
	Key Value = 8	,GPA1 <--> GPA5 
	Key Value = 9	,GPA0 <--> GPA5 

/*----------------------- Block Diagram  END --------------------------------------------------------------*/
