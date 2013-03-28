// cpu_1_altera_nios_custom_instr_interrupt_vector_inst.v

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
module cpu_1_altera_nios_custom_instr_interrupt_vector_inst (
		input  wire        estatus,  // interrupt_vector.estatus
		input  wire [31:0] ipending, //                 .ipending
		output wire [31:0] result    //                 .result
	);

	interrupt_vector_qsys cpu_1_altera_nios_custom_instr_interrupt_vector_inst (
		.estatus  (estatus),  // interrupt_vector.estatus
		.ipending (ipending), //                 .ipending
		.result   (result)    //                 .result
	);

endmodule
