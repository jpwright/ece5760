module AUDIO_DAC (	//	Memory Side
					oFLASH_ADDR,iFLASH_DATA,
					oSDRAM_ADDR,iSDRAM_DATA,
					oSRAM_ADDR,iSRAM_DATA,
					//	Audio Side
					oAUD_BCK,
					oAUD_DATA,
					oAUD_LRCK,
					//	Control Signals
					iSrc_Select,
				    iCLK_18_4,
					iRST_N,	
					iDDS_incr);				

parameter	REF_CLK			=	18432000;	//	18.432	MHz
parameter	SAMPLE_RATE		=	48000;		//	48		KHz
parameter	DATA_WIDTH		=	16;			//	16		Bits
parameter	CHANNEL_NUM		=	2;			//	Dual Channel

parameter	SIN_SAMPLE_DATA	=	48;
parameter	FLASH_DATA_NUM	=	1048576;	//	1	MWords
parameter	SDRAM_DATA_NUM	=	4194304;	//	4	MWords
parameter	SRAM_DATA_NUM	=	262144;		//	256	KWords

parameter	FLASH_ADDR_WIDTH=	20;			//	20	Address Line
parameter	SDRAM_ADDR_WIDTH=	22;			//	22	Address Line
parameter	SRAM_ADDR_WIDTH=	18;			//	18	Address	Line

parameter	FLASH_DATA_WIDTH=	8;			//	8	Bits
parameter	SDRAM_DATA_WIDTH=	16;			//	16	Bits
parameter	SRAM_DATA_WIDTH=	16;			//	16	Bits

////////////	Input Source Number	//////////////
parameter	SIN_SANPLE		=	0;
parameter	FLASH_DATA		=	1;
parameter	SDRAM_DATA		=	2;
parameter	SRAM_DATA		=	3;
//////////////////////////////////////////////////
//	Memory Side
output	[FLASH_ADDR_WIDTH-1:0]	oFLASH_ADDR;
input	[FLASH_DATA_WIDTH-1:0]	iFLASH_DATA;	
output	[SDRAM_ADDR_WIDTH:0]	oSDRAM_ADDR;
input	[SDRAM_DATA_WIDTH-1:0]	iSDRAM_DATA;	
output	[SRAM_ADDR_WIDTH:0]		oSRAM_ADDR;
input	[SRAM_DATA_WIDTH-1:0]	iSRAM_DATA;	
//	Audio Side
output			oAUD_DATA;
output			oAUD_LRCK;
output	reg		oAUD_BCK;
//	Control Signals
input	[1:0]	iSrc_Select;
input			iCLK_18_4;
input			iRST_N;
input	[31:0]	iDDS_incr; //DDS frequency control
//	Internal Registers and Wires
reg		[3:0]	BCK_DIV;
reg		[8:0]	LRCK_1X_DIV;
reg		[7:0]	LRCK_2X_DIV;
reg		[6:0]	LRCK_4X_DIV;
reg		[3:0]	SEL_Cont;
////////	DATA Counter	////////
reg		[31:0]	SIN_DDS;
wire    [7:0]   sin_addr;
reg		[FLASH_ADDR_WIDTH-1:0]	FLASH_Cont;
reg		[SDRAM_ADDR_WIDTH-1:0]	SDRAM_Cont;
reg		[SRAM_ADDR_WIDTH-1:0]	SRAM_Cont;
////////////////////////////////////
reg		[DATA_WIDTH-1:0]	sine;
reg		[DATA_WIDTH-1:0]	FLASH_Out;
reg		[DATA_WIDTH-1:0]	SDRAM_Out;
reg		[DATA_WIDTH-1:0]	SRAM_Out;
reg		[DATA_WIDTH-1:0]	FLASH_Out_Tmp;
reg		[DATA_WIDTH-1:0]	SDRAM_Out_Tmp;
reg		[DATA_WIDTH-1:0]	SRAM_Out_Tmp;
reg							LRCK_1X;
reg							LRCK_2X;
reg							LRCK_4X;

////////////	AUD_BCK Generator	//////////////
always@(posedge iCLK_18_4 or negedge iRST_N)
begin
	if(!iRST_N)
	begin
		BCK_DIV		<=	0;
		oAUD_BCK	<=	0;
	end
	else
	begin
		if(BCK_DIV >= REF_CLK/(SAMPLE_RATE*DATA_WIDTH*CHANNEL_NUM*2)-1 )
		begin
			BCK_DIV		<=	0;
			oAUD_BCK	<=	~oAUD_BCK;
		end
		else
		BCK_DIV		<=	BCK_DIV+1;
	end
end
//////////////////////////////////////////////////
////////////	AUD_LRCK Generator	//////////////
always@(posedge iCLK_18_4 or negedge iRST_N)
begin
	if(!iRST_N)
	begin
		LRCK_1X_DIV	<=	0;
		LRCK_2X_DIV	<=	0;
		LRCK_4X_DIV	<=	0;
		LRCK_1X		<=	0;
		LRCK_2X		<=	0;
		LRCK_4X		<=	0;
	end
	else
	begin
		//	LRCK 1X
		if(LRCK_1X_DIV >= REF_CLK/(SAMPLE_RATE*2)-1 )
		begin
			LRCK_1X_DIV	<=	0;
			LRCK_1X	<=	~LRCK_1X;
		end
		else
		LRCK_1X_DIV		<=	LRCK_1X_DIV+1;
		//	LRCK 2X
		if(LRCK_2X_DIV >= REF_CLK/(SAMPLE_RATE*4)-1 )
		begin
			LRCK_2X_DIV	<=	0;
			LRCK_2X	<=	~LRCK_2X;
		end
		else
		LRCK_2X_DIV		<=	LRCK_2X_DIV+1;		
		//	LRCK 4X
		if(LRCK_4X_DIV >= REF_CLK/(SAMPLE_RATE*8)-1 )
		begin
			LRCK_4X_DIV	<=	0;
			LRCK_4X	<=	~LRCK_4X;
		end
		else
		LRCK_4X_DIV		<=	LRCK_4X_DIV+1;		
	end
