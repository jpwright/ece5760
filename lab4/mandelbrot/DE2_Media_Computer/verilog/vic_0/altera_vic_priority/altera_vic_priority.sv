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

module altera_vic_priority #(parameter NUMBER_OF_INT_PORTS = 32, 
                             parameter PRIORITY_WIDTH = 6,
                             parameter DATA_WIDTH = 19)
(
   input  wire                   in0_valid,
   input  wire  [DATA_WIDTH-1:0] in0_data,
   
   input  wire                   in1_valid,
   input  wire  [DATA_WIDTH-1:0] in1_data,
   
   input  wire                   in2_valid,
   input  wire  [DATA_WIDTH-1:0] in2_data,
   
   input  wire                   in3_valid,
   input  wire  [DATA_WIDTH-1:0] in3_data,
   
   input  wire                   in4_valid,
   input  wire  [DATA_WIDTH-1:0] in4_data,
   
   input  wire                   in5_valid,
   input  wire  [DATA_WIDTH-1:0] in5_data,
   
   input  wire                   in6_valid,
   input  wire  [DATA_WIDTH-1:0] in6_data,
   
   input  wire                   in7_valid,
   input  wire  [DATA_WIDTH-1:0] in7_data,
   
   input  wire                   in8_valid,
   input  wire  [DATA_WIDTH-1:0] in8_data,
   
   input  wire                   in9_valid,
   input  wire  [DATA_WIDTH-1:0] in9_data,
   
   input  wire                   in10_valid,
   input  wire  [DATA_WIDTH-1:0] in10_data,
   
   input  wire                   in11_valid,
   input  wire  [DATA_WIDTH-1:0] in11_data,
   
   input  wire                   in12_valid,
   input  wire  [DATA_WIDTH-1:0] in12_data,
   
   input  wire                   in13_valid,
   input  wire  [DATA_WIDTH-1:0] in13_data,
   
   input  wire                   in14_valid,
   input  wire  [DATA_WIDTH-1:0] in14_data,
   
   input  wire                   in15_valid,
   input  wire  [DATA_WIDTH-1:0] in15_data,
   
   input  wire                   in16_valid,
   input  wire  [DATA_WIDTH-1:0] in16_data,
   
   input  wire                   in17_valid,
   input  wire  [DATA_WIDTH-1:0] in17_data,
   
   input  wire                   in18_valid,
   input  wire  [DATA_WIDTH-1:0] in18_data,
   
   input  wire                   in19_valid,
   input  wire  [DATA_WIDTH-1:0] in19_data,
   
   input  wire                   in20_valid,
   input  wire  [DATA_WIDTH-1:0] in20_data,
   
   input  wire                   in21_valid,
   input  wire  [DATA_WIDTH-1:0] in21_data,
   
   input  wire                   in22_valid,
   input  wire  [DATA_WIDTH-1:0] in22_data,
   
   input  wire                   in23_valid,
   input  wire  [DATA_WIDTH-1:0] in23_data,
   
   input  wire                   in24_valid,
   input  wire  [DATA_WIDTH-1:0] in24_data,
   
   input  wire                   in25_valid,
   input  wire  [DATA_WIDTH-1:0] in25_data,
   
   input  wire                   in26_valid,
   input  wire  [DATA_WIDTH-1:0] in26_data,
   
   input  wire                   in27_valid,
   input  wire  [DATA_WIDTH-1:0] in27_data,
   
   input  wire                   in28_valid,
   input  wire  [DATA_WIDTH-1:0] in28_data,
   
   input  wire                   in29_valid,
   input  wire  [DATA_WIDTH-1:0] in29_data,
   
   input  wire                   in30_valid,
   input  wire  [DATA_WIDTH-1:0] in30_data,
   
   input  wire                   in31_valid,
   input  wire  [DATA_WIDTH-1:0] in31_data,
 
   input  wire                   in32_valid,
   input  wire  [DATA_WIDTH-1:0] in32_data,
 
   output wire                   pri_valid,
   output wire  [DATA_WIDTH-1:0] pri_data,
   
   input  wire                   reset_n,
   input  wire                   clk
);


