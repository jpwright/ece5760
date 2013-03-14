// vic_0.v

// This file was auto-generated from altera_vic_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using SOPC Builder version 11.0 157 at 2013.03.14.16:05:18

`timescale 1 ps / 1 ps
module vic_0 (
		input  wire        clk_clk,                        //                      clk.clk
		input  wire        clk_reset_reset,                //                clk_reset.reset
		output wire        dummy_master_read,              //             dummy_master.read
		output wire        dummy_master_write,             //                         .write
		input  wire        dummy_master_waitrequest,       //                         .waitrequest
		output wire [31:0] dummy_master_address,           //                         .address
		output wire [31:0] dummy_master_writedata,         //                         .writedata
		input  wire [31:0] dummy_master_readdata,          //                         .readdata
		input  wire [7:0]  irq_input_irq,                  //                irq_input.irq
		input  wire        csr_access_read,                //               csr_access.read
		input  wire        csr_access_write,               //                         .write
		input  wire [7:0]  csr_access_address,             //                         .address
		input  wire [31:0] csr_access_writedata,           //                         .writedata
		output wire [31:0] csr_access_readdata,            //                         .readdata
		output wire        interrupt_controller_out_valid, // interrupt_controller_out.valid
		output wire [44:0] interrupt_controller_out_data   //                         .data
	);

	wire         vic_csr_out0_valid;      // vic_csr:out0_valid -> vic_priority:in0_valid
	wire  [18:0] vic_csr_out0_data;       // vic_csr:out0_data -> vic_priority:in0_data
	wire         vic_csr_out1_valid;      // vic_csr:out1_valid -> vic_priority:in1_valid
	wire  [18:0] vic_csr_out1_data;       // vic_csr:out1_data -> vic_priority:in1_data
	wire         vic_csr_out2_valid;      // vic_csr:out2_valid -> vic_priority:in2_valid
	wire  [18:0] vic_csr_out2_data;       // vic_csr:out2_data -> vic_priority:in2_data
	wire         vic_csr_out3_valid;      // vic_csr:out3_valid -> vic_priority:in3_valid
	wire  [18:0] vic_csr_out3_data;       // vic_csr:out3_data -> vic_priority:in3_data
	wire         vic_csr_out4_valid;      // vic_csr:out4_valid -> vic_priority:in4_valid
	wire  [18:0] vic_csr_out4_data;       // vic_csr:out4_data -> vic_priority:in4_data
	wire         vic_csr_out5_valid;      // vic_csr:out5_valid -> vic_priority:in5_valid
	wire  [18:0] vic_csr_out5_data;       // vic_csr:out5_data -> vic_priority:in5_data
	wire         vic_csr_out6_valid;      // vic_csr:out6_valid -> vic_priority:in6_valid
	wire  [18:0] vic_csr_out6_data;       // vic_csr:out6_data -> vic_priority:in6_data
	wire         vic_csr_out7_valid;      // vic_csr:out7_valid -> vic_priority:in7_valid
	wire  [18:0] vic_csr_out7_data;       // vic_csr:out7_data -> vic_priority:in7_data
	wire         vic_priority_out_valid;  // vic_priority:pri_valid -> vic_vector:in_valid
	wire  [18:0] vic_priority_out_data;   // vic_priority:pri_data -> vic_vector:in_data
	wire         vic_csr_control_valid;   // vic_csr:control_valid -> vic_vector:control_valid
	wire  [34:0] vic_csr_control_data;    // vic_csr:control_data -> vic_vector:control_data
	wire         vic_vector_status_valid; // vic_vector:status_valid -> vic_csr:status_valid
	wire  [37:0] vic_vector_status_data;  // vic_vector:status_data -> vic_csr:status_data

	altera_vic_csr #(
		.NUMBER_OF_INT_PORTS (8),
		.RRS_WIDTH           (6),
		.RIL_WIDTH           (4),
		.DAISY_CHAIN_ENABLE  (0)
	) vic_csr (
		.inr_i1_irq         (irq_input_irq),                                     //        i1.irq
		.avm_m1_read        (dummy_master_read),                                 //        m1.read
		.avm_m1_write       (dummy_master_write),                                //          .write
		.avm_m1_waitrequest (dummy_master_waitrequest),                          //          .waitrequest
		.avm_m1_address     (dummy_master_address),                              //          .address
		.avm_m1_writedata   (dummy_master_writedata),                            //          .writedata
		.avm_m1_readdata    (dummy_master_readdata),                             //          .readdata
		.avs_s1_read        (csr_access_read),                                   //        s1.read
		.avs_s1_write       (csr_access_write),                                  //          .write
		.avs_s1_address     (csr_access_address),                                //          .address
		.avs_s1_writedata   (csr_access_writedata),                              //          .writedata
		.avs_s1_readdata    (csr_access_readdata),                               //          .readdata
		.out0_valid         (vic_csr_out0_valid),                                //      out0.valid
		.out0_data          (vic_csr_out0_data),                                 //          .data
		.out1_valid         (vic_csr_out1_valid),                                //      out1.valid
		.out1_data          (vic_csr_out1_data),                                 //          .data
		.out2_valid         (vic_csr_out2_valid),                                //      out2.valid
		.out2_data          (vic_csr_out2_data),                                 //          .data
		.out3_valid         (vic_csr_out3_valid),                                //      out3.valid
		.out3_data          (vic_csr_out3_data),                                 //          .data
		.out4_valid         (vic_csr_out4_valid),                                //      out4.valid
		.out4_data          (vic_csr_out4_data),                                 //          .data
		.out5_valid         (vic_csr_out5_valid),                                //      out5.valid
		.out5_data          (vic_csr_out5_data),                                 //          .data
		.out6_valid         (vic_csr_out6_valid),                                //      out6.valid
		.out6_data          (vic_csr_out6_data),                                 //          .data
		.out7_valid         (vic_csr_out7_valid),                                //      out7.valid
		.out7_data          (vic_csr_out7_data),                                 //          .data
		.control_valid      (vic_csr_control_valid),                             //   control.valid
		.control_data       (vic_csr_control_data),                              //          .data
		.status_valid       (vic_vector_status_valid),                           //    status.valid
		.status_data        (vic_vector_status_data),                            //          .data
		.clk                (clk_clk),                                           //       clk.clk
		.reset_n            (~clk_reset_reset),                                  // clk_reset.reset_n
		.dc_in_valid        (1'b0),                                              // (terminated)
		.dc_in_data         (45'b000000000000000000000000000000000000000000000), // (terminated)
		.dc_out_valid       (),                                                  // (terminated)
		.dc_out_data        (),                                                  // (terminated)
		.out8_valid         (),                                                  // (terminated)
		.out8_data          (),                                                  // (terminated)
		.out9_valid         (),                                                  // (terminated)
		.out9_data          (),                                                  // (terminated)
		.out10_valid        (),                                                  // (terminated)
		.out10_data         (),                                                  // (terminated)
		.out11_valid        (),                                                  // (terminated)
		.out11_data         (),                                                  // (terminated)
		.out12_valid        (),                                                  // (terminated)
		.out12_data         (),                                                  // (terminated)
		.out13_valid        (),                                                  // (terminated)
		.out13_data         (),                                                  // (terminated)
		.out14_valid        (),                                                  // (terminated)
		.out14_data         (),                                                  // (terminated)
		.out15_valid        (),                                                  // (terminated)
		.out15_data         (),                                                  // (terminated)
		.out16_valid        (),                                                  // (terminated)
		.out16_data         (),                                                  // (terminated)
		.out17_valid        (),                                                  // (terminated)
		.out17_data         (),                                                  // (terminated)
		.out18_valid        (),                                                  // (terminated)
		.out18_data         (),                                                  // (terminated)
		.out19_valid        (),                                                  // (terminated)
		.out19_data         (),                                                  // (terminated)
		.out20_valid        (),                                                  // (terminated)
		.out20_data         (),                                                  // (terminated)
		.out21_valid        (),                                                  // (terminated)
		.out21_data         (),                                                  // (terminated)
		.out22_valid        (),                                                  // (terminated)
		.out22_data         (),                                                  // (terminated)
		.out23_valid        (),                                                  // (terminated)
		.out23_data         (),                                                  // (terminated)
		.out24_valid        (),                                                  // (terminated)
		.out24_data         (),                                                  // (terminated)
		.out25_valid        (),                                                  // (terminated)
		.out25_data         (),                                                  // (terminated)
		.out26_valid        (),                                                  // (terminated)
		.out26_data         (),                                                  // (terminated)
		.out27_valid        (),                                                  // (terminated)
		.out27_data         (),                                                  // (terminated)
		.out28_valid        (),                                                  // (terminated)
		.out28_data         (),                                                  // (terminated)
		.out29_valid        (),                                                  // (terminated)
		.out29_data         (),                                                  // (terminated)
		.out30_valid        (),                                                  // (terminated)
		.out30_data         (),                                                  // (terminated)
		.out31_valid        (),                                                  // (terminated)
		.out31_data         (),                                                  // (terminated)
		.out32_valid        (),                                                  // (terminated)
		.out32_data         ()                                                   // (terminated)
	);

	altera_vic_priority #(
		.NUMBER_OF_INT_PORTS (8),
		.PRIORITY_WIDTH      (4),
		.DATA_WIDTH          (19)
	) vic_priority (
		.clk        (clk_clk),                 //       clk.clk
		.reset_n    (~clk_reset_reset),        // clk_reset.reset_n
		.in0_valid  (vic_csr_out0_valid),      //       in0.valid
		.in0_data   (vic_csr_out0_data),       //          .data
		.in1_valid  (vic_csr_out1_valid),      //       in1.valid
		.in1_data   (vic_csr_out1_data),       //          .data
		.in2_valid  (vic_csr_out2_valid),      //       in2.valid
		.in2_data   (vic_csr_out2_data),       //          .data
		.in3_valid  (vic_csr_out3_valid),      //       in3.valid
		.in3_data   (vic_csr_out3_data),       //          .data
		.in4_valid  (vic_csr_out4_valid),      //       in4.valid
		.in4_data   (vic_csr_out4_data),       //          .data
		.in5_valid  (vic_csr_out5_valid),      //       in5.valid
		.in5_data   (vic_csr_out5_data),       //          .data
		.in6_valid  (vic_csr_out6_valid),      //       in6.valid
		.in6_data   (vic_csr_out6_data),       //          .data
		.in7_valid  (vic_csr_out7_valid),      //       in7.valid
		.in7_data   (vic_csr_out7_data),       //          .data
		.pri_valid  (vic_priority_out_valid),  //       out.valid
		.pri_data   (vic_priority_out_data),   //          .data
		.in8_valid  (1'b0),                    // (terminated)
		.in8_data   (19'b0000000000000000000), // (terminated)
		.in9_valid  (1'b0),                    // (terminated)
		.in9_data   (19'b0000000000000000000), // (terminated)
		.in10_valid (1'b0),                    // (terminated)
		.in10_data  (19'b0000000000000000000), // (terminated)
		.in11_valid (1'b0),                    // (terminated)
		.in11_data  (19'b0000000000000000000), // (terminated)
		.in12_valid (1'b0),                    // (terminated)
		.in12_data  (19'b0000000000000000000), // (terminated)
		.in13_valid (1'b0),                    // (terminated)
		.in13_data  (19'b0000000000000000000), // (terminated)
		.in14_valid (1'b0),                    // (terminated)
		.in14_data  (19'b0000000000000000000), // (terminated)
		.in15_valid (1'b0),                    // (terminated)
		.in15_data  (19'b0000000000000000000), // (terminated)
		.in16_valid (1'b0),                    // (terminated)
		.in16_data  (19'b0000000000000000000), // (terminated)
		.in17_valid (1'b0),                    // (terminated)
		.in17_data  (19'b0000000000000000000), // (terminated)
		.in18_valid (1'b0),                    // (terminated)
		.in18_data  (19'b0000000000000000000), // (terminated)
		.in19_valid (1'b0),                    // (terminated)
		.in19_data  (19'b0000000000000000000), // (terminated)
		.in20_valid (1'b0),                    // (terminated)
		.in20_data  (19'b0000000000000000000), // (terminated)
		.in21_valid (1'b0),                    // (terminated)
		.in21_data  (19'b0000000000000000000), // (terminated)
		.in22_valid (1'b0),                    // (terminated)
		.in22_data  (19'b0000000000000000000), // (terminated)
		.in23_valid (1'b0),                    // (terminated)
		.in23_data  (19'b0000000000000000000), // (terminated)
		.in24_valid (1'b0),                    // (terminated)
		.in24_data  (19'b0000000000000000000), // (terminated)
		.in25_valid (1'b0),                    // (terminated)
		.in25_data  (19'b0000000000000000000), // (terminated)
		.in26_valid (1'b0),                    // (terminated)
		.in26_data  (19'b0000000000000000000), // (terminated)
		.in27_valid (1'b0),                    // (terminated)
		.in27_data  (19'b0000000000000000000), // (terminated)
		.in28_valid (1'b0),                    // (terminated)
		.in28_data  (19'b0000000000000000000), // (terminated)
		.in29_valid (1'b0),                    // (terminated)
		.in29_data  (19'b0000000000000000000), // (terminated)
		.in30_valid (1'b0),                    // (terminated)
		.in30_data  (19'b0000000000000000000), // (terminated)
		.in31_valid (1'b0),                    // (terminated)
		.in31_data  (19'b0000000000000000000), // (terminated)
		.in32_valid (1'b0),                    // (terminated)
		.in32_data  (19'b0000000000000000000)  // (terminated)
	);

	altera_vic_vector #(
		.DAISY_CHAIN_ENABLE (0)
	) vic_vector (
		.clk           (clk_clk),                              //       clk.clk
		.reset_n       (~clk_reset_reset),                     // clk_reset.reset_n
		.in_valid      (vic_priority_out_valid),               //        in.valid
		.in_data       (vic_priority_out_data),                //          .data
		.control_valid (vic_csr_control_valid),                //   control.valid
		.control_data  (vic_csr_control_data),                 //          .data
		.status_valid  (vic_vector_status_valid),              //    status.valid
		.status_data   (vic_vector_status_data),               //          .data
		.out_valid     (interrupt_controller_out_valid),       //       out.valid
		.out_data      (interrupt_controller_out_data),        //          .data
		.dc_valid      (1'b0),                                 // (terminated)
		.dc_data       (32'b00000000000000000000000000000000)  // (terminated)
	);

endmodule
