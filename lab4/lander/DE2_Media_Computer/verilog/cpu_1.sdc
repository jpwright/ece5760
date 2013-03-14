# Legal Notice: (C)2013 Altera Corporation. All rights reserved.  Your
# use of Altera Corporation's design tools, logic functions and other
# software and tools, and its AMPP partner logic functions, and any
# output files any of the foregoing (including device programming or
# simulation files), and any associated documentation or information are
# expressly subject to the terms and conditions of the Altera Program
# License Subscription Agreement or other applicable license agreement,
# including, without limitation, that your use is for the sole purpose
# of programming logic devices manufactured by Altera and sold by Altera
# or its authorized distributors.  Please refer to the applicable
# agreement for further details.

#**************************************************************
# Timequest JTAG clock definition
#   Uncommenting the following lines will define the JTAG
#   clock in TimeQuest Timing Analyzer
#**************************************************************

#create_clock -period 10MHz {altera_internal_jtag|tckutap}
#set_clock_groups -asynchronous -group {altera_internal_jtag|tckutap}

#**************************************************************
# Set TCL Path Variables 
#**************************************************************

set 	cpu_1 	cpu_1:*
set 	cpu_1_oci 	cpu_1_nios2_oci:the_cpu_1_nios2_oci
set 	cpu_1_oci_break 	cpu_1_nios2_oci_break:the_cpu_1_nios2_oci_break
set 	cpu_1_ocimem 	cpu_1_nios2_ocimem:the_cpu_1_nios2_ocimem
set 	cpu_1_oci_debug 	cpu_1_nios2_oci_debug:the_cpu_1_nios2_oci_debug
set 	cpu_1_wrapper 	cpu_1_jtag_debug_module_wrapper:the_cpu_1_jtag_debug_module_wrapper
set 	cpu_1_jtag_tck 	cpu_1_jtag_debug_module_tck:the_cpu_1_jtag_debug_module_tck
set 	cpu_1_jtag_sysclk 	cpu_1_jtag_debug_module_sysclk:the_cpu_1_jtag_debug_module_sysclk
set 	cpu_1_oci_path 	 [format "%s|%s" $cpu_1 $cpu_1_oci]
set 	cpu_1_oci_break_path 	 [format "%s|%s" $cpu_1_oci_path $cpu_1_oci_break]
set 	cpu_1_ocimem_path 	 [format "%s|%s" $cpu_1_oci_path $cpu_1_ocimem]
set 	cpu_1_oci_debug_path 	 [format "%s|%s" $cpu_1_oci_path $cpu_1_oci_debug]
set 	cpu_1_jtag_tck_path 	 [format "%s|%s|%s" $cpu_1_oci_path $cpu_1_wrapper $cpu_1_jtag_tck]
set 	cpu_1_jtag_sysclk_path 	 [format "%s|%s|%s" $cpu_1_oci_path $cpu_1_wrapper $cpu_1_jtag_sysclk]
set 	cpu_1_jtag_sr 	 [format "%s|*sr" $cpu_1_jtag_tck_path]

#**************************************************************
# Set False Paths
#**************************************************************

set_false_path -from [get_keepers *$cpu_1_oci_break_path|break_readreg*] -to [get_keepers *$cpu_1_jtag_sr*]
set_false_path -from [get_keepers *$cpu_1_oci_debug_path|*resetlatch]     -to [get_keepers *$cpu_1_jtag_sr[33]]
set_false_path -from [get_keepers *$cpu_1_oci_debug_path|monitor_ready]  -to [get_keepers *$cpu_1_jtag_sr[0]]
set_false_path -from [get_keepers *$cpu_1_oci_debug_path|monitor_error]  -to [get_keepers *$cpu_1_jtag_sr[34]]
set_false_path -from [get_keepers *$cpu_1_ocimem_path|*MonDReg*] -to [get_keepers *$cpu_1_jtag_sr*]
set_false_path -from *$cpu_1_jtag_sr*    -to *$cpu_1_jtag_sysclk_path|*jdo*
set_false_path -from sld_hub:*|irf_reg* -to *$cpu_1_jtag_sysclk_path|ir*
set_false_path -from sld_hub:*|sld_shadow_jsm:shadow_jsm|state[1] -to *$cpu_1_oci_debug_path|monitor_go
