#include <NUC1xx.h>

void InterruptInit(void) 
	{
		UART0->IER.RDA_IEN = 1; //Receive Data Available Interrupt Enable
		// Clear any previous occurred interrupt for port 3
		NVIC_ClearPendingIRQ(UART0_IRQn);
		// Set priority of port 3 interrupt
		NVIC_SetPriority(UART0_IRQn, 0);
		// Enable interrupt at NVIC
		NVIC_EnableIRQ(UART0_IRQn);
		return;
	}
void UART02_IRQHandler(void)
	{
		char rx;
		rx = UART0->DATA;
		UART0->DATA = rx;
		UART0->DATA = rx;
		UART0->DATA = 'O';
		UART0->DATA = 'k';
		UART0->DATA = '!';
		UART0->DATA = '\n';
		UART0->DATA = '\r';
	}


void Timer_initial(void)
	{
		/* Step 1. Enable and Select Timer clock source */
		
		SYSCLK->CLKSEL1.TMR1_S = 7;//Select 12Mhz for Timer0 clk src
		SYSCLK->APBCLK.TMR1_EN = 1; //Enable Timer0 clock source
		
		/* Step 2. Select Operation mode */
		
		TIMER1->TCSR.MODE=1;//Sel. periodic mode for operation mode
		
		/* Step 3. Select Time out period = (Period of timer clock input) * (8-bit Prescale + 1) * (24-bit TCMP)*/
		
		TIMER1->TCSR.PRESCALE = 0; // Set Prescale [0~255]     		 	
		TIMER1->TCMPR = 30000 ;// Set TICR(TCMP) [0~16777215]				60000 - 100 Hz    30000 - 200 Hz
		// (1/12000000)*(0+1)*(2765)= 125.01usec or 7999.42Hz
		
		//12000000/1/500 = 24000
		
		/* Step 4. Enable interrupt */
		
		TIMER1->TCSR.IE = 1;
		TIMER1->TISR.TIF = 1; //Write 1 to clear for safty
		NVIC_EnableIRQ(TMR1_IRQn); //Enable Timer0 Interrupt
		
		/* Step 5. Enable Timer module */
		
		TIMER1->TCSR.CRST = 1; //Reset up counter
		TIMER1->TCSR.CEN = 1; //Enable Timer1
		TIMER1->TCSR.TDR_EN = 1; // Enable TDR function
	}
	
int hex_to_ascii(unsigned int binary, unsigned char *ascii)
{
	 register unsigned char n;   
	 unsigned int tmp = binary;
	 unsigned int num;
	 for(n = 0; n <= 4; n++)// очистка массиву
	 ascii[n] = '0';
	 
	 for(n = 1; n <= 5; n++)//перетворення в двійково-десятковий код
	 {
		 //num = (tmp % 10) * pow(10, n);
		 tmp = tmp / 10;
		 if(tmp == 0) break;
	 } 
	 
	 num /= 256;
	
	 for(n = 0; n <= 4; n++)//перетворення в двійково-десятковий код
	 {
		 ascii[n] = (binary % 10) | '0';
		 binary = binary / 10;
		 if(binary == 0) break;
	 }
	 
	 return num;
	 
//	 for(n = 1; n <= 5; n++)
//	 {
//		 num += ascii[n-1] * 10^n;
//	 } 
	 
}
	
void InitADC(void) 
	{
		/* Step 1. GPIO initial */
		
		GPIOA->OFFD|=0x00800000; //Disable digital input path
		SYS->GPAMFP.ADC7_SS21_AD6=1; //Set ADC function
		
		/* Step 2. Enable and Select ADC clock source, and then enable ADC module */
		
		SYSCLK->CLKSEL1.ADC_S = 2; //Select 22Mhz for ADC
		SYSCLK->CLKDIV.ADC_N = 1;//ADC clock source=22Mhz/2=11Mhz;
		SYSCLK->APBCLK.ADC_EN = 1; //Enable clock source
		ADC->ADCR.ADEN = 1; //Enable ADC module
		
		/* Step 3. Select Operation mode */
		
		ADC->ADCR.DIFFEN = 0; //single end input
		ADC->ADCR.ADMD = 0; //single mode
		
		/* Step 4. Select ADC channel */
		
		ADC->ADCHER.CHEN = 0x80;
		
		/* Step 5. Enable ADC interrupt */
		
		ADC->ADSR.ADF =1; //clear the A/D interrupt flags for safe
		ADC->ADCR.ADIE = 1;
		
		// NVIC_EnableIRQ(ADC_IRQn);
		/* Step 6. Enable WDT module */
		
		ADC->ADCR.ADST=1;
}
	
void uart_tx_char(unsigned char data)
	{
		while(UART0->FSR.TE_FLAG == 0);
		UART0->DATA = data;
	}
	
