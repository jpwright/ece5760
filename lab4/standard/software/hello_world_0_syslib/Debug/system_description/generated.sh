#!/bin/sh
#
# generated.sh - shell script fragment - not very useful on its own
#
# Machine generated for a CPU named "cpu" as defined in:
# c:\work\standard\software\hello_world_0_syslib\..\..\NiosII_stratix_1s10_standard.ptf
#
# Generated: 2009-10-18 15:04:42.762

# DO NOT MODIFY THIS FILE
#
#   Changing this file will have subtle consequences
#   which will almost certainly lead to a nonfunctioning
#   system. If you do modify this file, be aware that your
#   changes will be overwritten and lost when this file
#   is generated again.
#
# DO NOT MODIFY THIS FILE

# This variable indicates where the PTF file for this design is located
ptf=c:\work\standard\software\hello_world_0_syslib\..\..\NiosII_stratix_1s10_standard.ptf

# This variable indicates whether there is a CPU debug core
nios2_debug_core=yes

# This variable indicates how to connect to the CPU debug core
nios2_instance=0

# This variable indicates the CPU module name
nios2_cpu_name=cpu

# These variables indicate what the System ID peripheral should hold
sidp=0x021208b8
id=765005573u
timestamp=1255892058u

# Include operating system specific parameters, if they are supplied.

if test -f /cygdrive/c/altera/72/nios2eds/components/altera_hal/build/os.sh ; then
   . /cygdrive/c/altera/72/nios2eds/components/altera_hal/build/os.sh
fi
