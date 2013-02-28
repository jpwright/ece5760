// --------------------------------------------------------------------
// Copyright (c) 2005 by Terasic Technologies Inc. 
// --------------------------------------------------------------------
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// --------------------------------------------------------------------
//           
//                     Terasic Technologies Inc
//                     356 Fu-Shin E. Rd Sec. 1. JhuBei City,
//                     HsinChu County, Taiwan
//                     302
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// --------------------------------------------------------------------
//
// Major Functions:	DE2 Default Bitstream
//
// --------------------------------------------------------------------
//
// Revision History :
// --------------------------------------------------------------------
//   Ver  :| Author            :| Mod. Date :| Changes Made:
//   V1.0 :| Johnny Chen       :| 05/08/19  :|      Initial Revision
//   V1.1 :| Sean Peng         :| 05/09/30  :|      Changed CLOCK, SW, LEDG/R
//                                                  according to Zvonko's requests.
//   V1.2 :| Johnny Chen       :| 05/11/16  :|      Add to FLASH Address FL_ADDR[21:20]
//   V1.3 :| Johnny Chen       :| 05/12/12  :|      Fixed VGA_Audio_PLL Initial Sequence.
// --------------------------------------------------------------------


module DE2_Default
	(
		////////////////////	Clock Input	 	////////////////////	 
		CLOCK_27,						//	27 MHz
		CLOCK_50,						//	50 MHz
		EXT_CLOCK,						//	External Clock
		////////////////////	Push Button		////////////////////
		KEY,							//	Pushbutton[3:0]
		////////////////////	DPDT Switch		////////////////////
		SW,								//	Toggle Switch[17:0]
		////////////////////	7-SEG Dispaly	////////////////////
		HEX0,							//	Seven Segment Digit 0
		HEX1,							//	Seven Segment Digit 1
		HEX2,							//	Seven Segment Digit 2
		HEX3,							//	Seven Segment Digit 3
		HEX4,							//	Seven Segment Digit 4
		HEX5,							//	Seven Segment Digit 5
		HEX6,							//	Seven Segment Digit 6
		HEX7,							//	Seven Segment Digit 7
		////////////////////////	LED		////////////////////////
		LEDG,							//	LED Green[8:0]
		LEDR,							//	LED Red[17:0]
		////////////////////////	UART	////////////////////////
		UART_TXD,						//	UART Transmitter
		UART_RXD,						//	UART Receiver
		////////////////////////	IRDA	////////////////////////
		IRDA_TXD,						//	IRDA Transmitter
		IRDA_RXD,						//	IRDA Receiver
		/////////////////////	SDRAM Interface		////////////////
		DRAM_DQ,						//	SDRAM Data bus 16 Bits
		DRAM_ADDR,						//	SDRAM Address bus 12 Bits
		DRAM_LDQM,						//	SDRAM Low-byte Data Mask 
		DRAM_UDQM,						//	SDRAM High-byte Data Mask
		DRAM_WE_N,						//	SDRAM Write Enable
		DRAM_CAS_N,						//	SDRAM Column Address Strobe
		DRAM_RAS_N,						//	SDRAM Row Address Strobe
		DRAM_CS_N,						//	SDRAM Chip Select
		DRAM_BA_0,						//	SDRAM Bank Address 0
		DRAM_BA_1,						//	SDRAM Bank Address 0
		DRAM_CLK,						//	SDRAM Clock
		DRAM_CKE,						//	SDRAM Clock Enable
		////////////////////	Flash Interface		////////////////
		FL_DQ,							//	FLASH Data bus 8 Bits
		FL_ADDR,						//	FLASH Address bus 22 Bits
		FL_WE_N,						//	FLASH Write Enable
		FL_RST_N,						//	FLASH Reset
		FL_OE_N,						//	FLASH Output Enable
		FL_CE_N,						//	FLASH Chip Enable
		////////////////////	SRAM Interface		////////////////
		SRAM_DQ,						//	SRAM Data bus 16 Bits
		SRAM_ADDR,						//	SRAM Address bus 18 Bits
		SRAM_UB_N,						//	SRAM High-byte Data Mask 
		SRAM_LB_N,						//	SRAM Low-byte Data Mask 
		SRAM_WE_N,						//	SRAM Write Enable
		SRAM_CE_N,						//	SRAM Chip Enable
		SRAM_OE_N,						//	SRAM Output Enable
		////////////////////	ISP1362 Interface	////////////////
		OTG_DATA,						//	ISP1362 Data bus 16 Bits
		OTG_ADDR,						//	ISP1362 Address 2 Bits
		OTG_CS_N,						//	ISP1362 Chip Select
		OTG_RD_N,						//	ISP1362 Write
		OTG_WR_N,						//	ISP1362 Read
		OTG_RST_N,						//	ISP1362 Reset
		OTG_FSPEED,						//	USB Full Speed,	0 = Enable, Z = Disable
		OTG_LSPEED,						//	USB Low Speed, 	0 = Enable, Z = Disable
		OTG_INT0,						//	ISP1362 Interrupt 0
		OTG_INT1,						//	ISP1362 Interrupt 1
		OTG_DREQ0,						//	ISP1362 DMA Request 0
		OTG_DREQ1,						//	ISP1362 DMA Request 1
		OTG_DACK0_N,					//	ISP1362 DMA Acknowledge 0
		OTG_DACK1_N,					//	ISP1362 DMA Acknowledge 1
		////////////////////	LCD Module 16X2		////////////////
		LCD_ON,							//	LCD Power ON/OFF
		LCD_BLON,						//	LCD Back Light ON/OFF
		LCD_RW,							//	LCD Read/Write Select, 0 = Write, 1 = Read
		LCD_EN,							//	LCD Enable
		LCD_RS,							//	LCD Command/Data Select, 0 = Command, 1 = Data
		LCD_DATA,						//	LCD Data bus 8 bits
		////////////////////	SD_Card Interface	////////////////
		SD_DAT,							//	SD Card Data
		SD_DAT3,						//	SD Card Data 3
		SD_CMD,							//	SD Card Command Signal
		SD_CLK,							//	SD Card Clock
		////////////////////	USB JTAG link	////////////////////
		TDI,  							// CPLD -> FPGA (data in)
		TCK,  							// CPLD -> FPGA (clk)
		TCS,  							// CPLD -> FPGA (CS)
	    TDO,  							// FPGA -> CPLD (data out)
		////////////////////	I2C		////////////////////////////
		I2C_SDAT,						//	I2C Data
		I2C_SCLK,						//	I2C Clock
		////////////////////	PS2		////////////////////////////
		PS2_DAT,						//	PS2 Data
		PS2_CLK,						//	PS2 Clock
		////////////////////	VGA		////////////////////////////
		VGA_CLK,   						//	VGA Clock
		VGA_HS,							//	VGA H_SYNC
		VGA_VS,							//	VGA V_SYNC
		VGA_BLANK,						//	VGA BLANK
		VGA_SYNC,						//	VGA SYNC
		VGA_R,   						//	VGA Red[9:0]
		VGA_G,	 						//	VGA Green[9:0]
		VGA_B,  						//	VGA Blue[9:0]
		////////////	Ethernet Interface	////////////////////////
		ENET_DATA,						//	DM9000A DATA bus 16Bits
		ENET_CMD,						//	DM9000A Command/Data Select, 0 = Command, 1 = Data
		ENET_CS_N,						//	DM9000A Chip Select
		ENET_WR_N,						//	DM9000A Write
		ENET_RD_N,						//	DM9000A Read
		ENET_RST_N,						//	DM9000A Reset
		ENET_INT,						//	DM9000A Interrupt
		ENET_CLK,						//	DM9000A Clock 25 MHz
		////////////////	Audio CODEC		////////////////////////
		AUD_ADCLRCK,					//	Audio CODEC ADC LR Clock
		AUD_ADCDAT,						//	Audio CODEC ADC Data
		AUD_DACLRCK,					//	Audio CODEC DAC LR Clock
		AUD_DACDAT,						//	Audio CODEC DAC Data
		AUD_BCLK,						//	Audio CODEC Bit-Stream Clock
		AUD_XCK,						//	Audio CODEC Chip Clock
		////////////////	TV Decoder		////////////////////////
		TD_DATA,    					//	TV Decoder Data bus 8 bits
		TD_HS,							//	TV Decoder H_SYNC
		TD_VS,							//	TV Decoder V_SYNC
		TD_RESET,						//	TV Decoder Reset
		////////////////////	GPIO	////////////////////////////
		GPIO_0,							//	GPIO Connection 0
		GPIO_1							//	GPIO Connection 1
	);

