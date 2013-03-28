#include "address_map.h"
#include "nios2_ctrl_reg_macros.h"
#define RIBBON_CABLE_INSTALLED 0

/* function prototypes */
void Update_HEX_display(int);
void Update_red_LED(void);
void Update_UARTs(void);
void Test_Expansion_Ports(void);
#if RIBBON_CABLE_INSTALLED
int Test_expansion_ports (void);
#endif

/* global variables */

int	display_buffer[] = { 0, 0, 0 };	/* Buffer to hold values to display on the hex display.
 													 * The buffer contains 3 full-words: before, visible, 
													 * after */
int	shift_direction = 0;					// display scrolling direction (right = 1, left = 0)
/* SEVEN_SEGMENT_DECODE_TABLE gives the on/off settings for all segments in 
 * a single 7-seg display in the DE2 Media Computer, for the characters 
 * 'blank', 1, 2, 3, 4, S, 6, r, o, 9, A, P, C, d, E, F. These values obey 
 * the digit indexes on the DE2 board 7-seg displays, and the assignment of 
 * these signals to parallel port pins in the DE2 Media Computer 
 */
char	seven_seg_decode_table[] = {	0x00, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7C, 0x50, 
		  										0x5C, 0x67, 0x77, 0x73, 0x39, 0x5E, 0x79, 0x71 };
char	hex_segments[] = { 0, 0, 0, 0, 0, 0, 0, 0 };
int	green_LED_pattern = 0;				// used for a flashing pattern on the green lights
int	eight_sec = 0;							/* used to keep track of a delay, which is 8 seconds
													 * for the default display scrolling speed */
int	display_toggle = 0;					// toggles display of the text dE2 and PASSED

/***************************************************************************************
 * Main program: exercises various features of the DE2 Media Computer, as a test 
 * and to provide an example.
 * It performs the following: 
 * 1. tests the SRAM repeatedly
 * 2. scrolls some text on the hex displays, which alternates between "dE2" and
 *    "PASSEd" if there is no SRAM error detected, and "Error" if an error is detected 
 * 3. flashes the green LEDs. The speed of flasing and scrolling for 2. is controlled
 *    by timer interrupts
 * 4. connects the SW switches to red LEDs
 * 5. handles pushbutton interrupts: pushing KEY1 speeds up the scrolling of text, 
 *    pushing KEY2 slows it down, and pushing KEY3 stops the scrolling
 * 6. can test the JP1, JP2 expansion ports, if a ribbon cable is installed between them
 * 7. echos text received from the JTAG UART (such as text typed in the
 *    terminal window of the Monitor Program) to the serial port UART, and vice versa
****************************************************************************************/
int main(void)
{
	/* Declare volatile pointers to I/O registers (volatile means that IO load
	 * and store instructions will be used to access these pointer locations, 
	 * instead of regular memory loads and stores)
	*/
	volatile int * interval_timer_ptr = (int *) INTERVAL_TIMER_BASE;
	volatile int * pushbutton_ptr = (int *) PUSHBUTTON_BASE;

	/* initialize 7-segment displays buffer (dE2 just before being visible on left side) */
	display_buffer[0] = 0xdE2;			
	display_buffer[1] = 0x0;		
	display_buffer[2] = 0x0;	

	green_LED_pattern = 0x55555555;	// used for a flashing pattern on the green lights
	eight_sec = 0;							// initialize 8-second delay counter
	display_toggle = 0;					// display initialized to scroll the text dE2
	shift_direction = 1;					// initial shift direction is to the right

	*(interval_timer_ptr + 1) = 0x7;	// Set START = 1, CONT = 1, ITO = 1
	*(pushbutton_ptr + 2) = 0xE; 		// Set the 3 interrupt mask bits to 1 (bit 0 is Nios II reset)

#if !RIBBON_CABLE_INSTALLED
	NIOS2_WRITE_IENABLE( 0x3 );		// Set interrupt mask for the interval timer and pushbuttons
#else
	NIOS2_WRITE_IENABLE( 0x3 | 0x1000 );	// also enable expansion port (JP2) interrupts
#endif
	NIOS2_WRITE_STATUS( 1 );			// Enable Nios II interrupts

	int * SRAM_ptr;

	int SRAM_write = 0x55555555;
	int SRAM_read;
	int memory_error = 0;
	while ( !memory_error )
	{
		SRAM_ptr = (int *) SRAM_BASE;
		while( (SRAM_ptr < (int *) SRAM_END) & !memory_error )
		{
			Update_HEX_display ( display_buffer[1] );
			Update_red_LED ( );							// read slider switches and show on red LEDs
			Update_UARTs ( );								// update both the JTAG and serial port UARTs

		/* only test the Expansion ports if there is a 40-pin ribbon cable connected
			between them. */
#if RIBBON_CABLE_INSTALLED
			if (!Test_expansion_ports ( ))
			{
				memory_error = 1;							// use this to break out of the while loop
			}
#endif
			// test SRAM
			* SRAM_ptr = SRAM_write; 
			SRAM_read = * SRAM_ptr; 
			if (SRAM_read != SRAM_write)
			{
				memory_error = 1;
			}
			SRAM_ptr += 1;
		};
		SRAM_write = ~SRAM_write;
		if ( eight_sec > 80 )
		{
			eight_sec = 0;									// restart the 8-second delay counter
			if ( display_toggle == 0 )
			{
				display_toggle = 1;
				display_buffer[0] = 0xbA55Ed;			// code for the word PASSEd
				display_buffer[1] = 0x0;		
				display_buffer[2] = 0x0;	
			}
			else
			{
				display_toggle = 0;
				display_buffer[0] = 0xdE2;				// code for the word dE2
				display_buffer[1] = 0x0;		
				display_buffer[2] = 0x0;	
			}
		}
	};
	display_buffer[0] = 0xe7787;				// code for the word Error
	display_buffer[1] = 0x0;		
	display_buffer[2] = 0x0;	
	while ( 1 )
	{
		Update_HEX_display ( display_buffer[1] );
	}

	return 0;
}

