#include "address_map.h"

/*****************************************************************************
 * Pushbutton - Interrupt Service Routine                                
 *   Divide or multiply DE2 delay by 2
 *                                                                          
 * r10 - Pushbutton
******************************************************************************/
void pushbutton_isr( void )
{
	volatile int * pushbutton_ptr = (int *) PUSHBUTTON_BASE;
	volatile int * interval_timer_ptr = (int *) INTERVAL_TIMER_BASE;
	int press, high_half, counter;
	int stop = 0;

	// get the current timer counter value in case we need to change it

	// stop the timer
	*(interval_timer_ptr + 1) = 0x8; 		// STOP = 1, START = 0, CONT = 0, ITO = 0 
	
	// read the 32-bit counter start value from the 16-bit timer registers
	high_half = *(interval_timer_ptr + 0x3) & 0xFFFF;
	counter = (*(interval_timer_ptr + 0x2) & 0xFFFF) | (high_half << 16);

	press = *(pushbutton_ptr + 3);
	*(pushbutton_ptr + 3) = 0; 		// Clear the interrupt

	if (press & 0x2)			// KEY1
	{
		counter = counter >> 1;			// half the count value = double timer frequency
		if (counter < 0x2FAF0)			// avoid making the timer too fast
		{
			counter = 0x2FAF0;
		}
	}
	else if (press & 0x4)	// KEY2
	{
		counter = counter << 1;			// half the count value = double timer frequency
		counter = counter | 1;			// make sure it never shifts to all 0s
	}
	else // press & 0x8, which is KEY3
	{
		stop = 1;
	}

	if (!stop)
	{
		// store new counter values
		*(interval_timer_ptr + 0x2) = (counter & 0xFFFF);
		*(interval_timer_ptr + 0x3) = (counter >> 16) & 0xFFFF;
		// restart counter
		*(interval_timer_ptr + 1) = 0x7; 		// STOP = 0, START = 1, CONT = 1, ITO = 1 
	}

	return;
}

