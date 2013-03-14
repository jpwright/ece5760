#include "altera_up_avalon_ethernet.h"
#include "altera_up_avalon_ethernet_low_level_driver.h"
#include "altera_up_avalon_ethernet_high_level_driver.h"
#include "altera_up_avalon_ethernet_regs.h"
#include "sys/alt_stdio.h"
#include "sys/alt_irq.h"
#include <unistd.h>

/* globals */
// Create a transmission packet with multicast address
unsigned char tx_packet[1024] = { 0xFF,0xFF,0xFF,0xFF,0xFF,0xFF, 0x01,0x60,0x6E,0x11,0x02,0x0F };
unsigned int text_length;

alt_up_ethernet_dev * ethernet_dev;

/* function prototypes */
void ethernet_interrupts(void);

/********************************************************************************
 * This program demonstrates use of the ethernet in the DE2 Media Computer. It
 *   requires a second DE2 board with this program running. The two DE2 boards
 *   should be connected using a cross-over ethernet cable.
 *
 * It performs the following: 
 *  1. Records input text and transmits the text via ethernet after enter is 
 *     pressed
 * 	2. Displays text received via ethernet packet on the JTAG UART
********************************************************************************/
int main(void)
{
	/* open the ethernet controller */
	ethernet_dev = alt_up_ethernet_open_dev ("/dev/Ethernet");
	if (ethernet_dev == NULL)
	{
		alt_printf ("Error: could not open Ethernet controller device\n");
		return -1;
	}
	else
		alt_printf ("Opened Ethernet controller device\n");
	
	/* Reqister the ethernet interrupt handler */
	alt_irq_register( ethernet_dev->irq, NULL, (void*)ethernet_interrupts ); 
	
	/* Enable the ethernet's receive packet interrupt */
	alt_up_ethernet_set_interrupts( ethernet_dev, ALT_UP_ETHERNET_INTERRUPT_MASK_PRI );

	while (1) {
		char new_char;

		alt_printf( "me> " );
		text_length = 0;
		tx_packet[12] = '\0';

		while (1) {
			/* Enable the ethernet's receive packet interrupt */
			alt_up_ethernet_set_interrupts( ethernet_dev, ALT_UP_ETHERNET_INTERRUPT_MASK_PRI );

			new_char = alt_getchar();

			/* Disable the ethernet's receive packet interrupt */
			alt_up_ethernet_set_interrupts( ethernet_dev, ALT_UP_ETHERNET_INTERRUPT_MASK_NONE );

			// Check if character is a backspace
			if (new_char == 0x08) {
				// Check if there is anything to delete
				if (text_length > 0) {
					alt_printf( "%c", new_char );
					text_length--;
				}

				// Maintain the terminal character after the text
				tx_packet[12 + text_length] = '\0';

			// Check if character is return
			} else if (new_char == '\n') {
				alt_printf( "%c", new_char );
				
				// Add termination character
				tx_packet[12 + text_length] = '\0';
				text_length++;

				break;

			// Check if their is still room in the packet for another character
			} else if ((text_length <= 500) || (new_char == '\n')) {
				alt_printf( "%c", new_char );
				
				// Add the new character to the output text
				tx_packet[12 + text_length] = new_char;
				text_length++;

				// Maintain the terminal character after the text
				tx_packet[12 + text_length] = '\0';
			}
		}

		// Send text over the ethernet
		alt_up_ethernet_send_pkt (ethernet_dev, tx_packet, text_length + 12);	
	}    
}

/****************************************************************************************
 * Subroutine to read incoming ethernet packets
 * Note that this function can be used as an interrupt handler
****************************************************************************************/
void ethernet_interrupts(void)
{
	int rx_status;

	unsigned char rx_packet[1024];
	unsigned int rx_length;
	
	// read the new packet from the ethernet chip
    rx_status = alt_up_ethernet_receive_pkt( ethernet_dev, rx_packet, &rx_length );

	// Process the incoming packet if receive status is ok	
	if (rx_status >= 0) {
		int i;
		char backspace = 0x08;

		// Clear input line before writing
		for (i = 0; i < (4 + text_length); i++) {
	        alt_printf("%c", backspace);			
		}

		// Output received text		
        alt_printf("them> %s\n", rx_packet + 12);

		// Put back current input line
        alt_printf("me> %s", tx_packet + 12);
    }
}

