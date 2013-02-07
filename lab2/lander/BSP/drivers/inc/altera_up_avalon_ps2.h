/******************************************************************************
*                                                                             *
* License Agreement                                                           *
*                                                                             *
* Copyright (c) 2007 Altera Corporation, San Jose, California, USA.           *
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
* Altera does not recommend, suggest or require that this reference design    *
* file be used in conjunction or combination with any other product.          *
*                                                                             *
******************************************************************************/

#ifndef __ALTERA_UP_AVALON_PS2_H__
#define __ALTERA_UP_AVALON_PS2_H__

#include <stddef.h>
#include <alt_types.h>
#include <sys/alt_dev.h>

#include <errno.h>

#ifdef __cplusplus
extern "C"
{
#endif /* __cplusplus */


typedef enum {
	/// @brief Indicate that the device is a PS/2 Mouse.
	PS2_MOUSE = 0,
	/// @brief Indicate that the device is a PS/2 Keyboard.
	PS2_KEYBOARD = 1,
	/// @brief The program cannot determine what type the device is.
	PS2_UNKNOWN = 2
} PS2_DEVICE;

/*
 * Device structure definition. Each instance of the driver uses one
 * of these structures to hold its associated state.
 */
typedef struct alt_up_ps2_dev {
	/// @brief character mode device structure. 
	/// @sa Developing Device Drivers for the HAL in Nios II Software Developer's Handbook.
	alt_dev dev;
	/// @brief the base address of the device.
	unsigned int base;
	/// @brief the interrupt id of the device.
	unsigned int irq_id;
	/// @brief the default timeout value.
	unsigned int timeout;
	/// @brief the device type (PS/2 Mouse or PS/2 Keyboard).
	PS2_DEVICE device_type;
} alt_up_ps2_dev;


//////////////////////////////////////////////////////////////////////////
// HAL system functions

/**
 * @brief Initialize the PS/2 device and detect device type (mouse or keyboard). 
 *
 * @param ps2 -- the PS/2 device structure.
 * 
 * @note The function will set the \c device_type field of \em ps2 to \c
 * PS2_MOUSE or \c PS2_KEYBOARD upon successful initialization, otherwise the
 * intialization is unsuccessful.
 *
 **/
void alt_up_ps2_init(alt_up_ps2_dev *ps2);

/**
 * @brief Enable read interrupts for the PS/2 port.
 *
 * @param ps2 -- the PS/2 device structure.
 *
 * @return nothing
 **/
void alt_up_ps2_enable_read_interrupt(alt_up_ps2_dev *ps2);

/**
 * @brief Diaable read interrupts for the PS/2 port.
 *
 * @param ps2 -- the PS/2 device structure.
 *
 * @return nothing
 **/
void alt_up_ps2_disable_read_interrupt(alt_up_ps2_dev *ps2);

/**
 * @brief Write a byte to the PS/2 port.
 *
 * @param ps2 -- the PS/2 device structure.
 * @param byte -- the byte to be written to the PS/2 port.
 *
 * @return 0 on success, or \c -EIO on failure.
 **/
int alt_up_ps2_write_data_byte(alt_up_ps2_dev *ps2, unsigned char byte);

/**
 * @brief Write a byte to the PS/2 port and wait for the acknowledgment.
 *
 * @param ps2 -- the PS/2 device structure.
 * @param byte -- the byte to be written to the PS/2 port.
 *
 * @return 0 on success, \c -EIO on write failure, or \c -ETIMEDOUT on timeout when waiting for the acknowledgment.
 * @note The timeout value is defined in the PS/2 device structure \c alt_up_ps2_dev.
 **/
int alt_up_ps2_write_data_byte_with_ack(alt_up_ps2_dev *ps2, unsigned char byte);

/**
 * @brief Read a byte from the PS/2 port.
 *
 * @param ps2 -- the PS/2 device structure.
 * @param byte -- pointer to the memory location to store the byte.
 *
 * @return 0 on success, else -1
 *
 **/
int alt_up_ps2_read_data_byte(alt_up_ps2_dev *ps2, unsigned char *byte);

/**
 * @brief Read a byte from the PS/2 port.
 *
 * @param ps2 -- the PS/2 device structure.
 * @param byte -- pointer to the memory location to store the byte.
 *
 * @return 0 on success, or \c -ETIMEDOUT when timeout.
 *
 * @note This function waits for a timeout period if there is no data available.
 **/
int alt_up_ps2_read_data_byte_timeout(alt_up_ps2_dev *ps2, unsigned char *byte);

/**
 * @brief Clear the FIFO for the PS/2 port.
 *
 * @param ps2 -- the PS/2 device structure.
 *
 **/
void alt_up_ps2_clear_fifo(alt_up_ps2_dev *ps2);

//////////////////////////////////////////////////////////////////////////
// file-like operation functions
/**
 * @brief Read \em len bytes from the PS/2 device.
 *
 * @param fd -- the file descriptor for the PS/2 device.
 * @param ptr -- memory location to store the bytes read.
 * @param len -- number of bytes to be read.
 *
 * @return the number of bytes actually read.
 *
 **/
int alt_up_ps2_read_fd (alt_fd* fd, char* ptr, int len);

/**
 * @brief Write \em len bytes to the PS/2 device from memory location pointed by \em ptr.
 *
 * @param fd -- the file descriptor for the PS/2 device.
 * @param ptr -- memory location storing the bytes to write.
 * @param len -- number of bytes to write.
 *
 * @return the number of bytes actually written.
 **/
int alt_up_ps2_write_fd (alt_fd* fd, const char* ptr, int len);


//////////////////////////////////////////////////////////////////////////
// direct operation functions

/**
 * @brief Open a PS/2 device structure with \em name in SOPC Builder
 *
 * @param name the specified name of the device in SOPC Builder 
 *
 * @return the PS/2 device structure
 **/
alt_up_ps2_dev* alt_up_ps2_open_dev(const char* name);

/*
 * Macros used by alt_sys_init 
 */
#define ALTERA_UP_AVALON_PS2_INSTANCE(name, device)	\
  static alt_up_ps2_dev device =		\
  {                                                 \
    {                                               \
      ALT_LLIST_ENTRY,                              \
      name##_NAME,                                  \
      NULL , /* open */								\
      NULL , /* close */							\
      alt_up_ps2_read_fd , /* read */				\
      alt_up_ps2_write_fd , /* write */				\
      NULL , /* lseek */							\
      NULL , /* fstat */							\
      NULL , /* ioctl */							\
    },                                              \
	name##_BASE,                                	\
	name##_IRQ,										\
	0x0001ffff,										\
	PS2_UNKNOWN										\
  }

#define ALTERA_UP_AVALON_PS2_INIT(name, device)  \
  {															\
	alt_up_ps2_init(&device);			  \
	/* make the device available to the system */			\
    alt_dev_reg(&device.dev);								\
  }



#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* __ALTERA_UP_AVALON_PS2_H__ */


