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
 * This module is a rom for auto initializing the on board periphal devices   *
 *  on the DE2-35 board.                                                      *
 *                                                                            *
 ******************************************************************************/

module altera_up_av_config_auto_init_ob_de2_35 (
	// Inputs
	rom_address,

	// Bidirectionals

	// Outputs
	rom_data
);

/*****************************************************************************
 *                           Parameter Declarations                          *
 *****************************************************************************/

parameter AUD_LINE_IN_LC	= 9'h01A;
parameter AUD_LINE_IN_RC	= 9'h01A;
parameter AUD_LINE_OUT_LC	= 9'h07B;
parameter AUD_LINE_OUT_RC	= 9'h07B;
parameter AUD_ADC_PATH		= 9'h0F8;
parameter AUD_DAC_PATH		= 9'h006;
parameter AUD_POWER			= 9'h000;
parameter AUD_DATA_FORMAT	= 9'h001;
parameter AUD_SAMPLE_CTRL	= 9'h002;
parameter AUD_SET_ACTIVE	= 9'h001;

parameter VID_INPUT_CONTROL	= 16'h0040;
parameter VID_CHROMA_GAIN_1	= 16'h2df4;
parameter VID_CHROMA_GAIN_2	= 16'h2e00;

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
wire		[26: 0]	audio_rom_data;
wire		[26: 0]	video_rom_data;

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
assign rom_data = audio_rom_data | video_rom_data;

// Internal Assignments

/*****************************************************************************
 *                              Internal Modules                             *
 *****************************************************************************/

altera_up_av_config_auto_init_ob_audio Auto_Init_Audio_ROM (
	// Inputs
	.rom_address			(rom_address),

	// Bidirectionals

	// Outputs
	.rom_data				(audio_rom_data)
);
defparam
	Auto_Init_Audio_ROM.AUD_LINE_IN_LC	= AUD_LINE_IN_LC,
	Auto_Init_Audio_ROM.AUD_LINE_IN_RC	= AUD_LINE_IN_RC,
	Auto_Init_Audio_ROM.AUD_LINE_OUT_LC	= AUD_LINE_OUT_LC,
	Auto_Init_Audio_ROM.AUD_LINE_OUT_RC	= AUD_LINE_OUT_RC,
	Auto_Init_Audio_ROM.AUD_ADC_PATH	= AUD_ADC_PATH,
	Auto_Init_Audio_ROM.AUD_DAC_PATH	= AUD_DAC_PATH,
	Auto_Init_Audio_ROM.AUD_POWER		= AUD_POWER,
	Auto_Init_Audio_ROM.AUD_DATA_FORMAT	= AUD_DATA_FORMAT,
	Auto_Init_Audio_ROM.AUD_SAMPLE_CTRL	= AUD_SAMPLE_CTRL,
	Auto_Init_Audio_ROM.AUD_SET_ACTIVE	= AUD_SET_ACTIVE;

altera_up_av_config_auto_init_ob_adv7181 Auto_Init_Video_ROM (
	// Inputs
	.rom_address			(rom_address),

	// Bidirectionals

	// Outputs
	.rom_data				(video_rom_data)
);
defparam
	Auto_Init_Video_ROM.INPUT_CONTROL	= VID_INPUT_CONTROL,
	Auto_Init_Video_ROM.CHROMA_GAIN_1	= VID_CHROMA_GAIN_1,
	Auto_Init_Video_ROM.CHROMA_GAIN_2	= VID_CHROMA_GAIN_2;

endmodule

