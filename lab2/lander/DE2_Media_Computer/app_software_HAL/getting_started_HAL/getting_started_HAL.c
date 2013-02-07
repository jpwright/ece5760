#include "altera_up_avalon_parallel_port.h"
#include "altera_up_avalon_audio.h"
#include "sys/alt_stdio.h"

/* globals */
#define BUF_SIZE 500000			// about 10 seconds of buffer (@ 48K samples/sec)
#define BUF_THRESHOLD 96		// 75% of 128 word buffer

/* function prototypes */
void check_KEYs( int *, int *, int *, alt_up_parallel_port_dev *, alt_up_audio_dev * );

/********************************************************************************
 * This program demonstrates use of HAL functions
 *
 * It performs the following: 
 *  	1. records audio for about 10 seconds when KEY[1] is pressed. LEDG[0] is
 *  	   lit while recording
 * 	2. plays the recorded audio when KEY[2] is pressed. LEDG[1] is lit while 
 * 	   playing
********************************************************************************/
int main(void)
{
	/* declare variables to point to devices that are opened */
	alt_up_parallel_port_dev *KEY_dev;
	alt_up_parallel_port_dev *green_LEDs_dev;
	alt_up_audio_dev *audio_dev;

	// open the pushbutton KEY parallel port
	KEY_dev = alt_up_parallel_port_open_dev ("/dev/Pushbuttons");
	if (KEY_dev == NULL)
	{
		alt_printf ("Error: could not open pushbutton KEY device\n");
		return -1;
	}
	else
		alt_printf ("Opened pushbutton KEY device\n");
	// open the green LEDs parallel port
	green_LEDs_dev = alt_up_parallel_port_open_dev ("/dev/Green_LEDs");
	if (green_LEDs_dev == NULL)
	{
		alt_printf ("Error: could not open green LEDs device\n");
		return -1;
	}
	else
		alt_printf ("Opened green LEDs device\n");
	audio_dev = alt_up_audio_open_dev ("/dev/Audio");
	if ( audio_dev == NULL)
	{
		alt_printf ("Error: could not open audio device\n");
		return -1;
	}
	else
		alt_printf ("Opened audio device\n");

	/* used for audio record/playback */
	int record = 0, play = 0, buffer_index = 0;
	unsigned int l_buf[BUF_SIZE];
	unsigned int r_buf[BUF_SIZE];
	int num_read; int num_written;
	/* read and echo audio data */
	record = 0;
	play = 0;
	while(1)
	{
		check_KEYs ( &record, &play, &buffer_index, KEY_dev, audio_dev );
		if (record)
		{
			alt_up_parallel_port_write_data(green_LEDs_dev, 0x1); // set LEDG[0] on

			// record data until the buffer is full
			if (buffer_index < BUF_SIZE)
			{
				num_read = alt_up_audio_record_r (audio_dev, &(r_buf[buffer_index]), 
					BUF_SIZE - buffer_index);
				/* assume we can read same # words from the left and right */
				(void) alt_up_audio_record_l (audio_dev, &(l_buf[buffer_index]), 
					num_read);
				buffer_index += num_read;

				if (buffer_index == BUF_SIZE)
				{
					// done recording
					record = 0;
					alt_up_parallel_port_write_data(green_LEDs_dev, 0x0); // set LEDG off
				}
			}
		}
		else if (play)
		{
			alt_up_parallel_port_write_data(green_LEDs_dev, 0x2); // set LEDG[1] on

			// output data until the buffer is empty 
			if (buffer_index < BUF_SIZE)
			{
				num_written = alt_up_audio_play_r (audio_dev, &(r_buf[buffer_index]), 
				 	BUF_SIZE - buffer_index);
				/* assume that we can write the same # words to the left and right */
				(void) alt_up_audio_play_l (audio_dev, &(l_buf[buffer_index]), 
					num_written);
				buffer_index += num_written;

				if (buffer_index == BUF_SIZE)
				{
					// done playback
					play = 0;
					alt_up_parallel_port_write_data(green_LEDs_dev, 0x0); // set LEDG off
				}
			}
		}
	}
}

/****************************************************************************************
 * Subroutine to read KEYs
****************************************************************************************/
void check_KEYs(int *KEY1, int *KEY2, int *counter, alt_up_parallel_port_dev *KEY_dev,
					 alt_up_audio_dev *audio_dev)
{
	int KEY_value;

	KEY_value = alt_up_parallel_port_read_data (KEY_dev); // read the pushbutton KEY values
	while (alt_up_parallel_port_read_data (KEY_dev));		// wait for pushbutton KEY release

	if (KEY_value == 0x2)					// check KEY1
	{
		// reset counter to start recording
		*counter = 0;
		// reset audio port
		alt_up_audio_reset_audio_core (audio_dev);

		*KEY1 = 1;
	}
	else if (KEY_value == 0x4)				// check KEY2
	{
		// reset counter to start playback
		*counter = 0;
		// reset audio port
		alt_up_audio_reset_audio_core (audio_dev);

		*KEY2 = 1;
	}
}