/*******************************************************************************
 * Updates the value displayed on the hex display. The value is taken from the 
 * buffer.
********************************************************************************/
void Update_HEX_display( int buffer )
{
	volatile int * HEX3_HEX0_ptr = (int *) HEX3_HEX0_BASE;
	volatile int * HEX7_HEX4_ptr = (int *) HEX7_HEX4_BASE;
	int shift_buffer, nibble;
	char code;
	int i;

	shift_buffer = buffer;
	for ( i = 0; i < 8; ++i )
	{
		nibble = shift_buffer & 0x0000000F;		// character is in rightmost nibble
		code = seven_seg_decode_table[nibble];
		hex_segments[i] = code;
		shift_buffer = shift_buffer >> 4;
	}
	*(HEX3_HEX0_ptr) = *(int *) hex_segments; 		// drive the hex displays
	*(HEX7_HEX4_ptr) = *(int *) (hex_segments+4);	// drive the hex displays
	return;
}
/********************************************************************************
 * Updates the value displayed on the red LEDs. The value is taken from the 
 * slider switches.
********************************************************************************/
void Update_red_LED( void )
{
  	volatile int * slider_switch_ptr = (int *) SLIDER_SWITCH_BASE;
	volatile int * red_LED_ptr = (int *) RED_LED_BASE;

	int sw_values;
	sw_values = *(slider_switch_ptr); 	// Read the SW slider switch values
	*(red_LED_ptr) = sw_values; 			// Light up the red LEDs

	return;
}

