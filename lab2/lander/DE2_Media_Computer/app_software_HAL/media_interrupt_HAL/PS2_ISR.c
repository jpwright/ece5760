#include "globals.h"

extern volatile unsigned char byte1, byte2, byte3;

/***************************************************************************************
 * Pushbutton - Interrupt Service Routine                                
 *                                                                          
 * This routine checks which KEY has been pressed. If it is KEY1 or KEY2, it writes this 
 * value to the global variable key_pressed. If it is KEY3 then it loads the SW switch 
 * values and stores in the variable pattern
****************************************************************************************/
void PS2_ISR(struct alt_up_dev *up_dev, unsigned int id)
{
	unsigned char PS2_data;

	/* check for PS/2 data--display on HEX displays */
	if (alt_up_ps2_read_data_byte (up_dev->PS2_dev, &PS2_data) == 0)
	{
		/* allows save the last three bytes of data */
		byte1 = byte2;
		byte2 = byte3;
		byte3 = PS2_data;
		if ( (byte2 == (unsigned char) 0xAA) && (byte3 == (unsigned char) 0x00) )
			// mouse inserted; initialize sending of data
			(void) alt_up_ps2_write_data_byte (up_dev->PS2_dev, (unsigned char) 0xF4);
	}
	return;
}
