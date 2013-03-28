/* system.h
 *
 * Machine generated for a CPU named "cpu" as defined in:
 * c:\work\standard\software\hello_world_0_syslib\..\..\NiosII_stratix_1s10_standard.ptf
 *
 * Generated: 2009-10-18 15:03:34.527
 *
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/*

DO NOT MODIFY THIS FILE

   Changing this file will have subtle consequences
   which will almost certainly lead to a nonfunctioning
   system. If you do modify this file, be aware that your
   changes will be overwritten and lost when this file
   is generated again.

DO NOT MODIFY THIS FILE

*/

/******************************************************************************
*                                                                             *
* License Agreement                                                           *
*                                                                             *
* Copyright (c) 2003 Altera Corporation, San Jose, California, USA.           *
* All rights reserved.                                                        *
*                                                                             *
* Permission is hereby granted, free of charge, to any person obtaining a     *
* copy of this software and associated documentation files (the "Software"),  *
* to deal in the Software without restriction, including without limitation   *
* the rights to use, copy, modify, merge, publish, distribute, sublicense,    *
* and/or sell copies of the Software, and to permit persons to whom the       *
* Software is furnished to do so, subject to the following conditions:        *
*                                                                             *
* The above copyright notice and this permission notice shall be included in  *
* all copies or substantial portions of the Software.                         *
*                                                                             *
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  *
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,    *
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE *
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER      *
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING     *
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER         *
* DEALINGS IN THE SOFTWARE.                                                   *
*                                                                             *
* This agreement shall be governed in all respects by the laws of the State   *
* of California and by the laws of the United States of America.              *
*                                                                             *
******************************************************************************/

/*
 * system configuration
 *
 */

#define ALT_SYSTEM_NAME "NiosII_stratix_1s10_standard"
#define ALT_CPU_NAME "cpu"
#define ALT_CPU_ARCHITECTURE "altera_nios2"
#define ALT_DEVICE_FAMILY "STRATIX"
#define ALT_STDIN "/dev/jtag_uart"
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN_BASE 0x021208b0
#define ALT_STDIN_DEV jtag_uart
#define ALT_STDIN_PRESENT
#define ALT_STDOUT "/dev/jtag_uart"
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT_BASE 0x021208b0
#define ALT_STDOUT_DEV jtag_uart
#define ALT_STDOUT_PRESENT
#define ALT_STDERR "/dev/jtag_uart"
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDERR_BASE 0x021208b0
#define ALT_STDERR_DEV jtag_uart
#define ALT_STDERR_PRESENT
#define ALT_CPU_FREQ 50000000
#define ALT_IRQ_BASE NULL

/*
 * processor configuration
 *
 */

#define NIOS2_CPU_IMPLEMENTATION "small"
#define NIOS2_BIG_ENDIAN 0

#define NIOS2_ICACHE_SIZE 4096
#define NIOS2_DCACHE_SIZE 0
#define NIOS2_ICACHE_LINE_SIZE 32
#define NIOS2_ICACHE_LINE_SIZE_LOG2 5
#define NIOS2_DCACHE_LINE_SIZE 0
#define NIOS2_DCACHE_LINE_SIZE_LOG2 0
#define NIOS2_FLUSHDA_SUPPORTED

#define NIOS2_EXCEPTION_ADDR 0x01000020
#define NIOS2_RESET_ADDR 0x00000000
#define NIOS2_BREAK_ADDR 0x02120020

#define NIOS2_HAS_DEBUG_STUB

#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0

/*
 * A define for each class of peripheral
 *
 */

#define __ALTERA_AVALON_PLL
#define __ALTERA_AVALON_TIMER
#define __ALTERA_AVALON_SYSID
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_TRI_STATE_BRIDGE
#define __ALTERA_AVALON_CFI_FLASH
#define __ALTERA_NIOS_DEV_KIT_STRATIX_EDITION_SRAM2
#define __ALTERA_AVALON_LAN91C111
#define __ALTERA_AVALON_LCD_16207
#define __ALTERA_AVALON_UART
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_NEW_SDRAM_CONTROLLER

/*
 * pll configuration
 *
 */

