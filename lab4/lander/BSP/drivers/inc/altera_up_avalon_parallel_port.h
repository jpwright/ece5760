#ifndef __ALTERA_UP_AVALON_PARALLEL_PORT_H__
#define __ALTERA_UP_AVALON_PARALLEL_PORT_H__

#include <stddef.h>

#include "sys/alt_dev.h"
#include "sys/alt_alarm.h"
#include "sys/alt_warning.h"

#include "altera_up_avalon_parallel_port_regs.h"

#ifdef __cplusplus
extern "C"
{
#endif /* __cplusplus */

/*
 * Device structure definition. Each instance of the driver uses one
 * of these structures to hold its associated state.
 */
typedef struct alt_up_parallel_port_dev {
	/// @brief device structure 
	/// @sa Developing Device Drivers for the HAL in Nios II Software Developer's Handbook
	alt_dev dev;
	/// @brief the base address of the device
	unsigned int base;
} alt_up_parallel_port_dev;

// system functions
// file-like operation functions

// direct operation functions
/**
 * @brief Open the parallel port device specified by <em> name </em>
 *
 * @param name -- the parallel port name. For example, if the parallel port name in SOPC Builder is "green_leds", then <em> name </em> should be "/dev/green_leds"
 *
 * @return The corresponding device structure, or NULL if the device is not found.
 **/
alt_up_parallel_port_dev* alt_up_parallel_port_open_dev(const char* name);

/**
 * @brief Read from the data register of the parallel port.
 *
 * @param parallel_port -- struct for the parallel port device .
 *
 * @return data -- The data read for the parallel port.
 **/
//unsigned int alt_up_parallel_port_read_data(alt_up_parallel_port_dev *parallel_port);
#define alt_up_parallel_port_read_data(parallel_port)						\
	(IORD_ALT_UP_PARALLEL_PORT_DATA((parallel_port)->base))

/**
 * @brief Write to the data register of the parallel port.
 *
 * @param parallel_port -- struct for the parallel port device.
 * @param data -- The data to be written to the parallel port.
 **/
//void alt_up_parallel_port_write_data(alt_up_parallel_port_dev *parallel_port, unsigned data);
#define alt_up_parallel_port_write_data(parallel_port, data)				\
	IOWR_ALT_UP_PARALLEL_PORT_DATA((parallel_port)->base, data)

/**
 * @brief Read from the direction register of the parallel port.
 *
 * @param parallel_port -- struct for the parallel port device.
 *
 * @return direction -- The direction read for the parallel port.
 **/
//unsigned int alt_up_parallel_port_read_direction(alt_up_parallel_port_dev *parallel_port);
#define alt_up_parallel_port_read_direction(parallel_port)					\
	IORD_ALT_UP_PARALLEL_PORT_DIRECTION((parallel_port)->base)

/**
 * @brief Set the direction register of the parallel port.
 *
 * @param parallel_port -- struct for the parallel port device.
 **/
//void alt_up_parallel_port_set_port_direction(alt_up_parallel_port_dev *parallel_port, unsigned direction);
#define alt_up_parallel_port_set_port_direction(parallel_port, direction)	\
	IOWR_ALT_UP_PARALLEL_PORT_DIRECTION((parallel_port)->base, direction)

/**
 * @brief Set the direction of all bits of the parallel port to be inputs.
 *
 * @param parallel_port -- struct for the parallel port device.
 **/
//void alt_up_parallel_port_set_all_bits_to_input(alt_up_parallel_port_dev *parallel_port);
#define alt_up_parallel_port_set_all_bits_to_input(parallel_port)			\
	IOWR_ALT_UP_PARALLEL_PORT_DIRECTION((parallel_port)->base, 0x0)

/**
 * @brief Set the direction of one bits of the parallel port to be outputs.
 *
 * @param parallel_port -- struct for the parallel port device.
 **/
//void alt_up_parallel_port_set_all_bits_to_output(alt_up_parallel_port_dev *parallel_port);
#define alt_up_parallel_port_set_all_bits_to_output(parallel_port)			\
	IOWR_ALT_UP_PARALLEL_PORT_DIRECTION((parallel_port)->base, 0xFFFFFFFF)

/**
 * @brief Set the direction of one bit of the parallel port to be input.
 *
 * @param parallel_port -- struct for the parallel port device.
 * @param bit -- The bit of the parallel port to be set as an input.
 **/
//void alt_up_parallel_port_set_bit_to_input(alt_up_parallel_port_dev *parallel_port, unsigned int bit);
#define alt_up_parallel_port_set_bit_to_input(parallel_port, bit)			\
	IOWR_ALT_UP_PARALLEL_PORT_DIRECTION((parallel_port)->base, IORD_ALT_UP_PARALLEL_PORT_DIRECTION((parallel_port)->base) & ~(0x1 << bit))

/**
 * @brief Set the direction of one bit of the parallel port to be output.
 *
 * @param parallel_port -- struct for the parallel port device.
 * @param bit -- The bit of the parallel port to be set as an output.
 **/
//void alt_up_parallel_port_set_bit_to_output(alt_up_parallel_port_dev *parallel_port, unsigned int bit);
#define alt_up_parallel_port_set_bit_to_output(parallel_port, bit)			\
	IOWR_ALT_UP_PARALLEL_PORT_DIRECTION((parallel_port)->base, IORD_ALT_UP_PARALLEL_PORT_DIRECTION((parallel_port)->base) | (0x1 << bit))

/**
 * @brief Read from the interrupt mask register of the parallel port.
 *
 * @param parallel_port -- struct for the parallel port device.
 *
 * @return data -- The current interrupt mask of the parallel port.
 **/
//unsigned int alt_up_parallel_port_read_interrupt_mask(alt_up_parallel_port_dev *parallel_port);
#define alt_up_parallel_port_read_interrupt_mask(parallel_port)				\
	(IORD_ALT_UP_PARALLEL_PORT_INTERRUPT_MASK((parallel_port)->base))

/**
 * @brief Set the interrupt mask register of the parallel port.
 *
 * @param parallel_port -- struct for the parallel port device.
 * @param mask -- The interrupt mask to be set in the parallel port.
 **/
//void alt_up_parallel_port_set_interrupt_mask(alt_up_parallel_port_dev *parallel_port, unsigned mask);
#define alt_up_parallel_port_set_interrupt_mask(parallel_port, mask)		\
	IOWR_ALT_UP_PARALLEL_PORT_INTERRUPT_MASK((parallel_port)->base, mask)

/**
 * @brief Read from the edge capture register of the parallel port.
 *
 * @param parallel_port -- struct for the parallel port device.
 *
 * @return data -- The current edge capture register of the parallel port.
 **/
//unsigned int alt_up_parallel_port_read_edge_capture(alt_up_parallel_port_dev *parallel_port);
#define alt_up_parallel_port_read_edge_capture(parallel_port)				\
	(IORD_ALT_UP_PARALLEL_PORT_EDGE_CAPTURE((parallel_port)->base))

/**
 * @brief Clear the edge capture register of the parallel port.
 *
 * @param parallel_port -- struct for the parallel port device.
 **/
//void alt_up_parallel_port_clear_edge_capture(alt_up_parallel_port_dev *parallel_port);
#define alt_up_parallel_port_clear_edge_capture(parallel_port)				\
	IOWR_ALT_UP_PARALLEL_PORT_EDGE_CAPTURE((parallel_port)->base, 0x0)

/**
 * @brief Read interrupt pending information of the parallel port.
 *
 * @param parallel_port -- struct for the parallel port device.
 *
 * @return pending -- The interrupt pending bit field of the parallel port.
 **/
//unsigned int alt_up_parallel_port_read_interrupt_pending(alt_up_parallel_port_dev *parallel_port);
#define alt_up_parallel_port_read_interrupt_pending(parallel_port)			\
	(IORD_ALT_UP_PARALLEL_PORT_INTERRUPT_MASK((parallel_port)->base) &		\
	IORD_ALT_UP_PARALLEL_PORT_EDGE_CAPTURE((parallel_port)->base))			\

/*
 * Macros used by alt_sys_init 
 */
#define ALTERA_UP_AVALON_PARALLEL_PORT_INSTANCE(name, device)	\
static alt_up_parallel_port_dev device =						\
{																\
  {																\
	ALT_LLIST_ENTRY,											\
	name##_NAME,												\
	NULL, /* open */											\
	NULL, /* close */											\
	NULL, /* read */											\
	NULL, /* write */											\
	NULL, /* lseek */											\
	NULL, /* fstat */											\
	NULL, /* ioctl */											\
  },															\
  name##_BASE,													\
}

#define ALTERA_UP_AVALON_PARALLEL_PORT_INIT(name, device)		\
{									  							\
	alt_dev_reg(&device.dev);									\
}


#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* __ALTERA_UP_AVALON_PARALLEL_PORT_H__ */