////////////////////////	Clock Input	 	////////////////////////
input			CLOCK_27;				//	27 MHz
input			CLOCK_50;				//	50 MHz
input			EXT_CLOCK;				//	External Clock
////////////////////////	Push Button		////////////////////////
input	[3:0]	KEY;					//	Pushbutton[3:0]
////////////////////////	DPDT Switch		////////////////////////
input	[17:0]	SW;						//	Toggle Switch[17:0]
////////////////////////	7-SEG Dispaly	////////////////////////
output	[6:0]	HEX0;					//	Seven Segment Digit 0
output	[6:0]	HEX1;					//	Seven Segment Digit 1
output	[6:0]	HEX2;					//	Seven Segment Digit 2
output	[6:0]	HEX3;					//	Seven Segment Digit 3
output	[6:0]	HEX4;					//	Seven Segment Digit 4
output	[6:0]	HEX5;					//	Seven Segment Digit 5
output	[6:0]	HEX6;					//	Seven Segment Digit 6
output	[6:0]	HEX7;					//	Seven Segment Digit 7
////////////////////////////	LED		////////////////////////////
output	[8:0]	LEDG;					//	LED Green[8:0]
output	[17:0]	LEDR;					//	LED Red[17:0]
////////////////////////////	UART	////////////////////////////
output			UART_TXD;				//	UART Transmitter
input			UART_RXD;				//	UART Receiver
////////////////////////////	IRDA	////////////////////////////
output			IRDA_TXD;				//	IRDA Transmitter
input			IRDA_RXD;				//	IRDA Receiver
///////////////////////		SDRAM Interface	////////////////////////
inout	[15:0]	DRAM_DQ;				//	SDRAM Data bus 16 Bits
output	[11:0]	DRAM_ADDR;				//	SDRAM Address bus 12 Bits
output			DRAM_LDQM;				//	SDRAM Low-byte Data Mask 
output			DRAM_UDQM;				//	SDRAM High-byte Data Mask
output			DRAM_WE_N;				//	SDRAM Write Enable
output			DRAM_CAS_N;				//	SDRAM Column Address Strobe
output			DRAM_RAS_N;				//	SDRAM Row Address Strobe
output			DRAM_CS_N;				//	SDRAM Chip Select
output			DRAM_BA_0;				//	SDRAM Bank Address 0
output			DRAM_BA_1;				//	SDRAM Bank Address 0
output			DRAM_CLK;				//	SDRAM Clock
output			DRAM_CKE;				//	SDRAM Clock Enable
////////////////////////	Flash Interface	////////////////////////
inout	[7:0]	FL_DQ;					//	FLASH Data bus 8 Bits
output	[21:0]	FL_ADDR;				//	FLASH Address bus 22 Bits
output			FL_WE_N;				//	FLASH Write Enable
output			FL_RST_N;				//	FLASH Reset
output			FL_OE_N;				//	FLASH Output Enable
output			FL_CE_N;				//	FLASH Chip Enable
////////////////////////	SRAM Interface	////////////////////////
inout	[15:0]	SRAM_DQ;				//	SRAM Data bus 16 Bits
output	[17:0]	SRAM_ADDR;				//	SRAM Address bus 18 Bits
output			SRAM_UB_N;				//	SRAM High-byte Data Mask
output			SRAM_LB_N;				//	SRAM Low-byte Data Mask 
output			SRAM_WE_N;				//	SRAM Write Enable
output			SRAM_CE_N;				//	SRAM Chip Enable
output			SRAM_OE_N;				//	SRAM Output Enable
////////////////////	ISP1362 Interface	////////////////////////
inout	[15:0]	OTG_DATA;				//	ISP1362 Data bus 16 Bits
output	[1:0]	OTG_ADDR;				//	ISP1362 Address 2 Bits
output			OTG_CS_N;				//	ISP1362 Chip Select
output			OTG_RD_N;				//	ISP1362 Write
output			OTG_WR_N;				//	ISP1362 Read
output			OTG_RST_N;				//	ISP1362 Reset
output			OTG_FSPEED;				//	USB Full Speed,	0 = Enable, Z = Disable
output			OTG_LSPEED;				//	USB Low Speed, 	0 = Enable, Z = Disable
input			OTG_INT0;				//	ISP1362 Interrupt 0
input			OTG_INT1;				//	ISP1362 Interrupt 1
input			OTG_DREQ0;				//	ISP1362 DMA Request 0
input			OTG_DREQ1;				//	ISP1362 DMA Request 1
output			OTG_DACK0_N;			//	ISP1362 DMA Acknowledge 0
output			OTG_DACK1_N;			//	ISP1362 DMA Acknowledge 1
////////////////////	LCD Module 16X2	////////////////////////////
inout	[7:0]	LCD_DATA;				//	LCD Data bus 8 bits
output			LCD_ON;					//	LCD Power ON/OFF
output			LCD_BLON;				//	LCD Back Light ON/OFF
output			LCD_RW;					//	LCD Read/Write Select, 0 = Write, 1 = Read
output			LCD_EN;					//	LCD Enable
output			LCD_RS;					//	LCD Command/Data Select, 0 = Command, 1 = Data
////////////////////	SD Card Interface	////////////////////////
inout			SD_DAT;					//	SD Card Data
inout			SD_DAT3;				//	SD Card Data 3
inout			SD_CMD;					//	SD Card Command Signal
output			SD_CLK;					//	SD Card Clock
////////////////////////	I2C		////////////////////////////////
inout			I2C_SDAT;				//	I2C Data
output			I2C_SCLK;				//	I2C Clock
////////////////////////	PS2		////////////////////////////////
input		 	PS2_DAT;				//	PS2 Data
input			PS2_CLK;				//	PS2 Clock
////////////////////	USB JTAG link	////////////////////////////
input  			TDI;					// CPLD -> FPGA (data in)
input  			TCK;					// CPLD -> FPGA (clk)
input  			TCS;					// CPLD -> FPGA (CS)
output 			TDO;					// FPGA -> CPLD (data out)
////////////////////////	VGA			////////////////////////////
output			VGA_CLK;   				//	VGA Clock
output			VGA_HS;					//	VGA H_SYNC
output			VGA_VS;					//	VGA V_SYNC
output			VGA_BLANK;				//	VGA BLANK
output			VGA_SYNC;				//	VGA SYNC
output	[9:0]	VGA_R;   				//	VGA Red[9:0]
output	[9:0]	VGA_G;	 				//	VGA Green[9:0]
output	[9:0]	VGA_B;   				//	VGA Blue[9:0]
////////////////	Ethernet Interface	////////////////////////////
inout	[15:0]	ENET_DATA;				//	DM9000A DATA bus 16Bits
output			ENET_CMD;				//	DM9000A Command/Data Select, 0 = Command, 1 = Data
output			ENET_CS_N;				//	DM9000A Chip Select
output			ENET_WR_N;				//	DM9000A Write
output			ENET_RD_N;				//	DM9000A Read
output			ENET_RST_N;				//	DM9000A Reset
input			ENET_INT;				//	DM9000A Interrupt
output			ENET_CLK;				//	DM9000A Clock 25 MHz
////////////////////	Audio CODEC		////////////////////////////
output			AUD_ADCLRCK;			//	Audio CODEC ADC LR Clock
input			AUD_ADCDAT;				//	Audio CODEC ADC Data
output			AUD_DACLRCK;			//	Audio CODEC DAC LR Clock
output			AUD_DACDAT;				//	Audio CODEC DAC Data
output			AUD_BCLK;				//	Audio CODEC Bit-Stream Clock
output			AUD_XCK;				//	Audio CODEC Chip Clock
////////////////////	TV Devoder		////////////////////////////
input	[7:0]	TD_DATA;    			//	TV Decoder Data bus 8 bits
input			TD_HS;					//	TV Decoder H_SYNC
input			TD_VS;					//	TV Decoder V_SYNC
output			TD_RESET;				//	TV Decoder Reset
////////////////////////	GPIO	////////////////////////////////
inout	[35:0]	GPIO_0;					//	GPIO Connection 0
inout	[35:0]	GPIO_1;					//	GPIO Connection 1

