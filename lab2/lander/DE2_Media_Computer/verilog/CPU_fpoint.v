// CPU_fpoint.v

// This file was auto-generated as part of a SOPC Builder generate operation.
// If you edit it your changes will probably be lost.
// 
// The HDL file this wrapper is instantiating was not analysed successfully.
// This can cause problems with the wrapper not matching the child module.
// Please check that your hw.tcl file includes the following two commands:
// `set_module_property TOP_LEVEL_HDL_FILE` and
// `set_module_property TOP_LEVEL_HDL_MODULE`
// Please also check that the HDL file does not contain syntax errors.

`timescale 1 ps / 1 ps
module CPU_fpoint (
		input  wire        clk,    // s1.clk
		input  wire        clk_en, //   .clk_en
		input  wire [31:0] dataa,  //   .dataa
		input  wire [31:0] datab,  //   .datab
		input  wire [1:0]  n,      //   .n
		input  wire        reset,  //   .reset
		input  wire        start,  //   .start
		output wire        done,   //   .done
		output wire [31:0] result  //   .result
	);

	fpoint_wrapper #(
		.useDivider (1)
	) cpu_fpoint (
		.clk    (clk),    // s1.clk
		.clk_en (clk_en), //   .clk_en
		.dataa  (dataa),  //   .dataa
		.datab  (datab),  //   .datab
		.n      (n),      //   .n
		.reset  (reset),  //   .reset
		.start  (start),  //   .start
		.done   (done),   //   .done
		.result (result)  //   .result
	);

endmodule
