#include "altera_up_ps2_mouse.h"

int alt_up_ps2_mouse_reset(alt_up_ps2_dev *ps2)
{
	if (ps2->device_type != PS2_MOUSE)
		return -EINVAL;

	alt_u8 byte;

	//send the reset command
	int status = alt_up_ps2_write_data_byte_with_ack(ps2, MOUSE_RESET);
	if (status == 0) 
	{
		// get the ACK, now read the BAT result
		status = alt_up_ps2_read_data_byte(ps2, &byte);
		if ( status == 0 && byte == 0xAA) 
		{
			// BAT is passed, now get the device ID
			status = alt_up_ps2_read_data_byte(ps2, &byte); 
			// mouse should return 0x00 for device ID
			if ( byte == 0x00 )
				status = 0;
			else 
				status = -EIO;
		}
	}
	return status;
}

int alt_up_ps2_mouse_set_mode(alt_up_ps2_dev *ps2, alt_u8 byte)
{
	return alt_up_ps2_write_data_byte_with_ack(ps2, byte);
}

