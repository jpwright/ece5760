project_open -current_revision NiosII_stratix_1s10_standard.qpf

# Analysis & Synthesis Assignments
# ================================
set_global_assignment -name EDA_DESIGN_ENTRY_SYNTHESIS_TOOL "<None>"
set_global_assignment -name TOP_LEVEL_ENTITY NiosII_stratix_1s10_standard

# Fitter Assignments
# ==================
set_global_assignment -name STRATIX_CONFIGURATION_SCHEME "FAST PASSIVE PARALLEL"
set_global_assignment -name RESERVE_ALL_UNUSED_PINS "AS INPUT TRI-STATED"
set_global_assignment -name RESERVE_DATA0_AFTER_CONFIGURATION "USE AS REGULAR IO"
set_global_assignment -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON

# Assembler Assignments
# =====================
set_global_assignment -name GENERATE_TTF_FILE ON
set_global_assignment -name RESERVE_ALL_UNUSED_PINS_NO_OUTPUT_GND "AS INPUT TRI-STATED"

set_global_assignment -name FMAX_REQUIREMENT "50 MHz"
set_global_assignment -name ERROR_CHECK_FREQUENCY_DIVISOR 1

project_close
