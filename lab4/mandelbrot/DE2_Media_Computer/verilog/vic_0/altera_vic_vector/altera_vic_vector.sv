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

module altera_vic_vector #(parameter DAISY_CHAIN_ENABLE = 0)
(  
   output reg          out_valid,
   output reg   [44:0] out_data,
   
   output reg          status_valid,
   output reg   [37:0] status_data,
   
   input  wire         control_valid,
   input  wire  [34:0] control_data, 
  
   input  wire         dc_valid,
   input  wire  [31:0] dc_data,   
   
   input  wire         in_valid,
   input  wire  [18:0] in_data,   
   
   input  wire         reset_n,
   input  wire         clk
);


// ********************************************************************
// Module Wiring

wire         InValid;
wire   [5:0] InPortId;
wire  [12:0] InConfig;

wire         OutValid;
reg    [5:0] OutPortId;
reg   [12:0] OutConfig;

reg    [2:0] VecSize;
reg   [31:0] VecBaseAddr;

reg   [13:0] VecOffset;
reg   [31:0] VecHandAddr;

reg   [31:0] DcRhaValue;


// ********************************************************************
// Module Logic

assign InValid  = in_valid;
assign InPortId = in_data[18:13];
assign InConfig = in_data[12:0];

assign OutValid = InValid;


always @(posedge clk) begin
   if (control_valid) begin
      VecSize     <= control_data[34:32];
      VecBaseAddr <= control_data[31:0];
   end
end

   
always @(posedge clk) begin
   status_valid  <= OutValid;
   status_data   <= {OutPortId, VecHandAddr};
end


always @(VecSize, InPortId) begin
   case (VecSize)
      3'b000: VecOffset <= {7'b0, InPortId[4:0], 2'b0};
      3'b001: VecOffset <= {6'b0, InPortId[4:0], 3'b0};
      3'b010: VecOffset <= {5'b0, InPortId[4:0], 4'b0};
      3'b011: VecOffset <= {4'b0, InPortId[4:0], 5'b0};
      3'b100: VecOffset <= {3'b0, InPortId[4:0], 6'b0};
      3'b101: VecOffset <= {2'b0, InPortId[4:0], 7'b0};
      3'b110: VecOffset <= {1'b0, InPortId[4:0], 8'b0};
      3'b111: VecOffset <= {InPortId[4:0], 9'b0};
   endcase
end


always @(dc_valid, dc_data) begin
   if (dc_valid)
      DcRhaValue <= dc_data;
   else
      DcRhaValue <= 32'h00000000;
end


always @(InValid, InPortId, DcRhaValue, VecBaseAddr, VecOffset) begin
   if (InValid &  InPortId[5])
      VecHandAddr <= DcRhaValue;
   else if (InValid &  ~InPortId[5])
      VecHandAddr <= VecBaseAddr + VecOffset;
   else
      VecHandAddr <= 32'h00000000;
end


always @(InValid, InPortId) begin
   if (InValid)
      OutPortId <= InPortId;
   else
      OutPortId <= 6'h00;
end


always @(InValid, InConfig) begin
   if (InValid)
      OutConfig <= InConfig;
   else
      OutConfig <= 13'h0000;
end


always @(posedge clk) begin
   out_valid <= 1'b1;
   out_data  <= {VecHandAddr, OutConfig};
end
                 

endmodule