// ********************************************************************
// Module Wiring

wire                    cmp_valid_A0;
wire   [DATA_WIDTH-1:0] cmp_data_A0;

wire                    cmp_valid_A1;
wire   [DATA_WIDTH-1:0] cmp_data_A1;

wire                    cmp_valid_A2;
wire   [DATA_WIDTH-1:0] cmp_data_A2;

wire                    cmp_valid_A3;
wire   [DATA_WIDTH-1:0] cmp_data_A3;

wire                    cmp_valid_A4;
wire   [DATA_WIDTH-1:0] cmp_data_A4;

wire                    cmp_valid_A5;
wire   [DATA_WIDTH-1:0] cmp_data_A5;

wire                    cmp_valid_A6;
wire   [DATA_WIDTH-1:0] cmp_data_A6;

wire                    cmp_valid_A7;
wire   [DATA_WIDTH-1:0] cmp_data_A7;

wire                    cmp_valid_A8;
wire   [DATA_WIDTH-1:0] cmp_data_A8;

wire                    cmp_valid_B0;
wire   [DATA_WIDTH-1:0] cmp_data_B0;

wire                    cmp_valid_B1;
wire   [DATA_WIDTH-1:0] cmp_data_B1;

wire                    cmp_valid_B2;
wire   [DATA_WIDTH-1:0] cmp_data_B2;


// ********************************************************************
// Module Logic

