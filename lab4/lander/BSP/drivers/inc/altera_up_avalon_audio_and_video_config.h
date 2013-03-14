#ifndef __ALTERA_UP_AVALON_AUDIO_AND_VIDEO_CONFIG_H__
#define __ALTERA_UP_AVALON_AUDIO_AND_VIDEO_CONFIG_H__

#include <stddef.h>
#include <alt_types.h>
#include <sys/alt_dev.h>

#include "altera_up_avalon_audio_and_video_config_regs.h"

#ifdef __cplusplus
extern "C"
{
#endif /* __cplusplus */

///////////////////////////////////////////////////////////////////////////////
// 

typedef enum {
	/// @brief Configuration is unknown.
	UNKNOWN_CONFIG = 0,
	/// @brief Configuration is for on-board audio only.
	ON_BOARD_AUDIO_ONLY_CONFIG = 1,
	/// @brief Configuration is for both the on-board audio and video on the DE2 board.
	ON_BOARD_DE2_CONFIG = 2,
	/// @brief Configuration is for both the on-board audio and video on the DE2-70 board.
	ON_BOARD_DE2_70_CONFIG = 3,
	/// @brief Configuration is for both the on-board audio and video on the DE2-115 board.
	ON_BOARD_DE2_115_CONFIG = 4,
	/// @brief Configuration is for the 1.3 megapixel digital camera daughtercard.
	TRDB_DC2_CONFIG = 8,
	/// @brief Configuration is for the 5 megapixel digital camera daughtercard.
	TRDB_D5M_CONFIG = 9,
	/// @brief Configuration is for the LCD with touchscreen daughtercard.
	TRDB_LTM_CONFIG = 10
} CONFIG_DEVICE_TYPE;

typedef enum {
	/// @brief Configure the on-board audio device.
	AUDIO_DEVICE = 0,
	/// @brief Configure the on-board video device for the DE2 and DE2-115 or the first on-board video device for the DE2-70.
	FIRST_VIDEO_DEVICE = 1,
	/// @brief Configure the second on-board video device for the DE2-70.
	SECOND_VIDEO_DEVICE = 2,
} SELECTED_ON_BOARD_DEVICE;

//////////////////////////////////////////////////////////////////////////
// 
/*
 * Device structure definition. Each instance of the driver uses one
 * of these structures to hold its associated state.
 */
typedef struct alt_up_av_config_dev {
	/// @brief character mode device structure .
	/// @sa Developing Device Drivers for the HAL in Nios II Software Developer's Handbook.
	alt_dev dev;
	/// @brief the base address of the device.
	unsigned int base;
	/// @brief the configuration device type
	CONFIG_DEVICE_TYPE type;
} alt_up_av_config_dev;

//////////////////////////////////////////////////////////////////////////
// HAL system functions

//////////////////////////////////////////////////////////////////////////
// direct operation functions

/*
 * Macros used by alt_sys_init 
 */
#define ALTERA_UP_AVALON_AUDIO_AND_VIDEO_CONFIG_INSTANCE(name, device)	\
  static alt_up_av_config_dev device =									\
  {                                            				 	    	\
    {                                        				 	     	\
      ALT_LLIST_ENTRY,                         				 	    	\
      name##_NAME,                           	 			 	     	\
      NULL , 	/* open  */												\
      NULL , 	/* close */												\
      NULL , 	/* read  */												\
      NULL , 	/* write */												\
      NULL , 	/* lseek */												\
      NULL , 	/* fstat */												\
      NULL , 	/* ioctl */												\
    },                                  				            	\
    name##_BASE,                               					 		\
    0			/* device type */									   	\
  }

#define ALTERA_UP_AVALON_AUDIO_AND_VIDEO_CONFIG_INIT(name, device)	\
{																	\
    alt_dev_reg(&device.dev);                       			   	\
}

/**
 * @brief Opens the Audio/Video Configuration device specified by <em> name </em>.
 *
 * @param name -- the Audio/Video Configuration component name in SOPC Builder. 
 *
 * @return The corresponding device structure, or NULL if the device is not found.
 **/
alt_up_av_config_dev* alt_up_av_config_open_dev(const char* name);

/** 
 * @brief Resets the AV Config core and re-initializes the peripherals device(s) is auto-initialize was enabled
 *
 * @param av_config -- the device structure 
 *
 * @return 0 for success
 **/
int alt_up_av_config_reset(alt_up_av_config_dev *av_config);

/**
 * @brief Enables the AV Config core's interrupt
 *
 * @param av_config -- the device structure 
 *
 * @return 0 for success
 **/
int alt_up_av_config_enable_interrupt(alt_up_av_config_dev *av_config);

/**
 * @brief Disables the AV Config core's interrupt
 *
 * @param av_config -- the device structure 
 *
 * @return 0 for success
 **/
int alt_up_av_config_disable_interrupt(alt_up_av_config_dev *av_config);

/**
 * @brief Returns the acknowledge bit
 *
 * @param av_config -- the device structure 
 *
 * @return The acknowledge bit or -1 if the core it not ready 
 **/
int alt_up_av_config_read_acknowledge(alt_up_av_config_dev *av_config);

/**
 * @brief Returns the ready bit
 *
 * @param av_config -- the device structure 
 *
 * @return 1 if the core is ready otherwire 0
 **/
int alt_up_av_config_read_ready(alt_up_av_config_dev *av_config);

/**
 * @brief Writes configuration data to one of the on-board audio device's registers.
 *
 * @param av_config -- the device structure 
 * @param addr -- the device's configuration register's address
 * @param data -- the data to be written.
 *
 * @note The \e av_config structure should represent a component that does
 * on-board audio configuration only, otherwise an error will occur.
 *
 * @return 0 for success
 **/
int alt_up_av_config_write_audio_cfg_register(alt_up_av_config_dev *av_config, alt_u32 addr, alt_u32 data);

/**
 * @brief Reads configuration data from one of the on-board video device's registers.
 *
 * @param av_config -- the device structure 
 * @param addr -- the device's configuration register's address
 * @param data -- a pointer to the location where the read data should be stored
 * @param video_port -- the video port to be written to. Should be 1 for the DE2 and DE2-115 boards, and either 1 or 2 for the DE2-70 board
 *
 * @note The \e av_config structure should represent a component that does
 * both on-board audio and video configuration, otherwise an error will occur.
 *
 * @return 0 for success or -1 for failure
 **/
int alt_up_av_config_read_video_cfg_register(alt_up_av_config_dev *av_config, alt_u32 addr, alt_u32 *data, SELECTED_ON_BOARD_DEVICE video_port);

/**
 * @brief Writes configuration data to one of the on-board video device's registers.
 *
 * @param av_config -- the device structure 
 * @param addr -- the device's configuration register's address
 * @param data -- the data to be written
 * @param video_port -- the video port to be written to. Should be 1 for the DE2 and DE2-115 boards, and either 1 or 2 for the DE2-70 board
 *
 * @note The \e av_config structure should represent a component that does
 * both on-board audio and video configuration, otherwise an error will occur.
 *
 * @return 0 for success
 **/
int alt_up_av_config_write_video_cfg_register(alt_up_av_config_dev *av_config, alt_u32 addr, alt_u32 data, SELECTED_ON_BOARD_DEVICE video_port);

/**
 * @brief Reads configuration data from one of the LCD with touchscreen device's registers.
 *
 * @param av_config -- the device structure 
 * @param addr -- the device's configuration register's address
 * @param data -- a pointer to the location where the read data should be stored
 *
 * @note The \e av_config structure should represent a component that does
 * LTM configuration, otherwise an error will occur.
 *
 * @return 0 for success or -1 for failure
 **/
int alt_up_av_config_read_LTM_cfg_register(alt_up_av_config_dev *av_config, alt_u32 addr, alt_u32 *data);

/**
 * @brief Writes configuration data to one of the LCD with touchscreen device's registers.
 *
 * @param av_config -- the device structure 
 * @param addr -- the device's configuration register's address
 * @param data -- the data to be written.
 *
 * @note The \e av_config structure should represent a component that does
 * LTM configuration, otherwise an error will occur.
 *
 * @return 0 for success
 **/
int alt_up_av_config_write_LTM_cfg_register(alt_up_av_config_dev *av_config, alt_u32 addr, alt_u32 data);

/**
 * @brief Reads configuration data from one of the 1.3 megapixel digital camera device's registers.
 *
 * @param av_config -- the device structure 
 * @param addr -- the device's configuration register's address 
 * @param data -- a pointer to the location where the read data should be stored
 *
 * @note The \e av_config structure should represent a component that does
 * DC2 camera configuration, otherwise an error will occur.
 *
 * @return 0 for success or -1 for failure
 **/
int alt_up_av_config_read_DC2_cfg_register(alt_up_av_config_dev *av_config, alt_u32 addr, alt_u32 *data);

/**
 * @brief Writes configuration data to one of the 1.3 megapixel digital camera device's registers.
 *
 * @param av_config -- the device structure 
 * @param addr -- the device's configuration register's address 
 * @param data -- the data to be written.
 *
 * @note The \e av_config structure should represent a component that does
 * DC2 camera configuration, otherwise an error will occur.
 *
 * @return 0 for success
 **/
int alt_up_av_config_write_DC2_cfg_register(alt_up_av_config_dev *av_config, alt_u32 addr, alt_u32 data);

/**
 * @brief Reads configuration data from one of the 5 megapixel digital camera device's registers.
 *
 * @param av_config -- the device structure 
 * @param addr -- the device's configuration register's address 
 * @param data -- a pointer to the location where the read data should be stored
 *
 * @note The \e av_config structure should represent a component that does
 * D5M camera configuration, otherwise an error will occur.
 *
 * @return 0 for success or -1 for failure
 **/
int alt_up_av_config_read_D5M_cfg_register(alt_up_av_config_dev *av_config, alt_u32 addr, alt_u32 *data);

/**
 * @brief Writes configuration data to one of the 5 megapixel digital camera device's registers.
 *
 * @param av_config -- the device structure 
 * @param addr -- the device's configuration register's address 
 * @param data -- the data to be written.
 *
 * @note The \e av_config structure should represent a component that does
 * D5M camera configuration, otherwise an error will occur.
 *
 * @return 0 for success
 **/
int alt_up_av_config_write_D5M_cfg_register(alt_up_av_config_dev *av_config, alt_u32 addr, alt_u32 data);


#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* __ALTERA_UP_AVALON_AUDIO_AND_VIDEO_CONFIG_H__ */


