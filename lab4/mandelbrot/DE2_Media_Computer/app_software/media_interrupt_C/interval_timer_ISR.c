extern volatile int timeout;

/*****************************************************************************
 * Interval timer interrupt service routine
 *                                                                          
 * Controls refresh of the VGA screen
 * 
******************************************************************************/
void interval_timer_ISR( )
{
	volatile int * interval_timer_ptr = (int *) 0x10002000;
  	volatile char * LCD_display_ptr = (char *) 0x10003050;	// 16x2 character display

	*(interval_timer_ptr) = 0; 										// clear the interrupt
	timeout = 1;															// set global variable

	/* shift the LCD display to the left */
	*(LCD_display_ptr) = 0x18;											// instruction = shift left 

	return;
}

