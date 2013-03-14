#include "globals.h"

extern volatile int timeout;

/*****************************************************************************
 * Interval timer interrupt service routine
 *                                                                          
 * Shifts a PATTERN being displayed on the LCD character display. The shift 
 * direction is determined by the external variable KEY_PRESSED.
 * 
******************************************************************************/
void interval_timer_ISR(struct alt_up_dev *up_dev, unsigned int id)
{
	volatile int *interval_timer_ptr = (int *) 0x10002000;

	*(interval_timer_ptr) = 0; 										// clear the interrupt
	timeout = 1;															// set global variable

	/* shift the LCD display to the left */
	alt_up_character_lcd_shift_display (up_dev->lcd_dev, -1);

	return;
}

