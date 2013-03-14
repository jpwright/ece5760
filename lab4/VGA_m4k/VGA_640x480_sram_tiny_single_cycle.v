// --------------------------------------------------------------------
// --------------------------------------------------------------------
//
// Major Functions: Video output from Stack machine 
//		VGA state is in m4k blocks
// --------------------------------------------------------------------
//
// Revision History :
// --------------------------------------------------------------------
// Bruce R Land, Cornell University, Nov 2010
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
   assign HEX0 = 7'h7F;
   assign HEX1 = 7'h7F;
   assign HEX2 = 7'h7F;
   assign HEX3 = 7'h7F;
   assign HEX4 = 7'h7F;
   assign HEX5 = 7'h7F;
   assign HEX6 = 7'h7F;
   assign HEX7 = 7'h7F;
  // assign LEDR = 18'h0;
  // assign LEDG = 9'h0;
   
   //Set all GPIO to tri-state.
   //assign GPIO_0 = 36'hzzzzzzzzz;
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

	/*
   //Disable SRAM.
   assign SRAM_ADDR = 18'h0;
   assign SRAM_CE_N = 1'b1;
   assign SRAM_DQ   = 16'hzzzz;
   assign SRAM_LB_N = 1'b1;
   assign SRAM_OE_N = 1'b1;
   assign SRAM_UB_N = 1'b1;
   assign SRAM_WE_N = 1'b1;
   */
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
wire	FAST_CLK;
wire	DLY_RST;

assign	TD_RESET	=	1'b1;	//	Allow 27 MHz
assign	AUD_ADCLRCK	=	AUD_DACLRCK;
assign	AUD_XCK		=	AUD_CTRL_CLK;

Reset_Delay			r0	(	.iCLK(CLOCK_50),.oRESET(DLY_RST)	);

VGA_Audio_PLL 		p1	(	.areset(~DLY_RST),.inclk0(CLOCK_27),.c0(VGA_CTRL_CLK),.c1(FAST_CLK),.c2(VGA_CLK)	);


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

