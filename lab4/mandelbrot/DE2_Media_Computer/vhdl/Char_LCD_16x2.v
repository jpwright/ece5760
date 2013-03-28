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
 * This module controls 16x2 character LCD on the Altera DE2 Board.           *
 *                                                                            *
 ******************************************************************************/

module Char_LCD_16x2 (
	// Inputs
	clk,
	reset,

	address,
	chipselect,
	read,
	write,
	writedata,

	// Bidirectionals
	LCD_DATA,

	// Outputs
	LCD_ON,
	LCD_BLON,

	LCD_EN,
	LCD_RS,
	LCD_RW,

	readdata,
	waitrequest
);


/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter	CURSOR_ON	= 1'b1;
parameter	BLINKING_ON	= 1'b1;

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input				clk;
input				reset;

input				address;
input				chipselect;
input				read;
input				write;
input		[ 7: 0]	writedata;

// Bidirectionals
inout		[ 7: 0]	LCD_DATA;			//	LCD Data bus 8 bits

// Outputs
output				LCD_ON;				//	LCD Power ON/OFF
output				LCD_BLON;			//	LCD Back Light ON/OFF

output				LCD_EN;				//	LCD Enable
output				LCD_RS;				//	LCD 0-Command/1-Data Select
output				LCD_RW;				//	LCD 1-Read/0-Write Select

output		[ 7: 0]	readdata;
output				waitrequest;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/
// states
localparam	LCD_STATE_0_IDLE				= 3'h0,
			LCD_STATE_1_INITIALIZE			= 3'h1,
			LCD_STATE_2_START_CHECK_BUSY	= 3'h2,
			LCD_STATE_3_CHECK_BUSY			= 3'h3,
			LCD_STATE_4_BEGIN_TRANSFER		= 3'h4,
			LCD_STATE_5_TRANSFER			= 3'h5,
			LCD_STATE_6_COMPLETE			= 3'h6;

/*****************************************************************************
 *                 Internal Wires and Registers Declarations                 *
 *****************************************************************************/

// Internal Wires
wire				transfer_complete;
wire				done_initialization;

wire				init_send_command;
wire		[ 8: 0]	init_command;

wire				send_data;

wire		[ 7: 0]	data_received;


// Internal Registers
reg					initialize_lcd_display;

reg			[ 7: 0]	data_to_send;
reg					rs;
reg					rw;

// State Machine Registers
reg			[ 2: 0]	ns_lcd_controller;
reg			[ 2: 0]	s_lcd_controller;

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/

always @(posedge clk)
begin
	if (reset)
		s_lcd_controller <= LCD_STATE_0_IDLE;
	else
		s_lcd_controller <= ns_lcd_controller;
end

