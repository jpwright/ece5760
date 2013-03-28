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
 * This module loads data into the Audio and Video chips' control             *
 *  registers after system reset.                                             *
 *                                                                            *
 ******************************************************************************/

module altera_up_av_config_auto_init (
	// Inputs
	clk,
	reset,

	clear_error,

	ack,
	transfer_complete,

	rom_data,

	// Bidirectionals

	// Outputs
	data_out,
	transfer_data,

	rom_address,
	
	auto_init_complete,
	auto_init_error,
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter ROM_SIZE			= 50;

parameter AW				= 5;		// Auto Initialize ROM's address width 
parameter DW				= 23;		// Auto Initialize ROM's datawidth

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input				clk;
input				reset;

input				clear_error;

input				ack;
input				transfer_complete;

input		[DW: 0]	rom_data;

// Bidirectionals

// Outputs
output	reg	[DW: 0]	data_out;
output	reg			transfer_data;

output	reg	[AW: 0]	rom_address;

output	reg			auto_init_complete;
output	reg			auto_init_error;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/

// States

/*****************************************************************************
 *                 Internal wires and registers Declarations                 *
 *****************************************************************************/

// Internal Wires
wire				toggle_next_transfer;

// Internal Registers

// State Machine Registers

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential logic                              *
 *****************************************************************************/

// Output Registers
always @(posedge clk)
begin
	if (reset)
		data_out <= 'h0;
	else
		data_out <= rom_data;
end

always @(posedge clk)
begin
	if (reset)
		transfer_data <= 1'b0;
	else if (auto_init_complete | transfer_complete)
		transfer_data <= 1'b0;
	else
		transfer_data <= 1'b1;
end

always @(posedge clk)
begin
	if (reset)
		rom_address <= 'h0;
	else if (toggle_next_transfer)
		rom_address <= rom_address + 'h1;
end

always @(posedge clk)
begin
	if (reset)
		auto_init_complete <= 1'b0;
	else if (toggle_next_transfer & (rom_address == (ROM_SIZE - 1)))
		auto_init_complete <= 1'b1;
end

always @(posedge clk)
begin
	if (reset)
		auto_init_error <= 1'b0;
	else if (toggle_next_transfer & ack)
		auto_init_error <= 1'b1;
	else if (clear_error)
		auto_init_error <= 1'b0;
end

// Internal Registers

/*****************************************************************************
 *                            Combinational logic                            *
 *****************************************************************************/

// Output Assignments

// Internal Assignments
assign toggle_next_transfer = transfer_data & transfer_complete;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/


endmodule

