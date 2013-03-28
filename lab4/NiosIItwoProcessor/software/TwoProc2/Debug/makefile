# ********************************************************************** 
# 
# THIS IS AN AUTO-GENERATED FILE. DO NOT EDIT DIRECTLY
# 
# To change the settings in here:
# 		- Right click on the project
#		- Select "Properties" option
#       - Use property pages to set options. Details given below 
#
# ********************************************************************** 
 
# These flags can be set from C/C++ build property page -> nios2-elf-gcc -> General
CFLAGS = -DALT_DEBUG -O0 -g -Wall

ASFLAGS = -g

# These flags can be set from C/C++ build property page -> nios2-elf-gcc.linker -> General
LDFLAGS := 

LDDEPS +=\

LIBS := 

LIBS += -lm

RM := rm -rf

# This project
PROJECT := TwoProc2
# Location of this project
APP_DIR :=C:/DE2/NiosIItwoProcessor/software/TwoProc2

# Configuration for application project
# The configuration can be changed from C/C++ build property page -> Configuration drop-down box.
# If changed a new configuration folder (e.g. Release) is generated with all the generated and built files
APP_CONFIG := Debug


# Referenced system library & location. 
# These can be changed from App Options property page
SYSTEM_NAME := TwoProc2_syslib
SYSTEM_DIR := C:/DE2/NiosIItwoProcessor/software/TwoProc2_syslib

# Configuration for system library project
# The configuration can be changed from system library properties -> C/C++ build -> Configuration drop-down box.
# If changed a new configuration folder (e.g. Release) is generated with all the generated and built files
SYS_CONFIG := Debug

PTF := C:/DE2/NiosIItwoProcessor/TwoProc.ptf

# Change this setting from Window->Preferences->Nios II Run and Build Settings
DO_MAKE_OBJDUMP := 0

# Every subdirectory with source files must be described here
SUBDIRS := \
. \

# Include the makefiles for each source subdirectory
-include ${patsubst %, %/subdir.mk, $(SUBDIRS)}
MAKEFILE_LIST += $(patsubst %, %/subdir.mk, $(SUBDIRS))


# Include makefile for the OS we are building on as specified in system library project
APP_MAKEFILE := C:/altera/kits/nios2_60/components/altera_hal/build/app.mk
include $(APP_MAKEFILE)

