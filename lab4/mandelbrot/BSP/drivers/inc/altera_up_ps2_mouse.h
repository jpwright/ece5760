#ifndef __PS2_MOUSE_H__
#define __PS2_MOUSE_H__

#include "altera_up_avalon_ps2.h"

//mouse commands
#define MOUSE_SET_SAMPLE_RATE 0xF3
#define MOUSE_RESET 0xFF
#define MOUSE_SET_DEFAULT 0xF6
#define MOUSE_DISABLE_DATA_REPORTING 0xF5
#define MOUSE_ENABLE_DATA_REPORTING 0xF4
#define MOUSE_SET_SAMPLE_RATE 0xF3
#define MOUSE_READ_DATA 0xEB
#define MOUSE_SET_STREAM_MODE 0xEA
#define MOUSE_REQUEST_STATUS 0xE9
#define MOUSE_SET_RESOLUTION 0xE8

//Mouse modes (incomplete list)
#define MOUSE_STREAM_MODE 0xEA
#define MOUSE_REMOTE_MODE 0xF0

/**
 * @brief Reset the mouse.
 *
 * @param ps2 -- the PS/2 mouse device strcture
 *
 * @return 0 on BAT is passed, \c -EINVAL when the PS/2 device is not mouse, or \c -EIO if error occurs.
 **/
int alt_up_ps2_mouse_reset(alt_up_ps2_dev *ps2);

/**
 * @brief Set the operation mode of the mouse.
 *
 * @param ps2 -- the PS/2 mouse device strcture
 * @param byte -- the byte representing the mode (see macro definitions for details).
 *
 * @sa PS/2 Mouse document 
 *
 * @return 0 on receiving acknowledgment, or negative number for errors.
 **/
int alt_up_ps2_mouse_set_mode(alt_up_ps2_dev *ps2, alt_u8 byte);

#endif
