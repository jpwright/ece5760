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
 * This module can read and/or write data to a parallel I/O port based        *
 *  on various user selected parameters. It has some predefined               *
 *  configurations for some devices on the Altera DE boards.                  *
 *                                                                            *
 ******************************************************************************/

module HEX7_HEX4 (
     // Inputs
	clk,
	reset,
	
	address,
	byteenable,
	chipselect,
	read,
	write,
	writedata,


	// Bidirectionals


	// Outputs
	HEX4,
	HEX5,
	HEX6,
	HEX7,

	readdata
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

// DW represents the Data Width minus 1
parameter DW = 31;

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input				clk;
input				reset;

input		[ 1: 0]	address;
input		[ 3: 0]	byteenable;
input				chipselect;
input				read;
input				write;
input		[31: 0]	writedata;


// Bidirectionals

// Outputs
output		[ 6: 0]	HEX4;
output		[ 6: 0]	HEX5;
output		[ 6: 0]	HEX6;
output		[ 6: 0]	HEX7;

output	reg	[31: 0]	readdata;

/*****************************************************************************
 *                 Internal wires and registers Declarations                 *
 *****************************************************************************/
// Internal Wires

// Internal Registers
reg			[31: 0]	data;

reg			[DW: 0]	data_in;
reg			[DW: 0]	data_out;


// State Machine Registers

// Internal Variables
genvar				i;


/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential logic                              *
 *****************************************************************************/

// Input Registers
always @(posedge clk)
	data_in <= data[DW: 0];

// Output Registers

always @(posedge clk)
begin
	if (reset == 1'b1)
		readdata <= 32'h00000000;
	else if (chipselect == 1'b1)
	begin
		if (address == 2'h0)
			readdata <= {{(31-DW){1'b0}}, data_in};
		else
			readdata <= 32'h00000000;
	end
end

// Internal Registers
always @(posedge clk)
begin
	if (reset == 1'b1)
		data <= {(DW + 1){1'b0}};
	else if ((chipselect == 1'b1) &&
			(write == 1'b1) &&
			(address == 2'h0))
	begin
		if (byteenable[0])
			data[ 7: 0] <= writedata[ 7: 0];
			
		if (byteenable[1])
			data[15: 8] <= writedata[15: 8];

		if (byteenable[2])
			data[23:16] <= writedata[23:16];
			
		if (byteenable[3])
			data[31:24] <= writedata[31:24];
	end
end




always @(posedge clk)
	data_out <= data[DW: 0];


/*****************************************************************************
 *                            Combinational logic                            *
 *****************************************************************************/

// Output Assignments

assign HEX4 = ~data_out[ 7: 0];
assign HEX5 = ~data_out[15: 8];
assign HEX6 = ~data_out[23:16];
assign HEX7 = ~data_out[31:24];

// Internal Assignments

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/


endmodule

