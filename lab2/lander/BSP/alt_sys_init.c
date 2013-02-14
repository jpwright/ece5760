/*
 * alt_sys_init.c - HAL initialization source
 *
 * Machine generated for CPU 'CPU' in SOPC Builder design 'nios_system'
 * SOPC Builder design path: C:/ece5760/lab2/lander/DE2_Media_Computer/verilog/nios_system.sopcinfo
 *
 * Generated: Thu Feb 14 12:46:18 EST 2013
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#include "system.h"
#include "sys/alt_irq.h"
#include "sys/alt_sys_init.h"

#include <stddef.h>

/*
 * Device headers
 */

#include "altera_nios2_irq.h"
#include "altera_avalon_jtag_uart.h"
#include "altera_avalon_sysid.h"
#include "altera_avalon_timer.h"
#include "altera_up_avalon_audio.h"
#include "altera_up_avalon_audio_and_video_config.h"
#include "altera_up_avalon_character_lcd.h"
#include "altera_up_avalon_parallel_port.h"
#include "altera_up_avalon_ps2.h"
#include "altera_up_avalon_rs232.h"
#include "altera_up_avalon_video_character_buffer_with_dma.h"
#include "altera_up_avalon_video_pixel_buffer_dma.h"

/*
 * Allocate the device storage
 */

ALTERA_NIOS2_IRQ_INSTANCE ( CPU, CPU);
ALTERA_AVALON_JTAG_UART_INSTANCE ( JTAG_UART, JTAG_UART);
ALTERA_AVALON_SYSID_INSTANCE ( SYSID, sysid);
ALTERA_AVALON_TIMER_INSTANCE ( INTERVAL_TIMER, Interval_Timer);
ALTERA_UP_AVALON_AUDIO_AND_VIDEO_CONFIG_INSTANCE ( AV_CONFIG, AV_Config);
ALTERA_UP_AVALON_AUDIO_INSTANCE ( AUDIO, Audio);
ALTERA_UP_AVALON_CHARACTER_LCD_INSTANCE ( CHAR_LCD_16X2, Char_LCD_16x2);
ALTERA_UP_AVALON_PARALLEL_PORT_INSTANCE ( EXPANSION_JP1, Expansion_JP1);
ALTERA_UP_AVALON_PARALLEL_PORT_INSTANCE ( EXPANSION_JP2, Expansion_JP2);
ALTERA_UP_AVALON_PARALLEL_PORT_INSTANCE ( GREEN_LEDS, Green_LEDs);
ALTERA_UP_AVALON_PARALLEL_PORT_INSTANCE ( HEX3_HEX0, HEX3_HEX0);
ALTERA_UP_AVALON_PARALLEL_PORT_INSTANCE ( HEX7_HEX4, HEX7_HEX4);
ALTERA_UP_AVALON_PARALLEL_PORT_INSTANCE ( PUSHBUTTONS, Pushbuttons);
ALTERA_UP_AVALON_PARALLEL_PORT_INSTANCE ( RED_LEDS, Red_LEDs);
ALTERA_UP_AVALON_PARALLEL_PORT_INSTANCE ( SLIDER_SWITCHES, Slider_Switches);
ALTERA_UP_AVALON_PS2_INSTANCE ( PS2_PORT, PS2_Port);
ALTERA_UP_AVALON_RS232_INSTANCE ( SERIAL_PORT, Serial_Port);
ALTERA_UP_AVALON_VIDEO_CHARACTER_BUFFER_WITH_DMA_INSTANCE ( VGA_CHAR_BUFFER, VGA_Char_Buffer);
ALTERA_UP_AVALON_VIDEO_PIXEL_BUFFER_DMA_INSTANCE ( VGA_PIXEL_BUFFER, VGA_Pixel_Buffer);

/*
 * Initialize the interrupt controller devices
 * and then enable interrupts in the CPU.
 * Called before alt_sys_init().
 * The "base" parameter is ignored and only
 * present for backwards-compatibility.
 */

void alt_irq_init ( const void* base )
{
    ALTERA_NIOS2_IRQ_INIT ( CPU, CPU);
    alt_irq_cpu_enable_interrupts();
}

/*
 * Initialize the non-interrupt controller devices.
 * Called after alt_irq_init().
 */

void alt_sys_init( void )
{
    ALTERA_AVALON_TIMER_INIT ( INTERVAL_TIMER, Interval_Timer);
    ALTERA_AVALON_JTAG_UART_INIT ( JTAG_UART, JTAG_UART);
    ALTERA_AVALON_SYSID_INIT ( SYSID, sysid);
    ALTERA_UP_AVALON_AUDIO_AND_VIDEO_CONFIG_INIT ( AV_CONFIG, AV_Config);
    ALTERA_UP_AVALON_AUDIO_INIT ( AUDIO, Audio);
    ALTERA_UP_AVALON_CHARACTER_LCD_INIT ( CHAR_LCD_16X2, Char_LCD_16x2);
    ALTERA_UP_AVALON_PARALLEL_PORT_INIT ( EXPANSION_JP1, Expansion_JP1);
    ALTERA_UP_AVALON_PARALLEL_PORT_INIT ( EXPANSION_JP2, Expansion_JP2);
    ALTERA_UP_AVALON_PARALLEL_PORT_INIT ( GREEN_LEDS, Green_LEDs);
    ALTERA_UP_AVALON_PARALLEL_PORT_INIT ( HEX3_HEX0, HEX3_HEX0);
    ALTERA_UP_AVALON_PARALLEL_PORT_INIT ( HEX7_HEX4, HEX7_HEX4);
    ALTERA_UP_AVALON_PARALLEL_PORT_INIT ( PUSHBUTTONS, Pushbuttons);
    ALTERA_UP_AVALON_PARALLEL_PORT_INIT ( RED_LEDS, Red_LEDs);
    ALTERA_UP_AVALON_PARALLEL_PORT_INIT ( SLIDER_SWITCHES, Slider_Switches);
    ALTERA_UP_AVALON_PS2_INIT ( PS2_PORT, PS2_Port);
    ALTERA_UP_AVALON_RS232_INIT ( SERIAL_PORT, Serial_Port);
    ALTERA_UP_AVALON_VIDEO_CHARACTER_BUFFER_WITH_DMA_INIT ( VGA_CHAR_BUFFER, VGA_Char_Buffer);
    ALTERA_UP_AVALON_VIDEO_PIXEL_BUFFER_DMA_INIT ( VGA_PIXEL_BUFFER, VGA_Pixel_Buffer);
}