// 18 bits of adddress:
// 9 bits of Y 
// 10 bits of X (excludes low bit which drives LB/UB)
// reset high is normal operation
assign SRAM_ADDR = (reset)? ((VGA_BLANK)? {Coord_Y[8:0], Coord_X[9:1]} : out0) : {Coord_Y[8:0], Coord_X[9:1]} ;
assign SRAM_CE_N = 1'b0;
assign SRAM_DQ   = (reset)? ((out2[0])? 16'hzzzz : out1) : 16'b0 ;
assign SRAM_OE_N = 1'b0;
assign SRAM_LB_N = (reset)? ((out2[0])? 0 : out2[1]) : 0 ;  // we=high implies VGA controller
assign SRAM_UB_N = (reset)? ((out2[0])? 0 : ~out2[1]) : 0 ;
assign SRAM_WE_N = (reset)? out2[0] : 0 ;

// remap color index for bigger dynamic range
wire [9:0] r, g, b ;
assign mVGA_R = r ;
assign mVGA_G = g ;
assign mVGA_B = b ;
wire [7:0] index ;
assign index = (Coord_X[0])? SRAM_DQ[15:8] : SRAM_DQ[7:0] ;
colormap cmap(r, g, b, index);

// reset
assign reset = KEY[0];

wire [17:0] out0, out1, out2, out3 ;

// define the CPU
minicpu cpu1(.clk(FAST_CLK), .reset(reset),  .run(1'b1),
	.in0(SW[17:0]),
	.in1({2'b00,SRAM_DQ}),
	.in2({~VGA_BLANK}), //.in2({~VGA_VS, ~VGA_HS}),
	.out0(out0),
	.out1(out1),
	.out2(out2),
	//.out2(LEDG),
   .out3(out3)	);

reg [32:0] timer;
always @(posedge CLOCK_50)
begin
	if (!reset) timer <= 0 ;
	else if (out3!=0) timer <= timer + 32'b1 ;
end

assign LEDR = out3;
endmodule //top module

/////////////////////////////////////////////////////
/// color map ///////////////////////////////////////
/////////////////////////////////////////////////////

module colormap(r,g,b, index);
// index bits r=[7:5], g=[4:2], b=[1:0]
input [7:0] index;
output reg [9:0] r, g, b ;
always @(*)
begin
if (index[7:6]==2'b11)
begin
	// red map
	case(index[5:4])
		0: r=10'h0;
		1: r=10'h100;
		2: r=10'h200;
		3: r=10'h3ff;
	endcase 
	// green map
	case(index[3:2])
		0: g=10'h0;
		1: g=10'h100;
		2: g=10'h200;
		3: g=10'h3ff;
	endcase 
	// blue map
	case(index[1:0])
		0: b=10'h0;
		1: b=10'h100;
		2: b=10'h200;
		3: b=10'h3ff;
	endcase
end
	
else if (index[7:6]==2'b10) 
begin
		// red map
	case(index[5:4])
		0: r=10'h0;
		1: r=10'h100>>1;
		2: r=10'h200>>1;
		3: r=10'h3ff>>1;
	endcase 
	// green map
	case(index[3:2])
		0: g=10'h0;
		1: g=10'h100>>1;
		2: g=10'h200>>1;
		3: g=10'h3ff>>1;
	endcase 
	// blue map
	case(index[1:0])
		0: b=10'h0;
		1: b=10'h100>>1;
		2: b=10'h200>>1;
		3: b=10'h3ff>>1;
	endcase
end
	
else if (index[7:6]==2'b01) 
begin
		// red map
	case(index[5:4])
		0: r=10'h0;
		1: r=10'h100>>2;
		2: r=10'h200>>2;
		3: r=10'h3ff>>2;
	endcase 
	// green map
	case(index[3:2])
		0: g=10'h0;
		1: g=10'h100>>2;
		2: g=10'h200>>2;
		3: g=10'h3ff>>2;
	endcase 
	// blue map
	case(index[1:0])
		0: b=10'h0;
		1: b=10'h100>>2;
		2: b=10'h200>>2;
		3: b=10'h3ff>>2;
	endcase
end
	
else begin
		// red map
	case(index[5:4])
		0: r=10'h0;
		1: r=10'h100>>3;
		2: r=10'h200>>3;
		3: r=10'h3ff>>3;
	endcase 
	// green map
	case(index[3:2])
		0: g=10'h0;
		1: g=10'h100>>3;
		2: g=10'h200>>3;
		3: g=10'h3ff>>3;
	endcase 
	// blue map
	case(index[1:0])
		0: b=10'h0;
		1: b=10'h100>>3;
		2: b=10'h200>>3;
		3: b=10'h3ff>>3;
	endcase
end
end
endmodule

///////////////////////////////////////////////////
//// signed mult of 10.8 format 2'comp ////////////
///////////////////////////////////////////////////
module signed_mult (out, a, b);

	output 		[17:0]	out;
	input 	signed	[17:0] 	a;
	input 	signed	[17:0] 	b;
	
	wire	signed	[17:0]	out;
	wire 	signed	[35:0]	mult_out;

	assign mult_out = a * b;
	//assign out = mult_out[33:17];
	assign out = {mult_out[35], mult_out[24:8]};
endmodule
//////////////////////////////////////////////////

////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
// The following CPU design is from
// http://www.cs.hiroshima-u.ac.jp/~nakano/wiki/
// and is GPL licensed
//
// with added opcodes, 18-bit data, and modified mult
////////////////////////////////////////////////////////////

`define IDLEA 2'b00
`define IDLEB 2'b01
`define EXEC 2'b10

`define  ADD  5'b00000
`define  SUB  5'b00001
`define  MUL  5'b00010
`define  SHL  5'b00011
`define  SHR  5'b00100
`define  BAND 5'b00101
`define  BOR  5'b00110
`define  BXOR 5'b00111
`define  AND  5'b01000
`define  OR   5'b01001
`define  EQ   5'b01010
`define  NE   5'b01011
`define  GE   5'b01100
`define  LE   5'b01101
`define  GT   5'b01110
`define  LT   5'b01111
`define  NEG  5'b10000
`define  BNOT 5'b10001
`define  NOT  5'b10010
`define  A    5'b10011
`define  B    5'b10111
`define  Aa   5'b11011
`define  Ba   5'b11111

`define HALT 4'b0000
`define PUSHI 4'b0001
`define PUSH 4'b0010
`define POP  4'b0011
`define JMP  4'b0100
`define JZ  4'b0101
`define JNZ 4'b0110
`define LD  4'b0111
`define ST  4'b1000
`define PPPC 4'b1001
`define IN   4'b1101
`define OUT  4'b1110
`define OP   4'b1111

//////////////////////////////////
module alu(a, b, f, s);

 input [17:0] a, b;
 input [4:0] 	f;
 output [17:0] s;
 reg  [17:0] 	 s;
 wire [17:0] x, y, mout;

 assign x = a + 18'h20000;
 assign y = b + 18'h20000;
  
 always @(a or b or x or y or f or mout)
   case(f)
     `ADD : s = b + a;
     `SUB : s = b - a;
     `MUL : s =  b * a; //mout ; // b * a;
     `SHL : s = b << a;
     `SHR : s = b >> a;
     `BAND: s = b & a;
     `BOR : s = b | a;
     `BXOR: s = b ^ a;
     `AND : s = b && a;
     `OR  : s = b || a;
     `EQ  : s = b == a;
     `NE  : s = b != a;
     `GE  : s = y >= x;
     `LE  : s = y <= x;
     `GT  : s = y > x;
     `LT  : s = y < x;
     `NEG : s = -a;
     `BNOT : s = ~a;
     `NOT : s = !a;
	  `A   : s = a;
	  `B   : s = b;
	  `Aa  : s = a;
	  `Ba  : s = b;
     default : s = 18'hxxxx;
   endcase

	signed_mult m_10_8(mout, a, b) ;
endmodule

////////////////////////////////////
module statef(clk,reset,run,halt,cs);
   
  input clk, reset, run, halt;
  output [1:0] cs;
  reg [1:0] cs;

  always @(posedge clk or negedge reset)
    if(!reset) cs <= `IDLEA;
    else
      case(cs)
        `IDLEA: if(run) cs <= `IDLEB;
        `IDLEB: cs <= `EXEC;
        `EXEC: if(halt) cs <= `IDLEA;
                else cs <= `EXEC;
		  //`EXEC:  cs <= `EXEC;
        default: cs <= 2'bxx;
      endcase

endmodule


//////////////////////////////////////

module stackm(clk, reset, load, push, pop, pop2, thru, d, dthru, qtop, qnext);
parameter AWIDTH = 3, N = 8;

  input clk, reset, load, push, pop, pop2, thru;
  input [17:0] d, dthru;
  output [17:0] qtop, qnext;
  reg [AWIDTH-1:0] ptop, ptopf, addra, addrb;
  reg [17:0] mem [N-1:0];
  reg [17:0] qtopf;
  wire [17:0] pnextf;
  wire thruwrite;

  always @(push or pop or pop2 or ptop)
  if(push) ptopf = ptop - 1;
  else if(pop) ptopf = ptop + 1;
  else if(pop2) ptopf = ptop + 2;
  else ptopf = ptop;

  always @(posedge clk or negedge reset) 
  if(!reset) ptop <= 0;
  else ptop <= ptopf;

  assign  pnextf = ptopf + 1;
  assign thruwrite = !(push||pop) && thru;

  always @(load or thruwrite or d or dthru)
  if(load) qtopf = d;
  else if(thruwrite) qtopf = dthru;
  else qtopf = 18'hxxxx;

  always @(posedge clk)
  begin
    if(load || thruwrite) mem[ptopf] <= qtopf;
    addra <= ptopf;
  end

  always @(posedge clk)
  begin
    if(push && thru) mem[pnextf] <= dthru;
    addrb <= pnextf;
  end

  assign qtop = (thru ? dthru : mem[addra]);
  assign qnext = mem[addrb];

endmodule


//////////////////////////////////////////////////


// module dpram(clk, load1, addr1, addr2, d1, q1, q2);
module dpram(clk, load1, addr1, addr2, d1, q1, q2);
 parameter DWIDTH=18,AWIDTH=12,WORDS=4096;

 input clk,load1 ; //,load2;
 input [AWIDTH-1:0] addr1,addr2;
 input [DWIDTH-1:0] d1 ; //,d2;
 output [DWIDTH-1:0] q1,q2;
 reg [DWIDTH-1:0] q1,q2;
 reg [DWIDTH-1:0] mem [WORDS-1:0] /* synthesis ram_init_file = "stack_machine_vga_sram_dla_nodraw3.mif" */ ;

 always @(posedge clk)
   begin
     if(load1) mem[addr1] <= d1;
     q1 <= mem[addr1];
  end

 always @(posedge clk)
   begin
//     if(load2) mem[addr2] <= d2;
     q2 <= mem[addr2];
  end

//  initial begin
//		mem[12'h000]=16'hd000;
//		mem[12'h001]=16'he000;
//		mem[12'h002]=16'h4000;
//  end

endmodule
//////////////////////////////////////

module minicpu(clk, reset, run, in0, in1, in2, in3, out0, out1, out2, out3);

 input clk,reset,run;
 input [17:0] in0, in1, in2, in3 ;
 output [17:0] out0, out1, out2, out3;
 
 wire [1:0] cs;
 wire [17:0] irout, qtop, dbus ;
 wire [17:0] qnext, ramout, aluout;
 reg [11:0] abus;
 reg halt, jump, pcinc, push, pop, thru, qthru, dbus2qtop;
 reg dbus2ram, dbus2obuf, ir2dbus, qtop2dbus, alu2dbus, ram2dbus, in2dbus;
 reg pop2, ir2abus, qtop2abus, qnext2abus;
 reg poppc, pushpc ; // added by BRL4 to support POPPC/PUSHPC opcode
 reg [11:0] pcout, pcnext;
 reg [17:0] out[7:0] ;
 wire [17:0] in[7:0] ;

 statef statef0(.clk(clk),.reset(reset),.run(run),.halt(halt),.cs(cs));
 stackm stackm0(.clk(clk),.reset(reset),.load(dbus2qtop),.push(push),
	.pop(pop),.pop2(pop2),.thru(qthru),.d(dbus),.dthru(ramout),.qtop(qtop),.qnext(qnext));
 alu alu0(.a(qtop),.b(qnext),.f(irout[4:0]),.s(aluout));
 dpram #(18,12,4096) dpram0(.clk(clk),.load1(dbus2ram),.addr1(abus),.addr2(pcnext),.d1(dbus),.q1(ramout),.q2(irout));

 always @ (pcinc or jump or cs or pcout or irout or poppc or qtop)
   if(cs == `IDLEB) pcnext = pcout;
   else if(pcinc)  pcnext = pcout + 1;
   else if(jump)  pcnext = irout[11:0];
	else if(poppc) pcnext = qtop[11:0]; // added to support POPPC opcode
   else pcnext = 12'hxxx;

 always @ (posedge clk or negedge reset)
   if(!reset) pcout <= 0;
   else if(pcinc || jump || poppc) pcout <= pcnext; // mod to support poppc

 // update the output ports
 always @ (posedge clk)
   if(dbus2obuf) out[irout[2:0]] <= dbus ;
	
 // only 4 of the 8 ports are external
 assign out0 = out[0];
 assign out1 = out[1];
 assign out2 = out[2];
 assign out3 = out[3];
 
 // only 4 of the 8 ports are external
 assign in[0] = in0;
 assign in[1] = in1;
 assign in[2] = in2;
 assign in[3] = in3;

 always @ (posedge clk or negedge reset)
   if(!reset) qthru <= 0;
   else qthru <= thru;

 always @ (ir2abus or qtop2abus or qnext2abus or irout or qtop or qnext)
 if(ir2abus) abus = irout[11:0];
 else if(qtop2abus) abus = qtop[11:0];
 else if(qnext2abus) abus = qnext[11:0];
 else abus = 12'hxxx;

 assign dbus = ir2dbus ? {{6{irout[11]}},irout[11:0]} : 18'hzzzz;
 assign dbus = qtop2dbus ? qtop : 18'hzzzz;
 assign dbus = alu2dbus ? aluout : 18'hzzzz;
 assign dbus = ram2dbus ? ramout : 18'hzzzz;
 assign dbus = in2dbus ? in[irout[2:0]] : 18'hzzzz;
 assign dbus = pushpc ? pcnext : 18'hzzzz; // added by BRL4 to support PUSHPC opcode

 always @(cs or irout or qtop)
   begin
     halt = 0; pcinc = 0; jump = 0; push = 0; pop = 0; pop2 = 0; 
	  thru = 0; dbus2qtop = 0; dbus2ram = 0; dbus2obuf = 0; ir2dbus = 0; 
	  qtop2dbus = 0; alu2dbus = 0; ram2dbus = 0; in2dbus = 0; ir2abus = 0; 
	  qtop2abus = 0; qnext2abus = 0; 
	  poppc = 0; pushpc = 0; // added to support poppc and pushpc
	  
  if(cs == `EXEC)
    case(irout[15:12])
      `PUSHI:
         begin
           ir2dbus = 1; dbus2qtop = 1; push = 1; pcinc = 1;
         end	 
      `PUSH: 
         begin
           ir2abus = 1; push = 1; thru = 1; pcinc = 1;
         end
      `POP:
         begin
           ir2abus = 1; qtop2dbus = 1; dbus2ram = 1; pop = 1; pcinc = 1;
         end
      `JMP: jump = 1;
      `JZ:
           begin
             if(qtop == 0) jump = 1;
             else pcinc = 1;
             pop = 1;
           end
      `JNZ: 
          begin
            if(qtop != 0) jump = 1;
             else pcinc = 1;
             pop = 1;
          end
      `LD:
         begin
           qtop2abus = 1; thru = 1; pcinc = 1;
         end
      `ST:
         begin
           qnext2abus = 1; qtop2dbus = 1; dbus2ram = 1; pop2 = 1; pcinc = 1;
         end
		// added by BRL4 //////////////////////////////// 
		  `PPPC:
		  if(irout[0] == 0) //pushpc
			begin
				pushpc = 1; dbus2qtop = 1; push = 1; pcinc = 1;
			end
			
			else //poppc
			begin
				poppc = 1;  pop = 1;
			end
		// end addition ////////////////////////////////
     `IN:
         begin
          in2dbus = 1; dbus2qtop = 1; push = 1; pcinc = 1;
         end
      `OUT:
         begin
           qtop2dbus = 1; dbus2obuf = 1; pop = 1; pcinc = 1;
         end
      `OP:
           begin
             alu2dbus = 1; dbus2qtop = 1; pcinc = 1;
             if(irout[4] == 0) pop = 1; //binary operations
				 // do nothing for bnot, neg, not
				 if(irout[4:0]==5'b10011) push = 1;  // dup
				 if(irout[4:0]==5'b10111) pop = 1; // drop
				 if(irout[4:0]==5'b11111) push = 1; // over
				 if(irout[4:0]==5'b11011) pop = 1;  // dropnext
           end
			  
       default:
         begin
           pcinc = 1 ; // halt=1; change opcode zero to NOP
         end
      endcase
  end

endmodule

//////////////////////////////////////////
//// end file //////////////////////////////////////
