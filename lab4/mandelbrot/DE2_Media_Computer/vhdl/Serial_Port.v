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
 * This module reads and writes data to the RS232 connectpr on Altera's       *
 *  DE1 and DE2 Development and Education Boards.                             *
 *                                                                            *
 ******************************************************************************/

module Serial_Port (
	// Inputs
	clk,
	reset,
	
	address,
	chipselect,
	byteenable,
	read,
	write,
	writedata,

	UART_RXD,

	// Bidirectionals

	// Outputs
	irq,
	readdata,

	UART_TXD
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter BAUD_COUNTER_WIDTH	= 9;
parameter BAUD_TICK_INCREMENT	= 9'd1;
parameter BAUD_TICK_COUNT		= 9'd434;
parameter HALF_BAUD_TICK_COUNT	= 9'd217;

parameter TOTAL_DATA_WIDTH		= 12;
parameter DATA_WIDTH			= 8;
parameter ODD_PARITY			= 1'b1;

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

input				UART_RXD;

// Bidirectionals

// Outputs
output	reg			irq;
output	reg	[31:0]	readdata;

output				UART_TXD;

/*****************************************************************************
 *                 Internal wires and registers Declarations                 *
 *****************************************************************************/

// Internal Wires
wire				read_fifo_read_en;
wire		[7:0]	read_available;
wire				read_data_valid;
wire		[DATA_WIDTH:0]			read_data;

wire				parity_error;

wire				write_data_parity;
wire		[7:0]	write_space;

// Internal Registers
reg					read_interrupt_en;
reg					write_interrupt_en;

reg					read_interrupt;
reg					write_interrupt;

reg					write_fifo_write_en;
reg			[(DATA_WIDTH - 1):0]	data_to_uart;

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
		irq <= 1'b0;
	else
		irq <= write_interrupt | read_interrupt;
end

always @(posedge clk)
begin
	if (reset)
		readdata <= 32'h00000000;
	else if (chipselect)
	begin
		if (address == 1'b0)
			readdata <= 
				{8'h00,
				 read_available,
				 read_data_valid,
				 5'h00,
				 parity_error,
				 1'b0,
				 read_data[(DATA_WIDTH - 1):0]};
		else
			readdata <= 
				{8'h00,
				 write_space,
				 6'h00,
				 write_interrupt,
				 read_interrupt,
				 6'h00,
				 write_interrupt_en,
				 read_interrupt_en};
	end
end


always @(posedge clk)
begin
	if (reset)
		read_interrupt_en <= 1'b0;
	else if ((chipselect) && (write) && (address) && (byteenable[0]))
		read_interrupt_en <= writedata[0];
end

always @(posedge clk)
begin
	if (reset)
		write_interrupt_en <= 1'b0;
	else if ((chipselect) && (write) && (address) && (byteenable[0]))
		write_interrupt_en <= writedata[1];
end

always @(posedge clk)
begin
	if (reset)
		read_interrupt <= 1'b0;
	else if (read_interrupt_en == 1'b0)
		read_interrupt <= 1'b0;
	else
		read_interrupt <= (&(read_available[6:5])  | read_available[7]);
end

always @(posedge clk)
begin
	if (reset)
		write_interrupt <= 1'b0;
	else if (write_interrupt_en == 1'b0)
		write_interrupt <= 1'b0;
	else
		write_interrupt <= (&(write_space[6:5])  | write_space[7]);
end


always @(posedge clk)
begin
	if (reset)
		write_fifo_write_en <= 1'b0;
	else
		write_fifo_write_en <= 
			chipselect & write & ~address & byteenable[0];
end

always @(posedge clk)
begin
	if (reset)
		data_to_uart <= 1'b0;
	else
		data_to_uart <= writedata[(DATA_WIDTH - 1):0];
end

/*****************************************************************************
 *                            Combinational logic                            *
 *****************************************************************************/

assign parity_error = (read_available != 8'h00) ? 
						((^(read_data[DATA_WIDTH:0])) ^ ODD_PARITY) :
						1'b0;

assign read_fifo_read_en = chipselect & read & ~address & byteenable[0];

assign write_data_parity = (^(data_to_uart)) ^ ODD_PARITY;

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

altera_up_rs232_in_deserializer RS232_In_Deserializer (
	// Inputs
	.clk					(clk),
	.reset					(reset),
	
	.serial_data_in			(UART_RXD),

	.receive_data_en		(read_fifo_read_en),

	// Bidirectionals

	// Outputs
	.fifo_read_available	(read_available),

	.received_data_valid	(read_data_valid),
	.received_data			(read_data)
);
defparam 
	RS232_In_Deserializer.BAUD_COUNTER_WIDTH	= BAUD_COUNTER_WIDTH,
	RS232_In_Deserializer.BAUD_TICK_INCREMENT	= BAUD_TICK_INCREMENT,
	RS232_In_Deserializer.BAUD_TICK_COUNT		= BAUD_TICK_COUNT,
	RS232_In_Deserializer.HALF_BAUD_TICK_COUNT	= HALF_BAUD_TICK_COUNT,
	RS232_In_Deserializer.TOTAL_DATA_WIDTH		= TOTAL_DATA_WIDTH,
	RS232_In_Deserializer.DATA_WIDTH			= (DATA_WIDTH + 1);

altera_up_rs232_out_serializer RS232_Out_Serializer (
	// Inputs
	.clk					(clk),
	.reset					(reset),
	
	.transmit_data			({write_data_parity, data_to_uart}),
	.transmit_data_en		(write_fifo_write_en),

	// Bidirectionals

	// Outputs
	.fifo_write_space		(write_space),

	.serial_data_out		(UART_TXD)
);
defparam 
	RS232_Out_Serializer.BAUD_COUNTER_WIDTH		= BAUD_COUNTER_WIDTH,
	RS232_Out_Serializer.BAUD_TICK_INCREMENT	= BAUD_TICK_INCREMENT,
	RS232_Out_Serializer.BAUD_TICK_COUNT		= BAUD_TICK_COUNT,
	RS232_Out_Serializer.HALF_BAUD_TICK_COUNT	= HALF_BAUD_TICK_COUNT,
	RS232_Out_Serializer.TOTAL_DATA_WIDTH		= TOTAL_DATA_WIDTH,
	RS232_Out_Serializer.DATA_WIDTH				= (DATA_WIDTH + 1);

endmodule