//	LCD ON
assign	LCD_ON		=	1'b0;
assign	LCD_BLON	=	1'b0;

//	All inout port turn to tri-state
assign	DRAM_DQ		=	16'hzzzz;
assign	FL_DQ		=	8'hzz;
assign	SRAM_DQ		=	16'hzzzz;
assign	OTG_DATA	=	16'hzzzz;
assign	SD_DAT		=	1'bz;
assign	ENET_DATA	=	16'hzzzz;
assign	GPIO_0		=	36'hzzzzzzzzz;
assign	GPIO_1		=	36'hzzzzzzzzz;

wire	VGA_CTRL_CLK;
wire	AUD_CTRL_CLK;
wire	DLY_RST;

//sine wave gneerator
reg [31:0]	DDS_accum;
wire signed [15:0] sine_out;

//state variables for FitzHugh-Nagumo
reg signed [35:0] v, w, c ;
wire signed [35:0] v2,v3 ;//squared and cubed values
wire signed [35:0] vnew, wnew ;

// the clock divider
reg [4:0] count;


assign	TD_RESET	=	1'b1;	//	Allow 27 MHz
assign	AUD_ADCLRCK	=	AUD_DACLRCK;
assign	AUD_XCK		=	AUD_CTRL_CLK;

Reset_Delay			r0	(	.iCLK(CLOCK_50),.oRESET(DLY_RST)	);

