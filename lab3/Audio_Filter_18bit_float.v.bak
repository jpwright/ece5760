// --------------------------------------------------------------------
// --------------------------------------------------------------------
//
// Major Functions: Audio Filters 18-bit floating point
// 2, 4 and 6 pole IIR filters implemented as 
// second-order-sections to minimize sensitivity to short mantissa
// --------------------------------------------------------------------
//
// Revision History :
// --------------------------------------------------------------------
// Bruce R Land, Cornell University, Nov 2007
// Improved top module written by Adam Shapiro
// Bruce Land Oct 2009 
// -- syntax cleanup and module name improvement
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
   assign LEDR = 18'h0;
   assign LEDG = 9'h0;
   
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
   //assign VGA_CLK   = 1'b0;
   assign VGA_BLANK = 1'b0;
   assign VGA_SYNC  = 1'b0;
   assign VGA_HS    = 1'b0;
   assign VGA_VS    = 1'b0;
   assign VGA_R     = 10'h0;
   assign VGA_G     = 10'h0;
   assign VGA_B     = 10'h0;

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
							.oAUD_inL(audio_inL), // audio data from ADC 
							.oAUD_inR(audio_inR), // audio data from ADC 
							.iAUD_ADCDAT(AUD_ADCDAT),
							.iAUD_extL(audio_outL), // audio data to DAC
							.iAUD_extR(audio_outR), // audio data to DAC
							//	Control Signals
				           		 .iCLK_18_4(AUD_CTRL_CLK),
							.iRST_N(DLY_RST)
							);

/// reset ///////////////////////////////////////////////////////						
//state machine start up	
wire reset; 
// reset control
assign reset = ~KEY[0];

/// audio stuff /////////////////////////////////////////////////
// output to audio DAC
wire signed [15:0] audio_outL, audio_outR ;
// input from audio ADC
wire signed [15:0] audio_inL, audio_inR ;
// filter outputs
wire signed [15:0] filter2_out, filter4_out, filter6_out ;

//reg signed [15:0] filter_out_buffer2 ;

// make some output
// original signal in R channel
// filtered signal in L channel
assign audio_outR = audio_inR ; 
assign audio_outL = filter6_out ;


