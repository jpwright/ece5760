#include "globals.h"

/* global variables */
volatile int record, play, buffer_index;		// audio variables
volatile int left_buffer[BUF_SIZE];				// audio buffer
volatile int right_buffer[BUF_SIZE]; 			// audio buffer

volatile char byte1, byte2, byte3;				// PS/2 variables

volatile int timeout;								// used to synchronize with the timer