void uart_transmit(unsigned int data)
{
		unsigned char buff[5];
		unsigned int num;
		int i;
		unsigned char tmp[5];
	
		for (i = 0; i < 5; i++)
		{
			tmp[i] = (num % 10) | '0';
			num = num / 10;			
		}
		num = hex_to_ascii(data, &buff[0]);
		uart_tx_char('V');
		uart_tx_char(buff[4]);
		uart_tx_char(buff[3]);
		uart_tx_char(buff[2]);
		uart_tx_char(buff[1]);
		uart_tx_char(buff[0]);
		uart_tx_char('\n');
		uart_tx_char('\r');	
		
		GPIOD->DOUT = ~GPIOD->DOUT;		
		
//		uart_tx_char('C');
//		uart_tx_char(tmp[4]);
//		uart_tx_char(tmp[3]);
//		uart_tx_char(tmp[2]);
//		uart_tx_char(tmp[1]);
//		uart_tx_char(tmp[0]);
//		uart_tx_char('\n');
//		uart_tx_char('\r');	
}
	
void case1()
{
	int i;
	
	SysTick->LOAD = 47999;
	SysTick->VAL = 0;
	SysTick->CTRL = 0x5;
	
	GPIOC->PMD.PMD14 = 0x1;	
	GPIOC->PMD.PMD15 = 0x1;
	
	GPIOC->DOUT = 0x1;	
	
		for (i=0; i < 100; i++)
		{
			while ((SysTick->CTRL & 0x10000) == 0);
		}		
		GPIOC->DOUT = ~0x00007000;  //0001
		
		for (i=0; i< 100; i++)
		{
			while ((SysTick->CTRL & 0x10000) == 0);
		}
		GPIOC->DOUT = ~0x0000B000;  //0010
		
		for (i=0; i< 100; i++)
		{
			while ((SysTick->CTRL & 0x10000) == 0);
		}
		GPIOC->DOUT = ~0x0000D000;	//0100
		
		for (i=0; i< 100; i++)
		{
			while ((SysTick->CTRL & 0x10000) == 0);
		}
		GPIOC->DOUT = ~0x0000E000;	//1000
		for (i=0; i< 100; i++)
		{
			while ((SysTick->CTRL & 0x10000) == 0);
		}	
}



//unsigned char count;
//void TMR1_IRQHandler(void) // Timer0 interrupt subroutine
//{
//		TIMER1->TISR.TIF =1;
//		count++;
//		if(count==10)
//		count = 0;
//		UART0->DATA = count + 0x30;
//		UART0->DATA = '\n';
//		UART0->DATA = '\r';
//}

void TMR1_IRQHandler(void) // Timer0 interrupt subroutine
{
			TIMER1->TISR.TIF =1;
//		ADC->ADSR.ADF=1;		
//		//UART0->DATA = ADC->ADDR[7].RSLT;
//		ADC->ADCR.ADST=1;
			GPIOC->DOUT = ~GPIOC->DOUT;
}

void case2()
{
	int i;
	
	SysTick->LOAD = 47999;
	SysTick->VAL = 0;
	SysTick->CTRL = 0x5;
	
	GPIOC->PMD.PMD14 = 0x1;	
	GPIOC->PMD.PMD15 = 0x1;
	
	GPIOC->DOUT = 0x1;
	
	UART0->DATA = '\n';
	UART0->DATA = '\r';
	
	while(1) 
		{
			for (i = 0; i < 200; i++)
			{
				while ((SysTick->CTRL & 0x10000)==0);
			}
			if(UART0->FSR.TE_FLAG == 1)
				{
					UART0->DATA = 'K';
					UART0->DATA = 'k';
					UART0->DATA = '!';
					UART0->DATA = '\n';
					UART0->DATA = '\r';
				}
		}
}

void case2_1()
{
	int i;
	int	rx;
	
	SysTick->LOAD = 47999;
	SysTick->VAL = 0;
	SysTick->CTRL = 0x5;
	
	GPIOC->PMD.PMD14 = 0x1;	
	GPIOC->PMD.PMD15 = 0x1;
	
	GPIOC->DOUT = 0x1;
	
	UART0->DATA = '\n';
	UART0->DATA = '\r';
	
	while(1) 
		{
			for (i = 0; i < 10; i++)
			{
				while ((SysTick->CTRL & 0x10000)==0);
			}
			if(UART0->FSR.RX_EMPTY == 0)
				{
					rx = UART0->DATA;
					UART0->DATA = rx;
					UART0->DATA = rx;					
					UART0->DATA = 'O';
					UART0->DATA = 'k';
					UART0->DATA = '!';
					UART0->DATA = '\n';
					UART0->DATA = '\r';
				}
		}
}


int main()
{	
	unsigned int i = 0;
	//unsigned char count;
	
	
////	int i;
//// SysTick Timer Initialization
//SysTick->LOAD = (2000-1); // Count from 47999 to 0
//SysTick->VAL = 0; // Clear SysTick value
//SysTick->CTRL = 0x5; // Enable, using core clock
////GPIO Init
//GPIOC->PMD.PMD14 = 0x1;
//GPIOC->PMD.PMD15 = 0x1;
//GPIOC->DOUT = 0x1;
	InterruptInit();
	
	Timer_initial();
	InitADC();	
	GPIOC->DOUT = 0x0000F000;		
	while(1)
	{
		
//		for (i=0; i<500; i++) { // Wait for 0.5 seconds
//while ((SysTick->CTRL & 0x10000)==0)
//; // Wait for counter underflow
//}
		
		
		
		
		//case1();			
	
		//uart_transmit(ADC->ADDR[7].RSLT*625>>9);		
		//uart_transmit(ADC->ADDR[7].RSLT>>8);
				
	}
	
	//UART02_IRQHandler();
	
	
}