generate
   case (NUMBER_OF_INT_PORTS)
      1: begin : port1
            assign pri_valid = in0_valid;
            assign pri_data  = in0_data;
         end
         
      2, 3, 4: begin : port2_4
            altera_vic_compare4 #(PRIORITY_WIDTH, DATA_WIDTH) A0 
               (in0_valid, in0_data, in1_valid, in1_data, 
                in2_valid, in2_data, in3_valid, in3_data, 
                pri_valid, pri_data, clk);
         end
         
      5, 6, 7, 8: begin : port5_8
            altera_vic_compare4 #(PRIORITY_WIDTH, DATA_WIDTH) A0 
               (in0_valid, in0_data, in1_valid, in1_data, 
                in2_valid, in2_data, in3_valid, in3_data,       
                cmp_valid_A0, cmp_data_A0, clk);
                
            altera_vic_compare4 #(PRIORITY_WIDTH, DATA_WIDTH) A1 
               (in4_valid, in4_data, in5_valid, in5_data, 
                in6_valid, in6_data, in7_valid, in7_data, 
                cmp_valid_A1, cmp_data_A1, clk);
                 
            altera_vic_compare2 #(PRIORITY_WIDTH, DATA_WIDTH) B0 
               (cmp_valid_A0, cmp_data_A0, cmp_valid_A1, cmp_data_A1, 
                pri_valid, pri_data, clk);
         end
         
      9, 10, 11, 12, 13, 14, 15, 16: begin : port9_16
            altera_vic_compare4 #(PRIORITY_WIDTH, DATA_WIDTH) A0 
               (in0_valid, in0_data, in1_valid, in1_data, 
                in2_valid, in2_data, in3_valid, in3_data,
                cmp_valid_A0, cmp_data_A0, clk);
                
            altera_vic_compare4 #(PRIORITY_WIDTH, DATA_WIDTH) A1 
               (in4_valid, in4_data, in5_valid, in5_data, 
                in6_valid, in6_data, in7_valid, in7_data, 
                cmp_valid_A1, cmp_data_A1, clk);
                 
            altera_vic_compare4 #(PRIORITY_WIDTH, DATA_WIDTH) A2 
               (in8_valid, in8_data, in9_valid, in9_data, 
                in10_valid, in10_data, in11_valid, in11_data, 
                cmp_valid_A2, cmp_data_A2, clk);
            
            altera_vic_compare4 #(PRIORITY_WIDTH, DATA_WIDTH) A3
               (in12_valid, in12_data, in13_valid, in13_data, 
                in14_valid, in14_data, in15_valid, in15_data, 
                cmp_valid_A3, cmp_data_A3, clk);
                        
            altera_vic_compare4 #(PRIORITY_WIDTH, DATA_WIDTH) B0 
               (cmp_valid_A0, cmp_data_A0, cmp_valid_A1, cmp_data_A1,
                cmp_valid_A2, cmp_data_A2, cmp_valid_A3, cmp_data_A3, 
                pri_valid, pri_data, clk);
         end
         
      17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32: begin : port17_32
            altera_vic_compare4 #(PRIORITY_WIDTH, DATA_WIDTH) A0
               (in0_valid, in0_data, in1_valid, in1_data, 
                in2_valid, in2_data, in3_valid, in3_data, 
                cmp_valid_A0, cmp_data_A0, clk);
                
            altera_vic_compare4 #(PRIORITY_WIDTH, DATA_WIDTH) A1
               (in4_valid, in4_data, in5_valid, in5_data, 
                in6_valid, in6_data, in7_valid, in7_data,
                cmp_valid_A1, cmp_data_A1, clk);
                 
            altera_vic_compare4 #(PRIORITY_WIDTH, DATA_WIDTH) A2 
               (in8_valid, in8_data, in9_valid, in9_data, 
                in10_valid, in10_data, in11_valid, in11_data, 
                cmp_valid_A2, cmp_data_A2, clk);
            
            altera_vic_compare4 #(PRIORITY_WIDTH, DATA_WIDTH) A3
               (in12_valid, in12_data, in13_valid, in13_data, 
                in14_valid, in14_data, in15_valid, in15_data, 
                cmp_valid_A3, cmp_data_A3, clk);

            altera_vic_compare4 #(PRIORITY_WIDTH, DATA_WIDTH) A4
               (in16_valid, in16_data, in17_valid, in17_data, 
                in18_valid, in18_data, in19_valid, in19_data, 
                cmp_valid_A4, cmp_data_A4, clk);
                
            altera_vic_compare4 #(PRIORITY_WIDTH, DATA_WIDTH) A5
               (in20_valid, in20_data, in21_valid, in21_data, 
                in22_valid, in22_data, in23_valid, in23_data, 
                cmp_valid_A5, cmp_data_A5, clk);
                
            altera_vic_compare4 #(PRIORITY_WIDTH, DATA_WIDTH) A6
               (in24_valid, in24_data, in25_valid, in25_data, 
                in26_valid, in26_data, in27_valid, in27_data, 
                cmp_valid_A6, cmp_data_A6, clk);
                
            altera_vic_compare4 #(PRIORITY_WIDTH, DATA_WIDTH) A7
               (in28_valid, in28_data, in29_valid, in29_data, 
                in30_valid, in30_data, in31_valid, in31_data, 
                cmp_valid_A7, cmp_data_A7, clk);

            altera_vic_compare4 #(PRIORITY_WIDTH, DATA_WIDTH) B0 
               (cmp_valid_A0, cmp_data_A0, cmp_valid_A1, cmp_data_A1,
                cmp_valid_A2, cmp_data_A2, cmp_valid_A3, cmp_data_A3, 
                cmp_valid_B0, cmp_data_B0, clk);
                
            altera_vic_compare4 #(PRIORITY_WIDTH, DATA_WIDTH) B1 
               (cmp_valid_A4, cmp_data_A4, cmp_valid_A5, cmp_data_A5,
                cmp_valid_A6, cmp_data_A6, cmp_valid_A7, cmp_data_A7, 
                cmp_valid_B1, cmp_data_B1, clk);               
                      
            altera_vic_compare2 #(PRIORITY_WIDTH, DATA_WIDTH) C0 
               (cmp_valid_B0, cmp_data_B0, cmp_valid_B1, cmp_data_B1,
                pri_valid, pri_data, clk);                      
         end         
         
      default: begin : port33
            altera_vic_compare4 #(PRIORITY_WIDTH, DATA_WIDTH) A0
               (in0_valid, in0_data, in1_valid, in1_data, 
                in2_valid, in2_data, in3_valid, in3_data, 
                cmp_valid_A0, cmp_data_A0, clk);
                
            altera_vic_compare4 #(PRIORITY_WIDTH, DATA_WIDTH) A1
               (in4_valid, in4_data, in5_valid, in5_data, 
                in6_valid, in6_data, in7_valid, in7_data,
                cmp_valid_A1, cmp_data_A1, clk);
                 
            altera_vic_compare4 #(PRIORITY_WIDTH, DATA_WIDTH) A2 
               (in8_valid, in8_data, in9_valid, in9_data, 
                in10_valid, in10_data, in11_valid, in11_data, 
                cmp_valid_A2, cmp_data_A2, clk);
            
            altera_vic_compare4 #(PRIORITY_WIDTH, DATA_WIDTH) A3
               (in12_valid, in12_data, in13_valid, in13_data, 
                in14_valid, in14_data, in15_valid, in15_data, 
                cmp_valid_A3, cmp_data_A3, clk);

            altera_vic_compare4 #(PRIORITY_WIDTH, DATA_WIDTH) A4
               (in16_valid, in16_data, in17_valid, in17_data, 
                in18_valid, in18_data, in19_valid, in19_data, 
                cmp_valid_A4, cmp_data_A4, clk);
                
            altera_vic_compare4 #(PRIORITY_WIDTH, DATA_WIDTH) A5
               (in20_valid, in20_data, in21_valid, in21_data, 
                in22_valid, in22_data, in23_valid, in23_data, 
                cmp_valid_A5, cmp_data_A5, clk);
                
            altera_vic_compare4 #(PRIORITY_WIDTH, DATA_WIDTH) A6
               (in24_valid, in24_data, in25_valid, in25_data, 
                in26_valid, in26_data, in27_valid, in27_data, 
                cmp_valid_A6, cmp_data_A6, clk);
                
            altera_vic_compare4 #(PRIORITY_WIDTH, DATA_WIDTH) A7
               (in28_valid, in28_data, in29_valid, in29_data, 
                in30_valid, in30_data, in31_valid, in31_data, 
                cmp_valid_A7, cmp_data_A7, clk);

            altera_vic_compare2 #(PRIORITY_WIDTH, DATA_WIDTH) A8 
               (in32_valid, in32_data, 1'b0, {DATA_WIDTH{1'b0}},
                cmp_valid_A8, cmp_data_A8, clk);                      

            altera_vic_compare4 #(PRIORITY_WIDTH, DATA_WIDTH) B0 
               (cmp_valid_A0, cmp_data_A0, cmp_valid_A1, cmp_data_A1,
                cmp_valid_A2, cmp_data_A2, cmp_valid_A3, cmp_data_A3, 
                cmp_valid_B0, cmp_data_B0, clk);
                
            altera_vic_compare4 #(PRIORITY_WIDTH, DATA_WIDTH) B1 
               (cmp_valid_A4, cmp_data_A4, cmp_valid_A5, cmp_data_A5,
                cmp_valid_A6, cmp_data_A6, cmp_valid_A7, cmp_data_A7, 
                cmp_valid_B1, cmp_data_B1, clk);               
                      
            altera_vic_compare2 #(PRIORITY_WIDTH, DATA_WIDTH) B2 
               (cmp_valid_A8, cmp_data_A8, 1'b0, {DATA_WIDTH{1'b0}},
                cmp_valid_B2, cmp_data_B2, clk);                      

            altera_vic_compare4 #(PRIORITY_WIDTH, DATA_WIDTH) C0 
               (cmp_valid_B0, cmp_data_B0, cmp_valid_B1, cmp_data_B1,
                cmp_valid_B2, cmp_data_B2, 1'b0, {DATA_WIDTH{1'b0}}, 
                pri_valid, pri_data, clk);                      
         end         
   endcase
endgenerate


endmodule
