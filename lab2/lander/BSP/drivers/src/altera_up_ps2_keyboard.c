#include "altera_up_ps2_keyboard.h"
#include <string.h>

#define SCAN_CODE_NUM  102

////////////////////////////////////////////////////////////////////
// Table of scan code, make code and their corresponding values 
// These data are useful for developing more features for the keyboard 
//
char *key_table[SCAN_CODE_NUM] = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "`", "-", "=", "\\", "BKSP", "SPACE", "TAB", "CAPS", "L SHFT", "L CTRL", "L GUI", "L ALT", "R SHFT", "R CTRL", "R GUI", "R ALT", "APPS", "ENTER", "ESC", "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12", "SCROLL", "[", "INSERT", "HOME", "PG UP", "DELETE", "END", "PG DN", "U ARROW", "L ARROW", "D ARROW", "R ARROW", "NUM", "KP /", "KP *", "KP -", "KP +", "KP ENTER", "KP .", "KP 0", "KP 1", "KP 2", "KP 3", "KP 4", "KP 5", "KP 6", "KP 7", "KP 8", "KP 9", "]", ";", "'", ",", ".", "/" };

char ascii_codes[SCAN_CODE_NUM] = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '`', '-', '=', 0, 0x08, 0, 0x09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x0A, 0x1B, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '[', 0, 0, 0, 0x7F, 0, 0, 0, 0, 0, 0, 0, '/', '*', '-', '+', 0x0A, '.', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', ']', ';', '\'', ',', '.', '/' };

alt_u8 single_byte_make_code[SCAN_CODE_NUM] = { 0x1C, 0x32, 0x21, 0x23, 0x24, 0x2B, 0x34, 0x33, 0x43, 0x3B, 0x42, 0x4B, 0x3A, 0x31, 0x44, 0x4D, 0x15, 0x2D, 0x1B, 0x2C, 0x3C, 0x2A, 0x1D, 0x22, 0x35, 0x1A, 0x45, 0x16, 0x1E, 0x26, 0x25, 0x2E, 0x36, 0x3D, 0x3E, 0x46, 0x0E, 0x4E, 0x55, 0x5D, 0x66, 0x29, 0x0D, 0x58, 0x12, 0x14, 0, 0x11, 0x59, 0, 0, 0, 0, 0x5A, 0x76, 0x05, 0x06, 0x04, 0x0C, 0x03, 0x0B, 0x83, 0x0A, 0x01, 0x09, 0x78, 0x07, 0x7E, 0x54, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x77, 0, 0x7C, 0x7B, 0x79, 0, 0x71, 0x70, 0x69, 0x72, 0x7A, 0x6B, 0x73, 0x74, 0x6C, 0x75, 0x7D, 0x5B, 0x4C, 0x52, 0x41, 0x49, 0x4A };

alt_u8 multi_byte_make_code[SCAN_CODE_NUM] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x1F, 0, 0, 0x14, 0x27, 0x11, 0x2F, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x70, 0x6C, 0x7D, 0x71, 0x69, 0x7A, 0x75, 0x6B, 0x72, 0x74, 0, 0x4A, 0, 0, 0, 0x5A, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
////////////////////////////////////////////////////////////////////

// States for the Keyboard Decode FSM 
typedef enum
{
	STATE_INIT,
	STATE_LONG_CODE,
	STATE_BREAK_CODE ,
	STATE_LONG_BREAK_CODE ,
	STATE_DONE 
} DECODE_STATE;

//helper function for get_next_state
unsigned get_multi_byte_make_code_index(alt_u8 code)
{
	unsigned i;
	for (i = 0; i < SCAN_CODE_NUM; i++ )
	{
		if ( multi_byte_make_code[i] == code )
			return i;
	}
	return SCAN_CODE_NUM;
}

//helper function for get_next_state
unsigned get_single_byte_make_code_index(alt_u8 code)
{
	unsigned i;
	for (i = 0; i < SCAN_CODE_NUM; i++ )
	{
		if ( single_byte_make_code[i] == code )
			return i;
	}
	return SCAN_CODE_NUM;
}

//helper function for decode_scancode
/* FSM Diagram (Main transitions)
 * Normal bytes: bytes that are not 0xF0 or 0xE0
  +--<--+
  |     |                                   
  |     |
  V    INIT ------ 0xF0 ----> BREAK CODE
  |     |                         |
  |     |         LONG_BREAK_CODE-+
  |    0xE0      /                |
 Normal |       /                Normal
  |     |     0xF0                |
  |     V     /                   |
  |    LONG  /                    V
  |    CODE --- Normal -------> DONE
  |          (long make code)    /|\
  |                               |
  +-------------------------------|

 */
