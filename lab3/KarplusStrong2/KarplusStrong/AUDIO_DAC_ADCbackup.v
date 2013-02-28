module AUDIO_DAC_ADC (	//	Memory Side
					oFLASH_ADDR,iFLASH_DATA,
					oSDRAM_ADDR,iSDRAM_DATA,
					oSRAM_ADDR,iSRAM_DATA,
					//	Audio Side
					oAUD_BCK,
					oAUD_DATA,
					oAUD_LRCK,
					iAUD_ADCDAT,
					iAUD_extR,
					iAUD_extL,
					//	Control Signals
					//iSrc_Select,
				    iCLK_18_4,
					iRST_N	
					);				

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
parameter	ADC_loop		=	0;
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
input signed [DATA_WIDTH-1:0]	iAUD_extR, iAUD_extL;
//	Audio Side
output			oAUD_DATA;
output			oAUD_LRCK;
output	reg		oAUD_BCK;
input			iAUD_ADCDAT;
//	Control Signals
//input	[1:0]	iSrc_Select;
input			iCLK_18_4;
input			iRST_N;
//	Internal Registers and Wires
reg		[3:0]	BCK_DIV;
reg		[8:0]	LRCK_1X_DIV;
reg		[7:0]	LRCK_2X_DIV;
reg		[6:0]	LRCK_4X_DIV;
reg		[3:0]	SEL_Cont;
////////	DATA Counter	////////
reg		[FLASH_ADDR_WIDTH-1:0]	FLASH_Cont;
reg		[SDRAM_ADDR_WIDTH-1:0]	SDRAM_Cont;
reg		[SRAM_ADDR_WIDTH-1:0]	SRAM_Cont;
////////////////////////////////////
reg signed [DATA_WIDTH-1:0]	AUD_outL, AUD_outR ;
reg	signed [DATA_WIDTH-1:0]	AUD_inL, AUD_inR ;

reg		[DATA_WIDTH-1:0]	FLASH_Out;
reg		[DATA_WIDTH-1:0]	SDRAM_Out;
reg		[DATA_WIDTH-1:0]	SRAM_Out;
reg		[DATA_WIDTH-1:0]	FLASH_Out_Tmp;
reg		[DATA_WIDTH-1:0]	SDRAM_Out_Tmp;
reg		[DATA_WIDTH-1:0]	SRAM_Out_Tmp;
reg							LRCK_1X;
reg							LRCK_2X;
reg							LRCK_4X;

wire	[3:0]				bit_in;
//////////////////////////////////////////////////
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
//oAUD_LRCK is high for left and low for right
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

assign oAUD_LRCK = LRCK_1X;

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
//////////	16 Bits - MSB First	//////////////////
/// Clocks in the ADC input
/// and sets up the output bit selector
//////////////////////////////////////////////////

always@(negedge oAUD_BCK or negedge iRST_N)
begin
	if(!iRST_N) SEL_Cont <= 0;
	else
	begin
		SEL_Cont <= SEL_Cont+1; //4 bit counter, so it wraps at 16
		if (LRCK_1X)
			AUD_inL[~(SEL_Cont)] <= iAUD_ADCDAT;
		else
			AUD_inR[~(SEL_Cont)] <= iAUD_ADCDAT;
	end
end


// output the DAC bit-stream						
assign oAUD_DATA = (LRCK_1X)? AUD_outL[~SEL_Cont]: AUD_outR[~SEL_Cont] ;
																			
// latch input from top module	
always@(negedge LRCK_1X ) //oAUD_LRCK
begin
	AUD_outR <= iAUD_extR; 
	AUD_outL <= iAUD_extL ;
 end 

endmodule
								
			
					