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
   assign HEX0 = 7'h7F;
   assign HEX1 = 7'h7F;
   assign HEX2 = 7'h7F;
   assign HEX3 = 7'h7F;
   assign HEX4 = 7'h7F;
   assign HEX5 = 7'h7F;
   assign HEX6 = 7'h7F;
   assign HEX7 = 7'h7F;
   assign LEDR = 18'h0;
  // assign LEDG = 9'h0;
   
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
wire [19:0]	mVGA_ADDR;			//video memory address
wire [9:0]  Coord_X, Coord_Y;	//display coods

////////////////////////////////////
//DLA state machine variables
wire reset;
reg [3:0] state;	//state machine
reg [30:0] x_rand;	//shift registers for random number gen  
reg [28:0] y_rand;
wire seed_low_bit, x_low_bit, y_low_bit; //rand low bits for SR
reg [8:0] x_walker; //particle coords of random walker
reg [8:0] y_walker;
reg [3:0] sum; //neighbor sum

assign LEDG = sum;
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
reg [17:0] addr_reg ; // for a
reg data_reg ; // for a
vga_buffer display(
	.address_a (addr_reg) , 
	.address_b ({Coord_X[9:1],Coord_Y[9:1]}), // vga current address
	.clock_a (VGA_CTRL_CLK),
	.clock_b (VGA_CTRL_CLK),
	.data_a (data_reg),
	.data_b (1'b0), // never write on port b
	.wren_a (we),
	.wren_b (1'b0), // never write on port b
	.q_a (state_bit),
	.q_b (mem_bit) ); // data used to update VGA

// make the color white
assign  mVGA_R = {10{disp_bit}} ;
assign  mVGA_G = {10{disp_bit}} ;
assign  mVGA_B = {10{disp_bit}} ;

// DLA state machine
assign reset = ~KEY[0];

//right-most bit for rand number shift regs
//your basic XOR random # gen
assign x_low_bit = x_rand[27] ^ x_rand[30];
assign y_low_bit = y_rand[26] ^ y_rand[28];

//state names
parameter init=4'd0, test1=4'd1, test2=4'd2, test3=4'd3, test4=4'd4, test5=4'd5, test6=4'd6, 
	draw_walker=4'd7, update_walker=4'd8, new_walker=4'd9,
	init1=4'd10, init2=4'd11, draw_walker1=4'd12, draw_walker2=4'd13 ;
always @ (negedge VGA_CTRL_CLK)
begin
	// register the m4k output for better timing on VGA
	// negedge seems to work better than posedge
	disp_bit <= mem_bit;
end

always @ (posedge VGA_CTRL_CLK)
begin
	// register the m4k output for better timing on VGA
	//disp_bit <= mem_bit;
	
	if (reset)		//synch reset assumes KEY0 is held down 1/60 second
	begin
		//clear the screen
		addr_reg <= {Coord_X[9:1],Coord_Y[9:1]} ;	// [17:0]
		we <= 1'b1;								//write some memory
		data_reg <= 1'b0;						//write all zeros (black)		
		//init random number generators to alternating bits
		x_rand <= 31'h55555555;
		y_rand <= 29'h55555555;
		//init a randwalker to just left of center
		x_walker <= 9'd150;
		y_walker <= 9'd120;
		//
		state <= init;	//first state in regular state machine 
	end
	
	//begin state machine to modify display 
	else if ( KEY[3])  // KEY3 is pause
	begin
		case(state)
			
			// next three states write the inital dot
			init: //write a single dot in the middle of the screen
			begin
				we <= 1'b0 ;
				addr_reg <= {9'd160,9'd120} ;	//(x,y)							
				//write a white dot in the middle of the screen
				data_reg <= 1'b1 ;
				state <= init1 ;
			end			
			
			init1: //delay enable 'we' to account for registering addr,data
			begin
				we <= 1'b1;								
				//write a white dot in the middle of the screen
				data_reg <= 1'b1 ;
				state <= init2 ;
			end	 
			
			init2: 
			// finish write a single dot in the middle of the screen
			// and set up first read
			begin
				we <= 1'b0;	
				//read left neighbor
				// use result TWO cycles later (state==test2)
				// -- one to load the addr reg, one to read memory
				addr_reg <= {x_walker-9'd1,y_walker};							
				state <= test1 ;
			end	
					
			test1: 
			begin	
				sum <= 0; 		//init sum of neighbors
				we <= 1'b0; 	//no memory write 
				//read right neighbor 
				addr_reg <= {x_walker+9'd1,y_walker};
				state <= test2 ;			
			end
			
			test2: 
			begin				
				we <= 1'b0; //no memory write 
				sum <= sum + {3'b0, state_bit};	//use left neighbor
				//read upper neighbor 
				addr_reg <= {x_walker,y_walker - 9'd1};
				state <= test3 ;	
			end
			
			test3:  
			begin
				we <= 1'b0; //no memory write 
				sum <= sum + {3'b0, state_bit}; //use right neighbor
				//read lower neighbor 
				addr_reg <= {x_walker,y_walker + 9'd1};
				state <= test4 ;							
			end
			
			test4: 
			begin
				we <= 1'b0; //no memory write 
				sum <= sum + {3'b0, state_bit}; // use upper neighbor
				state <= test5 ;							
			end
			
			test5: 
			begin
				we <= 1'b0; //no memory write 
				sum <= sum + {3'b0, state_bit} ; // use lower neighbor
				state <= test6 ;
			end	
			
			test6:
			begin
				if (sum>0) // then there is one or more neighbors
				begin
					state <= draw_walker;
				end
				else // if get here, then no neighbors, so update position
					state <= update_walker; 
			end
			
			// the next three states draw the walker in memory
			draw_walker: //draw the walker
			begin
				addr_reg <= {x_walker,y_walker};
				data_reg <= 1'b1 ;
				state <= draw_walker1 ;	
			end
			
			draw_walker1:
			begin
				we <= 1'b1; // memory write enable 
				state <= draw_walker2 ;
			end
			
			draw_walker2:
			begin
				we <= 1'b0; // finish memory write 
				state <= new_walker ;
			end		
			
			update_walker: //update the walker
			begin
				we <= 1'b0; //no mem write
				//inc/dec x while staying on screen
				if (x_walker<9'd316 & x_rand[30]==1)
					x_walker <= x_walker+1;
				else if (x_walker>9'd4 & x_rand[30]==0)
					x_walker <= x_walker-1;
				//inc/dec y while staying on screen
				if (y_walker<9'd236 & y_rand[28]==1)
					y_walker <= y_walker+1;
				else if (y_walker>9'd4 & y_rand[28]==0)
					y_walker <= y_walker-1;
				//update the x,y random number gens
				x_rand <= {x_rand[29:0], x_low_bit} ;
				y_rand <= {y_rand[27:0], y_low_bit} ;
				state <= init2 ;	
			end
			
			new_walker: //generate a new one
			begin
				we <= 1'b0; // no memory write
				//init randwalker x
				if (x_rand[30])
				begin
					x_walker <= x_rand[29:22]+8'd20;
					if (y_rand[28])
						y_walker <= 9'd236;
					else
						y_walker <= 9'd4;
				end
				else
				begin
					y_walker <= x_rand[28:22]+8'd50;
					if (y_rand[28])
						x_walker <= 9'd316;
					else
						x_walker <= 9'd4;
				end
				//update the x,y random number gens
				x_rand <= {x_rand[29:0], x_low_bit} ;
				y_rand <= {y_rand[27:0], y_low_bit} ;
				state <= init2;
			end
		endcase
	end // else if ( KEY[3]) 
	
	else
	begin
		//update the x,y random number gens
		// this allows the pause key to change the pattern
		// generated
		x_rand <= {x_rand[29:0], x_low_bit} ;
		y_rand <= {y_rand[27:0], y_low_bit} ;
	end
end // always @ (posedge VGA_CTRL_CLK)

endmodule //top module

////////// end of file //////////////////////////