#define PLL_NAME "/dev/pll"
#define PLL_TYPE "altera_avalon_pll"
#define PLL_BASE 0x00800020
#define PLL_SPAN 32
#define PLL_ARESET "None"
#define PLL_PFDENA "None"
#define PLL_LOCKED "None"
#define PLL_PLLENA "None"
#define PLL_SCANCLK "None"
#define PLL_SCANDATA "None"
#define PLL_SCANREAD "None"
#define PLL_SCANWRITE "None"
#define PLL_SCANCLKENA "None"
#define PLL_SCANACLR "None"
#define PLL_SCANDATAOUT "None"
#define PLL_SCANDONE "None"
#define PLL_CONFIGUPDATE "None"
#define PLL_PHASECOUNTERSELECT "None"
#define PLL_PHASEDONE "None"
#define PLL_PHASEUPDOWN "None"
#define PLL_PHASESTEP "None"
#define PLL_CONFIG_DONE 0
#define ALT_MODULE_CLASS_pll altera_avalon_pll

/*
 * sys_clk_timer configuration
 *
 */

#define SYS_CLK_TIMER_NAME "/dev/sys_clk_timer"
#define SYS_CLK_TIMER_TYPE "altera_avalon_timer"
#define SYS_CLK_TIMER_BASE 0x02120800
#define SYS_CLK_TIMER_SPAN 32
#define SYS_CLK_TIMER_IRQ 0
#define SYS_CLK_TIMER_ALWAYS_RUN 0
#define SYS_CLK_TIMER_FIXED_PERIOD 0
#define SYS_CLK_TIMER_SNAPSHOT 1
#define SYS_CLK_TIMER_PERIOD 10.0
#define SYS_CLK_TIMER_PERIOD_UNITS "ms"
#define SYS_CLK_TIMER_RESET_OUTPUT 0
#define SYS_CLK_TIMER_TIMEOUT_PULSE_OUTPUT 0
#define SYS_CLK_TIMER_LOAD_VALUE 499999
#define SYS_CLK_TIMER_COUNTER_SIZE 32
#define SYS_CLK_TIMER_MULT 0.0010
#define SYS_CLK_TIMER_TICKS_PER_SEC 100
#define SYS_CLK_TIMER_FREQ 50000000
#define ALT_MODULE_CLASS_sys_clk_timer altera_avalon_timer

/*
 * sysid configuration
 *
 */

#define SYSID_NAME "/dev/sysid"
#define SYSID_TYPE "altera_avalon_sysid"
#define SYSID_BASE 0x021208b8
#define SYSID_SPAN 8
#define SYSID_ID 765005573u
#define SYSID_TIMESTAMP 1255892058u
#define SYSID_REGENERATE_VALUES 0
#define ALT_MODULE_CLASS_sysid altera_avalon_sysid

/*
 * reconfig_request_pio configuration
 *
 */

#define RECONFIG_REQUEST_PIO_NAME "/dev/reconfig_request_pio"
#define RECONFIG_REQUEST_PIO_TYPE "altera_avalon_pio"
#define RECONFIG_REQUEST_PIO_BASE 0x021208a0
#define RECONFIG_REQUEST_PIO_SPAN 16
#define RECONFIG_REQUEST_PIO_DO_TEST_BENCH_WIRING 0
#define RECONFIG_REQUEST_PIO_DRIVEN_SIM_VALUE 0
#define RECONFIG_REQUEST_PIO_HAS_TRI 1
#define RECONFIG_REQUEST_PIO_HAS_OUT 0
#define RECONFIG_REQUEST_PIO_HAS_IN 0
#define RECONFIG_REQUEST_PIO_CAPTURE 0
#define RECONFIG_REQUEST_PIO_DATA_WIDTH 1
#define RECONFIG_REQUEST_PIO_RESET_VALUE 0
#define RECONFIG_REQUEST_PIO_EDGE_TYPE "NONE"
#define RECONFIG_REQUEST_PIO_IRQ_TYPE "NONE"
#define RECONFIG_REQUEST_PIO_BIT_CLEARING_EDGE_REGISTER 0
#define RECONFIG_REQUEST_PIO_BIT_MODIFYING_OUTPUT_REGISTER 0
#define RECONFIG_REQUEST_PIO_FREQ 50000000
#define ALT_MODULE_CLASS_reconfig_request_pio altera_avalon_pio

/*
 * jtag_uart configuration
 *
 */

