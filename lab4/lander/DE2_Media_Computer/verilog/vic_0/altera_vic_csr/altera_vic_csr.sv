// (C) 2001-2011 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


`timescale 1ns / 1ns

module altera_vic_csr #(parameter NUMBER_OF_INT_PORTS = 32, 
                        parameter RRS_WIDTH = 6, 
                        parameter RIL_WIDTH = 6,
                        parameter DAISY_CHAIN_ENABLE = 0)
( 
   input  wire  [NUMBER_OF_INT_PORTS-1:0] inr_i1_irq,

   output wire  [31:0] avm_m1_address,
   output wire         avm_m1_read,
   output wire         avm_m1_write,
   output wire  [31:0] avm_m1_writedata,
   input  wire  [31:0] avm_m1_readdata,
   input  wire         avm_m1_waitrequest,

   input  wire  [7:0]  avs_s1_address,
   input  wire         avs_s1_read,
   input  wire         avs_s1_write,
   input  wire  [31:0] avs_s1_writedata,
   output reg   [31:0] avs_s1_readdata,
   
   input  wire         dc_in_valid,
   input  wire  [44:0] dc_in_data,
   
   output reg          dc_out_valid,
   output reg   [31:0] dc_out_data,
   
   output wire         out0_valid,
   output wire  [18:0] out0_data,
   
   output wire         out1_valid,
   output wire  [18:0] out1_data,
   
   output wire         out2_valid,
   output wire  [18:0] out2_data,
   
   output wire         out3_valid,
   output wire  [18:0] out3_data,
   
   output wire         out4_valid,
   output wire  [18:0] out4_data,
   
   output wire         out5_valid,
   output wire  [18:0] out5_data,
   
   output wire         out6_valid,
   output wire  [18:0] out6_data,
   
   output wire         out7_valid,
   output wire  [18:0] out7_data,
   
   output wire         out8_valid,
   output wire  [18:0] out8_data,
   
   output wire         out9_valid,
   output wire  [18:0] out9_data,
   
   output wire         out10_valid,
   output wire  [18:0] out10_data,
   
   output wire         out11_valid,
   output wire  [18:0] out11_data,
   
   output wire         out12_valid,
   output wire  [18:0] out12_data,
   
   output wire         out13_valid,
   output wire  [18:0] out13_data,
   
   output wire         out14_valid,
   output wire  [18:0] out14_data,
   
   output wire         out15_valid,
   output wire  [18:0] out15_data,
   
   output wire         out16_valid,
   output wire  [18:0] out16_data,
   
   output wire         out17_valid,
   output wire  [18:0] out17_data,
   
   output wire         out18_valid,
   output wire  [18:0] out18_data,
   
   output wire         out19_valid,
   output wire  [18:0] out19_data,
   
   output wire         out20_valid,
   output wire  [18:0] out20_data,
   
   output wire         out21_valid,
   output wire  [18:0] out21_data,
   
   output wire         out22_valid,
   output wire  [18:0] out22_data,
   
   output wire         out23_valid,
   output wire  [18:0] out23_data,
   
   output wire         out24_valid,
   output wire  [18:0] out24_data,
   
   output wire         out25_valid,
   output wire  [18:0] out25_data,
   
   output wire         out26_valid,
   output wire  [18:0] out26_data,
   
   output wire         out27_valid,
   output wire  [18:0] out27_data,
   
   output wire         out28_valid,
   output wire  [18:0] out28_data,
   
   output wire         out29_valid,
   output wire  [18:0] out29_data,
   
   output wire         out30_valid,
   output wire  [18:0] out30_data,
   
   output wire         out31_valid,
   output wire  [18:0] out31_data,
   
   output wire         out32_valid,
   output wire  [18:0] out32_data,
   
   output reg          control_valid,
   output reg   [34:0] control_data,
   
   input  wire         status_valid,
   input  wire  [37:0] status_data,
   
   input  wire         reset_n,
   input  wire         clk
);


// ********************************************************************
// Module Wiring

reg           Reset;

reg    [NUMBER_OF_INT_PORTS-1:0] IntInput;

reg           DcInValid;
reg    [44:0] DcInData;

wire          DcOutValid;
wire   [31:0] DcOutData;

reg    [5:0]  DcRrsValue;
reg           DcNmiValue;
reg    [5:0]  DcRilValue;
reg    [5:0]  DcRilAdjust;
wire   [5:0]  RilMaxValue;

reg    [7:0]  AvsAddr;
reg           AvsRead;
reg           AvsWrite;
reg    [31:0] AvsWrData;
reg    [31:0] AvsRdData;

reg           ConfRegRead;
reg           ConfRegWrite;
reg    [31:0] ConfRegSelect;
reg    [12:0] ConfRegWrData;
wire   [12:0] ConfRegRdData [31:0];
reg           ConfRegReset;
reg    [12:0] ConfRegRdMux;

reg           CtrlRegRead;
reg           CtrlRegWrite;
reg    [11:0] CtrlRegSelect;
reg    [31:0] CtrlRegWrData;
reg           CtrlRegReset;
reg    [31:0] CtrlRegRdMux;
reg           ControlValid;

wire   [NUMBER_OF_INT_PORTS-1:0] IntEnableRdData;

reg    [NUMBER_OF_INT_PORTS-1:0] IntPendingWrData;
wire   [NUMBER_OF_INT_PORTS-1:0] IntPendingRdData;

reg    [NUMBER_OF_INT_PORTS-1:0] IntRawStatusWrData;
wire   [NUMBER_OF_INT_PORTS-1:0] IntRawStatusRdData;

wire   [NUMBER_OF_INT_PORTS-1:0] SwTriggerRdData;

wire   [DAISY_CHAIN_ENABLE+2:0]  VicConfigRdData;

reg    [31:0]  VicStatusWrData;
wire   [31:0]  VicStatusRdData;

wire   [31:0] VecTableBaseRdData;

reg    [31:0] VecTableAddrWrData;
wire   [31:0] VecTableAddrRdData;

wire   [32:0] IntOutputValid;
wire   [18:0] IntOutputData [32:0];
wire   [5:0]  IntPortId [32:0];

genvar        i, j, k, l;


// ********************************************************************
// Module Logic

assign avm_m1_address = 32'b0;
assign avm_m1_read = 1'b0;
assign avm_m1_write = 1'b0;
assign avm_m1_writedata = 32'b0;


always @(posedge clk) begin
   Reset <= ~reset_n;
   ConfRegReset <= Reset;
   CtrlRegReset <= Reset;
end


always @(posedge clk) begin
   IntInput   <= inr_i1_irq;

   DcInValid  <= dc_in_valid;
   DcInData   <= dc_in_data;
   DcRrsValue <= dc_in_data[12:7];
   DcNmiValue <= dc_in_data[6];
   DcRilValue <= dc_in_data[5:0];

   AvsAddr   <= avs_s1_address;
   AvsRead   <= avs_s1_read;
   AvsWrite  <= avs_s1_write;
   AvsWrData <= avs_s1_writedata;

   avs_s1_readdata <= AvsRdData;

   dc_out_valid <= DcOutValid;
   dc_out_data  <= DcOutData;
end


generate
   case (RIL_WIDTH)
      1:       begin assign RilMaxValue = 6'b000001; end
      2:       begin assign RilMaxValue = 6'b000011; end
      3:       begin assign RilMaxValue = 6'b000111; end
      4:       begin assign RilMaxValue = 6'b001111; end
      5:       begin assign RilMaxValue = 6'b011111; end
      default: begin assign RilMaxValue = 6'b111111; end
   endcase
endgenerate


always @(DcRilValue, RilMaxValue) begin
   if (DcRilValue > RilMaxValue) 
      DcRilAdjust <= RilMaxValue;
   else
      DcRilAdjust <= DcRilValue;
end


always @(posedge clk) begin
   if (AvsAddr[7:5] == 3'b000) begin
      ConfRegRead  <= AvsRead;
      ConfRegWrite <= AvsWrite;
      CtrlRegRead  <= 1'b0;
      CtrlRegWrite <= 1'b0;
   end

   else begin
      ConfRegRead  <= 1'b0;
      ConfRegWrite <= 1'b0;
      CtrlRegRead  <= AvsRead;
      CtrlRegWrite <= AvsWrite;
   end
end 
  

always @(posedge clk) begin
   case (AvsAddr[4:0])
      5'h00: ConfRegSelect <= 32'h00000001;
      5'h01: ConfRegSelect <= 32'h00000002;
      5'h02: ConfRegSelect <= 32'h00000004;
      5'h03: ConfRegSelect <= 32'h00000008;
      5'h04: ConfRegSelect <= 32'h00000010;
      5'h05: ConfRegSelect <= 32'h00000020;
      5'h06: ConfRegSelect <= 32'h00000040;
      5'h07: ConfRegSelect <= 32'h00000080;
      5'h08: ConfRegSelect <= 32'h00000100;
      5'h09: ConfRegSelect <= 32'h00000200;
      5'h0A: ConfRegSelect <= 32'h00000400;
      5'h0B: ConfRegSelect <= 32'h00000800;
      5'h0C: ConfRegSelect <= 32'h00001000;
      5'h0D: ConfRegSelect <= 32'h00002000;
      5'h0E: ConfRegSelect <= 32'h00004000;
      5'h0F: ConfRegSelect <= 32'h00008000; 
      5'h10: ConfRegSelect <= 32'h00010000;
      5'h11: ConfRegSelect <= 32'h00020000;
      5'h12: ConfRegSelect <= 32'h00040000;
      5'h13: ConfRegSelect <= 32'h00080000;
      5'h14: ConfRegSelect <= 32'h00100000;
      5'h15: ConfRegSelect <= 32'h00200000;
      5'h16: ConfRegSelect <= 32'h00400000;
      5'h17: ConfRegSelect <= 32'h00800000;
      5'h18: ConfRegSelect <= 32'h01000000;
      5'h19: ConfRegSelect <= 32'h02000000;
      5'h1A: ConfRegSelect <= 32'h04000000;
      5'h1B: ConfRegSelect <= 32'h08000000;
      5'h1C: ConfRegSelect <= 32'h10000000;
      5'h1D: ConfRegSelect <= 32'h20000000;
      5'h1E: ConfRegSelect <= 32'h40000000;
      5'h1F: ConfRegSelect <= 32'h80000000;      
   endcase
end


always @(posedge clk) begin
   case (AvsAddr[4:0])
      5'h00: CtrlRegSelect <= 12'h001;
      5'h01: CtrlRegSelect <= 12'h002;
      5'h02: CtrlRegSelect <= 12'h004;
      5'h03: CtrlRegSelect <= 12'h008;
      5'h04: CtrlRegSelect <= 12'h010;
      5'h05: CtrlRegSelect <= 12'h020;
      5'h06: CtrlRegSelect <= 12'h040;
      5'h07: CtrlRegSelect <= 12'h080;
      5'h08: CtrlRegSelect <= 12'h100;
      5'h09: CtrlRegSelect <= 12'h200;
      5'h0A: CtrlRegSelect <= 12'h400;
      5'h0B: CtrlRegSelect <= 12'h800;
      default: CtrlRegSelect <= 12'h000;
   endcase
end


always @(posedge clk) begin
   case (AvsAddr[4:0])
      5'h00: ConfRegRdMux <= ConfRegRdData[0];
      5'h01: ConfRegRdMux <= ConfRegRdData[1];
      5'h02: ConfRegRdMux <= ConfRegRdData[2];
      5'h03: ConfRegRdMux <= ConfRegRdData[3];
      5'h04: ConfRegRdMux <= ConfRegRdData[4];
      5'h05: ConfRegRdMux <= ConfRegRdData[5];
      5'h06: ConfRegRdMux <= ConfRegRdData[6];
      5'h07: ConfRegRdMux <= ConfRegRdData[7];
      5'h08: ConfRegRdMux <= ConfRegRdData[8];
      5'h09: ConfRegRdMux <= ConfRegRdData[9];
      5'h0A: ConfRegRdMux <= ConfRegRdData[10];
      5'h0B: ConfRegRdMux <= ConfRegRdData[11];
      5'h0C: ConfRegRdMux <= ConfRegRdData[12];
      5'h0D: ConfRegRdMux <= ConfRegRdData[13];
      5'h0E: ConfRegRdMux <= ConfRegRdData[14];
      5'h0F: ConfRegRdMux <= ConfRegRdData[15];      
      5'h10: ConfRegRdMux <= ConfRegRdData[16];
      5'h11: ConfRegRdMux <= ConfRegRdData[17];
      5'h12: ConfRegRdMux <= ConfRegRdData[18];
      5'h13: ConfRegRdMux <= ConfRegRdData[19];
      5'h14: ConfRegRdMux <= ConfRegRdData[20];
      5'h15: ConfRegRdMux <= ConfRegRdData[21];
      5'h16: ConfRegRdMux <= ConfRegRdData[22];
      5'h17: ConfRegRdMux <= ConfRegRdData[23];
      5'h18: ConfRegRdMux <= ConfRegRdData[24];
      5'h19: ConfRegRdMux <= ConfRegRdData[25];
      5'h1A: ConfRegRdMux <= ConfRegRdData[26];
      5'h1B: ConfRegRdMux <= ConfRegRdData[27];
      5'h1C: ConfRegRdMux <= ConfRegRdData[28];
      5'h1D: ConfRegRdMux <= ConfRegRdData[29];
      5'h1E: ConfRegRdMux <= ConfRegRdData[30];
      5'h1F: ConfRegRdMux <= ConfRegRdData[31];
   endcase
end


always @(posedge clk) begin
   case (AvsAddr[4:0])
      5'h00: CtrlRegRdMux <= IntEnableRdData;
      
      5'h03: CtrlRegRdMux <= IntPendingRdData;
      5'h04: CtrlRegRdMux <= IntRawStatusRdData;
      5'h05: CtrlRegRdMux <= SwTriggerRdData;
     
      5'h08: CtrlRegRdMux <= VicConfigRdData;
      5'h09: CtrlRegRdMux <= VicStatusRdData;
      5'h0A: CtrlRegRdMux <= VecTableBaseRdData;
      5'h0B: CtrlRegRdMux <= VecTableAddrRdData;
      
      default: CtrlRegRdMux <= 32'h00000000;
   endcase
end


always @(posedge clk) begin
  if (ConfRegRead)
     AvsRdData <= {19'h0, ConfRegRdMux};
     
  else if (CtrlRegRead)
     AvsRdData <= CtrlRegRdMux;
     
  else
     AvsRdData <= 32'h00000000;
end


always @(posedge clk) begin
   ConfRegWrData <= AvsWrData[12:0];
   CtrlRegWrData <= AvsWrData;
end


always @(posedge clk) begin
   IntPendingWrData   <= IntEnableRdData  &  (IntInput | SwTriggerRdData);
   IntRawStatusWrData <= IntInput;

   ControlValid  <= (CtrlRegSelect[8] | CtrlRegSelect[10]) & CtrlRegWrite;
   control_valid <= ControlValid;
   control_data  <= {VicConfigRdData[2:0], VecTableBaseRdData};   
end


always @(posedge clk) begin
   if (status_valid) begin
      VicStatusWrData[31]                      <= status_valid;
      VicStatusWrData[30:DAISY_CHAIN_ENABLE+5] <= 0;
      VicStatusWrData[DAISY_CHAIN_ENABLE+4:0]  <= status_data[DAISY_CHAIN_ENABLE+36:32];
      VecTableAddrWrData                       <= status_data[31:0];
   end 
   else begin
      VicStatusWrData    <= 0;
      VecTableAddrWrData <= 0;
   end
end


assign IntPortId[0]  = 6'h00;
assign IntPortId[1]  = 6'h01;
assign IntPortId[2]  = 6'h02;
assign IntPortId[3]  = 6'h03;
assign IntPortId[4]  = 6'h04;
assign IntPortId[5]  = 6'h05;
assign IntPortId[6]  = 6'h06;
assign IntPortId[7]  = 6'h07;
assign IntPortId[8]  = 6'h08;
assign IntPortId[9]  = 6'h09;
assign IntPortId[10] = 6'h0A;
assign IntPortId[11] = 6'h0B;
assign IntPortId[12] = 6'h0C;
assign IntPortId[13] = 6'h0D;
assign IntPortId[14] = 6'h0E;
assign IntPortId[15] = 6'h0F;
assign IntPortId[16] = 6'h10;
assign IntPortId[17] = 6'h11;
assign IntPortId[18] = 6'h12;
assign IntPortId[19] = 6'h13;
assign IntPortId[20] = 6'h14;
assign IntPortId[21] = 6'h15;
assign IntPortId[22] = 6'h16;
assign IntPortId[23] = 6'h17;
assign IntPortId[24] = 6'h18;
assign IntPortId[25] = 6'h19;
assign IntPortId[26] = 6'h1A;
assign IntPortId[27] = 6'h1B;
assign IntPortId[28] = 6'h1C;
assign IntPortId[29] = 6'h1D;
assign IntPortId[30] = 6'h1E;
assign IntPortId[31] = 6'h1F;
assign IntPortId[32] = 6'h20;


generate
   for (i=0; i < NUMBER_OF_INT_PORTS; i=i+1) begin : INT_OUT
      altera_vic_output_reg U (IntPendingWrData[i], 
                               IntPortId[i], ConfRegRdData[i],
                               IntOutputValid[i],
                               IntOutputData[i],
                               clk);
   end
endgenerate


generate
   if (DAISY_CHAIN_ENABLE) begin : INT_DC
      altera_vic_output_reg D ((|DcRilAdjust & VicConfigRdData[3]), 
                               6'h20, {DcRrsValue, DcNmiValue, DcRilAdjust},
                               IntOutputValid[NUMBER_OF_INT_PORTS],
                               IntOutputData[NUMBER_OF_INT_PORTS],
                               clk);
   end
endgenerate


generate   
   for (j=NUMBER_OF_INT_PORTS+DAISY_CHAIN_ENABLE; j < 33; j=j+1) begin : INT_NULL
      assign IntOutputValid[j] = 1'b0;
      assign IntOutputData[j]  = 19'h00000;
   end
endgenerate


generate
   if (DAISY_CHAIN_ENABLE) begin : OUT_DC
      assign DcOutValid = DcInValid;
      assign DcOutData  = DcInData[44:13];
   end
   else begin
      assign DcOutValid = 1'b0;
      assign DcOutData  = 32'h00000000;
   end
endgenerate


assign out0_valid  = IntOutputValid[0];
assign out0_data   = IntOutputData[0];
   
assign out1_valid  = IntOutputValid[1];
assign out1_data   = IntOutputData[1];
   
assign out2_valid  = IntOutputValid[2];
assign out2_data   = IntOutputData[2];
   
assign out3_valid  = IntOutputValid[3];
assign out3_data   = IntOutputData[3];
   
assign out4_valid  = IntOutputValid[4];
assign out4_data   = IntOutputData[4];
   
assign out5_valid  = IntOutputValid[5];
assign out5_data   = IntOutputData[5];
   
assign out6_valid  = IntOutputValid[6];
assign out6_data   = IntOutputData[6];
   
assign out7_valid  = IntOutputValid[7];
assign out7_data   = IntOutputData[7];
   
assign out8_valid  = IntOutputValid[8];
assign out8_data   = IntOutputData[8];
   
assign out9_valid  = IntOutputValid[9];
assign out9_data   = IntOutputData[9];
   
assign out10_valid = IntOutputValid[10];
assign out10_data  = IntOutputData[10];
   
assign out11_valid = IntOutputValid[11];
assign out11_data  = IntOutputData[11];
   
assign out12_valid = IntOutputValid[12];
assign out12_data  = IntOutputData[12];
   
assign out13_valid = IntOutputValid[13];
assign out13_data  = IntOutputData[13];
   
assign out14_valid = IntOutputValid[14];
assign out14_data  = IntOutputData[14];
   
assign out15_valid = IntOutputValid[15];
assign out15_data  = IntOutputData[15];
   
assign out16_valid = IntOutputValid[16];
assign out16_data  = IntOutputData[16];
   
assign out17_valid = IntOutputValid[17];
assign out17_data  = IntOutputData[17];
   
assign out18_valid = IntOutputValid[18];
assign out18_data  = IntOutputData[18];
   
assign out19_valid = IntOutputValid[19];
assign out19_data  = IntOutputData[19];
   
assign out20_valid = IntOutputValid[20];
assign out20_data  = IntOutputData[20];
   
assign out21_valid = IntOutputValid[21];
assign out21_data  = IntOutputData[21];
   
assign out22_valid = IntOutputValid[22];
assign out22_data  = IntOutputData[22];
   
assign out23_valid = IntOutputValid[23];
assign out23_data  = IntOutputData[23];
   
assign out24_valid = IntOutputValid[24];
assign out24_data  = IntOutputData[24];
   
assign out25_valid = IntOutputValid[25];
assign out25_data  = IntOutputData[25];
   
assign out26_valid = IntOutputValid[26];
assign out26_data  = IntOutputData[26];
   
assign out27_valid = IntOutputValid[27];
assign out27_data  = IntOutputData[27];
   
assign out28_valid = IntOutputValid[28];
assign out28_data  = IntOutputData[28];
   
assign out29_valid = IntOutputValid[29];
assign out29_data  = IntOutputData[29];
   
assign out30_valid = IntOutputValid[30];
assign out30_data  = IntOutputData[30];
   
assign out31_valid = IntOutputValid[31];
assign out31_data  = IntOutputData[31];
   
assign out32_valid = IntOutputValid[32];
assign out32_data  = IntOutputData[32];
   

// ********************************************************************
// Instantiation of CSRs

generate
   for (k=0; k < NUMBER_OF_INT_PORTS; k=k+1) begin : REG_CONFIG
      altera_vic_config_reg #(RRS_WIDTH, RIL_WIDTH) U 
         (ConfRegSelect[k], ConfRegWrite, ConfRegWrData, ConfRegRdData[k], ConfRegReset, clk);
   end
endgenerate


generate   
   for (l=NUMBER_OF_INT_PORTS; l <32; l=l+1) begin : REG_NULL
      assign ConfRegRdData[l] = 13'h0000;
   end
endgenerate


// Set Clear
altera_vic_reg_set_clear #(NUMBER_OF_INT_PORTS) INT_ENABLE    
   (CtrlRegSelect[2:0], CtrlRegWrite, CtrlRegWrData[NUMBER_OF_INT_PORTS-1:0], IntEnableRdData, CtrlRegReset, clk);
                              
// Read only
altera_vic_reg_ro #(NUMBER_OF_INT_PORTS) INT_PENDING    
   (IntPendingWrData, IntPendingRdData, CtrlRegReset, clk);       
                              
// Read only
altera_vic_reg_ro #(NUMBER_OF_INT_PORTS) INT_RAW_STATUS 
   (IntRawStatusWrData, IntRawStatusRdData, CtrlRegReset, clk);   
                              
// Set Clear
altera_vic_reg_set_clear #(NUMBER_OF_INT_PORTS) SW_TRIGGER    
   (CtrlRegSelect[7:5], CtrlRegWrite, CtrlRegWrData[NUMBER_OF_INT_PORTS-1:0], SwTriggerRdData, CtrlRegReset, clk);

// Reg                              
altera_vic_reg #(DAISY_CHAIN_ENABLE+3) VIC_CONFIG         
   (CtrlRegSelect[8], CtrlRegWrite, CtrlRegWrData[DAISY_CHAIN_ENABLE+2:0], VicConfigRdData, CtrlRegReset, clk);
                             
// Read only                            
altera_vic_reg_ro #(32) VIC_STATUS      
   (VicStatusWrData, VicStatusRdData, CtrlRegReset, clk);

// Reg                              
altera_vic_reg #(32) VEC_TABLE_BASE    
   (CtrlRegSelect[10], CtrlRegWrite, CtrlRegWrData, VecTableBaseRdData, CtrlRegReset, clk);
                                                           
// Read only                            
altera_vic_reg_ro #(32) VEC_TABLE_ADDR 
   (VecTableAddrWrData, VecTableAddrRdData, CtrlRegReset, clk);                             
                             
endmodule


module altera_vic_output_reg
(
   input  wire         reg_write,
   input  wire  [5:0]  reg_portid,
   input  wire  [12:0] reg_configdata,
   output reg          reg_outputvalid,
   output reg   [18:0] reg_outputdata,
   input  wire         clk
);
always @(posedge clk) begin
   if (reg_write) begin
      reg_outputvalid <= 1'b1;
      reg_outputdata  <= {reg_portid, reg_configdata};
   end
   else begin
      reg_outputvalid <= 1'b0;
      reg_outputdata  <= 19'h00000;
   end
end
endmodule


module altera_vic_config_reg #(parameter RRS_WIDTH = 6, RIL_WIDTH = 6)
(
   input  wire         reg_select,
   input  wire         reg_write,
   input  wire  [12:0] reg_writedata,
   output reg   [12:0] reg_readdata,
   input  wire         reg_reset,
   input  wire         clk
);

localparam RRS_ZEROS = 6 - RRS_WIDTH;
localparam RIL_ZEROS = 6 - RIL_WIDTH;
wire  [5:0]   wr_data_lsb;
wire  [12:7]  wr_data_msb;

generate
    if (RIL_ZEROS > 0) begin
        assign wr_data_lsb =  {{RIL_ZEROS{1'b0}}, reg_writedata[RIL_WIDTH-1:0]};
    end
    else begin
         assign wr_data_lsb =  reg_writedata[RIL_WIDTH-1:0];
    end
endgenerate

generate
    if (RRS_ZEROS > 0) begin
        assign wr_data_msb =  {{RRS_ZEROS{1'b0}}, reg_writedata[RRS_WIDTH+6:7]};
    end
    else begin
        assign wr_data_msb =  reg_writedata[RRS_WIDTH+6:7];
    end
endgenerate


always @(posedge clk) begin
   if (reg_reset)
      reg_readdata <= 0;
   else if (reg_select  &&  reg_write) begin
      reg_readdata[12:7] <= wr_data_msb;
      reg_readdata[6]    <= reg_writedata[6]; 
      reg_readdata[5:0]  <= wr_data_lsb;
   end
end

endmodule



module altera_vic_reg #(parameter WIDTH = 32)
(
   input  wire              reg_select,
   input  wire              reg_write,
   input  wire  [WIDTH-1:0] reg_writedata,
   output reg   [WIDTH-1:0] reg_readdata,
   input  wire              reg_reset,
   input  wire              clk
);

always @(posedge clk) begin
   if (reg_reset)
      reg_readdata <= 0;
   else if (reg_select  &&  reg_write)
      reg_readdata <= reg_writedata;
end

endmodule



module altera_vic_reg_ro #(parameter WIDTH = 32)
(
   input  wire  [WIDTH-1:0] reg_writedata,
   output reg   [WIDTH-1:0] reg_readdata,
   input  wire              reg_reset,
   input  wire              clk
);


always @(posedge clk) begin
   if (reg_reset)
      reg_readdata <= 0;
   else
      reg_readdata <= reg_writedata;
end

endmodule



module altera_vic_reg_set_clear #(parameter WIDTH = 32)
(
   input  wire  [2:0]       reg_select,
   input  wire              reg_write,
   input  wire  [WIDTH-1:0] reg_writedata,
   output reg   [WIDTH-1:0] reg_readdata,
   input  wire              reg_reset,
   input  wire              clk
);


always @(posedge clk) begin
   if (reg_reset)
      reg_readdata <= 0;
   else if (reg_select[0]  &&  reg_write)
      reg_readdata <= reg_writedata;
   else if (reg_select[1]  &&  reg_write)  // Write 1 to Set
      reg_readdata <= reg_readdata  |  reg_writedata;
   else if (reg_select[2]  &&  reg_write)  // Write 1 to Clear
      reg_readdata <= reg_readdata  &  ~reg_writedata;
end

endmodule

