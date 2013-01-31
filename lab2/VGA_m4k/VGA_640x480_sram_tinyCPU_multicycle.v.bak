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

////////////////////////////////////
//DLA state machine variables
wire reset;
reg [3:0] state;	//state machine
reg [30:0] x_rand;	//shift registers for random number gen  
reg [28:0] y_rand;
wire seed_low_bit, x_low_bit, y_low_bit; //rand low bits for SR
reg [9:0] x_walker; //particle coords of random walker
reg [8:0] y_walker;
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
wire we ; // write enable for a
wire [18:0] addr_reg ; // for a
wire data_reg ; // for a

vga_buffer display(
	.address_a (addr_reg) , 
	.address_b ({Coord_X[9:0],Coord_Y[8:0]}), // vga current address
	.clock_a (FAST_CLK),
	.clock_b (FAST_CLK), //VGA_CTRL_CLK, FAST_CLK
	.data_a (data_reg),
	.data_b (1'b0), // never write on port b
	.wren_a (we),
	.wren_b (1'b0), // never write on port b
	.q_a (state_bit), // memory data, if needed for state machine
	.q_b (mem_bit) ); // data used to update VGA

// make the color white
assign  mVGA_R = (Coord_X<480)? {10{disp_bit}} : 0 ;
assign  mVGA_G = (Coord_X<480)? {10{disp_bit}} : 0 ;
assign  mVGA_B = (Coord_X<480)? {10{disp_bit}} : 0 ;
always @ (posedge VGA_CTRL_CLK) //VGA_CTRL_CLK
begin
	// register the m4k output for better timing on VGA
	disp_bit <= mem_bit;
end

// reset
assign reset = KEY[0];

wire [17:0] out1, out2 ;
assign we = out2[0]  ;
assign data_reg = out1[0] ;
assign addr_reg[18]=0 ;

// define the CPU
tinycpu cpu1(.clk(FAST_CLK), .reset(reset),  
	.in0(SW[17:0]),
	.in1(KEY[3:0]),
	.out0(addr_reg[17:0]),
	.out1(out1),
	.out2(out2),
	//.out2(LEDG),
   .out3(GPIO_0)	);


endmodule //top module

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
////////////////////////////////////////////////////////////

`define IDLE 3'b000
`define FETCHA 3'b001 
`define FETCHB 3'b010 
`define EXECA  3'b011 
`define EXECB  3'b100 

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

`define HALT  4'b0000  
`define PUSHI 4'b0001  
`define PUSH  4'b0010  
`define POP   4'b0011  
`define JMP   4'b0100  
`define JZ    4'b0101  
`define JNZ   4'b0110  
`define LD    4'b0111
`define ST    4'b1000
//`define PUSHPC 4'b1001
//`define POPPC 4'b1001
`define PPPC  4'b1001
`define IN    4'b1101  
`define OUT   4'b1110  
`define OP    4'b1111  
//////////////////////////////////////////////////////////////

module alu(a, b, f, s);

 input [17:0] a, b;
 input [4:0] 	f;
 output [17:0] s;
 reg  [17:0] 	 s;
 wire [17:0] x, y;

 assign x = a + 18'h20000;
 assign y = b + 18'h20000;
  
 always @(a or b or x or y or f)
   case(f)
     `ADD : s = b + a;
     `SUB : s = b - a;
     `MUL : s = b * a;
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
     default : s = 18'hxxxxx;
   endcase

endmodule
//////////////////////////////////////////////////////////////////
 module counter(clk,reset,load,inc,d,q);
  parameter N = 18;
   
  input clk,reset,load,inc;
  input [N-1:0] d;
  output [N-1:0] q;
  reg [N-1:0] 	 q;

  always @(posedge clk)//(posedge clk or negedge reset)
    if(!reset) q <= 0;
    else if(load) q <= d;
    else if(inc) q <= q + 18'd1;

endmodule
///////////////////////////////////////////////////////////////////////
 module state(clk,reset,run,cont,halt,cs);
  
  input clk, reset, run, cont, halt;
  output [2:0] cs;
  reg [2:0]cs;

  always @(posedge clk)//(posedge clk or negedge reset)
    if(!reset) cs <= `IDLE;
    else
      case(cs)
        `IDLE:   cs <= `FETCHA;
        `FETCHA: cs <= `FETCHB;
        `FETCHB: cs <= `EXECA;
        `EXECA: if(cont) cs <= `EXECB; //cont
                else cs <= `FETCHA;
        `EXECB: cs <= `FETCHA;
        default: cs <= 3'bxxx;
      endcase

endmodule
/////////////////////////////////////////////////////////////////////
module stack(clk, reset, load, push, pop, d, qtop, qnext);
  parameter N = 8;
	 
  input clk, reset, load, push, pop;
  input [17:0] d;
  output [17:0] qtop, qnext;
  reg [17:0] q [0:N-1];

  assign qtop = q[0];
  assign qnext = q[1];
   
  always @(posedge clk)//(posedge clk or negedge reset)
    if(!reset) q[0] <= 0;
    else if(load) q[0] <= d;
    else if(pop) q[0] <= q[1];

  integer i;
  always @(posedge clk)//(posedge clk or negedge reset)
    for(i=1;i< N-1;i=i+1)
      if(!reset) q[i] <= 0;
      else if(push) q[i] <= q[i-1];
      else if(pop) q[i] <= q[i+1];
   
  always @(posedge clk)//(posedge clk or negedge reset)
    if(!reset) q[N-1] <= 0;
    else if(push) q[N-1] <= q[N-2];

endmodule
/////////////////////////////////////////////////////////////////////
module ram(clk, load, addr, d, q) ;
 parameter DWIDTH=18,AWIDTH=12,WORDS=4096;

 input clk,load;
 input [AWIDTH-1:0] addr;
 input [DWIDTH-1:0] d;
 output [DWIDTH-1:0] q;
 reg [DWIDTH-1:0] q;
 // IF YOUR PROGRAM IS IN a mif file use:
 // reg [DWIDTH-1:0] mem [WORDS-1:0] /* synthesis ram_init_file = "TestPgm0.mif" */ ;
 // see http://www.altera.com/literature/hb/qts/qts_qii51008.pdf EXAMPLE 9-78
 
 reg [DWIDTH-1:0] mem [WORDS-1:0]  /* synthesis ram_init_file = "stack_machine_vga_comp1.mif" */ ;
 
 always @(posedge clk)
   begin
     if(load) mem[addr] <= d;
     q <= mem[addr];
   end

endmodule

/////////////////////////////////////////////////////////////////////
//module annotate;
//	defparam DE2_TOP.cpu1.ram0.lpm_hint = "ENABLE_RUNTIME_MOD = YES, INSTANCE_NAME = bozo";
//endmodule

module tinycpu(clk, reset, in0, in1, in2, in3, out0, out1, out2, out3);

  input clk,reset;
  input [17:0] in0, in1, in2, in3 ;
  output [17:0] out0, out1, out2, out3;
  ////////////////////////
  // for testing
  //output [11:0] pcout ; 
  //output [17:0] qtop ;
  ////////////////////////
  
  wire [2:0] cs;
  wire [17:0] irout, qtop ;
  reg [17:0]  dbus ;
  wire [17:0] qnext, ramout, aluout;
  reg [11:0] abus;
  reg [11:0] pcin; // added by BRL4 to suppport pop pc instruction
  reg [17:0] out[7:0] ;
  wire [17:0] in[7:0] ;
  wire [11:0] pcout ;
 
  reg halt, cont, pcinc, push, pop, abus2pc, dbus2ir, dbus2qtop, dbus2ram,
      dbus2obuf, pc2abus, ir2abus, ir2dbus, qtop2dbus, alu2dbus, ram2dbus,
      in2dbus;
  
  // added BRL4
  // to support new instructions
  reg pc2dbus ; // needed for push pc
  reg dbus2pc ; // needed for pop pc
  reg qnext2abus ; // needed for ST store opcode
  reg qtop2abus ; // needed for LD load opcode
  
  counter #(12) pc0(.clk(clk), .reset(reset), .load(abus2pc | dbus2pc), .inc(pcinc),
                    .d(pcin), .q(pcout)); // modified for pcin bus
  counter #(18) ir0(.clk(clk), .reset(reset), .load(dbus2ir), .inc(0),
                   .d(dbus), .q(irout));
  state state0(.clk(clk), .reset(reset), .run(1), .cont(cont),
               .halt(halt), .cs(cs));
  stack stack0(.clk(clk), .reset(reset), .load(dbus2qtop), .push(push),
               .pop(pop), .d(dbus), .qtop(qtop), .qnext(qnext));
  alu alu0(.a(qtop), .b(qnext), .f(irout[4:0]), .s(aluout));
  ram ram0(.clk(clk), .load(dbus2ram), .addr(abus[11:0]), .d(dbus), .q(ramout));
 
  
  always @(*)
    if(pc2abus) abus <= pcout;
    else if(ir2abus) abus <= irout[11:0];
	 else if(qnext2abus) abus <= qnext[11:0] ; // added by BRL4 to support ST
	 else if(qtop2abus) abus <= qtop[11:0] ; // added by BRL4 to support LD
    else abus <= 12'h000; // modified from 12'hxxx
  
  // added by BRL4 to support pop pc instruction
  always @(*)
  begin
		if (dbus2pc) pcin = dbus[11:0];
		else pcin = abus ;
  end
  // end addition /////////////////////////////
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
 
 ///////////////////////////////////////////////
 
  always @(*)
  begin
		if (ir2dbus) dbus = {{4{irout[11]}},irout[11:0]};
		else if (qtop2dbus) dbus = qtop ;
		else if (alu2dbus) dbus = aluout ;
		else if (ram2dbus) dbus = ramout ;
		else if (in2dbus) dbus = in[irout[2:0]] ;
		else if (pc2dbus) dbus = pcout ; // added by BRL4 to support push pc
		else dbus = 18'hxxxx ;
  end
  
  
  always @(cs or irout or qtop)
    begin
      halt = 0; pcinc = 0; push = 0; pop = 0; cont = 0; abus2pc = 0;
      dbus2ir = 0; dbus2qtop = 0; dbus2ram = 0; dbus2obuf = 0; pc2abus = 0;
      ir2abus = 0; ir2dbus = 0; qtop2dbus = 0; alu2dbus = 0; ram2dbus = 0;
      in2dbus = 0;
		// added by BRL4
		pc2dbus = 0 ; // to suppport PUSH PC instruction
		dbus2pc = 0 ; // to support POP PC
		qnext2abus = 0 ; // needed for ST store opcode
		qtop2abus = 0 ; // needed for LD load opcode
		
		
      if(cs == `FETCHA) 
        begin
         pcinc = 1; pc2abus = 1;
        end
		 
		 
      else if(cs == `FETCHB)
		
        begin
          ram2dbus = 1; dbus2ir = 1; pc2abus = 1; 
        end
		  
      else if(cs == `EXECA)
		begin
        case(irout[15:12])
        `PUSHI:
           begin
             ir2dbus = 1; dbus2qtop = 1; push = 1;
           end	 
        `PUSH:
           begin
             ir2abus = 1; cont = 1;  // read and push=1 is in EXECB
           end
        `POP:
           begin
             ir2abus = 1; qtop2dbus = 1; dbus2ram = 1; pop = 1;
           end
			  
        `JMP:
           begin
             ir2abus = 1; abus2pc = 1;
           end
			  
        `JZ:
           begin
             if(qtop == 18'b0) 
               begin
                 ir2abus = 1; abus2pc = 1;
               end
             pop = 1;
           end
        `JNZ:
           begin
             if ((qtop != 18'b0)) 
               begin
                 ir2abus = 1; abus2pc = 1;
               end
             pop = 1;
           end
			// added by BRL4 //////////////////////////////// 
			
			`PPPC:
		   if(irout[0] == 0) //pushpc
			begin
				pc2dbus = 1; dbus2qtop = 1; push = 1;
			end
			else //poppc
			begin
				qtop2dbus = 1; dbus2pc = 1; pop = 1;
			end
			
			`LD:
			begin
			   qtop2abus = 1; cont = 1;  //read is in EXECB
			end
			
			`ST:
			begin
				qnext2abus = 1; qtop2dbus = 1; dbus2ram = 1; pop = 1 ; cont = 1; // second pop is in EXECB
			end
			// end addition /////////////////////////////////
			
        `IN:
           begin
             in2dbus = 1; dbus2qtop = 1; push = 1;
           end
        `OUT:
           begin
             qtop2dbus = 1; dbus2obuf = 1; pop = 1;
           end
        `OP:
           begin
             alu2dbus = 1; dbus2qtop = 1;
             if(irout[4] == 0) pop = 1;
				 if(irout[4:0]==5'b10011) push = 1;  // dup
				 if(irout[4:0]==5'b10111) pop = 1; // drop
				 if(irout[4:0]==5'b11111) push = 1; // over
				 if(irout[4:0]==5'b11011) pop = 1;  // dropnext
           end
        default:
           halt = 0; // never halt
        endcase
		  
		 
		end //EXECA
		
      else if(cs == `EXECB)
		
        if(irout[15:12]==`PUSH)
        begin
           ram2dbus = 1; dbus2qtop = 1; push = 1;
        end
		  
		  else if(irout[15:12]==`ST) //added for second pop
        begin
		     pop = 1;
        end
		  
		  else if(irout[15:12]==`LD) // added for LD read operation
        begin
           ram2dbus = 1; dbus2qtop = 1; 
        end
		  
		  else
		  begin
			 ram2dbus = 0; dbus2qtop = 0; push = 0; pop = 0;
		  end
		  
    end

endmodule
//// end file //////////////////////////////////////