#define JTAG_UART_NAME "/dev/jtag_uart"
#define JTAG_UART_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_BASE 0x021208b0
#define JTAG_UART_SPAN 8
#define JTAG_UART_IRQ 1
#define JTAG_UART_WRITE_DEPTH 64
#define JTAG_UART_READ_DEPTH 64
#define JTAG_UART_WRITE_THRESHOLD 8
#define JTAG_UART_READ_THRESHOLD 8
#define JTAG_UART_READ_CHAR_STREAM ""
#define JTAG_UART_SHOWASCII 1
#define JTAG_UART_READ_LE 0
#define JTAG_UART_WRITE_LE 0
#define JTAG_UART_ALTERA_SHOW_UNRELEASED_JTAG_UART_FEATURES 0
#define ALT_MODULE_CLASS_jtag_uart altera_avalon_jtag_uart

/*
 * ext_ram_bus configuration
 *
 */

#define EXT_RAM_BUS_NAME "/dev/ext_ram_bus"
#define EXT_RAM_BUS_TYPE "altera_avalon_tri_state_bridge"
#define ALT_MODULE_CLASS_ext_ram_bus altera_avalon_tri_state_bridge

/*
 * high_res_timer configuration
 *
 */

#define HIGH_RES_TIMER_NAME "/dev/high_res_timer"
#define HIGH_RES_TIMER_TYPE "altera_avalon_timer"
#define HIGH_RES_TIMER_BASE 0x02120820
#define HIGH_RES_TIMER_SPAN 32
#define HIGH_RES_TIMER_IRQ 3
#define HIGH_RES_TIMER_ALWAYS_RUN 0
#define HIGH_RES_TIMER_FIXED_PERIOD 0
#define HIGH_RES_TIMER_SNAPSHOT 1
#define HIGH_RES_TIMER_PERIOD 10.0
#define HIGH_RES_TIMER_PERIOD_UNITS "us"
#define HIGH_RES_TIMER_RESET_OUTPUT 0
#define HIGH_RES_TIMER_TIMEOUT_PULSE_OUTPUT 0
#define HIGH_RES_TIMER_LOAD_VALUE 499
#define HIGH_RES_TIMER_COUNTER_SIZE 32
#define HIGH_RES_TIMER_MULT "1.0E-6"
#define HIGH_RES_TIMER_TICKS_PER_SEC 100000
#define HIGH_RES_TIMER_FREQ 50000000
#define ALT_MODULE_CLASS_high_res_timer altera_avalon_timer

/*
 * ext_flash configuration
 *
 */

#define EXT_FLASH_NAME "/dev/ext_flash"
#define EXT_FLASH_TYPE "altera_avalon_cfi_flash"
#define EXT_FLASH_BASE 0x00000000
#define EXT_FLASH_SPAN 8388608
#define EXT_FLASH_SETUP_VALUE 40
#define EXT_FLASH_WAIT_VALUE 160
#define EXT_FLASH_HOLD_VALUE 40
#define EXT_FLASH_TIMING_UNITS "ns"
#define EXT_FLASH_UNIT_MULTIPLIER 1
#define EXT_FLASH_SIZE 8388608
#define ALT_MODULE_CLASS_ext_flash altera_avalon_cfi_flash

/*
 * ext_ram configuration
 *
 */

#define EXT_RAM_NAME "/dev/ext_ram"
#define EXT_RAM_TYPE "altera_nios_dev_kit_stratix_edition_sram2"
#define EXT_RAM_BASE 0x02000000
#define EXT_RAM_SPAN 1048576
#define EXT_RAM_SRAM_MEMORY_SIZE 1048576
#define EXT_RAM_SRAM_MEMORY_UNITS 1
#define EXT_RAM_SRAM_DATA_WIDTH 32
#define EXT_RAM_SIMULATION_MODEL_NUM_LANES 4
#define ALT_MODULE_CLASS_ext_ram altera_nios_dev_kit_stratix_edition_sram2

/*
 * lan91c111 configuration
 *
 */

#define LAN91C111_NAME "/dev/lan91c111"
#define LAN91C111_TYPE "altera_avalon_lan91c111"
#define LAN91C111_BASE 0x02110000
#define LAN91C111_SPAN 65536
#define LAN91C111_IRQ 6
#define LAN91C111_IS_ETHERNET_MAC 1
#define LAN91C111_LAN91C111_REGISTERS_OFFSET 768
#define LAN91C111_LAN91C111_DATA_BUS_WIDTH 32
#define ALT_MODULE_CLASS_lan91c111 altera_avalon_lan91c111

/*
 * lcd_display configuration
 *
 */

