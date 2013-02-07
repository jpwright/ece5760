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

#ifndef __ALT_UP_AUDIO_VIDEO_CONFIG_REGS_H__
#define __ALT_UP_AUDIO_VIDEO_CONFIG_REGS_H__
#include <io.h>
#include <alt_types.h>

#define IOWR_ALT_UP_AV_CONFIG_ADDR(base, addr, data)  		\
        IOWR(base, addr, data)
/*
 * Control Register 
 */
#define ALT_UP_AV_CONFIG_CONTROL_REG	0

#define IOADDR_ALT_UP_AV_CONFIG_CONTROL(base)      			\
        __IO_CALC_ADDRESS_NATIVE(base, ALT_UP_AV_CONFIG_CONTROL_REG)
#define IORD_ALT_UP_AV_CONFIG_CONTROL(base)        			\
        IORD(base, ALT_UP_AV_CONFIG_CONTROL_REG)
#define IOWR_ALT_UP_AV_CONFIG_CONTROL(base, data)			\
        IOWR(base, ALT_UP_AV_CONFIG_CONTROL_REG, data)


#define IOWR_ALT_UP_AV_CONFIG_CONTROL_RESET(base)	  		\
        IOWR_8DIRECT(base, 0x0, 0x1)
#define IOWR_ALT_UP_AV_CONFIG_CONTROL_RIE_ENABLE(base) 		\
        IOWR_8DIRECT(base, 0x0, 0x2)
#define IOWR_ALT_UP_AV_CONFIG_CONTROL_RIE_DISABLE(base)		\
        IOWR_8DIRECT(base, 0x0, 0x0)
#define IOWR_ALT_UP_AV_CONFIG_CONTROL_DEVICE(base, data)	\
        IOWR_8DIRECT(base, 0x2, data)



#define ALT_UP_AV_CONFIG_CONTROL_RESET_MSK		(0x00000001)
#define ALT_UP_AV_CONFIG_CONTROL_RESET_OFST		(0)
#define ALT_UP_AV_CONFIG_CONTROL_RIE_MSK		(0x00000002)
#define ALT_UP_AV_CONFIG_CONTROL_RIE_OFST		(1)
#define ALT_UP_AV_CONFIG_CONTROL_DEVICE_MSK		(0x00FF0000)
#define ALT_UP_AV_CONFIG_CONTROL_DEVICE_OFST	(16)

#define ALT_UP_AV_CONFIG_CONTROL_VALID_MSK (ALT_UP_AV_CONFIG_CONTROL_RESET_MSK  | 	\
											ALT_UP_AV_CONFIG_CONTROL_RIE_MSK 	| 	\
											ALT_UP_AV_CONFIG_CONTROL_DEVICE_OFST)

/*
 * Status Register 
 */
#define ALT_UP_AV_CONFIG_STATUS_REG		1

#define IOADDR_ALT_UP_AV_CONFIG_STATUS(base)      	\
        __IO_CALC_ADDRESS_NATIVE(base, ALT_UP_AV_CONFIG_STATUS_REG)
#define IORD_ALT_UP_AV_CONFIG_STATUS(base)        	\
        IORD(base, ALT_UP_AV_CONFIG_STATUS_REG)
#define IOWR_ALT_UP_AV_CONFIG_STATUS(base, data)  	\
        IOWR(base, ALT_UP_AV_CONFIG_STATUS_REG, data)

#define ALT_UP_AV_CONFIG_STATUS_ACK_MSK		(0x00000001)
#define ALT_UP_AV_CONFIG_STATUS_ACK_OFST	(0)
#define ALT_UP_AV_CONFIG_STATUS_RDY_MSK		(0x00000002)
#define ALT_UP_AV_CONFIG_STATUS_RDY_OFST	(1)
#define ALT_UP_AV_CONFIG_STATUS_AIS_MSK		(0x00000100)
#define ALT_UP_AV_CONFIG_STATUS_AIS_OFST	(8)
#define ALT_UP_AV_CONFIG_STATUS_CFG_MSK		(0x00FF0000)
#define ALT_UP_AV_CONFIG_STATUS_CFG_OFST	(16)

#define ALT_UP_AV_CONFIG_STATUS_VALID_MSK  (ALT_UP_AV_CONFIG_STATUS_ACK_MSK	|	\
											ALT_UP_AV_CONFIG_STATUS_RDY_MSK |	\
											ALT_UP_AV_CONFIG_STATUS_AIS_MSK |	\
											ALT_UP_AV_CONFIG_STATUS_CFG_MSK)
/*
 * Address Register 
 */
#define ALT_UP_AV_CONFIG_ADDRESS_REG	2

#define IOADDR_ALT_UP_AV_CONFIG_ADDRESS(base)      	\
        __IO_CALC_ADDRESS_NATIVE(base, ALT_UP_AV_CONFIG_ADDRESS_REG)
#define IORD_ALT_UP_AV_CONFIG_ADDRESS(base)        	\
        IORD(base, ALT_UP_AV_CONFIG_ADDRESS_REG)
#define IOWR_ALT_UP_AV_CONFIG_ADDRESS(base, data)  	\
        IOWR(base, ALT_UP_AV_CONFIG_ADDRESS_REG, data)

#define ALT_UP_AV_CONFIG_ADDRESS_ADDR_MSK			(0x000000FF)
#define ALT_UP_AV_CONFIG_ADDRESS_ADDR_OFST			(0)

#define ALT_UP_AV_CONFIG_ADDRESS_VALID_MSK  		(ALT_UP_AV_CONFIG_ADDRESS_ADDR_MSK)

/*
 * Data Register 
 */
#define ALT_UP_AV_CONFIG_DATA_REG		3

#define IOADDR_ALT_UP_AV_CONFIG_DATA(base)      	\
        __IO_CALC_ADDRESS_NATIVE(base, ALT_UP_AV_CONFIG_DATA_REG)
#define IORD_ALT_UP_AV_CONFIG_DATA(base)        	\
        IORD(base, ALT_UP_AV_CONFIG_DATA_REG)
#define IOWR_ALT_UP_AV_CONFIG_DATA(base, data)  	\
        IOWR(base, ALT_UP_AV_CONFIG_DATA_REG, data)

#define ALT_UP_AV_CONFIG_DATA_DATA_MSK				(0x0000FFFF)
#define ALT_UP_AV_CONFIG_DATA_DATA_OFST				(0)

#define ALT_UP_AV_CONFIG_DATA_VALID_MSK  			(ALT_UP_AV_CONFIG_DATA_DATA_MSK)


// Register map address of the Audio Config Chip
// see the datasheet of the Audio CODEC chip for details
#define AUDIO_REG_LEFT_LINE_IN 					(0x0000000)
#define AUDIO_REG_RIGHT_LINE_IN 				(0x0000001)
#define AUDIO_REG_LEFT_HEADPHONE_OUT			(0x0000002)
#define AUDIO_REG_RIGHT_HEADPHONE_OUT			(0x0000003)
#define AUDIO_REG_ANALOG_AUDIO_PATH_CTRL		(0x0000004)
#define AUDIO_REG_DIGITAL_AUDIO_PATH_CTRL		(0x0000005)
#define AUDIO_REG_POWER_DOWN_CTRL				(0x0000006)
#define AUDIO_REG_AUDIO_DIGITAL_INTERFACE		(0x0000007)
#define AUDIO_REG_SAMPLING_CTRL					(0x0000008)
#define AUDIO_REG_ACTIVE_CTRL					(0x0000009)

#endif /*__ALT_UP_AUDIO_VIDEO_CONFIG_REGS_H__*/
