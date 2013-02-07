#include "globals.h"

/* global variables */
volatile int buf_index_record, buf_index_play;		// audio variables

volatile unsigned char byte1, byte2, byte3;			// PS/2 variables

volatile int timeout;										// used to synchronize with the timer

struct alt_up_dev up_dev;									/* struct to hold pointers to open devices */