always @(*)
begin
	// Defaults
	ns_lcd_controller = LCD_STATE_0_IDLE;

    case (s_lcd_controller)
	LCD_STATE_0_IDLE:
		begin
			if (initialize_lcd_display)
				ns_lcd_controller = LCD_STATE_1_INITIALIZE;
			else if (chipselect)
				ns_lcd_controller = LCD_STATE_2_START_CHECK_BUSY; 
			else
				ns_lcd_controller = LCD_STATE_0_IDLE;
		end
	LCD_STATE_1_INITIALIZE:
		begin
			if (done_initialization)
				ns_lcd_controller = LCD_STATE_6_COMPLETE;
			else
				ns_lcd_controller = LCD_STATE_1_INITIALIZE;
		end
	LCD_STATE_2_START_CHECK_BUSY:
		begin
			if (transfer_complete == 1'b0)
				ns_lcd_controller = LCD_STATE_3_CHECK_BUSY;
			else
				ns_lcd_controller = LCD_STATE_2_START_CHECK_BUSY;
		end
	LCD_STATE_3_CHECK_BUSY:
		begin
			if ((transfer_complete) && (data_received[7]))
				ns_lcd_controller = LCD_STATE_2_START_CHECK_BUSY;
			else if ((transfer_complete) && (data_received[7] == 1'b0))
				ns_lcd_controller = LCD_STATE_4_BEGIN_TRANSFER;
			else
				ns_lcd_controller = LCD_STATE_3_CHECK_BUSY;
		end
	LCD_STATE_4_BEGIN_TRANSFER:
		begin
			if (transfer_complete == 1'b0)
				ns_lcd_controller = LCD_STATE_5_TRANSFER;
			else
				ns_lcd_controller = LCD_STATE_4_BEGIN_TRANSFER;
		end
	LCD_STATE_5_TRANSFER:
		begin
			if (transfer_complete)
				ns_lcd_controller = LCD_STATE_6_COMPLETE;
			else
				ns_lcd_controller = LCD_STATE_5_TRANSFER;
		end
	LCD_STATE_6_COMPLETE:
		begin
			ns_lcd_controller = LCD_STATE_0_IDLE;
		end
	default:
		begin
			ns_lcd_controller = LCD_STATE_0_IDLE;
		end
	endcase
end

/*****************************************************************************
 *                             Sequential Logic                              *
 *****************************************************************************/

always @(posedge clk)
begin
	if (reset)
		initialize_lcd_display <= 1'b1;
	else if (done_initialization)
		initialize_lcd_display <= 1'b0;
end

always @(posedge clk)
begin
	if (reset)
		data_to_send <= 8'h00;
	else if (s_lcd_controller == LCD_STATE_1_INITIALIZE)
		data_to_send <= init_command[7:0];
	else if (s_lcd_controller == LCD_STATE_4_BEGIN_TRANSFER)
		data_to_send <= writedata[7:0];
end

always @(posedge clk)
begin
	if (reset)
		rs <= 1'b0;
	else if (s_lcd_controller == LCD_STATE_1_INITIALIZE)
		rs <= init_command[8];
	else if (s_lcd_controller == LCD_STATE_2_START_CHECK_BUSY)
		rs <= 1'b0;
	else if (s_lcd_controller == LCD_STATE_4_BEGIN_TRANSFER)
		rs <= address;
end

always @(posedge clk)
begin
	if (reset)
		rw <= 1'b0;
	else if (s_lcd_controller == LCD_STATE_1_INITIALIZE)
		rw <= 1'b0;
	else if (s_lcd_controller == LCD_STATE_2_START_CHECK_BUSY)
		rw <= 1'b1;
	else if (s_lcd_controller == LCD_STATE_4_BEGIN_TRANSFER)
		rw <= ~write;
end

/*****************************************************************************
 *                            Combinational Logic                            *
 *****************************************************************************/

// Output Assignments
assign readdata		= data_received;

assign waitrequest	= chipselect & (s_lcd_controller != LCD_STATE_6_COMPLETE);

// Internal Assignments
assign send_data	= 
	(s_lcd_controller == LCD_STATE_1_INITIALIZE) ?	init_send_command :
	(s_lcd_controller == LCD_STATE_3_CHECK_BUSY) ?	1'b1 :
	(s_lcd_controller == LCD_STATE_5_TRANSFER) ?	1'b1 : 1'b0;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

altera_up_character_lcd_communication Char_LCD_Comm (
	// Inputs
	.clk				(clk),
	.reset				(reset),

	.data_in			(data_to_send),
	.enable				(send_data),
	.rs					(rs),
	.rw					(rw),

	.on					(1'b1),
	.back_light_on		(1'b1),

	// Bidirectionals
	.LCD_DATA			(LCD_DATA),

	// Outputs
	.LCD_ON				(LCD_ON),
	.LCD_BLON			(LCD_BLON),

	.LCD_EN				(LCD_EN),
	.LCD_RS				(LCD_RS),
	.LCD_RW				(LCD_RW),

	.data_out			(data_received),
	.transfer_complete	(transfer_complete)
);

altera_up_character_lcd_initialization Char_LCD_Init (
	// Inputs
	.clk					(clk),
	.reset					(reset),

	.initialize_LCD_display	(initialize_lcd_display),

	.command_was_sent		(transfer_complete),
	
	// Bidirectionals

	// Outputs
	.done_initialization	(done_initialization),

	.send_command			(init_send_command),
	.the_command			(init_command)
);
	defparam
		Char_LCD_Init.CURSOR_ON			= CURSOR_ON,
		Char_LCD_Init.BLINKING_ON		= BLINKING_ON;

endmodule