DECODE_STATE get_next_state(DECODE_STATE state, alt_u8 byte, KB_CODE_TYPE *decode_mode, alt_u8 *buf, char *ascii)
{
	DECODE_STATE next_state = STATE_INIT;
	unsigned idx = SCAN_CODE_NUM;
	*ascii = 0;
	switch (state)
	{
		case STATE_INIT:
			if ( byte == 0xE0 )
			{	
				// this could be a long break code or a long make code
				next_state = STATE_LONG_CODE;
			}
			else if (byte == 0xF0)
			{
				// it is a break code
				next_state = STATE_BREAK_CODE;
			}
			else
			{
				// it is a normal make code
				idx = get_single_byte_make_code_index(byte);
				if ( (idx < 40 || idx == 68 || idx > 79) && ( idx != SCAN_CODE_NUM ) )
				{
					*decode_mode = KB_ASCII_MAKE_CODE;
					*ascii = ascii_codes[idx];
					*buf = byte;
				}
				else 
				{
					*decode_mode = KB_BINARY_MAKE_CODE;
					*buf = byte;
				}
				next_state = STATE_DONE;
			}
			break;
		case STATE_LONG_CODE:
			if ( byte != 0xF0 && byte!= 0xE0)
			{
				*decode_mode = KB_LONG_BINARY_MAKE_CODE;
				*buf = byte;
				next_state = STATE_DONE;
			}
			else
			{
				*decode_mode = KB_BREAK_CODE;
				next_state = STATE_LONG_BREAK_CODE;
			}
			break;
		case STATE_BREAK_CODE:
			if ( byte != 0xF0 && byte != 0xE0)
			{
				*decode_mode = KB_BREAK_CODE;
				*buf = byte;
				next_state = STATE_DONE;
			}
			else
			{
				next_state = STATE_BREAK_CODE;
				*decode_mode = KB_BREAK_CODE;
			}
			break;
		case STATE_LONG_BREAK_CODE:
			if ( byte != 0xF0 && byte != 0xE0)
			{
				*decode_mode = KB_LONG_BREAK_CODE;
				*buf = byte;
				next_state = STATE_DONE;
			}
			else
			{
				next_state = STATE_LONG_BREAK_CODE;
				*decode_mode = KB_LONG_BREAK_CODE;
			}
			break;
		default:
			*decode_mode = KB_INVALID_CODE;
			next_state = STATE_INIT;
	}
	return next_state;
}

int decode_scancode(alt_up_ps2_dev *ps2, KB_CODE_TYPE *decode_mode, alt_u8 *buf, char *ascii)
{
	alt_u8 byte = 0;
	int status_read =0;
	*decode_mode = KB_INVALID_CODE;
	DECODE_STATE state = STATE_INIT;
	do
	{
		status_read = alt_up_ps2_read_data_byte(ps2, &byte);
		//FIXME: When the user press the keyboard extremely fast, data may get
		//occasionally get lost 

		if (status_read != 0)
			return status_read;

		state = get_next_state(state, byte, decode_mode, buf, ascii);
	} while ( state != STATE_DONE );

	return 0;
}

alt_u32 set_keyboard_rate(alt_up_ps2_dev *ps2, alt_u8 rate)
{
	// send the set keyboard rate command
	int status_send = alt_up_ps2_write_data_byte_with_ack(ps2, 0xF3);
	if ( status_send == 0)
	{
		// we received ACK, so send out the desired rate now
		status_send = alt_up_ps2_write_data_byte_with_ack(ps2, rate & 0x1F);
	}
	return status_send;
}

void translate_make_code(KB_CODE_TYPE decode_mode, alt_u8 makecode, char *str)
{
	unsigned idx;
	switch (decode_mode)
	{
		case KB_ASCII_MAKE_CODE:
			idx = get_single_byte_make_code_index(makecode);
			strcpy(str, key_table[idx]);
			break;
		case KB_BINARY_MAKE_CODE:
			idx = get_single_byte_make_code_index(makecode);
			strcpy(str, key_table[idx]);
			break;
		case KB_LONG_BINARY_MAKE_CODE:
			idx = get_multi_byte_make_code_index(makecode);
			strcpy(str, key_table[idx]);
			break;
		default:
			str = "";
			break;
	}
}


alt_u32 reset_keyboard(alt_up_ps2_dev *ps2)
{
	alt_u8 byte;
	// send out the reset command
	int status = alt_up_ps2_write_data_byte_with_ack(ps2, 0xff); 
	if ( status == 0)
	{
		// received the ACK for reset, now check the BAT result
		status = alt_up_ps2_read_data_byte(ps2, &byte);
		if (status == 0 && byte == 0xAA)
		{
			// BAT succeed
		}
		else
		{
			// BAT failed
			status = -1;
		}
	}	
	return status;
}

