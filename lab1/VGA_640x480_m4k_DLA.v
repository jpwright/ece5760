// --------------------------------------------------------------------
// --------------------------------------------------------------------
//
// Major Functions: Diffusion limited aggregation 
//		state is in m4k blocks
// --------------------------------------------------------------------
//
// Revision History :
// --------------------------------------------------------------------
// Bruce R Land, Cornell University, Oct 2009
// Improved top module written by Adam Shapiro Oct 2009
// --------------------------------------------------------------------

module DE2_TOP (
    // Clock Input
    input         CLOCK_27,    // 27 MHz
    input         CLOCK_50,    // 50 MHz
    input         EXT_CLOCK,   // External Clock
    // Push Button
    input  [3:0]  KEY,         // Pushbutton[3:0]
    // DPDT Switch
    input  [17:0] SW,          // Toggle Switch[17:0]
    // 7-SEG Display
    output [6:0]  HEX0,        // Seven Segment Digit 0
    output [6:0]  HEX1,        // Seven Segment Digit 1
    output [6:0]  HEX2,        // Seven Segment Digit 2
    output [6:0]  HEX3,        // Seven Segment Digit 3
    output [6:0]  HEX4,        // Seven Segment Digit 4
    output [6:0]  HEX5,        // Seven Segment Digit 5
    output [6:0]  HEX6,        // Seven Segment Digit 6
    output [6:0]  HEX7,        // Seven Segment Digit 7
    // LED
    output [8:0]  LEDG,        // LED Green[8:0]
    output [17:0] LEDR,        // LED Red[17:0]
    // UART
    output        UART_TXD,    // UART Transmitter
    input         UART_RXD,    // UART Receiver
    // IRDA
    output        IRDA_TXD,    // IRDA Transmitter
    input         IRDA_RXD,    // IRDA Receiver
    // SDRAM Interface
    inout  [15:0] DRAM_DQ,     // SDRAM Data bus 16 Bits
    output [11:0] DRAM_ADDR,   // SDRAM Address bus 12 Bits
    output        DRAM_LDQM,   // SDRAM Low-byte Data Mask 
    output        DRAM_UDQM,   // SDRAM High-byte Data Mask
    output        DRAM_WE_N,   // SDRAM Write Enable
    output        DRAM_CAS_N,  // SDRAM Column Address Strobe
    output        DRAM_RAS_N,  // SDRAM Row Address Strobe
    output        DRAM_CS_N,   // SDRAM Chip Select
    output        DRAM_BA_0,   // SDRAM Bank Address 0
    output        DRAM_BA_1,   // SDRAM Bank Address 0
    output        DRAM_CLK,    // SDRAM Clock
    output        DRAM_CKE,    // SDRAM Clock Enable
    // Flash Interface
    inout  [7:0]  FL_DQ,       // FLASH Data bus 8 Bits
    output [21:0] FL_ADDR,     // FLASH Address bus 22 Bits
    output        FL_WE_N,     // FLASH Write Enable
    output        FL_RST_N,    // FLASH Reset
    output        FL_OE_N,     // FLASH Output Enable
    output        FL_CE_N,     // FLASH Chip Enable
    // SRAM Interface
    inout  [15:0] SRAM_DQ,     // SRAM Data bus 16 Bits
    output [17:0] SRAM_ADDR,   // SRAM Address bus 18 Bits
    output        SRAM_UB_N,   // SRAM High-byte Data Mask 
    output        SRAM_LB_N,   // SRAM Low-byte Data Mask 
    output        SRAM_WE_N,   // SRAM Write Enable
    output        SRAM_CE_N,   // SRAM Chip Enable
    output        SRAM_OE_N,   // SRAM Output Enable
    // ISP1362 Interface
    inout  [15:0] OTG_DATA,    // ISP1362 Data bus 16 Bits
    output [1:0]  OTG_ADDR,    // ISP1362 Address 2 Bits
    output        OTG_CS_N,    // ISP1362 Chip Select
    output        OTG_RD_N,    // ISP1362 Write
    output        OTG_WR_N,    // ISP1362 Read
    output        OTG_RST_N,   // ISP1362 Reset
    output        OTG_FSPEED,  // USB Full Speed, 0 = Enable, Z = Disable
    output        OTG_LSPEED,  // USB Low Speed,  0 = Enable, Z = Disable
    input         OTG_INT0,    // ISP1362 Interrupt 0
    input         OTG_INT1,    // ISP1362 Interrupt 1
    input         OTG_DREQ0,   // ISP1362 DMA Request 0
    input         OTG_DREQ1,   // ISP1362 DMA Request 1
    output        OTG_DACK0_N, // ISP1362 DMA Acknowledge 0
    output        OTG_DACK1_N, // ISP1362 DMA Acknowledge 1
    // LCD Module 16X2
    inout  [7:0]  LCD_DATA,    // LCD Data bus 8 bits
    output        LCD_ON,      // LCD Power ON/OFF
    output        LCD_BLON,    // LCD Back Light ON/OFF
    output        LCD_RW,      // LCD Read/Write Select, 0 = Write, 1 = Read
    output        LCD_EN,      // LCD Enable
    output        LCD_RS,      // LCD Command/Data Select, 0 = Command, 1 = Data
    // SD Card Interface
    inout         SD_DAT,      // SD Card Data
    inout         SD_DAT3,     // SD Card Data 3
    inout         SD_CMD,      // SD Card Command Signal
    output        SD_CLK,      // SD Card Clock
    // I2C
    inout         I2C_SDAT,    // I2C Data
    output        I2C_SCLK,    // I2C Clock
    // PS2
    input         PS2_DAT,     // PS2 Data
    input         PS2_CLK,     // PS2 Clock
    // USB JTAG link
    input         TDI,         // CPLD -> FPGA (data in)
    input         TCK,         // CPLD -> FPGA (clk)
    input         TCS,         // CPLD -> FPGA (CS)
    output        TDO,         // FPGA -> CPLD (data out)
    // VGA
    output        VGA_CLK,     // VGA Clock
    output        VGA_HS,      // VGA H_SYNC
    output        VGA_VS,      // VGA V_SYNC
    output        VGA_BLANK,   // VGA BLANK
    output        VGA_SYNC,    // VGA SYNC
    output [9:0]  VGA_R,       // VGA Red[9:0]
    output [9:0]  VGA_G,       // VGA Green[9:0]
    output [9:0]  VGA_B,       // VGA Blue[9:0]
    // Ethernet Interface
    inout  [15:0] ENET_DATA,   // DM9000A DATA bus 16Bits
    output        ENET_CMD,    // DM9000A Command/Data Select, 0 = Command, 1 = Data
    output        ENET_CS_N,   // DM9000A Chip Select
    output        ENET_WR_N,   // DM9000A Write
    output        ENET_RD_N,   // DM9000A Read
    output        ENET_RST_N,  // DM9000A Reset
    input         ENET_INT,    // DM9000A Interrupt
    output        ENET_CLK,    // DM9000A Clock 25 MHz
    // Audio CODEC
    inout         AUD_ADCLRCK, // Audio CODEC ADC LR Clock
    input         AUD_ADCDAT,  // Audio CODEC ADC Data
    inout         AUD_DACLRCK, // Audio CODEC DAC LR Clock
    output        AUD_DACDAT,  // Audio CODEC DAC Data
    inout         AUD_BCLK,    // Audio CODEC Bit-Stream Clock
    output        AUD_XCK,     // Audio CODEC Chip Clock
    // TV Decoder
    input  [7:0]  TD_DATA,     // TV Decoder Data bus 8 bits
    input         TD_HS,       // TV Decoder H_SYNC
    input         TD_VS,       // TV Decoder V_SYNC
    output        TD_RESET,    // TV Decoder Reset
    // GPIO
    inout  [35:0] GPIO_0,      // GPIO Connection 0
    inout  [35:0] GPIO_1       // GPIO Connection 1
);

   //Turn off all displays.
   //assign HEX0 = 7'h7F;
   //assign HEX1 = 7'h7F;
   //assign HEX2 = 7'h7F;
   //assign HEX3 = 7'h7F;
   //assign HEX4 = 7'h7F;
   //assign HEX5 = 7'h7F;
   //assign HEX6 = 7'h7F;
   //assign HEX7 = 7'h7F;
   //assign LEDR = 18'h0;
   //assign LEDG = 9'h0;
  
   //Set all GPIO to tri-state.
   assign GPIO_0 = 36'hzzzzzzzzz;
   assign GPIO_1 = 36'hzzzzzzzzz;

   //Disable audio codec.
   //assign AUD_DACDAT = 1'b0;
   //assign AUD_XCK    = 1'b0;

   //Disable DRAM.
   assign DRAM_ADDR  = 12'h0;
   assign DRAM_BA_0  = 1'b0;
   assign DRAM_BA_1  = 1'b0;
   assign DRAM_CAS_N = 1'b1;
   assign DRAM_CKE   = 1'b0;
   assign DRAM_CLK   = 1'b0;
   assign DRAM_CS_N  = 1'b1;
   assign DRAM_DQ    = 16'hzzzz;
   assign DRAM_LDQM  = 1'b0;
   assign DRAM_RAS_N = 1'b1;
   assign DRAM_UDQM  = 1'b0;
   assign DRAM_WE_N  = 1'b1;

   //Disable Ethernet.
   assign ENET_CLK   = 1'b0;
   assign ENET_CS_N  = 1'b1;
   assign ENET_CMD   = 1'b0;
   assign ENET_DATA  = 16'hzzzz;
   assign ENET_RD_N  = 1'b1;
   assign ENET_RST_N = 1'b1;
   assign ENET_WR_N  = 1'b1;

   //Disable flash.
   assign FL_ADDR  = 22'h0;
   assign FL_CE_N  = 1'b1;
   assign FL_DQ    = 8'hzz;
   assign FL_OE_N  = 1'b1;
   assign FL_RST_N = 1'b1;
   assign FL_WE_N  = 1'b1;

   //Disable LCD.
   assign LCD_BLON = 1'b0;
   assign LCD_DATA = 8'hzz;
   assign LCD_EN   = 1'b0;
   assign LCD_ON   = 1'b0;
   assign LCD_RS   = 1'b0;
   assign LCD_RW   = 1'b0;

   //Disable OTG.
   assign OTG_ADDR    = 2'h0;
   assign OTG_CS_N    = 1'b1;
   assign OTG_DACK0_N = 1'b1;
   assign OTG_DACK1_N = 1'b1;
   assign OTG_FSPEED  = 1'b1;
   assign OTG_DATA    = 16'hzzzz;
   assign OTG_LSPEED  = 1'b1;
   assign OTG_RD_N    = 1'b1;
   assign OTG_RST_N   = 1'b1;
   assign OTG_WR_N    = 1'b1;

   //Disable SDRAM.
   assign SD_DAT = 1'bz;
   assign SD_CLK = 1'b0;

   //Disable SRAM.
   assign SRAM_ADDR = 18'h0;
   assign SRAM_CE_N = 1'b1;
   assign SRAM_DQ   = 16'hzzzz;
   assign SRAM_LB_N = 1'b1;
   assign SRAM_OE_N = 1'b1;
   assign SRAM_UB_N = 1'b1;
   assign SRAM_WE_N = 1'b1;

   //Disable VGA.
   /*
   assign VGA_CLK   = 1'b0;
   assign VGA_BLANK = 1'b0;
   assign VGA_SYNC  = 1'b0;
   assign VGA_HS    = 1'b0;
   assign VGA_VS    = 1'b0;
   assign VGA_R     = 10'h0;
   assign VGA_G     = 10'h0;
   assign VGA_B     = 10'h0;
   */

   //Disable all other peripherals.
   //assign I2C_SCLK = 1'b0;
   assign IRDA_TXD = 1'b0;
   //assign TD_RESET = 1'b0;
   assign TDO = 1'b0;
   assign UART_TXD = 1'b0;
   

