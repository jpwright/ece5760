.include "key_codes.s"			/* defines values for KEY1, KEY2, KEY3 */
/********************************************************************************
 * This program demonstrates use of interrupts in the DE2 Media Computer. It
 * first starts the interval timer with 33 msec timeouts, and then enables 
 * Nios II interrupts from the interval timer and pushbutton KEYs
 *
 * The interrupt service routine for the interval timer displays a pattern on 
 * the HEX displays, and shifts this pattern either left or right. The shifting
 * direction is set in the pushbutton interrupt service routine, as follows:
 *		KEY[1]: shifts the displayed pattern to the right
 *		KEY[2]: shifts the displayed pattern to the left
 *		KEY[3]: changes the pattern using the settings on the SW switches
********************************************************************************/
	.text									/* executable code follows */
	.global _start
_start:
	/* set up the stack */
	movia 	sp, 0x007FFFFC			/* stack starts from largest memory address */

	movia		r16, 0x10002000		/* internal timer base address */
	/* set the interval timer period for scrolling the HEX displays */
	movia		r12, 0x190000			/* 1/(50 MHz) x (0x190000) = 33 msec */
	sthio		r12, 8(r16)				/* store the low half word of counter start value */ 
	srli		r12, r12, 16
	sthio		r12, 0xC(r16)			/* high half word of counter start value */ 

	/* start interval timer, enable its interrupts */
	movi		r15, 0b0111				/* START = 1, CONT = 1, ITO = 1 */
	sthio		r15, 4(r16)

	/* write to the pushbutton port interrupt mask register */
	movia		r15, 0x10000050		/* pushbutton key base address */
	movi		r7, 0b01110				/* set 3 interrupt mask bits (bit 0 is Nios II Reset) */
	stwio		r7, 8(r15)				/* interrupt mask register is (base + 8) */

	/* enable Nios II processor interrupts */
	movi		r7, 0b011				/* set interrupt mask bits for levels 0 (interval */
	wrctl		ienable, r7				/* timer) and level 1 (pushbuttons) */
	movi		r7, 1
	wrctl		status, r7				/* turn on Nios II interrupt processing */

IDLE:
	br 		IDLE						/* main program simply idles */

	.data
/* The two global variables used by the interrupt service routines for the interval timer
 * and the pushbutton keys are declared below */
	.global	PATTERN
PATTERN:
	.word		0x0000000F				/* pattern to show on the HEX displays */
	.global	KEY_PRESSED
KEY_PRESSED:
	.word		KEY2						/* stores code representing pushbutton key pressed */

	.end
