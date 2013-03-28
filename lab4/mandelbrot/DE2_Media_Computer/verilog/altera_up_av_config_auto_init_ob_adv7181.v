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
 * This module is a rom for auto initializing the on board ADV7181 video chip.*
 *                                                                            *
 ******************************************************************************/

module altera_up_av_config_auto_init_ob_adv7181 (
	// Inputs
	rom_address,

	// Bidirectionals

	// Outputs
	rom_data
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter INPUT_CONTROL	= 16'h0040;
parameter CHROMA_GAIN_1	= 16'h2df4;
parameter CHROMA_GAIN_2	= 16'h2e00;

/*****************************************************************************
 *                             Port Declarations                             *
 *****************************************************************************/
// Inputs
input		[ 5: 0]	rom_address;

// Bidirectionals

// Outputs
output		[26: 0]	rom_data;

/*****************************************************************************
 *                           Constant Declarations                           *
 *****************************************************************************/

// States

/*****************************************************************************
 *                 Internal wires and registers Declarations                 *
 *****************************************************************************/
// Internal Wires
reg			[23: 0]	data;

// Internal Registers

// State Machine Registers

/*****************************************************************************
 *                         Finite State Machine(s)                           *
 *****************************************************************************/


/*****************************************************************************
 *                             Sequential logic                              *
 *****************************************************************************/

// Output Registers

// Internal Registers

/*****************************************************************************
 *                            Combinational logic                            *
 *****************************************************************************/

// Output Assignments
assign rom_data = { data[23:16], 1'b0, 
					data[15: 8], 1'b0, 
					data[ 7: 0], 1'b0};

// Internal Assignments
always @(*)
begin
	case (rom_address)
	//	Video Config Data
	10		:	data	<=	{8'h40, 16'h1500};
	11		:	data	<=	{8'h40, 16'h1741};
	12		:	data	<=	{8'h40, 16'h3a16};
	13		:	data	<=	{8'h40, 16'h5004};
	14		:	data	<=	{8'h40, 16'hc305};
	15		:	data	<=	{8'h40, 16'hc480};
	16		:	data	<=	{8'h40, 16'h0e80};
	17		:	data	<=	{8'h40, 16'h5004};
	18		:	data	<=	{8'h40, 16'h5218};
	19		:	data	<=	{8'h40, 16'h58ed};
	20		:	data	<=	{8'h40, 16'h77c5};
	21		:	data	<=	{8'h40, 16'h7c93};
	22		:	data	<=	{8'h40, 16'h7d00};
	23		:	data	<=	{8'h40, 16'hd048};
	24		:	data	<=	{8'h40, 16'hd5a0};
	25		:	data	<=	{8'h40, 16'hd7ea};
	26		:	data	<=	{8'h40, 16'he43e};
	27		:	data	<=	{8'h40, 16'hea0f};
	28		:	data	<=	{8'h40, 16'h3112};
	29		:	data	<=	{8'h40, 16'h3281};
	30		:	data	<=	{8'h40, 16'h3384};
	31		:	data	<=	{8'h40, 16'h37A0};
	32		:	data	<=	{8'h40, 16'he580};
	33		:	data	<=	{8'h40, 16'he603};
	34		:	data	<=	{8'h40, 16'he785};
	35		:	data	<=	{8'h40, 16'h5004};
	36		:	data	<=	{8'h40, 16'h5100};
	37		:	data	<=	{8'h40, INPUT_CONTROL};
	38		:	data	<=	{8'h40, 16'h1000};
	39		:	data	<=	{8'h40, 16'h0402};
	40		:	data	<=	{8'h40, 16'h0860};
	41		:	data	<=	{8'h40, 16'h0a18};
	42		:	data	<=	{8'h40, 16'h1100};
	43		:	data	<=	{8'h40, 16'h2b00};
	44		:	data	<=	{8'h40, 16'h2c8c};
	45		:	data	<=	{8'h40, CHROMA_GAIN_1};
	46		:	data	<=	{8'h40, CHROMA_GAIN_2};
	47		:	data	<=	{8'h40, 16'h2ff4};
	48		:	data	<=	{8'h40, 16'h30d2};
	49		:	data	<=	{8'h40, 16'h0e05};
	default	:	data	<=	{8'h00, 16'h0000};
	endcase
end

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/


endmodule