wire	VGA_CTRL_CLK;
wire	AUD_CTRL_CLK;
wire	DLY_RST;

assign	TD_RESET	=	1'b1;	//	Allow 27 MHz
assign	AUD_ADCLRCK	=	AUD_DACLRCK;
assign	AUD_XCK		=	AUD_CTRL_CLK;

Reset_Delay			r0	(	.iCLK(CLOCK_50),.oRESET(DLY_RST)	);

VGA_Audio_PLL 		p1	(	.areset(~DLY_RST),.inclk0(CLOCK_27),.c0(VGA_CTRL_CLK),.c1(AUD_CTRL_CLK),.c2(VGA_CLK)	);


VGA_Controller		u1	(	//	Host Side
							.iCursor_RGB_EN(4'b0111),
							.oAddress(mVGA_ADDR),
							.oCoord_X(Coord_X),
							.oCoord_Y(Coord_Y),
							.iRed(mVGA_R),
							.iGreen(mVGA_G),
							.iBlue(mVGA_B),
							//	VGA Side
							.oVGA_R(VGA_R),
							.oVGA_G(VGA_G),
							.oVGA_B(VGA_B),
							.oVGA_H_SYNC(VGA_HS),
							.oVGA_V_SYNC(VGA_VS),
							.oVGA_SYNC(VGA_SYNC),
							.oVGA_BLANK(VGA_BLANK),
							//	Control Signal
							.iCLK(VGA_CTRL_CLK),
							.iRST_N(DLY_RST)	);

wire [9:0]	mVGA_R;				//memory output to VGA
wire [9:0]	mVGA_G;
wire [9:0]	mVGA_B;
wire [18:0]	mVGA_ADDR;			//video memory address
wire [9:0]  Coord_X, Coord_Y;	//display coods

////////////////////////////////////
//DLA state machine variables
wire reset;
reg [3:0] state;	//state machine
reg [30:0] x_rand;	//shift registers for random number gen  
reg [28:0] y_rand;
wire seed_low_bit, x_low_bit, y_low_bit; //rand low bits for SR
reg [9:0] x_walker; //particle coords of random walker
reg [8:0] y_walker;
reg [7:0] rule;
reg [3:0] sum; //neighbor sum


////////////////////////////////////
/*From megaWizard:
	module vga_buffer (
	address_a, // use a for state machine
	address_b, // use b for VGA refresh
	clock_a,
	clock_b,
	data_a,
	data_b,
	wren_a,
	wren_b,
	q_a,
	q_b);*/
// Show m4k on the VGA
// -- use m4k a for state machine
// -- use m4k b for VGA refresh
wire mem_bit ; //current data from m4k to VGA
reg disp_bit ; // registered data from m4k to VGA
wire state_bit ; // current data from m4k to state machine
reg we ; // write enable for a
reg [18:0] addr_reg ; // for a
reg data_reg ; // for a
vga_buffer display(
	.address_a (addr_reg) , 
	.address_b ({Coord_X[9:0],Coord_Y[8:0]}), // vga current address
	.clock_a (VGA_CTRL_CLK),
	.clock_b (VGA_CTRL_CLK),
	.data_a (data_reg),
	.data_b (1'b0), // never write on port b
	.wren_a (we),
	.wren_b (1'b0), // never write on port b
	.q_a (state_bit),
	.q_b (mem_bit) ); // data used to update VGA

// make the color white

//reg [9:0] color_r = {8{disp_bit}} ;
//reg [9:0] color_g = {10{disp_bit}} ;
//reg [9:0] color_b = {2{disp_bit}} ;

assign  mVGA_R = {2{disp_bit}};
assign  mVGA_G = {10{disp_bit}};
assign  mVGA_B = {2{disp_bit}};

// DLA state machine
assign reset = ~KEY[0];

HexDigit H0(HEX0, rule[0]);
HexDigit H1(HEX1, rule[1]);
HexDigit H2(HEX2, rule[2]);
HexDigit H3(HEX3, rule[3]);
HexDigit H4(HEX4, rule[4]);
HexDigit H5(HEX5, rule[5]);
HexDigit H6(HEX6, rule[6]);
HexDigit H7(HEX7, rule[7]);

assign LEDR[7:0] = SW[7:0];
assign LEDG[0] = ~KEY[0];
assign LEDG[1] = ~KEY[0];
assign LEDG[2] = ~KEY[1];
assign LEDG[3] = ~KEY[1];
assign LEDG[4] = ~KEY[2];
assign LEDG[5] = ~KEY[2];
assign LEDG[6] = ~KEY[3];
assign LEDG[7] = ~KEY[3];

reg [7:0] current_state = 8'b11111111;

assign LEDR[17:10] = current_state[7:0];

reg reset_val;
assign LEDG[8] = reset_val;

reg [641:0] row_data = 642'd0; //Extra 2 are for zero-padding
reg [641:0] prow_data = 642'd0; //Extra 2 are for zero-padding
reg [8:0] current_row = 9'd0;
reg [9:0] current_col = 10'd1; //Start row pointer at the 1, due to zero padding.

wire [641:0] result;

reg print = 1'b1;

genvar index;
generate
for (index=1; index < 641; index=index+1)
	begin: gen_code_label 
		Automaton A_inst(result[index], prow_data[index+1:index-1], rule);
	end
endgenerate

reg [639:0] prev_random_row = 640'hf9232a25a8c301011f64ff197a07037e15f2b9498b9dec83273c0dae73b1adbf1fa46164a15fa1057184b67f0c22d55ae3bf4f0c5a213cb2da6226b3520b3de83dea4fc9080c12544c4e2afb78206410;
wire [639:0] random_row;

generate
for (index=0; index < 20; index=index+1)
	begin: gen_code_label2
		Random32 R_inst(random_row[(32*index + 31):(32*index)], prev_random_row[(32*index + 31):(32*index)]);
	end
endgenerate
//Automaton Tester

//state names
parameter init=4'd0, test1=4'd1, test2=4'd2, test3=4'd3, test4=4'd4, test5=4'd5, test6=4'd6, 
	new_row=4'd7, new_row2=4'd8, chill=4'd9,
	chill2=4'd10, init2=4'd11, draw_walker1=4'd12, draw_walker2=4'd13 ;
always @ (negedge VGA_CTRL_CLK)
begin
	// register the m4k output for better timing on VGA
	// negedge seems to work better than posedge
	disp_bit <= mem_bit;
end

always @ (posedge SW[3])
begin

end

always @ (posedge VGA_CTRL_CLK) //VGA_CTRL_CLK
begin
	// register the m4k output for better timing on VGA
	//disp_bit <= mem_bit;
	
	if (reset)		//synch reset assumes KEY0 is held down 1/60 second
	begin
		reset_val <= 1'b1;
		//clear the screen
		addr_reg <= {Coord_X[9:0],Coord_Y[8:0]} ;	// [17:0]
		we <= 1'b1;								//write some memory
		data_reg <= 1'b0;						//write all zeros (black)		

		//read SW0:7
		rule <= SW[7:0];
		row_data <= 642'd0;
		prow_data <= 642'd0;
		if (SW[17]) begin
			row_data <= {1'b0, prev_random_row, 1'b0}; //The random rows are 640 bits and each row needs to be 642
		end
		else begin
			row_data[320] <= 1'b1;
		end
		state <= init;	//first state in regular state machine 
	end
	
	//begin state machine to modify display 
	else
	begin
	
		reset_val <= 1'b0;
		case(state)
			
			// next three states write the inital dot
			init: //write a single dot in the middle of the screen
			begin
				we <= 1'b1 ;
				addr_reg <= {10'd320,9'd0} ;	//(x,y)							
				//write a white dot in the middle of the screen
				data_reg <= 1'b1 ;
				print = 1'b1;
				current_col <= 10'd1;
				current_row <= 9'd0;
				current_state <= 8'b10000000;
				state <= test1 ;
			end
			
			//
			test1:
			begin
				we <= 1'b0;
				//addr_reg <= {10'd250,9'd0};
				//data_reg <= compute;
				if (print == 1'b1) begin
					addr_reg <= {current_col,current_row};
					data_reg <= row_data[642-current_col];
					//color_r <= {prow_data[current_col+1:current_col-1]{disp_bit}};
					//color_g <= {prow_data[current_col+1:current_col-1]{disp_bit}};
					//color_b <= {prow_data[current_col+1:current_col-1]{disp_bit}};
				end
				current_state <= 8'b01000000;
				state <= test2;
			end
			
			test2:
			begin
				we <= 1'b1;
				
				current_state <= 8'b00100000;
				state <= test3;
			end
			
			test3:
			begin
				we <= 1'b0;
				
				if (current_col >= 10'd640) begin
				   current_col <= 10'd1;
					if (current_row >= 9'd480) begin
						//current_row <= 9'd0;
						print <= 1'b0;
						state <= chill;
					end
					else begin
						//if ( ~KEY[2] )
						//begin
							current_row <= current_row + 9'd1;
							state <= new_row;
						//end
						//else begin
							//state <= test1;
						//end
					end
					
				end
				else begin
					current_col <= current_col + 10'd1;
					state <= test1;
				end
				current_state <= 8'b00010000;
				//addr_reg <= {10'd250,9'd100};
				//data_reg <= compute;
				
			end
			
			new_row:
			begin
				if (print == 1'b1) begin
					prow_data <= row_data;
				end
				current_state <= 8'b00001000;
				state <= new_row2;
			end
			
			new_row2:
			begin
				if (print == 1'b1) begin
					row_data <= result;
				end
				current_state <= 8'b00000100;
				state <= test1;
			end
			
			chill:
			begin
				//just chill
				if (~KEY[3])
				begin
					state <= chill2;
				end
				prev_random_row <= random_row;
				current_state <= 8'b00000010;
				//if (state != test1) begin
					//state <= chill;
				//end
			end
			
			chill2:
			begin
				if (KEY[3])
				begin
					print <= 1'b1;
					current_row <= 9'd0;
					current_col <= 10'd1;
					state <= test1;
				end
				else begin
					state <= chill2;
				end
				current_state <= 8'b00000001;
			end
			
			default:
			begin
				state <= chill;
			end
			
		endcase
	end // else if ( KEY[3]) 
	
	//else
	//begin
		//update the x,y random number gens
		// this allows the pause key to change the pattern
		// generated
		//x_rand <= {x_rand[29:0], x_low_bit} ;
		//y_rand <= {y_rand[27:0], y_low_bit} ;
	//end
end // always @ (posedge VGA_CTRL_CLK)

endmodule //top module

//////////////////////////////////////////////
// Larger Automaton

//////////////////////////////////////////////
// Sexy Module
module Automaton(outpixel, inpixels, rule);
	input [2:0] inpixels;
	output outpixel;
	reg outpixel;
	input [7:0] rule;
	always @ (inpixels, rule)
	begin
		case (inpixels)
			3'd0: outpixel <= rule[0];
			3'd1: outpixel <= rule[1];
			3'd2: outpixel <= rule[2];
			3'd3: outpixel <= rule[3];
			3'd4: outpixel <= rule[4];
			3'd5: outpixel <= rule[5];
			3'd6: outpixel <= rule[6];
			3'd7: outpixel <= rule[7];
			default: outpixel <= 1'b0;
		endcase
	end
endmodule

//////////////////////////////////////////////
// Random Number Generator
module Random32(out, in);
	input [31:0] in;
	output [31:0] out;
	reg [31:0] out;
	reg newbit;
	always @ (in)
	begin
		newbit = in[31] ^ in[21] ^ in[1] ^ in[0];
		out = {in[30:0], newbit};
	end
endmodule
		

//////////////////////////////////////////////
// Decode one hex digit for LED 7-seg display
module HexDigit(segs, num);
	input [3:0] num	;		//the hex digit to be displayed
	output [6:0] segs ;		//actual LED segments
	reg [6:0] segs ;
	always @ (num)
	begin
		case (num)
				4'h0: segs = 7'b1000000;
				4'h1: segs = 7'b1111001;
				4'h2: segs = 7'b0100100;
				4'h3: segs = 7'b0110000;
				4'h4: segs = 7'b0011001;
				4'h5: segs = 7'b0010010;
				4'h6: segs = 7'b0000010;
				4'h7: segs = 7'b1111000;
				4'h8: segs = 7'b0000000;
				4'h9: segs = 7'b0010000;
				4'ha: segs = 7'b0001000;
				4'hb: segs = 7'b0000011;
				4'hc: segs = 7'b1000110;
				4'hd: segs = 7'b0100001;
				4'he: segs = 7'b0000110;
				4'hf: segs = 7'b0001110;
				default segs = 7'b1111111;
		endcase
	end
endmodule
///////////////////////////////////////////////

////////// end of file //////////////////////////

