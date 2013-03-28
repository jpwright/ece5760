/********************************************************************************
 * This program demonstrates use of the JTAG UART port in the DE2 Media Computer
 *
 * It performs the following: 
 *	1. sends a text string to the JTAG UART
 * 	2. reads character data from the JTAG UART
 * 	3. echos the character data back to the JTAG UART
********************************************************************************/
	.text									/* executable code follows */
	.global	_start
_start:
	/* set up stack pointer */
	movia 	sp, 0x007FFFFC			/* starts from largest memory address */

	movia		r6, 0x10001000			/* JTAG UART base address */

	/* print a text string */
	movia		r8, TEXT_STRING
LOOP:
	ldb		r5, 0(r8)
	beq		r5, zero, GET_JTAG	/* string is null-terminated */
	call		PUT_JTAG
	addi		r8, r8, 1
	br			LOOP

	/* read and echo characters */
GET_JTAG:
   ldwio		r4, 0(r6)				/* read the JTAG UART data register */
   andi		r8, r4, 0x8000			/* check if there is new data */
   beq		r8, r0, GET_JTAG		/* if no data, wait */
   andi		r5, r4, 0x00ff			/* the data is in the least significant byte */

	call		PUT_JTAG					/* echo character */
	br			GET_JTAG

/********************************************************************************
 * Subroutine to send a character to the JTAG UART
 *		r5	= character to send
 *		r6	= JTAG UART base address
********************************************************************************/
	.global	PUT_JTAG
PUT_JTAG:
	/* save any modified registers */
	subi		sp, sp, 4				/* reserve space on the stack */
	stw		r4, 0(sp)				/* save register */

   ldwio		r4, 4(r6)				/* read the JTAG UART control register */
   andhi		r4, r4, 0xffff			/* check for write space */
   beq		r4, r0, END_PUT		/* if no space, ignore the character */
   stwio		r5, 0(r6)				/* send the character */

END_PUT:
	/* restore registers */
	ldw		r4, 0(sp)
	addi		sp, sp, 4

	ret

/*******************************************************************************/
	.data			

TEXT_STRING:
	.asciz	"\nJTAG UART example code\n> "

	.end
