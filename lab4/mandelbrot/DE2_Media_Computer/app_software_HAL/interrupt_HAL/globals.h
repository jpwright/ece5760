/* include HAL device driver functions for the parallel port and audio device */
#include "altera_up_avalon_parallel_port.h"
#include "altera_up_avalon_audio.h"

#include "sys/alt_stdio.h"
#include "sys/alt_irq.h"

/* This stucture holds a pointer to each open I/O device */
struct alt_up_dev {
	alt_up_parallel_port_dev *KEY_dev;
	alt_up_parallel_port_dev *green_LEDs_dev;
	alt_up_audio_dev *audio_dev;
};