VGA_Audio_PLL 		p1	(	.areset(~DLY_RST),.inclk0(CLOCK_27),.c0(VGA_CTRL_CLK),.c1(AUD_CTRL_CLK),.c2(VGA_CLK)	);

I2C_AV_Config 		u3	(	//	Host Side
							.iCLK(CLOCK_50),
							.iRST_N(KEY[0]),
							//	I2C Side
							.I2C_SCLK(I2C_SCLK),
							.I2C_SDAT(I2C_SDAT)	);

AUDIO_DAC_ADC 			u4	(	//	Audio Side
							.oAUD_BCK(AUD_BCLK),
							.oAUD_DATA(AUD_DACDAT),
							.oAUD_LRCK(AUD_DACLRCK),
							.iAUD_ADCDAT(AUD_ADCDAT),
							.iAUD_extL({v[35],v[32:16]}),
							.iAUD_extR({w[35],w[32:16]}),
							//	Control Signals
							.iSrc_Select(SW[17]),
				            .iCLK_18_4(AUD_CTRL_CLK),
							.iRST_N(DLY_RST)
							);
	
	//analog simulation of FHN system
	always @ (posedge CLOCK_50) 
	begin
		count <= count + 1; 
		
		if (KEY[3]==0) //reset
		begin
			v <= 36'hf_2148_0000 ; //v1(0) = -0.870;
			w <= 36'hf_C9BB_0000 ; //w1(0) = -0.212;
			//v2 <= 18'h3_2148 ; //v2(0) = -0.870;
			//w2 <= 18'h3_C9BB ; //w2(0) = -0.212;
			c <= {SW[15:0],20'h0} ;    // current = 0.35 = 0_5999
			//c2 <= SW[15:0]+8;
		end
		else if (count==0)
		begin 
			v <= vnew ;
			w <= wnew ;
			//v2 <= v2new ;
			//w2 <= w2new ;
		end
	end
	
	//FitzHugh-Nagumo Equations
	// dt = 2>>7
	//v(i+1) = v(i) + dt*(v(i) - v(i)^3 - w(i) + current)  ;
    //w(i+1) = w(i) + dt*(1/16*(v(i) + 0.5 - 1*w(i)));
 	
	
	/*
	signed_mult v_2(v2, v, v);  // v squared
	signed_mult v_3(v3, v2, v); // v cubed
	assign vnew = v + ((v-v3-w+c)>>>7);
	assign wnew = w + ( ((v-w+36'h0_8000_0000)>>>4) >>>7);
	*/
	
	
	signed_mult v_2(v2, v, (v>>>1));  	// v-squared/2
	signed_mult v_3(v3, v2, (v>>>1)); 	// v-cubed/4
	assign vnew = v + (((v>>>2)-v3-(w>>>2)+(c>>>2))>>>5);
	assign wnew = w + (((v>>>2)-(w>>>2)+(36'h0_8000_0000>>>2)) >>>9);
	
	
	/*
	signed_mult v_22(v22, (v2>>>1), v2);  	// v-squared/2
	signed_mult v_23(v23, v22, v2); 		// v-cubed/2
	assign v2new = v2 + (((v2>>>1)-v23-(w2>>>1)+(c2>>>1))>>>5);
	assign w2new = w2 + (((v2>>>1)-(w2>>>1)+(18'h08000>>>1)) >>>9);
	*/
endmodule

//////////////////////////////////////////////////
//// signed mult of 2.16 format 2'comp////////////
//////////////////////////////////////////////////

module signed_mult (out, a, b);

	output 		[17:0]	out;
	input 	signed	[35:0] 	a;
	input 	signed	[35:0] 	b;
	
	wire	signed	[35:0]	out;
	wire 	signed	[71:0]	mult_out;

	assign mult_out = a * b;
	//assign out = mult_out[33:17];
	assign out = {mult_out[71], mult_out[66:32]};
endmodule

//////////////////////////////////////////////////
////////////	Sin Wave ROM Table	//////////////
//////////////////////////////////////////////////

module sync_rom (clock, address, sine);
input clock;
input [7:0] address;
output [15:0] sine;
reg signed [15:0] sine;
always@(posedge clock)
begin
    case(address)
    		8'h00: sine = 16'h0000 ;
			8'h01: sine = 16'h0192 ;
			8'h02: sine = 16'h0323 ;
			8'h03: sine = 16'h04b5 ;
			8'h04: sine = 16'h0645 ;
			8'h05: sine = 16'h07d5 ;
			8'h06: sine = 16'h0963 ;
			8'h07: sine = 16'h0af0 ;
			8'h08: sine = 16'h0c7c ;
			8'h09: sine = 16'h0e05 ;
			8'h0a: sine = 16'h0f8c ;
			8'h0b: sine = 16'h1111 ;
			8'h0c: sine = 16'h1293 ;
			8'h0d: sine = 16'h1413 ;
			8'h0e: sine = 16'h158f ;
			8'h0f: sine = 16'h1708 ;
			8'h10: sine = 16'h187d ;
			8'h11: sine = 16'h19ef ;
			8'h12: sine = 16'h1b5c ;
			8'h13: sine = 16'h1cc5 ;
			8'h14: sine = 16'h1e2a ;
			8'h15: sine = 16'h1f8b ;
			8'h16: sine = 16'h20e6 ;
			8'h17: sine = 16'h223c ;
			8'h18: sine = 16'h238d ;
			8'h19: sine = 16'h24d9 ;
			8'h1a: sine = 16'h261f ;
			8'h1b: sine = 16'h275f ;
			8'h1c: sine = 16'h2899 ;
			8'h1d: sine = 16'h29cc ;
			8'h1e: sine = 16'h2afa ;
			8'h1f: sine = 16'h2c20 ;
			8'h20: sine = 16'h2d40 ;
			8'h21: sine = 16'h2e59 ;
			8'h22: sine = 16'h2f6b ;
			8'h23: sine = 16'h3075 ;
			8'h24: sine = 16'h3178 ;
			8'h25: sine = 16'h3273 ;
			8'h26: sine = 16'h3366 ;
			8'h27: sine = 16'h3452 ;
			8'h28: sine = 16'h3535 ;
			8'h29: sine = 16'h3611 ;
			8'h2a: sine = 16'h36e4 ;
			8'h2b: sine = 16'h37ae ;
			8'h2c: sine = 16'h3870 ;
			8'h2d: sine = 16'h3929 ;
			8'h2e: sine = 16'h39da ;
			8'h2f: sine = 16'h3a81 ;
			8'h30: sine = 16'h3b1f ;
			8'h31: sine = 16'h3bb5 ;
			8'h32: sine = 16'h3c41 ;
			8'h33: sine = 16'h3cc4 ;
			8'h34: sine = 16'h3d3d ;
			8'h35: sine = 16'h3dad ;
			8'h36: sine = 16'h3e14 ;
			8'h37: sine = 16'h3e70 ;
			8'h38: sine = 16'h3ec4 ;
			8'h39: sine = 16'h3f0d ;
			8'h3a: sine = 16'h3f4d ;
			8'h3b: sine = 16'h3f83 ;
			8'h3c: sine = 16'h3fb0 ;
			8'h3d: sine = 16'h3fd2 ;
			8'h3e: sine = 16'h3feb ;
			8'h3f: sine = 16'h3ffa ;
			8'h40: sine = 16'h3fff ;
			8'h41: sine = 16'h3ffa ;
			8'h42: sine = 16'h3feb ;
			8'h43: sine = 16'h3fd2 ;
			8'h44: sine = 16'h3fb0 ;
			8'h45: sine = 16'h3f83 ;
			8'h46: sine = 16'h3f4d ;
			8'h47: sine = 16'h3f0d ;
			8'h48: sine = 16'h3ec4 ;
			8'h49: sine = 16'h3e70 ;
			8'h4a: sine = 16'h3e14 ;
			8'h4b: sine = 16'h3dad ;
			8'h4c: sine = 16'h3d3d ;
			8'h4d: sine = 16'h3cc4 ;
			8'h4e: sine = 16'h3c41 ;
			8'h4f: sine = 16'h3bb5 ;
			8'h50: sine = 16'h3b1f ;
			8'h51: sine = 16'h3a81 ;
			8'h52: sine = 16'h39da ;
			8'h53: sine = 16'h3929 ;
			8'h54: sine = 16'h3870 ;
			8'h55: sine = 16'h37ae ;
			8'h56: sine = 16'h36e4 ;
			8'h57: sine = 16'h3611 ;
			8'h58: sine = 16'h3535 ;
			8'h59: sine = 16'h3452 ;
			8'h5a: sine = 16'h3366 ;
			8'h5b: sine = 16'h3273 ;
			8'h5c: sine = 16'h3178 ;
			8'h5d: sine = 16'h3075 ;
			8'h5e: sine = 16'h2f6b ;
			8'h5f: sine = 16'h2e59 ;
			8'h60: sine = 16'h2d40 ;
			8'h61: sine = 16'h2c20 ;
			8'h62: sine = 16'h2afa ;
			8'h63: sine = 16'h29cc ;
			8'h64: sine = 16'h2899 ;
			8'h65: sine = 16'h275f ;
			8'h66: sine = 16'h261f ;
			8'h67: sine = 16'h24d9 ;
			8'h68: sine = 16'h238d ;
			8'h69: sine = 16'h223c ;
			8'h6a: sine = 16'h20e6 ;
			8'h6b: sine = 16'h1f8b ;
			8'h6c: sine = 16'h1e2a ;
			8'h6d: sine = 16'h1cc5 ;
			8'h6e: sine = 16'h1b5c ;
			8'h6f: sine = 16'h19ef ;
			8'h70: sine = 16'h187d ;
			8'h71: sine = 16'h1708 ;
			8'h72: sine = 16'h158f ;
			8'h73: sine = 16'h1413 ;
			8'h74: sine = 16'h1293 ;
			8'h75: sine = 16'h1111 ;
			8'h76: sine = 16'h0f8c ;
			8'h77: sine = 16'h0e05 ;
			8'h78: sine = 16'h0c7c ;
			8'h79: sine = 16'h0af0 ;
			8'h7a: sine = 16'h0963 ;
			8'h7b: sine = 16'h07d5 ;
			8'h7c: sine = 16'h0645 ;
			8'h7d: sine = 16'h04b5 ;
			8'h7e: sine = 16'h0323 ;
			8'h7f: sine = 16'h0192 ;
			8'h80: sine = 16'h0000 ;
			8'h81: sine = 16'hfe6e ;
			8'h82: sine = 16'hfcdd ;
			8'h83: sine = 16'hfb4b ;
			8'h84: sine = 16'hf9bb ;
			8'h85: sine = 16'hf82b ;
			8'h86: sine = 16'hf69d ;
			8'h87: sine = 16'hf510 ;
			8'h88: sine = 16'hf384 ;
			8'h89: sine = 16'hf1fb ;
			8'h8a: sine = 16'hf074 ;
			8'h8b: sine = 16'heeef ;
			8'h8c: sine = 16'hed6d ;
			8'h8d: sine = 16'hebed ;
			8'h8e: sine = 16'hea71 ;
			8'h8f: sine = 16'he8f8 ;
			8'h90: sine = 16'he783 ;
			8'h91: sine = 16'he611 ;
			8'h92: sine = 16'he4a4 ;
			8'h93: sine = 16'he33b ;
			8'h94: sine = 16'he1d6 ;
			8'h95: sine = 16'he075 ;
			8'h96: sine = 16'hdf1a ;
			8'h97: sine = 16'hddc4 ;
			8'h98: sine = 16'hdc73 ;
			8'h99: sine = 16'hdb27 ;
			8'h9a: sine = 16'hd9e1 ;
			8'h9b: sine = 16'hd8a1 ;
			8'h9c: sine = 16'hd767 ;
			8'h9d: sine = 16'hd634 ;
			8'h9e: sine = 16'hd506 ;
			8'h9f: sine = 16'hd3e0 ;
			8'ha0: sine = 16'hd2c0 ;
			8'ha1: sine = 16'hd1a7 ;
			8'ha2: sine = 16'hd095 ;
			8'ha3: sine = 16'hcf8b ;
			8'ha4: sine = 16'hce88 ;
			8'ha5: sine = 16'hcd8d ;
			8'ha6: sine = 16'hcc9a ;
			8'ha7: sine = 16'hcbae ;
			8'ha8: sine = 16'hcacb ;
			8'ha9: sine = 16'hc9ef ;
			8'haa: sine = 16'hc91c ;
			8'hab: sine = 16'hc852 ;
			8'hac: sine = 16'hc790 ;
			8'had: sine = 16'hc6d7 ;
			8'hae: sine = 16'hc626 ;
			8'haf: sine = 16'hc57f ;
			8'hb0: sine = 16'hc4e1 ;
			8'hb1: sine = 16'hc44b ;
			8'hb2: sine = 16'hc3bf ;
			8'hb3: sine = 16'hc33c ;
			8'hb4: sine = 16'hc2c3 ;
			8'hb5: sine = 16'hc253 ;
			8'hb6: sine = 16'hc1ec ;
			8'hb7: sine = 16'hc190 ;
			8'hb8: sine = 16'hc13c ;
			8'hb9: sine = 16'hc0f3 ;
			8'hba: sine = 16'hc0b3 ;
			8'hbb: sine = 16'hc07d ;
			8'hbc: sine = 16'hc050 ;
			8'hbd: sine = 16'hc02e ;
			8'hbe: sine = 16'hc015 ;
			8'hbf: sine = 16'hc006 ;
			8'hc0: sine = 16'hc001 ;
			8'hc1: sine = 16'hc006 ;
			8'hc2: sine = 16'hc015 ;
			8'hc3: sine = 16'hc02e ;
			8'hc4: sine = 16'hc050 ;
			8'hc5: sine = 16'hc07d ;
			8'hc6: sine = 16'hc0b3 ;
			8'hc7: sine = 16'hc0f3 ;
			8'hc8: sine = 16'hc13c ;
			8'hc9: sine = 16'hc190 ;
			8'hca: sine = 16'hc1ec ;
			8'hcb: sine = 16'hc253 ;
			8'hcc: sine = 16'hc2c3 ;
			8'hcd: sine = 16'hc33c ;
			8'hce: sine = 16'hc3bf ;
			8'hcf: sine = 16'hc44b ;
			8'hd0: sine = 16'hc4e1 ;
			8'hd1: sine = 16'hc57f ;
			8'hd2: sine = 16'hc626 ;
			8'hd3: sine = 16'hc6d7 ;
			8'hd4: sine = 16'hc790 ;
			8'hd5: sine = 16'hc852 ;
			8'hd6: sine = 16'hc91c ;
			8'hd7: sine = 16'hc9ef ;
			8'hd8: sine = 16'hcacb ;
			8'hd9: sine = 16'hcbae ;
			8'hda: sine = 16'hcc9a ;
			8'hdb: sine = 16'hcd8d ;
			8'hdc: sine = 16'hce88 ;
			8'hdd: sine = 16'hcf8b ;
			8'hde: sine = 16'hd095 ;
			8'hdf: sine = 16'hd1a7 ;
			8'he0: sine = 16'hd2c0 ;
			8'he1: sine = 16'hd3e0 ;
			8'he2: sine = 16'hd506 ;
			8'he3: sine = 16'hd634 ;
			8'he4: sine = 16'hd767 ;
			8'he5: sine = 16'hd8a1 ;
			8'he6: sine = 16'hd9e1 ;
			8'he7: sine = 16'hdb27 ;
			8'he8: sine = 16'hdc73 ;
			8'he9: sine = 16'hddc4 ;
			8'hea: sine = 16'hdf1a ;
			8'heb: sine = 16'he075 ;
			8'hec: sine = 16'he1d6 ;
			8'hed: sine = 16'he33b ;
			8'hee: sine = 16'he4a4 ;
			8'hef: sine = 16'he611 ;
			8'hf0: sine = 16'he783 ;
			8'hf1: sine = 16'he8f8 ;
			8'hf2: sine = 16'hea71 ;
			8'hf3: sine = 16'hebed ;
			8'hf4: sine = 16'hed6d ;
			8'hf5: sine = 16'heeef ;
			8'hf6: sine = 16'hf074 ;
			8'hf7: sine = 16'hf1fb ;
			8'hf8: sine = 16'hf384 ;
			8'hf9: sine = 16'hf510 ;
			8'hfa: sine = 16'hf69d ;
			8'hfb: sine = 16'hf82b ;
			8'hfc: sine = 16'hf9bb ;
			8'hfd: sine = 16'hfb4b ;
			8'hfe: sine = 16'hfcdd ;
			8'hff: sine = 16'hfe6e ;
	endcase
end
endmodule
//////////////////////////////////////////////////