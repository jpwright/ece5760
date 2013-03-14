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

module altera_vic_compare4 #(parameter PRIORITY_WIDTH = 6, 
                             parameter DATA_WIDTH = 20)
(  
   input  wire                   int_validA,
   input  wire  [DATA_WIDTH-1:0] int_dataA,
   
   input  wire                   int_validB,
   input  wire  [DATA_WIDTH-1:0] int_dataB,
   
   input  wire                   int_validC,
   input  wire  [DATA_WIDTH-1:0] int_dataC,
   
   input  wire                   int_validD,
   input  wire  [DATA_WIDTH-1:0] int_dataD,
   
   output reg                    int_validZ,
   output reg   [DATA_WIDTH-1:0] int_dataZ,
   
   input  wire                   clk
);


// ********************************************************************
// Module Wiring

wire  [PRIORITY_WIDTH:0]   LevelA;
wire  [PRIORITY_WIDTH:0]   LevelB;
wire  [PRIORITY_WIDTH:0]   LevelC;
wire  [PRIORITY_WIDTH:0]   LevelD;

wire  [PRIORITY_WIDTH:0]   LevelX;
wire  [PRIORITY_WIDTH:0]   LevelY;

reg   [PRIORITY_WIDTH+1:0] LevelDiffX;
reg   [PRIORITY_WIDTH+1:0] LevelDiffY;
reg   [PRIORITY_WIDTH+1:0] LevelDiffZ;

reg                        int_validX;
reg   [DATA_WIDTH-1:0]     int_dataX;

reg                        int_validY;
reg   [DATA_WIDTH-1:0]     int_dataY;


// ********************************************************************
// Module Logic - 1st and 2nd compare stages combinational

assign LevelA = {int_validA, int_dataA[PRIORITY_WIDTH-1:0]};
assign LevelB = {int_validB, int_dataB[PRIORITY_WIDTH-1:0]};
assign LevelC = {int_validC, int_dataC[PRIORITY_WIDTH-1:0]};
assign LevelD = {int_validD, int_dataD[PRIORITY_WIDTH-1:0]};


always @(LevelA, LevelB) begin
   LevelDiffX = (LevelA - LevelB);
end


always @(LevelDiffX, int_validA, int_dataA, int_validB, int_dataB) begin
   if (LevelDiffX[PRIORITY_WIDTH+1]) begin
      int_validX <= int_validB;
      int_dataX  <= int_dataB;
   end
   else begin
      int_validX <= int_validA;
      int_dataX  <= int_dataA;
   end
end


always @(LevelC, LevelD) begin
   LevelDiffY = (LevelC - LevelD);
end
                 

always @(LevelDiffY, int_validC, int_dataC, int_validD, int_dataD) begin
   if (LevelDiffY[PRIORITY_WIDTH+1]) begin
      int_validY <= int_validD;
      int_dataY  <= int_dataD;
   end
   else begin
      int_validY <= int_validC;
      int_dataY  <= int_dataC;
   end
end



// ********************************************************************
// Module Logic - 3rd compare stage clocked

assign LevelX = {int_validX, int_dataX[PRIORITY_WIDTH-1:0]};
assign LevelY = {int_validY, int_dataY[PRIORITY_WIDTH-1:0]};


always @(LevelX, LevelY) begin
   LevelDiffZ = (LevelX - LevelY);
end
                 

always @(posedge clk) begin
   if (LevelDiffZ[PRIORITY_WIDTH+1]) begin
      int_validZ <= int_validY;
      int_dataZ  <= int_dataY;
   end
   else begin
      int_validZ <= int_validX;
      int_dataZ  <= int_dataX;
   end
end


endmodule
