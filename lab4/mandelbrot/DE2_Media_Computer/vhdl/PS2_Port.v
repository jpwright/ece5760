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
 * This module connects the PS2 core to Avalon.                               *
 *                                                                            *
 ******************************************************************************/

/*
 *
 * Data Register Bits
 * Read Available 31-16, Read Valid 15, Incoming Data or Outgoing Command 7-0
 *
 * Control Register Bits
 * CE 10, RI 8, RE 0
 *
 **/

module PS2_Port (
	// Inputs
	clk,
	reset,

	address,
	chipselect,
	byteenable,
	read,
	write,
	writedata,
	
	// Bidirectionals
	PS2_CLK,					// PS2 Clock
 	PS2_DAT,					// PS2 Data

	// Outputs
	irq,
	readdata,
	waitrequest
);


/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/


/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input				clk;
input				reset;

input				address;
input				chipselect;
input		[3:0]	byteenable;
input				read;
input				write;
input		[31:0]	writedata;

// Bidirectionals
inout				PS2_CLK;
inout			 	PS2_DAT;

// Outputs
output				irq;
output		[31:0]	readdata;
output				waitrequest;

reg			[31:0]	readdata;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/


/*****************************************************************************
 *                 Internal wires and registers Declarations                 *
 *****************************************************************************/
// Internal Wires
wire		[7:0]	data_from_the_PS2_port;
wire				data_from_the_PS2_port_en;

wire				get_data_from_PS2_port;
wire				send_command_to_PS2_port;
wire				clear_command_error;
wire				set_interrupt_enable;

wire				command_was_sent;
wire				error_sending_command;

wire				data_fifo_is_empty;
wire				data_fifo_is_full;

wire		[ 7: 0]	data_in_fifo;
wire				data_valid;
wire		[ 8: 0]	data_available;

// Internal Registers
reg			[31: 0]	control_register;

// State Machine Registers

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential logic                              *
 *****************************************************************************/

always @(posedge clk)
begin
	if (reset == 1'b1)
		readdata <= 32'h00000000;
	else if (chipselect == 1'b1)
	begin
		if (address == 1'b0)
			readdata <= {7'h00,data_available,data_valid,7'h00,data_in_fifo};
		else
			readdata <= control_register;
	end
end

always @(posedge clk)
begin
	if (reset == 1'b1)
		control_register <= 32'h00000000;
	else
	begin
		if (error_sending_command == 1'b1)
			control_register[10] <= 1'b1;
		else if (clear_command_error == 1'b1)
			control_register[10] <= 1'b0;
		
		control_register[8] <= ~data_fifo_is_empty & control_register[0];

		if ((chipselect == 1'b1) && (set_interrupt_enable == 1'b1))
			control_register[0]  <= writedata[0];
	end
end

/*****************************************************************************
 *                            Combinational logic                            *
 *****************************************************************************/

assign irq			= control_register[8];
assign waitrequest	= send_command_to_PS2_port & 
						~(command_was_sent | error_sending_command);

assign get_data_from_PS2_port  = chipselect & byteenable[0] & ~address & read;
assign send_command_to_PS2_port= chipselect & byteenable[0] & ~address & write;
assign clear_command_error     = chipselect & byteenable[1] & address & write;
assign set_interrupt_enable    = chipselect & byteenable[0] & address & write;

assign data_available[8]	= data_fifo_is_full;
assign data_valid			= ~data_fifo_is_empty;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

altera_up_ps2 PS2_Serial_Port (
	// Inputs
	.clk							(clk),
	.reset							(reset),

	.the_command					(writedata[7:0]),
	.send_command					(send_command_to_PS2_port),

	// Bidirectionals
	.PS2_CLK						(PS2_CLK),
 	.PS2_DAT						(PS2_DAT),

	// Outputs
	.command_was_sent				(command_was_sent),
	.error_communication_timed_out	(error_sending_command),

	.received_data					(data_from_the_PS2_port),
	.received_data_en				(data_from_the_PS2_port_en)
);

scfifo	Incoming_Data_FIFO (
	// Inputs
	.clock			(clk),
	.sclr			(reset),

	.rdreq			(get_data_from_PS2_port & ~data_fifo_is_empty),
	.wrreq			(data_from_the_PS2_port_en & ~data_fifo_is_full),
	.data			(data_from_the_PS2_port),

	// Bidirectionals

	// Outputs
	.q				(data_in_fifo),

	.usedw			(data_available[7:0]),
	.empty			(data_fifo_is_empty),
	.full			(data_fifo_is_full)

	// synopsys translate_off
	,
	.almost_empty	(),
	.almost_full	(),
	.aclr			()
	// synopsys translate_on
);
defparam
	Incoming_Data_FIFO.add_ram_output_register	= "ON",
	Incoming_Data_FIFO.intended_device_family	= "Cyclone II",
	Incoming_Data_FIFO.lpm_numwords				= 256,
	Incoming_Data_FIFO.lpm_showahead			= "ON",
	Incoming_Data_FIFO.lpm_type					= "scfifo",
	Incoming_Data_FIFO.lpm_width				= 8,
	Incoming_Data_FIFO.lpm_widthu				= 8,
	Incoming_Data_FIFO.overflow_checking		= "OFF",
	Incoming_Data_FIFO.underflow_checking		= "OFF",
	Incoming_Data_FIFO.use_eab					= "ON";

endmodule

