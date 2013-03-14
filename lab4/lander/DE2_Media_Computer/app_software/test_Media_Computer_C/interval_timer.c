#include "address_map.h"

/*****************************************************************************
 * Interval Timer - Interrupt Service Routine                                
 *   Must write to the Interval Timer to clear it. 
 *                                                                          
 * Shifts the text being displayed in the hex displays, either right or left.
 * Also toggles the values of the green LEDs so that they will flash.
 * 
 * shift_dir - display shift direction; parameter passed in and out
 * light_pattern - Green LED pattern; parameter passed in and out 
 * buffer - display buffer pointer parameter; passed in
******************************************************************************/
void interval_timer_isr( int * light_pattern, int * shift_dir, int buffer[])
{
	volatile int * interval_timer_ptr = (int *) INTERVAL_TIMER_BASE;
	volatile int * green_LED_ptr = (int *) GREEN_LED_BASE;

	*(interval_timer_ptr) = 0; 					// Clear the interrupt

	*(light_pattern) = ~(*(light_pattern));	// toggle light pattern
	*(green_LED_ptr) = *(light_pattern);
	
	/* if the current shift direction is to the right, then the shift should be reversed
	 * when the first and second words are zero; the shift should be reversed for the left
	 * shift direction when the second and third words are zero
	 */
	if ( *(shift_dir) == 1 /* right */ )
	{
		if ( (buffer[0] == 0) && (buffer[1] == 0) )
		{
			*(shift_dir) = 0;
		}
	}
	else /* left */
	{
		if ( (buffer[1] == 0) && (buffer[2] == 0) )
		{
			*(shift_dir) = 1;
		}
	}
	int template[2];
	if ( *(shift_dir) == 1 /* right */ )
	{
		template[0] = (buffer[0] << 28) & 0xF0000000;
		template[1] = (buffer[1] << 28) & 0xF0000000;
		*(buffer+0) = (buffer[0] >> 4) & 0x0FFFFFFF;
		*(buffer+1) = ((buffer[1] >> 4) & 0x0FFFFFFF) | template[0];
		*(buffer+2) = ((buffer[2] >> 4) & 0x0FFFFFFF) | template[1];
	}
	else /* left */
	{
		template[0] = (buffer[1] >> 28) & 0xF;
		template[1] = (buffer[2] >> 28) & 0xF;
		*(buffer+0) = (buffer[0] << 4) | template[0];
		*(buffer+1) = (buffer[1] << 4) | template[1];
		*(buffer+2) = (buffer[2] << 4);
	}
	return;
}