#define LCD_DISPLAY_NAME "/dev/lcd_display"
#define LCD_DISPLAY_TYPE "altera_avalon_lcd_16207"
#define LCD_DISPLAY_BASE 0x02120880
#define LCD_DISPLAY_SPAN 16
#define ALT_MODULE_CLASS_lcd_display altera_avalon_lcd_16207

/*
 * uart1 configuration
 *
 */

#define UART1_NAME "/dev/uart1"
#define UART1_TYPE "altera_avalon_uart"
#define UART1_BASE 0x02120840
#define UART1_SPAN 32
#define UART1_IRQ 4
#define UART1_BAUD 115200
#define UART1_DATA_BITS 8
#define UART1_FIXED_BAUD 1
#define UART1_PARITY 'N'
#define UART1_STOP_BITS 1
#define UART1_SYNC_REG_DEPTH 2
#define UART1_USE_CTS_RTS 0
#define UART1_USE_EOP_REGISTER 0
#define UART1_SIM_TRUE_BAUD 0
#define UART1_SIM_CHAR_STREAM ""
#define UART1_FREQ 50000000
#define ALT_MODULE_CLASS_uart1 altera_avalon_uart

/*
 * button_pio configuration
 *
 */

#define BUTTON_PIO_NAME "/dev/button_pio"
#define BUTTON_PIO_TYPE "altera_avalon_pio"
#define BUTTON_PIO_BASE 0x02120860
#define BUTTON_PIO_SPAN 16
#define BUTTON_PIO_IRQ 2
#define BUTTON_PIO_DO_TEST_BENCH_WIRING 1
#define BUTTON_PIO_DRIVEN_SIM_VALUE 15
#define BUTTON_PIO_HAS_TRI 0
#define BUTTON_PIO_HAS_OUT 0
#define BUTTON_PIO_HAS_IN 1
#define BUTTON_PIO_CAPTURE 1
#define BUTTON_PIO_DATA_WIDTH 4
#define BUTTON_PIO_RESET_VALUE 0
#define BUTTON_PIO_EDGE_TYPE "ANY"
#define BUTTON_PIO_IRQ_TYPE "EDGE"
#define BUTTON_PIO_BIT_CLEARING_EDGE_REGISTER 0
#define BUTTON_PIO_BIT_MODIFYING_OUTPUT_REGISTER 0
#define BUTTON_PIO_FREQ 50000000
#define ALT_MODULE_CLASS_button_pio altera_avalon_pio

/*
 * led_pio configuration
 *
 */

#define LED_PIO_NAME "/dev/led_pio"
#define LED_PIO_TYPE "altera_avalon_pio"
#define LED_PIO_BASE 0x02120870
#define LED_PIO_SPAN 16
#define LED_PIO_DO_TEST_BENCH_WIRING 0
#define LED_PIO_DRIVEN_SIM_VALUE 0
#define LED_PIO_HAS_TRI 0
#define LED_PIO_HAS_OUT 1
#define LED_PIO_HAS_IN 0
#define LED_PIO_CAPTURE 0
#define LED_PIO_DATA_WIDTH 8
#define LED_PIO_RESET_VALUE 0
#define LED_PIO_EDGE_TYPE "NONE"
#define LED_PIO_IRQ_TYPE "NONE"
#define LED_PIO_BIT_CLEARING_EDGE_REGISTER 0
#define LED_PIO_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LED_PIO_FREQ 50000000
#define ALT_MODULE_CLASS_led_pio altera_avalon_pio

/*
 * seven_seg_pio configuration
 *
 */

#define SEVEN_SEG_PIO_NAME "/dev/seven_seg_pio"
#define SEVEN_SEG_PIO_TYPE "altera_avalon_pio"
#define SEVEN_SEG_PIO_BASE 0x02120890
#define SEVEN_SEG_PIO_SPAN 16
#define SEVEN_SEG_PIO_DO_TEST_BENCH_WIRING 0
#define SEVEN_SEG_PIO_DRIVEN_SIM_VALUE 0
#define SEVEN_SEG_PIO_HAS_TRI 0
#define SEVEN_SEG_PIO_HAS_OUT 1
#define SEVEN_SEG_PIO_HAS_IN 0
#define SEVEN_SEG_PIO_CAPTURE 0
#define SEVEN_SEG_PIO_DATA_WIDTH 16
#define SEVEN_SEG_PIO_RESET_VALUE 0
#define SEVEN_SEG_PIO_EDGE_TYPE "NONE"
#define SEVEN_SEG_PIO_IRQ_TYPE "NONE"
#define SEVEN_SEG_PIO_BIT_CLEARING_EDGE_REGISTER 0
#define SEVEN_SEG_PIO_BIT_MODIFYING_OUTPUT_REGISTER 0
#define SEVEN_SEG_PIO_FREQ 50000000
#define ALT_MODULE_CLASS_seven_seg_pio altera_avalon_pio

