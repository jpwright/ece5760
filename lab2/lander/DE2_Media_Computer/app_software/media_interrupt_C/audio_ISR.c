#include "globals.h"

/* globals used for audio record/playback */
extern volatile int record, play, buffer_index;
extern volatile int left_buffer[];
extern volatile int right_buffer[];

/***************************************************************************************
 * Pushbutton - Interrupt Service Routine                                
 *                                                                          
 * This routine checks which KEY has been pressed. If it is KEY1 or KEY2, it writes this 
 * value to the global variable key_pressed. If it is KEY3 then it loads the SW switch 
 * values and stores in the variable pattern
****************************************************************************************/
void audio_ISR( void )
{
	volatile int * audio_ptr = (int *) 0x10003040;		// audio port address
  	volatile int * green_LED_ptr = (int *) 0x10000010;	// green LED address
	
	int fifospace, leftdata, rightdata;

	if (*(audio_ptr) & 0x100)						// check bit RI of the Control register
	{
		if (buffer_index == 0)
			*(green_LED_ptr) = 0x1;					// turn on LEDG[0]

		fifospace = *(audio_ptr + 1);	 			// read the audio port fifospace register
		// store data until the the audio-in FIFO is empty or the buffer is full
		while ( (fifospace & 0x000000FF) && (buffer_index < BUF_SIZE) )
		{
			left_buffer[buffer_index] = *(audio_ptr + 2); 		
			right_buffer[buffer_index] = *(audio_ptr + 3); 		
			++buffer_index;

			if (buffer_index == BUF_SIZE)
			{
				// done recording
				record = 0;
				*(green_LED_ptr) = 0x0;				// turn off LEDG
				*(audio_ptr) = 0x0; 					// turn off interrupts
			}
			fifospace = *(audio_ptr + 1);	// read the audio port fifospace register
		}
	}
	if (*(audio_ptr) & 0x200)						// check bit WI of the Control register
	{
		if (buffer_index == 0)
			*(green_LED_ptr) = 0x2;					// turn on LEDG_1
		fifospace = *(audio_ptr + 1);	 			// read the audio port fifospace register
		// output data until the buffer is empty or the audio-out FIFO is full
		while ( (fifospace & 0x00FF0000) && (buffer_index < BUF_SIZE) )
		{
			*(audio_ptr + 2) = left_buffer[buffer_index];
			*(audio_ptr + 3) = right_buffer[buffer_index];
			++buffer_index;
	
			if (buffer_index == BUF_SIZE)
			{
				// done playback
				play = 0;
				*(green_LED_ptr) = 0x0;				// turn off LEDG
				*(audio_ptr) = 0x0; 					// turn off interrupts
			}
			fifospace = *(audio_ptr + 1);	// read the audio port fifospace register
		}
	}
	return;
}
