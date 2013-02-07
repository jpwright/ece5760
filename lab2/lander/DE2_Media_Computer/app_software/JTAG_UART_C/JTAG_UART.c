/* function prototypes */
void put_jtag(volatile int *, char);

/********************************************************************************
 * This program demonstrates use of the JTAG UART port in the DE2 Media Computer
 *
 * It performs the following: 
 *  	1. sends a text string to the JTAG UART
 * 	2. reads character data from the JTAG UART
 * 	3. echos the character data back to the JTAG UART
********************************************************************************/
int main(void)
{
	/* Declare volatile pointers to I/O registers (volatile means that IO load
	   and store instructions will be used to access these pointer locations, 
	   instead of regular memory loads and stores) */
	volatile int * JTAG_UART_ptr 	= (int *) 0x10001000;	// JTAG UART address

	int data, i;
	char text_string[] = "\nJTAG UART example code\n> \0";

	/* print a text string */
	for (i = 0; text_string[i] != 0; ++i)
		put_jtag (JTAG_UART_ptr, text_string[i]);

	/* read and echo characters */
	while(1)
	{
		data = *(JTAG_UART_ptr);		 		// read the JTAG_UART data register
		if (data & 0x00008000)					// check RVALID to see if there is new data
		{
			data = data & 0x000000FF;			// the data is in the least significant byte
			/* echo the character */
			put_jtag (JTAG_UART_ptr, (char) data & 0xFF );
		}
	}
}

/********************************************************************************
 * Subroutine to send a character to the JTAG UART
********************************************************************************/
void put_jtag( volatile int * JTAG_UART_ptr, char c )
{
	int control;
	control = *(JTAG_UART_ptr + 1);			// read the JTAG_UART control register
	if (control & 0xFFFF0000)					// if space, then echo character, else ignore 
		*(JTAG_UART_ptr) = c;
}