/********************************************************************************
 * Reads characteres received from either JTAG or serial port UARTs, and echo
 * character to both ports.
********************************************************************************/
void Update_UARTs( void )
{
  	volatile int * JTAG_UART_ptr = (int *) JTAG_UART_BASE;
	volatile int * UART_ptr = (int *) UART_BASE;

	int JTAG_data_register, JTAG_control_register;
	char JTAG_char;
	int UART_data_register, UART_control_register;
	char UART_char;

	// check for char from JTAG, echo to both JTAG and serial port UARTs
	JTAG_data_register = *(JTAG_UART_ptr); 	// bit 15 is RVALID, bits 7-0 is char data
	if ( (JTAG_data_register & 0x8000) )		// have valid data to read?
	{
		JTAG_char = (char) (JTAG_data_register & 0xFF); 	// extract the character
		JTAG_control_register = *(JTAG_UART_ptr + 1); 		// upper halfword is WSPACE
		if ( (JTAG_control_register & 0xFFFF0000) != 0)		// okay to echo char to JTAG?
		{
			*(JTAG_UART_ptr) = JTAG_char; 		// echo the character
		}
		UART_control_register = *(UART_ptr + 1); 		// upper halfword is WSPACE
		if ( (UART_control_register & 0xFFFF0000) != 0)		// okay to echo char to serial port?
		{
			*(UART_ptr) = JTAG_char; 		// echo the character
		}
	}
	// check for char from serial port UART, echo to both serial port and JTAG UARTs
	UART_data_register = *(UART_ptr); 		// bit 15 is RVALID, bits 7-0 is char data
	if ( (UART_data_register & 0x8000) )	// have valid data to read?
	{
		UART_char = (char) (UART_data_register & 0xFF); 	// extract the character
		UART_control_register = *(UART_ptr + 1); 		// upper halfword is WSPACE
		if ( (UART_control_register & 0xFFFF0000) != 0)		// okay to echo char to serial port?
		{
			*(UART_ptr) = UART_char; 		// echo the character
		}
		JTAG_control_register = *(JTAG_UART_ptr + 1); 		// upper halfword is WSPACE
		if ( (JTAG_control_register & 0xFFFF0000) != 0)		// okay to echo char to serial port?
		{
			*(JTAG_UART_ptr) = UART_char; 		// echo the character
		}
	}
	return;
}

/********************************************************************************
 * This code tests that the JP1 and JP2 expansion ports.  The code requires that
 * the two ports be connected in parallel, which would typically be done using 
 * a 40-pin ribbon cable. Returns 1 if no failure, else 0.
********************************************************************************/
int Test_expansion_ports( void )
{
  	volatile int * JP1_EXPANSION_ptr = (int *) JP1_EXPANSION_BASE;
  	volatile int * JP2_EXPANSION_ptr = (int *) JP2_EXPANSION_BASE;
	int data_out[] = { 0x55555555, 0xAAAAAAAA, 0x01234567 };
	int i, ret_value;

	ret_value = 1;

	*(JP1_EXPANSION_ptr+1) = 0xFFFFFFFF;	// makes JP1 an output
	*(JP2_EXPANSION_ptr+1) = 0;				// makes JP2 an input

	for ( i = 0; i < 3; i++ )
	{
		*(JP1_EXPANSION_ptr) = data_out[i];		// makes JP1 an output
		asm (	"nop" );									// cycle delay to allow registers to be clocked
		if ( *(JP2_EXPANSION_ptr) != data_out[i] ) 
		{
			ret_value = 0;
		}
	}
	*(JP2_EXPANSION_ptr+1) = 0xFFFFFFFF;	// makes JP2 an output
	*(JP1_EXPANSION_ptr+1) = 0;				// makes JP1 an input

	for ( i = 0; i < 3; i++ )
	{
		*(JP2_EXPANSION_ptr) = data_out[i];		// makes JP1 an output
		asm (	"nop" );									// cycle delay to allow registers to be clocked
		if ( *(JP1_EXPANSION_ptr) != data_out[i] ) 
		{
			ret_value = 0;
		}
	}
	return (ret_value);
}