/*
 * onchip_ram configuration
 *
 */

#define ONCHIP_RAM_NAME "/dev/onchip_ram"
#define ONCHIP_RAM_TYPE "altera_avalon_onchip_memory2"
#define ONCHIP_RAM_BASE 0x02100000
#define ONCHIP_RAM_SPAN 65536
#define ONCHIP_RAM_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define ONCHIP_RAM_RAM_BLOCK_TYPE "M-RAM"
#define ONCHIP_RAM_INIT_CONTENTS_FILE "onchip_ram"
#define ONCHIP_RAM_NON_DEFAULT_INIT_FILE_ENABLED 0
#define ONCHIP_RAM_GUI_RAM_BLOCK_TYPE "M-RAM"
#define ONCHIP_RAM_WRITEABLE 1
#define ONCHIP_RAM_DUAL_PORT 0
#define ONCHIP_RAM_SIZE_VALUE 65536
#define ONCHIP_RAM_SIZE_MULTIPLE 1
#define ONCHIP_RAM_USE_SHALLOW_MEM_BLOCKS 0
#define ONCHIP_RAM_INIT_MEM_CONTENT 0
#define ONCHIP_RAM_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define ONCHIP_RAM_INSTANCE_ID "NONE"
#define ONCHIP_RAM_READ_DURING_WRITE_MODE "DONT_CARE"
#define ONCHIP_RAM_IGNORE_AUTO_BLOCK_TYPE_ASSIGNMENT 1
#define ONCHIP_RAM_CONTENTS_INFO ""
#define ALT_MODULE_CLASS_onchip_ram altera_avalon_onchip_memory2

/*
 * sdram configuration
 *
 */

#define SDRAM_NAME "/dev/sdram"
#define SDRAM_TYPE "altera_avalon_new_sdram_controller"
#define SDRAM_BASE 0x01000000
#define SDRAM_SPAN 16777216
#define SDRAM_REGISTER_DATA_IN 1
#define SDRAM_SIM_MODEL_BASE 1
#define SDRAM_SDRAM_DATA_WIDTH 32
#define SDRAM_SDRAM_ADDR_WIDTH 12
#define SDRAM_SDRAM_ROW_WIDTH 12
#define SDRAM_SDRAM_COL_WIDTH 8
#define SDRAM_SDRAM_NUM_CHIPSELECTS 1
#define SDRAM_SDRAM_NUM_BANKS 4
#define SDRAM_REFRESH_PERIOD 15.625
#define SDRAM_POWERUP_DELAY 100.0
#define SDRAM_CAS_LATENCY 3
#define SDRAM_T_RFC 70.0
#define SDRAM_T_RP 20.0
#define SDRAM_T_MRD 3
#define SDRAM_T_RCD 20.0
#define SDRAM_T_AC 5.5
#define SDRAM_T_WR 14.0
#define SDRAM_INIT_REFRESH_COMMANDS 2
#define SDRAM_INIT_NOP_DELAY 0.0
#define SDRAM_SHARED_DATA 0
#define SDRAM_SDRAM_BANK_WIDTH 2
#define SDRAM_TRISTATE_BRIDGE_SLAVE ""
#define SDRAM_STARVATION_INDICATOR 0
#define SDRAM_IS_INITIALIZED 1
#define ALT_MODULE_CLASS_sdram altera_avalon_new_sdram_controller

/*
 * system library configuration
 *
 */

#define ALT_MAX_FD 32
#define ALT_SYS_CLK SYS_CLK_TIMER
#define ALT_TIMESTAMP_CLK none

/*
 * Devices associated with code sections.
 *
 */

#define ALT_TEXT_DEVICE       SDRAM
#define ALT_RODATA_DEVICE     SDRAM
#define ALT_RWDATA_DEVICE     SDRAM
#define ALT_EXCEPTIONS_DEVICE SDRAM
#define ALT_RESET_DEVICE      EXT_FLASH


#endif /* __SYSTEM_H_ */
