/******************************************************************************
 * License Agreement                                                          *
 *                                                                            *
 * Copyright (c) 1991-2011 Altera Corporation, San Jose, California, USA.     *
 * All rights reserved.                                                       *
 *                                                                            *
 * Any megafunction design, and related net list (encrypted or decrypted),    *
 *  support information, device programming or simulation file, and any other *
 *  associated documentation or information provided by Altera or a partner   *
 *  under Altera's Megafunction Partnership Program may be used only to       *
 *  program PLD devices (but not masked PLD devices) from Altera.  Any other  *
 *  use of such megafunction design, net list, support information, device    *
 *  programming or simulation file, or any other related documentation or     *
 *  information is prohibited for any other purpose, including, but not       *
 *  limited to modification, reverse engineering, de-compiling, or use with   *
 *  any other silicon devices, unless such use is explicitly licensed under   *
 *  a separate agreement with Altera or a megafunction partner.  Title to     *
 *  the intellectual property, including patents, copyrights, trademarks,     *
 *  trade secrets, or maskworks, embodied in any such megafunction design,    *
 *  net list, support information, device programming or simulation file, or  *
 *  any other related documentation or information provided by Altera or a    *
 *  megafunction partner, remains with Altera, the megafunction partner, or   *
 *  their respective licensors.  No other licenses, including any licenses    *
 *  needed under any third party's intellectual property, are provided herein.*
 *  Copying or modifying any file, or portion thereof, to which this notice   *
 *  is attached violates this copyright.                                      *
 *                                                                            *
 * THIS FILE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR    *
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,   *
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL    *
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER *
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING    *
 * FROM, OUT OF OR IN CONNECTION WITH THIS FILE OR THE USE OR OTHER DEALINGS  *
 * IN THIS FILE.                                                              *
 *                                                                            *
 * This agreement shall be governed in all respects by the laws of the State  *
 *  of California and by the laws of the United States of America.            *
 *                                                                            *
 ******************************************************************************/

/******************************************************************************
 *                                                                            *
 * This module writes data to the RS232 UART Port.                            *
 *                                                                            *
 ******************************************************************************/

module altera_up_rs232_out_serializer (
	// Inputs
	clk,
	reset,
	
	transmit_data,
	transmit_data_en,

	// Bidirectionals

	// Outputs
	fifo_write_space,

	serial_data_out
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter BAUD_COUNTER_WIDTH	= 9;
parameter BAUD_TICK_INCREMENT	= 9'd1;
parameter BAUD_TICK_COUNT		= 9'd433;
parameter HALF_BAUD_TICK_COUNT	= 9'd216;

parameter TOTAL_DATA_WIDTH		= 11;
parameter DATA_WIDTH			= 9;

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input				clk;
input				reset;

input		[DATA_WIDTH:1]	transmit_data;
input				transmit_data_en;

// Bidirectionals

// Outputs
output	reg	[7:0]	fifo_write_space;

output	reg			serial_data_out;


/*****************************************************************************
 *                 Internal wires and registers Declarations                 *
 *****************************************************************************/

// Internal Wires
wire				shift_data_reg_en;
wire				all_bits_transmitted;

wire				read_fifo_en;

wire				fifo_is_empty;
wire				fifo_is_full;
wire		[6:0]	fifo_used;

wire		[DATA_WIDTH:1]	data_from_fifo;

// Internal Registers
reg					transmitting_data;

reg			[DATA_WIDTH:0]	data_out_shift_reg;

// State Machine Registers

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential logic                              *
 *****************************************************************************/

always @(posedge clk)
begin
	if (reset)
		fifo_write_space <= 8'h00;
	else
		fifo_write_space <= 8'h80 - {fifo_is_full, fifo_used};
end


always @(posedge clk)
begin
	if (reset)
		serial_data_out <= 1'b1;
	else
		serial_data_out <= data_out_shift_reg[0];
end

always @(posedge clk)
begin
	if (reset)
		transmitting_data <= 1'b0;
	else if (all_bits_transmitted)
		transmitting_data <= 1'b0;
	else if (fifo_is_empty == 1'b0)
		transmitting_data <= 1'b1;
end

always @(posedge clk)
begin
	if (reset)
		data_out_shift_reg	<= {(DATA_WIDTH + 1){1'b1}};
	else if (read_fifo_en)
		data_out_shift_reg	<= {data_from_fifo, 1'b0};
	else if (shift_data_reg_en)
		data_out_shift_reg	<= 
			{1'b1, data_out_shift_reg[DATA_WIDTH:1]};
end

/*****************************************************************************
 *                            Combinational logic                            *
 *****************************************************************************/

assign read_fifo_en = 
			~transmitting_data & ~fifo_is_empty & ~all_bits_transmitted;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

altera_up_rs232_counters RS232_Out_Counters (
	// Inputs
	.clk						(clk),
	.reset						(reset),
	
	.reset_counters				(~transmitting_data),

	// Bidirectionals

	// Outputs
	.baud_clock_rising_edge		(shift_data_reg_en),
	.baud_clock_falling_edge	(),
	.all_bits_transmitted		(all_bits_transmitted)
);
defparam 
	RS232_Out_Counters.BAUD_COUNTER_WIDTH	= BAUD_COUNTER_WIDTH,
	RS232_Out_Counters.BAUD_TICK_INCREMENT	= BAUD_TICK_INCREMENT,
	RS232_Out_Counters.BAUD_TICK_COUNT		= BAUD_TICK_COUNT,
	RS232_Out_Counters.HALF_BAUD_TICK_COUNT	= HALF_BAUD_TICK_COUNT,
	RS232_Out_Counters.TOTAL_DATA_WIDTH		= TOTAL_DATA_WIDTH;

altera_up_sync_fifo RS232_Out_FIFO (
	// Inputs
	.clk			(clk),
	.reset			(reset),

	.write_en		(transmit_data_en & ~fifo_is_full),
	.write_data		(transmit_data),

	.read_en		(read_fifo_en),
	
	// Bidirectionals

	// Outputs
	.fifo_is_empty	(fifo_is_empty),
	.fifo_is_full	(fifo_is_full),
	.words_used		(fifo_used),

	.read_data		(data_from_fifo)
);
defparam 
	RS232_Out_FIFO.DATA_WIDTH	= DATA_WIDTH,
	RS232_Out_FIFO.DATA_DEPTH	= 128,
	RS232_Out_FIFO.ADDR_WIDTH	= 7;

endmodule

