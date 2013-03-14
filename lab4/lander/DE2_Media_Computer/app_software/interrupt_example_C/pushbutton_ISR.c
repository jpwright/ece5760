#include "key_codes.h" 	// defines values for KEY1, KEY2, KEY3

extern volatile int key_pressed;
extern volatile int pattern;

/***************************************************************************************
 * Pushbutton - Interrupt Service Routine                                
 *                                                                          
 * This routine checks which KEY has been pressed. If it is KEY1 or KEY2, it writes this 
 * value to the global variable key_pressed. If it is KEY3 then it loads the SW switch 
 * values and stores in the variable pattern
****************************************************************************************/
void pushbutton_ISR( void )
{
	volatile int * KEY_ptr = (int *) 0x10000050;
  	volatile int * slider_switch_ptr = (int *) 0x10000040;
	int press;

	press = *(KEY_ptr + 3);					// read the pushbutton interrupt register
	*(KEY_ptr + 3) = 0; 						// Clear the interrupt

	if (press & 0x2)							// KEY1
		key_pressed = KEY1;
	else if (press & 0x4)					// KEY2
		key_pressed = KEY2;
	else 											// press & 0x8, which is KEY3
		pattern = *(slider_switch_ptr); 	// Read the SW slider switch values; store in pattern

	return;
}
