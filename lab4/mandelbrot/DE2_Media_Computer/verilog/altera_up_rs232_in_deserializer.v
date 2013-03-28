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
 * This module reads data to the RS232 UART Port.                             *
 *                                                                            *
 ******************************************************************************/

module altera_up_rs232_in_deserializer (
	// Inputs
	clk,
	reset,
	
	serial_data_in,

	receive_data_en,

	// Bidirectionals

	// Outputs
	fifo_read_available,

	received_data_valid,
	received_data
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

input				serial_data_in;

input				receive_data_en;

// Bidirectionals

// Outputs
output	reg	[ 7: 0]	fifo_read_available;

output				received_data_valid;
output		[(DATA_WIDTH - 1):0]	received_data;


/*****************************************************************************
 *                 Internal wires and registers Declarations                 *
 *****************************************************************************/

// Internal Wires
wire				shift_data_reg_en;
wire				all_bits_received;

wire				fifo_is_empty;
wire				fifo_is_full;
wire		[6:0]	fifo_used;

// Internal Registers
reg					receiving_data;

reg			[(TOTAL_DATA_WIDTH - 1):0]	data_in_shift_reg;

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
		fifo_read_available <= 8'h00;
	else
		fifo_read_available <= {fifo_is_full, fifo_used};
end

always @(posedge clk)
begin
	if (reset)
		receiving_data <= 1'b0;
	else if (all_bits_received)
		receiving_data <= 1'b0;
	else if (serial_data_in == 1'b0)
		receiving_data <= 1'b1;
end

always @(posedge clk)
begin
	if (reset)
		data_in_shift_reg	<= {TOTAL_DATA_WIDTH{1'b0}};
	else if (shift_data_reg_en)
		data_in_shift_reg	<= 
			{serial_data_in, data_in_shift_reg[(TOTAL_DATA_WIDTH - 1):1]};
end

/*****************************************************************************
 *                            Combinational logic                            *
 *****************************************************************************/

// Output assignments
assign received_data_valid = ~fifo_is_empty;

// Input assignments


/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

altera_up_rs232_counters RS232_In_Counters (
	// Inputs
	.clk						(clk),
	.reset						(reset),
	
	.reset_counters				(~receiving_data),

	// Bidirectionals

	// Outputs
	.baud_clock_rising_edge		(),
	.baud_clock_falling_edge	(shift_data_reg_en),
	.all_bits_transmitted		(all_bits_received)
);
defparam 
	RS232_In_Counters.BAUD_COUNTER_WIDTH	= BAUD_COUNTER_WIDTH,
	RS232_In_Counters.BAUD_TICK_INCREMENT	= BAUD_TICK_INCREMENT,
	RS232_In_Counters.BAUD_TICK_COUNT		= BAUD_TICK_COUNT,
	RS232_In_Counters.HALF_BAUD_TICK_COUNT	= HALF_BAUD_TICK_COUNT,
	RS232_In_Counters.TOTAL_DATA_WIDTH		= TOTAL_DATA_WIDTH;

altera_up_sync_fifo RS232_In_FIFO (
	// Inputs
	.clk			(clk),
	.reset			(reset),

	.write_en		(all_bits_received & ~fifo_is_full),
	.write_data		(data_in_shift_reg[(DATA_WIDTH + 1):1]),

	.read_en		(receive_data_en & ~fifo_is_empty),
	
	// Bidirectionals

	// Outputs
	.fifo_is_empty	(fifo_is_empty),
	.fifo_is_full	(fifo_is_full),
	.words_used		(fifo_used),

	.read_data		(received_data)
);
defparam 
	RS232_In_FIFO.DATA_WIDTH	= DATA_WIDTH,
	RS232_In_FIFO.DATA_DEPTH	= 128,
	RS232_In_FIFO.ADDR_WIDTH	= 7;

endmodule