end
assign	oAUD_LRCK	=	LRCK_1X;
//////////////////////////////////////////////////
//////////	Sin LUT ADDR Generator	//////////////
always@(negedge LRCK_1X or negedge iRST_N)
begin
	if(!iRST_N)
		SIN_DDS	<=	0;
	else
		SIN_DDS	<=	SIN_DDS + iDDS_incr ;
end
//oAUD_LRCK is high for left and low for right
//Choose left/right channel
assign  sin_addr = oAUD_LRCK ? SIN_DDS[31:24] : SIN_DDS[31:24]+ 8'h40 ;

//////////////////////////////////////////////////
//////////	FLASH ADDR Generator	//////////////
always@(negedge LRCK_4X or negedge iRST_N)
begin
	if(!iRST_N)
	FLASH_Cont	<=	0;
	else
	begin
		if(FLASH_Cont < FLASH_DATA_NUM-1 )
		FLASH_Cont	<=	FLASH_Cont+1;
		else
		FLASH_Cont	<=	0;
	end
end
assign	oFLASH_ADDR	=	FLASH_Cont;
//////////////////////////////////////////////////
//////////	  FLASH DATA Reorder	//////////////
always@(posedge LRCK_4X or negedge iRST_N)
begin
	if(!iRST_N)
	FLASH_Out_Tmp	<=	0;
	else
	begin
		if(FLASH_Cont[0])
		FLASH_Out_Tmp[15:8]	<=	iFLASH_DATA;
		else
		FLASH_Out_Tmp[7:0]	<=	iFLASH_DATA;		
	end
end
always@(negedge LRCK_2X	or negedge iRST_N)
begin
	if(!iRST_N)
	FLASH_Out	<=	0;
	else
	FLASH_Out	<=	FLASH_Out_Tmp;
end
//////////////////////////////////////////////////
//////////	SDRAM ADDR Generator	//////////////
always@(negedge LRCK_2X or negedge iRST_N)
begin
	if(!iRST_N)
	SDRAM_Cont	<=	0;
	else
	begin
		if(SDRAM_Cont < SDRAM_DATA_NUM-1 )
		SDRAM_Cont	<=	SDRAM_Cont+1;
		else
		SDRAM_Cont	<=	0;
	end
end
assign	oSDRAM_ADDR	=	SDRAM_Cont;
//////////////////////////////////////////////////
//////////	  SDRAM DATA Latch		//////////////
always@(posedge LRCK_2X or negedge iRST_N)
begin
	if(!iRST_N)
	SDRAM_Out_Tmp	<=	0;
	else
	SDRAM_Out_Tmp	<=	iSDRAM_DATA;
end
always@(negedge LRCK_2X	or negedge iRST_N)
begin
	if(!iRST_N)
	SDRAM_Out	<=	0;
	else
	SDRAM_Out	<=	SDRAM_Out_Tmp;
end
//////////////////////////////////////////////////
////////////	SRAM ADDR Generator	  ////////////
always@(negedge LRCK_2X or negedge iRST_N)
begin
	if(!iRST_N)
	SRAM_Cont	<=	0;
	else
	begin
		if(SRAM_Cont < SRAM_DATA_NUM-1 )
		SRAM_Cont	<=	SRAM_Cont+1;
		else
		SRAM_Cont	<=	0;
	end
end
assign	oSRAM_ADDR	=	SRAM_Cont;
//////////////////////////////////////////////////
//////////	  SRAM DATA Latch		//////////////
always@(posedge LRCK_2X or negedge iRST_N)
begin
	if(!iRST_N)
	SRAM_Out_Tmp	<=	0;
	else
	SRAM_Out_Tmp	<=	iSRAM_DATA;
end
always@(negedge LRCK_2X	or negedge iRST_N)
begin
	if(!iRST_N)
	SRAM_Out	<=	0;
	else
	SRAM_Out	<=	SRAM_Out_Tmp;
end
//////////////////////////////////////////////////
//////////	16 Bits PISO MSB First	//////////////
always@(negedge oAUD_BCK or negedge iRST_N)
begin
	if(!iRST_N)
	SEL_Cont	<=	0;
	else
	SEL_Cont	<=	SEL_Cont+1; //16 bit counter, so it wraps
end
assign	oAUD_DATA	=	(iSrc_Select==SIN_SANPLE)	?	sine[~SEL_Cont]	:
						(iSrc_Select==FLASH_DATA)	?	FLASH_Out[~SEL_Cont]:
						(iSrc_Select==SDRAM_DATA)	?	SDRAM_Out[~SEL_Cont]:
														SRAM_Out[~SEL_Cont]	;												
//////////////////////////////////////////////////
////////////	Sin Wave ROM Table	//////////////
always@(sin_addr)
begin
    case(sin_addr)
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
//////////////////////////////////////////////////

endmodule
								
			
					

