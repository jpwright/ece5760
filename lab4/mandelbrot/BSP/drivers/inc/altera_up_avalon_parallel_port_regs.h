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

#ifndef __ALTERA_UP_AVALON_PARALLEL_PORT_REGS_H__
#define __ALTERA_UP_AVALON_PARALLEL_PORT_REGS_H__

#include <io.h>

// Data Register
#define ALT_UP_PARALLEL_PORT_DATA								0
#define IOADDR_ALT_UP_PARALLEL_PORT_DATA(base)					\
        __IO_CALC_ADDRESS_NATIVE(base, ALT_UP_PARALLEL_PORT_DATA)
#define IORD_ALT_UP_PARALLEL_PORT_DATA(base)					\
        IORD(base, ALT_UP_PARALLEL_PORT_DATA)
#define IOWR_ALT_UP_PARALLEL_PORT_DATA(base, data)				\
        IOWR(base, ALT_UP_PARALLEL_PORT_DATA, data)

// Direction Register
#define ALT_UP_PARALLEL_PORT_DIRECTION							1
#define IOADDR_ALT_UP_PARALLEL_PORT_DIRECTION(base)				\
        __IO_CALC_ADDRESS_NATIVE(base, ALT_UP_PARALLEL_PORT_DIRECTION)
#define IORD_ALT_UP_PARALLEL_PORT_DIRECTION(base)				\
        IORD(base, ALT_UP_PARALLEL_PORT_DIRECTION)
#define IOWR_ALT_UP_PARALLEL_PORT_DIRECTION(base, data)			\
        IOWR(base, ALT_UP_PARALLEL_PORT_DIRECTION, data)

// Interrupt Mask Register
#define ALT_UP_PARALLEL_PORT_INTERRUPT_MASK						2
#define IOADDR_ALT_UP_PARALLEL_PORT_INTERRUPT_MASK(base)		\
        __IO_CALC_ADDRESS_NATIVE(base, ALT_UP_PARALLEL_PORT_INTERRUPT_MASK)
#define IORD_ALT_UP_PARALLEL_PORT_INTERRUPT_MASK(base)			\
        IORD(base, ALT_UP_PARALLEL_PORT_INTERRUPT_MASK)
#define IOWR_ALT_UP_PARALLEL_PORT_INTERRUPT_MASK(base, data)	\
        IOWR(base, ALT_UP_PARALLEL_PORT_INTERRUPT_MASK, data)

// Edge Capture Register
#define ALT_UP_PARALLEL_PORT_EDGE_CAPTURE						3
#define IOADDR_ALT_UP_PARALLEL_PORT_EDGE_CAPTURE(base)			\
        __IO_CALC_ADDRESS_NATIVE(base, ALT_UP_PARALLEL_PORT_EDGE_CAPTURE)
#define IORD_ALT_UP_PARALLEL_PORT_EDGE_CAPTURE(base)			\
        IORD(base, ALT_UP_PARALLEL_PORT_EDGE_CAPTURE)
#define IOWR_ALT_UP_PARALLEL_PORT_EDGE_CAPTURE(base, data)		\
        IOWR(base, ALT_UP_PARALLEL_PORT_EDGE_CAPTURE, data)

#endif /* __ALTERA_UP_AVALON_PARALLEL_PORT_REGS_H__ */