//Filter: cutoff=0.100000
//Filter: cutoff=0.200000
IIR2sos_18bit_fp filter2(
     .audio_out (filter2_out),
     .audio_in (audio_inR),
     .b11 (18'h10300),
     .b12 (18'h0),
     .b13 (18'h30300),
     .a12 (18'h1038E),
     .a13 (18'h30173),
     .gain(18'hFD18),
     .state_clk(AUD_CTRL_CLK),
     .lr_clk(AUD_DACLRCK),
     .reset(reset)
) ; //end filter

//Filter: cutoff=0.100000
//Filter: cutoff=0.200000
IIR4sos_18bit_fp filter4(
     .audio_out (filter4_out),
     .audio_in (audio_inR),
     .b11 (18'h10300),
     .b12 (18'h10500),
     .b13 (18'h10300),
     .a12 (18'h1037A),
     .a13 (18'h30185),
     .b21 (18'h10300),
     .b22 (18'h30500),
     .b23 (18'h10300),
     .a22 (18'h103BC),
     .a23 (18'h301B0),
     .gain(18'hF749),
     .state_clk(AUD_CTRL_CLK),
     .lr_clk(AUD_DACLRCK),
     .reset(reset)
) ; //end filter

//Filter: cutoff=0.100000
//Filter: cutoff=0.200000
IIR6sos_18bit_fp filter6(
     .audio_out (filter6_out),
     .audio_in (audio_inR),
     .b11 (18'h10300),
     .b12 (18'h2E112),
     .b13 (18'h301FF),
     .a12 (18'h1038E),
     .a13 (18'h30173),
     .b21 (18'h10300),
     .b22 (18'h10500),
     .b23 (18'h10300),
     .a22 (18'h1037F),
     .a23 (18'h301A3),
     .b31 (18'h10300),
     .b32 (18'h303FF),
     .b33 (18'h101FF),
     .a32 (18'h103CB),
     .a33 (18'h301C9),
     .gain(18'hF17B),
     .state_clk(AUD_CTRL_CLK),
     .lr_clk(AUD_DACLRCK),
     .reset(reset)
) ; //end filter

endmodule

///////////////////////////////////////////////////////////////////
/// Second order IIR filter ///////////////////////////////////////
///////////////////////////////////////////////////////////////////
module IIR2sos_18bit_fp (audio_out, audio_in,  
			b11, b12, b13, 
			a12, a13,  
			gain, 
			state_clk, lr_clk, reset) ;
// The filter is a "Direct Form II Transposed"
// but is factored into two second order filters and a gain
// 
//    a(1)*y(n) = b(1)*x(n) + b(2)*x(n-1) + ... + b(nb+1)*x(n-nb)
//                          - a(2)*y(n-1) - ... - a(na+1)*y(n-na)
// 
//    If a(1) is not equal to 1, FILTER normalizes the filter
//    coefficients by a(1). 
//
// one audio sample, 16 bit, 2's complement
output wire signed [15:0] audio_out ;
// one audio sample, 16 bit, 2's complement
input wire signed [15:0] audio_in ;

// filter coefficients
input wire [17:0] b11, b12, b13, a12, a13, gain ;
input wire state_clk, lr_clk, reset ;

/// filter vars //////////////////////////////////////////////////
wire [17:0] f_mac_new, f_coeff_x_value ;
reg [17:0] f_coeff, f_mac_old, f_value ;

// input to filters
reg [17:0] x1_n ;
// input history x(n-1), x(n-2)
reg [17:0] x1_n1, x1_n2 ; 

// output history: y_n is the new filter output, BUT it is
// immediately stored in f1_y_n1 for the next loop through 
// the filter state machine
reg [17:0] f1_y_n1, f1_y_n2 ; 

// i/o conversion
// int output of FP calc
wire [9:0] audio_out_int ;
reg [17:0] audio_out_FP ;
wire [17:0] audio_in_FP ;
int2fp f_input(audio_in_FP, audio_in[15:6], 0) ;
fp2int f_output(audio_out_int, audio_out_FP, 0) ;
assign audio_out = {audio_out_int, 6'h0} ;

// MAC operation
fpmult f_c_x_v (f_coeff_x_value, f_coeff, f_value);
fpadd f_mac_add (f_mac_new, f_mac_old, f_coeff_x_value) ;

// state variable 
reg [3:0] state ;
//oneshot gen to sync to audio clock
reg last_clk ; 
///////////////////////////////////////////////////////////////////

//Run the filter state machine FAST so that it completes in one 
//audio cycle
always @ (posedge state_clk) 
begin
	if (reset)
	begin
		state <= 4'd15 ; //turn off the state machine	
	end
	
	else begin
		case (state)
	
			1: 
			begin
				// set up b11*x(n)
				f_mac_old <= 18'd0 ;
				f_coeff <= b11 ;
				f_value <= audio_in_FP ;				
				//register input
				x1_n <= audio_in_FP ;				
				// next state
				state <= 4'd2;
			end
	
			2: 
			begin
				// set up b12*x(n-1) 
				f_mac_old <= f_mac_new ;
				f_coeff <= b12 ;
				f_value <= x1_n1 ;				
				// next state
				state <= 4'd3;
			end
			
			3:
			begin
				// set up b13*x(n-2) 
				f_mac_old <= f_mac_new ;
				f_coeff <= b13 ;
				f_value <= x1_n2 ;
				// next state
				state <= 4'd4;
			end
			
			4:
			begin
				// set up a12*y(n-1) 
				f_mac_old <= f_mac_new ;
				f_coeff <= a12 ;
				f_value <= f1_y_n1 ;
				// next state
				state <= 4'd5;
			end
			
			5:
			begin
				// set up a13*y(n-2) 
				f_mac_old <= f_mac_new ;
				f_coeff <= a13 ;
				f_value <= f1_y_n2 ;
				// next state
				state <= 4'd6;
			end
			
			6: 
			begin
				// get the output of the first SOS
				// and put it in the LAST output var
				// for the next pass thru the state machine
				f1_y_n1 <= f_mac_new ; 
				// apply the final gain mult
				f_value <= f_mac_new ;
				f_coeff <= gain ;				
				// update output history
				f1_y_n2 <= f1_y_n1 ;			
				// update input history
				x1_n1 <= x1_n ;
				x1_n2 <= x1_n1 ;
				//next state 
				state <= 4'd8;
			end
			
			8:
			begin
				audio_out_FP <= f_coeff_x_value ;
				//next state 
				state <= 4'd15;
			end
			
			15:
			begin
				// wait for the audio clock and one-shot it
				if (lr_clk && last_clk==1)
				begin
					state <= 4'd1 ;
					last_clk <= 1'h0 ;
				end
				// reset the one-shot memory
				else if (~lr_clk && last_clk==0)
				begin
					last_clk <= 1'h1 ;				
				end	
			end
			
			default:
			begin
				// default state is end state
				state <= 4'd15 ;
			end
		endcase
	end
end	

endmodule


///////////////////////////////////////////////////////////////////
/// Fourth order IIR filter -- written as two SOS /////////////////
///////////////////////////////////////////////////////////////////
module IIR4sos_18bit_fp (audio_out, audio_in,  
			b11, b12, b13, 
			a12, a13, 
			b21, b22, b23, 
			a22, a23, 
			gain, 
			state_clk, lr_clk, reset) ;
// The filter is a "Direct Form II Transposed"
// but is factored into two second order filters and a gain
// 
//    a(1)*y(n) = b(1)*x(n) + b(2)*x(n-1) + ... + b(nb+1)*x(n-nb)
//                          - a(2)*y(n-1) - ... - a(na+1)*y(n-na)
// 
//    If a(1) is not equal to 1, FILTER normalizes the filter
//    coefficients by a(1). 
//
// one audio sample, 16 bit, 2's complement
output wire signed [15:0] audio_out ;
// one audio sample, 16 bit, 2's complement
input wire signed [15:0] audio_in ;

// filter coefficients
input wire [17:0] b11, b12, b13, a12, a13, b21, b22, b23, a22, a23, gain ;
input wire state_clk, lr_clk, reset ;

/// filter vars //////////////////////////////////////////////////
wire [17:0] f_mac_new, f_coeff_x_value ;
reg [17:0] f_coeff, f_mac_old, f_value ;

// input to filters
reg [17:0] x1_n, x2_n ;
// input history x(n-1), x(n-2)
reg [17:0] x1_n1, x1_n2, x2_n1, x2_n2 ; 

// output history: y_n is the new filter output, BUT it is
// immediately stored in f1_y_n1 for the next loop through 
// the filter state machine
reg [17:0] f1_y_n1, f1_y_n2, f2_y_n1, f2_y_n2 ; 

// i/o conversion
// int output of FP calc
wire [9:0] audio_out_int ;
reg [17:0] audio_out_FP ;
wire [17:0] audio_in_FP ;
int2fp f_input(audio_in_FP, audio_in[15:6], 0) ;
fp2int f_output(audio_out_int, audio_out_FP, 0) ;
assign audio_out = {audio_out_int, 6'h0} ;

// MAC operation
fpmult f_c_x_v (f_coeff_x_value, f_coeff, f_value);
fpadd f_mac_add (f_mac_new, f_mac_old, f_coeff_x_value) ;

// state variable 
reg [3:0] state ;
//oneshot gen to sync to audio clock
reg last_clk ; 
///////////////////////////////////////////////////////////////////

//Run the filter state machine FAST so that it completes in one 
//audio cycle
always @ (posedge state_clk) 
begin
	if (reset)
	begin
		state <= 4'd15 ; //turn off the state machine	
	end
	
	else begin
		case (state)
	
			1: 
			begin
				// set up b11*x(n)
				f_mac_old <= 18'd0 ;
				f_coeff <= b11 ;
				f_value <= audio_in_FP ;				
				//register input
				x1_n <= audio_in_FP ;				
				// next state
				state <= 4'd2;
			end
	
			2: 
			begin
				// set up b12*x(n-1) 
				f_mac_old <= f_mac_new ;
				f_coeff <= b12 ;
				f_value <= x1_n1 ;				
				// next state
				state <= 4'd3;
			end
			
			3:
			begin
				// set up b13*x(n-2) 
				f_mac_old <= f_mac_new ;
				f_coeff <= b13 ;
				f_value <= x1_n2 ;
				// next state
				state <= 4'd4;
			end
			
			4:
			begin
				// set up a12*y(n-1) 
				f_mac_old <= f_mac_new ;
				f_coeff <= a12 ;
				f_value <= f1_y_n1 ;
				// next state
				state <= 4'd5;
			end
			
			5:
			begin
				// set up a13*y(n-2) 
				f_mac_old <= f_mac_new ;
				f_coeff <= a13 ;
				f_value <= f1_y_n2 ;
				// next state
				state <= 4'd6;
			end
			
			6: 
			begin
				// get the output of the first SOS
				// and put it in the LAST output var
				// for the next pass thru the state machine
				f1_y_n1 <= f_mac_new ; 
				// link first SOS to second SOS
				x2_n <= f_mac_new ;				
				// update output history
				f1_y_n2 <= f1_y_n1 ;			
				// update input history
				x1_n1 <= x1_n ;
				x1_n2 <= x1_n1 ;
				//next state 
				state <= 4'd8;
			end
			
			8: 
			begin
				// set up b21*x(n)
				f_mac_old <= 18'd0 ;
				f_coeff <= b21 ;
				f_value <= x2_n ;								
				// next state
				state <= 4'd9;
			end
	
			9: 
			begin
				// set up b22*x(n-1) 
				f_mac_old <= f_mac_new ;
				f_coeff <= b22 ;
				f_value <= x2_n1 ;				
				// next state
				state <= 4'd10;
			end
			
			10:
			begin
				// set up b23*x(n-2) 
				f_mac_old <= f_mac_new ;
				f_coeff <= b23 ;
				f_value <= x2_n2 ;
				// next state
				state <= 4'd11;
			end
			
			11:
			begin
				// set up a22*y(n-1) 
				f_mac_old <= f_mac_new ;
				f_coeff <= a22 ;
				f_value <= f2_y_n1 ;
				// next state
				state <= 4'd12;
			end
			
			12:
			begin
				// set up a23*y(n-2) 
				f_mac_old <= f_mac_new ;
				f_coeff <= a23 ;
				f_value <= f2_y_n2 ;
				// next state
				state <= 4'd13;
			end
			
			13: 
			begin
				// get the output 
				// and put it in the LAST output var
				// for the next pass thru the state machine
				f2_y_n1 <= f_mac_new ; 
				// apply the final gain mult
				f_value <= f_mac_new ;
				f_coeff <= gain ;				
				// update output history
				f2_y_n2 <= f2_y_n1 ;			
				// update input history
				x2_n1 <= x2_n ;
				x2_n2 <= x2_n1 ;
				//next state 
				state <= 4'd14;
			end
			
			14:
			begin
				audio_out_FP <= f_coeff_x_value ;
				//next state 
				state <= 4'd15;
			end
			
			15:
			begin
				// wait for the audio clock and one-shot it
				if (lr_clk && last_clk==1)
				begin
					state <= 4'd1 ;
					last_clk <= 1'h0 ;
				end
				// reset the one-shot memory
				else if (~lr_clk && last_clk==0)
				begin
					last_clk <= 1'h1 ;				
				end	
			end
			
			default:
			begin
				// default state is end state
				state <= 4'd15 ;
			end
		endcase
	end
end	

endmodule


///////////////////////////////////////////////////////////////////
/// Sixth order IIR filter -- written as 3 SOS ////////////////////
///////////////////////////////////////////////////////////////////
module IIR6sos_18bit_fp (audio_out, audio_in,  
			b11, b12, b13, 
			a12, a13, 
			b21, b22, b23, 
			a22, a23,
			b31, b32, b33, 
			a32, a33, 
			gain, 
			state_clk, lr_clk, reset) ;
// The filter is a "Direct Form II Transposed"
// but is factored into two second order filters and a gain
// 
//    a(1)*y(n) = b(1)*x(n) + b(2)*x(n-1) + ... + b(nb+1)*x(n-nb)
//                          - a(2)*y(n-1) - ... - a(na+1)*y(n-na)
// 
//    If a(1) is not equal to 1, FILTER normalizes the filter
//    coefficients by a(1). 
//
// one audio sample, 16 bit, 2's complement
output wire signed [15:0] audio_out ;
// one audio sample, 16 bit, 2's complement
input wire signed [15:0] audio_in ;

// filter coefficients
input wire [17:0] b11, b12, b13, a12, a13, 
                  b21, b22, b23, a22, a23, 
                  b31, b32, b33, a32, a33,
                  gain ;
input wire state_clk, lr_clk, reset ;

/// filter vars //////////////////////////////////////////////////
wire [17:0] f_mac_new, f_coeff_x_value ;
reg [17:0] f_coeff, f_mac_old, f_value ;

// input to filters
reg [17:0] x1_n, x2_n, x3_n ;
// input history x(n-1), x(n-2)
reg [17:0] x1_n1, x1_n2, x2_n1, x2_n2, x3_n1, x3_n2 ; 

// output history: y_n is the new filter output, BUT it is
// immediately stored in f1_y_n1 for the next loop through 
// the filter state machine
reg [17:0] f1_y_n1, f1_y_n2, f2_y_n1, f2_y_n2, f3_y_n1, f3_y_n2 ; 

// i/o conversion
// int output of FP calc
wire [9:0] audio_out_int ;
reg [17:0] audio_out_FP ;
wire [17:0] audio_in_FP ;
int2fp f_input(audio_in_FP, audio_in[15:6], 0) ;
fp2int f_output(audio_out_int, audio_out_FP, 0) ;
assign audio_out = {audio_out_int, 6'h0} ;

// MAC operation
fpmult f_c_x_v (f_coeff_x_value, f_coeff, f_value);
fpadd f_mac_add (f_mac_new, f_mac_old, f_coeff_x_value) ;

// state variable 
reg [4:0] state ;
//oneshot gen to sync to audio clock
reg last_clk ; 
///////////////////////////////////////////////////////////////////

//Run the filter state machine FAST so that it completes in one 
//audio cycle
always @ (posedge state_clk) 
begin
	if (reset)
	begin
		state <= 5'd31 ; //turn off the state machine	
	end
	
	else begin
		case (state)
	
			1: 
			begin
				// set up b11*x(n)
				f_mac_old <= 18'd0 ;
				f_coeff <= b11 ;
				f_value <= audio_in_FP ;				
				//register input
				x1_n <= audio_in_FP ;				
				// next state
				state <= 4'd2;
			end
	
			2: 
			begin
				// set up b12*x(n-1) 
				f_mac_old <= f_mac_new ;
				f_coeff <= b12 ;
				f_value <= x1_n1 ;				
				// next state
				state <= 4'd3;
			end
			
			3:
			begin
				// set up b13*x(n-2) 
				f_mac_old <= f_mac_new ;
				f_coeff <= b13 ;
				f_value <= x1_n2 ;
				// next state
				state <= 4'd4;
			end
			
			4:
			begin
				// set up a12*y(n-1) 
				f_mac_old <= f_mac_new ;
				f_coeff <= a12 ;
				f_value <= f1_y_n1 ;
				// next state
				state <= 4'd5;
			end
			
			5:
			begin
				// set up a13*y(n-2) 
				f_mac_old <= f_mac_new ;
				f_coeff <= a13 ;
				f_value <= f1_y_n2 ;
				// next state
				state <= 4'd6;
			end
			
			6: 
			begin
				// get the output of the first SOS
				// and put it in the LAST output var
				// for the next pass thru the state machine
				f1_y_n1 <= f_mac_new ; 
				// link first SOS to second SOS
				x2_n <= f_mac_new ;				
				// update output history
				f1_y_n2 <= f1_y_n1 ;			
				// update input history
				x1_n1 <= x1_n ;
				x1_n2 <= x1_n1 ;
				//next state 
				state <= 4'd8;
			end
			
			8: 
			begin
				// set up b21*x(n)
				f_mac_old <= 18'd0 ;
				f_coeff <= b21 ;
				f_value <= x2_n ;								
				// next state
				state <= 4'd9;
			end
	
			9: 
			begin
				// set up b22*x(n-1) 
				f_mac_old <= f_mac_new ;
				f_coeff <= b22 ;
				f_value <= x2_n1 ;				
				// next state
				state <= 4'd10;
			end
			
			10:
			begin
				// set up b23*x(n-2) 
				f_mac_old <= f_mac_new ;
				f_coeff <= b23 ;
				f_value <= x2_n2 ;
				// next state
				state <= 4'd11;
			end
			
			11:
			begin
				// set up a22*y(n-1) 
				f_mac_old <= f_mac_new ;
				f_coeff <= a22 ;
				f_value <= f2_y_n1 ;
				// next state
				state <= 4'd12;
			end
			
			12:
			begin
				// set up a23*y(n-2) 
				f_mac_old <= f_mac_new ;
				f_coeff <= a23 ;
				f_value <= f2_y_n2 ;
				// next state
				state <= 4'd13;
			end
			
			13: 
			begin
				// get the output 
				// and put it in the LAST output var
				// for the next pass thru the state machine
				f2_y_n1 <= f_mac_new ; 
				// link to next section
				x3_n <= f_mac_new ;				
				// update output history
				f2_y_n2 <= f2_y_n1 ;			
				// update input history
				x2_n1 <= x2_n ;
				x2_n2 <= x2_n1 ;
				//next state 
				state <= 4'd14;
			end
			
			14: 
			begin
				// set up b31*x(n)
				f_mac_old <= 18'd0 ;
				f_coeff <= b31 ;
				f_value <= x3_n ;								
				// next state
				state <= 5'd15;
			end
	
			15: 
			begin
				// set up b32*x(n-1) 
				f_mac_old <= f_mac_new ;
				f_coeff <= b32 ;
				f_value <= x3_n1 ;				
				// next state
				state <= 5'd16;
			end
			
			16:
			begin
				// set up b33*x(n-2) 
				f_mac_old <= f_mac_new ;
				f_coeff <= b33 ;
				f_value <= x3_n2 ;
				// next state
				state <= 5'd17;
			end
			
			17:
			begin
				// set up a32*y(n-1) 
				f_mac_old <= f_mac_new ;
				f_coeff <= a32 ;
				f_value <= f3_y_n1 ;
				// next state
				state <= 5'd18;
			end
			
			18:
			begin
				// set up a33*y(n-2) 
				f_mac_old <= f_mac_new ;
				f_coeff <= a33 ;
				f_value <= f3_y_n2 ;
				// next state
				state <= 5'd19;
			end
			
			19: 
			begin
				// get the output 
				// and put it in the LAST output var
				// for the next pass thru the state machine
				f3_y_n1 <= f_mac_new ; 
				// apply the final gain mult
				f_value <= f_mac_new ;
				f_coeff <= gain ;				
				// update output history
				f3_y_n2 <= f3_y_n1 ;			
				// update input history
				x3_n1 <= x3_n ;
				x3_n2 <= x3_n1 ;
				//next state 
				state <= 5'd20;
			end
			
			20:
			begin
				audio_out_FP <= f_coeff_x_value ;
				//next state 
				state <= 5'd31;
			end
			
			31:
			begin
				// wait for the audio clock and one-shot it
				if (lr_clk && last_clk==1)
				begin
					state <= 5'd1 ;
					last_clk <= 1'h0 ;
				end
				// reset the one-shot memory
				else if (~lr_clk && last_clk==0)
				begin
					last_clk <= 1'h1 ;				
				end	
			end
			
			default:
			begin
				// default state is end state
				state <= 5'd31 ;
			end
		endcase
	end
end	

endmodule

//////////////////////////////////////////////////////////
// floating point multiply 
// -- sign bit -- 8-bit exponent -- 9-bit mantissa
// Similar to fp_mult from altera
// NO denorms, no flags, no NAN, no infinity, no rounding!
//////////////////////////////////////////////////////////
// f1 = {s1, e1, m1), f2 = {s2, e2, m2)
// If either is zero (zero MSB of mantissa) then output is zero
// If e1+e2<129 the result is zero (underflow)
///////////////////////////////////////////////////////////	
module fpmult (fout, f1, f2);

	input [17:0] f1, f2 ;
	output [17:0] fout ;
	
	wire [17:0] fout ;
	reg sout ;
	reg [8:0] mout ;
	reg [8:0] eout ; // 9-bits for overflow
	
	wire s1, s2;
	wire [8:0] m1, m2 ;
	wire [8:0] e1, e2, sum_e1_e2 ; // extend to 9 bits to avoid overflow
	wire [17:0] mult_out ;	// raw multiplier output
	
	// parse f1
	assign s1 = f1[17]; 	// sign
	assign e1 = {1'b0, f1[16:9]};	// exponent
	assign m1 = f1[8:0] ;	// mantissa
	// parse f2
	assign s2 = f2[17];
	assign e2 = {1'b0, f2[16:9]};
	assign m2 = f2[8:0] ;
	
	// first step in mult is to add extended exponents
	assign sum_e1_e2 = e1 + e2 ;
	
	// build output
	// raw integer multiply
	unsigned_mult mm(mult_out, m1, m2);
	 
	// assemble output bits
	assign fout = {sout, eout[7:0], mout} ;
	
	always @(*)
	begin
		// if either is denormed or exponents are too small
		if ((m1[8]==1'd0) || (m2[8]==1'd0) || (sum_e1_e2 < 9'h82)) 
		begin 
			mout = 0;
			eout = 0;
			sout = 0; // output sign
		end
		else // both inputs are nonzero and no exponent underflow
		begin
			sout = s1 ^ s2 ; // output sign
			if (mult_out[17]==1)
			begin // MSB of product==1 implies normalized -- result >=0.5
				eout = sum_e1_e2 - 9'h80;
				mout = mult_out[17:9] ;
			end
			else // MSB of product==0 implies result <0.5, so shift ome left
			begin
				eout = sum_e1_e2 - 9'h81;
				mout = mult_out[16:8] ;
			end	
		end // nonzero mult logic
	end // always @(*)
	
endmodule

///////////////////////////////////////
// low level integer multiply
// From Altera HDL style manual
///////////////////////////////////////
module unsigned_mult (out, a, b);
	output [17:0] out;
	input [8:0] a;
	input [8:0] b;
	assign out = a * b;
endmodule


/////////////////////////////////////////////////////////////////////////////
// floating point Add 
// -- sign bit -- 8-bit exponent -- 9-bit mantissa
// NO denorms, no flags, no NAN, no infinity, no rounding!
/////////////////////////////////////////////////////////////////////////////
// f1 = {s1, e1, m1), f2 = {s2, e2, m2)
// If either input is zero (zero MSB of mantissa) then output is the remaining input.
// If either input is <(other input)/2**9 then output is the remaining input.
// Sign of the output is the sign of the greater magnitude input
// Add the two inputs if their signs are the same. 
// Subtract the two inputs (bigger-smaller) if their signs are different
//////////////////////////////////////////////////////////////////////////////	
module fpadd (fout, f1, f2);

	input [17:0] f1, f2 ;
	output [17:0] fout ;
	
	wire  [17:0] fout ;
	wire sout ;
	reg [8:0] mout ;
	reg [7:0] eout ;
	reg [9:0] shift_small, denorm_mout ; //9th bit is overflow bit
	
	wire s1, s2 ; // input signs
	reg  sb, ss ; // signs of bigger and smaller
	wire [8:0] m1, m2 ; // input mantissas
	reg  [8:0] mb, ms ; // mantissas of bigger and smaller
	wire [7:0] e1, e2 ; // input exp
	wire [7:0] ediff ;  // exponent difference
	reg  [7:0] eb, es ; // exp of bigger and smaller
	reg  [7:0] num_zeros ; // high order zeros in the difference calc
	
	// parse f1
	assign s1 = f1[17]; 	// sign
	assign e1 = f1[16:9];	// exponent
	assign m1 = f1[8:0] ;	// mantissa
	// parse f2
	assign s2 = f2[17];
	assign e2 = f2[16:9];
	assign m2 = f2[8:0] ;
	
	// find biggest magnitude
	always @(*)
	begin
		if (e1>e2) // f1 is bigger
		begin
			sb = s1 ; // the bigger number (absolute value)
			eb = e1 ;
			mb = m1 ;
			ss = s2 ; // the smaller number
			es = e2 ;
			ms = m2 ;
		end
		else if (e2>e1) //f2 is bigger
		begin
			sb = s2 ; // the bigger number (absolute value)
			eb = e2 ;
			mb = m2 ;
			ss = s1 ; // the smaller number
			es = e1 ;
			ms = m1 ;
		end
		else // e1==e2, so need to look at mantissa to determine bigger/smaller
		begin
			if (m1>m2) // f1 is bigger
			begin
				sb = s1 ; // the bigger number (absolute value)
				eb = e1 ;
				mb = m1 ;
				ss = s2 ; // the smaller number
				es = e2 ;
				ms = m2 ;
			end
			else // f2 is bigger or same size
			begin
				sb = s2 ; // the bigger number (absolute value)
				eb = e2 ;
				mb = m2 ;
				ss = s1 ; // the smaller number
				es = e1 ;
				ms = m1 ;
			end
		end
	end //found the bigger number
	
	// sign of output is the sign of the bigger (magnitude) input
	assign sout = sb ;
	// form the output
	assign fout = {sout, eout, mout} ;	
	
	// do the actual add:
	// -- equalize exponents
	// -- add/sub
	// -- normalize
	assign ediff = eb - es ; // the actual difference in exponents
	always @(*)
	begin
		if ((ms[8]==0) && (mb[8]==0))  // both inputs are zero
		begin
			mout = 9'b0 ;
			eout = 8'b0 ; 
		end
		else if ((ms[8]==0) || ediff>8)  // smaller is too small to matter
		begin
			mout = mb ;
			eout = eb ;
		end
		else  // shift/add/normalize
		begin
			// now shift but save the low order bits by extending the registers
			// need a high order bit for 1.0<sum<2.0
			shift_small = {1'b0, ms} >> ediff ;
			// same signs means add -- different means subtract
			if (sb==ss) //do the add
			begin
				denorm_mout = {1'b0, mb} + shift_small ;
				// normalize --
				// when adding result has to be 0.5<sum<2.0
				if (denorm_mout[9]==1) // sum bigger than 1
				begin
					mout = denorm_mout[9:1] ; // take the top bits (shift-right)
					eout = eb + 1 ; // compensate for the shift-right
				end
				else //0.5<sum<1.0
				begin
					mout = denorm_mout[8:0] ; // drop the top bit (no-shift-right)
					eout = eb ; // 
				end
			end // end add logic
			else // otherwise sb!=ss, so subtract
			begin
				denorm_mout = {1'b0, mb} - shift_small ;
				// the denorm_mout is always smaller then the bigger input
				// (and never an overflow, so bit 9 is always zero)
				// and can be as low as zero! Thus up to 8 shifts may be necessary
				// to normalize denorm_mout
				if (denorm_mout[8:0]==9'd0)
				begin
					mout = 9'b0 ;
					eout = 8'b0 ;
				end
				else
				begin
					// detect leading zeros
					casex (denorm_mout[8:0])
						9'b1xxxxxxxx: num_zeros = 8'd0 ;
						9'b01xxxxxxx: num_zeros = 8'd1 ;
						9'b001xxxxxx: num_zeros = 8'd2 ;
						9'b0001xxxxx: num_zeros = 8'd3 ;
						9'b00001xxxx: num_zeros = 8'd4 ;
						9'b000001xxx: num_zeros = 8'd5 ;
						9'b0000001xx: num_zeros = 8'd6 ;
						9'b00000001x: num_zeros = 8'd7 ;
						9'b000000001: num_zeros = 8'd8 ;
						default:       num_zeros = 8'd9 ;
					endcase	
					// shift out leading zeros
					// and adjust exponent
					eout = eb - num_zeros ;
					mout = denorm_mout[8:0] << num_zeros ;
				end
			end // end subtract logic
			// format the output
			//fout = {sout, eout, mout} ;	
		end // end shift/add(sub)/normailize/
	end // always @(*) to compute sum/diff	
endmodule 

/////////////////////////////////////////////////////////////////////////////
// integer to floating point  
// input: 10-bit signed integer and scale factor (-100 to +100) powers of 2
// output: -- sign bit -- 8-bit exponent -- 9-bit mantissa 
// fp_out = {sign, exp, mantissa}
// NO denorms, no flags, no NAN, no infinity, no rounding!
/////////////////////////////////////////////////////////////////////////////
module int2fp(fp_out, int_in, scale_in) ;
	input signed  [9:0] int_in ;
	input signed  [7:0] scale_in ;
	output wire [17:0] fp_out ; 
	
	wire [9:0] abs_int ;
	reg sign ;
	reg [8:0] mout ; // mantissa
	reg [7:0] eout ; // exponent
	reg [7:0] num_zeros ; // count leading zeros in input integer
	
	// get absolute value of int_in
	assign abs_int = (int_in[9])? (~int_in)+10'd1 : int_in ;
	
	// build output
	assign fp_out = {sign, eout, mout} ;
	 
	// detect leading zeros of absolute value
	// detect leading zeros
	// normalize and form exponent including leading zero shift and scaling
	always @(*)
	begin
		if (abs_int[8:0] == 0)
		begin // zero value
			eout = 0 ;
			mout = 0 ;
			sign = 0 ;
			num_zeros = 8'd0 ;
		end 
		else // not zero
		begin
			casex (abs_int[8:0])
				9'b1xxxxxxxx: num_zeros = 8'd0 ;
				9'b01xxxxxxx: num_zeros = 8'd1 ;
				9'b001xxxxxx: num_zeros = 8'd2 ;
				9'b0001xxxxx: num_zeros = 8'd3 ;
				9'b00001xxxx: num_zeros = 8'd4 ;
				9'b000001xxx: num_zeros = 8'd5 ;
				9'b0000001xx: num_zeros = 8'd6 ;
				9'b00000001x: num_zeros = 8'd7 ;
				9'b000000001: num_zeros = 8'd8 ;
				default:       num_zeros = 8'd9 ;
			endcase 
			mout = abs_int[8:0] << num_zeros ; 
			eout = scale_in + (8'h89 - num_zeros) ; // h80 is offset, h09 normalizes
			sign = int_in[9] ;
		end // if int_in!=0
	end // always @
	
endmodule

/////////////////////////////////////////////////////////////////////////////
// floating point to integer 
// output: 10-bit signed integer 
// input: -- sign bit -- 8-bit exponent -- 9-bit mantissa 
// and scale factor (-100 to +100) powers of 2
// fp_out = {sign, exp, mantissa}
// NO denorms, no flags, no NAN, no infinity, no rounding!
/////////////////////////////////////////////////////////////////////////////
module fp2int(int_out, fp_in, scale_in) ;
	output signed  [9:0] int_out ;
	input signed  [7:0] scale_in ;
	input wire [17:0] fp_in ; 
	
	wire [9:0] abs_int ;
	wire sign ;
	wire [8:0] m_in ; // mantissa
	wire [7:0] e_in ; // exponent
	
	//reg [7:0] num_zeros ; // count leading zeros in input integer
	
	assign sign = (m_in[8])? fp_in[17] : 1'h0 ;
	assign m_in = fp_in[8:0] ;
	assign e_in = fp_in[16:9] ;
	//
	assign abs_int = (e_in>8'h80)? (m_in >> (8'h89 - e_in)) : 10'd0 ;
	//assign int_out = (m_in[8])? {sign, (sign? (~abs_int)+9'd1 : abs_int)} : 10'd0 ;
	
	assign int_out = (sign? (~abs_int)+10'd1 : abs_int)  ;
	//assign int_out = {sign, sign? (~abs_int)+9'd1 : abs_int}  ;
endmodule
/////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////
//// Time weighted average amplitude (2'comp) 
///////////////////////////////////////////////////////
// dk_const    e-folding time of average			         
// 3			~8 samples
// 4			15 
// 5			32
// 6			64
// 7			128 -- 2.7 mSec at 48kHz
// 8			256 -- 5.3 mSec (useful for music/voice)
// 9			512 -- 10.5 mSec (useful for music/voice)
// 10			1024 -- 21 mSec (useful for music/voice)
// 11			2048 -- 42 mSec
/////////////////////////////////////////////////////////
module average (out, in, dk_const, clk);

	output reg signed [15:0] out ;
	input wire signed [15:0] in ;
	input wire [3:0] dk_const ;
	input wire clk;
	
	wire signed  [17:0] new_out ;
	//first order lowpass of absolute value of input
	assign new_out = out - (out>>>dk_const) + ((in[15]?-in:in)>>>dk_const) ;
	always @(posedge clk)
	begin
		 out <= new_out ;
	end
endmodule
//////////////////////////////////////////////////

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
/*
*/
