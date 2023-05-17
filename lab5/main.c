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

void case1()
{
	int i;
	
	SysTick->LOAD = 47999;
	SysTick->VAL = 0;
	SysTick->CTRL = 0x5;
	
	GPIOC->PMD.PMD14 = 0x1;	
	GPIOC->PMD.PMD15 = 0x1;
	
	GPIOC->DOUT = 0x1;
	
	while(1)
	{
		for (i=0; i< 100; i++)
		{
			while ((SysTick->CTRL & 0x10000) == 0);
		}
		GPIOC->DOUT = ~0x00007000;
		
		for (i=0; i< 100; i++)
		{
			while ((SysTick->CTRL & 0x10000) == 0);
		}
		GPIOC->DOUT = ~0x0000B000;
		
		for (i=0; i< 100; i++)
		{
			while ((SysTick->CTRL & 0x10000) == 0);
		}
		GPIOC->DOUT = ~0x0000D000;
		
		for (i=0; i< 100; i++)
		{
			while ((SysTick->CTRL & 0x10000) == 0);
		}
		GPIOC->DOUT = ~0x0000E000;
	}
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
			for (i = 0; i < 200; i++)
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

void case3()
{
	
}

int main()
{	
	
	case2_1();
	InterruptInit();
	
	
	return 0;
}

