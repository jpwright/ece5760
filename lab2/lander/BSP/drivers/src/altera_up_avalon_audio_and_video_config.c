/******************************************************************************
*                                                                             *
* License Agreement                                                           *
*                                                                             *
* Copyright (c) 1991-2010 Altera Corporation, San Jose, California, USA.      *
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

#include <errno.h>

#include <priv/alt_file.h>
#include <alt_types.h>

#include "altera_up_avalon_audio_and_video_config.h"
#include "altera_up_avalon_audio_and_video_config_regs.h"

alt_up_av_config_dev* alt_up_av_config_open_dev(const char* name)
{
  // find the device from the device list 
  // (see altera_hal/HAL/inc/priv/alt_file.h 
  // and altera_hal/HAL/src/alt_find_dev.c 
  // for details)
  alt_up_av_config_dev *dev = (alt_up_av_config_dev*)alt_find_dev(name, &alt_dev_list);
  dev->type = (IORD_ALT_UP_AV_CONFIG_STATUS(dev->base) & ALT_UP_AV_CONFIG_STATUS_CFG_MSK) >> ALT_UP_AV_CONFIG_STATUS_CFG_OFST;

  return dev;
}

/**
 * @brief Send data to the device
 *
 * @param av_config -- the device data structure 
 * @param addr -- the address of the destination device register 
 * @param data --  the data to be sent
 *
 * @return 0 for success
 **/
int alt_up_av_config_write_data(alt_up_av_config_dev *av_config, alt_u32 addr, alt_u32 data)
{
	// set the register address in the Address register
	IOWR_ALT_UP_AV_CONFIG_ADDRESS(av_config->base, addr & ALT_UP_AV_CONFIG_ADDRESS_VALID_MSK); 

	// write data to the device Data register
	IOWR_ALT_UP_AV_CONFIG_DATA(av_config->base, data & ALT_UP_AV_CONFIG_DATA_VALID_MSK); 

	return 0;
}

/**
 * @brief Reads data from the device
 *
 * @param av_config -- the device data structure 
 * @param addr -- the address of the source device register 
 * @param data -- a pointer to the location where the read data should be stored
 *
 * @return 0 for success or -1 for failure
 **/
int alt_up_av_config_read_data(alt_up_av_config_dev *av_config, alt_u32 addr, alt_u32 * data)
{
	// set the register address in the Address register
	IOWR_ALT_UP_AV_CONFIG_ADDRESS(av_config->base, addr & ALT_UP_AV_CONFIG_ADDRESS_VALID_MSK); 

	// write data to the device Data register
	*(data) = IORD_ALT_UP_AV_CONFIG_DATA(av_config->base); 

	// check acknowledge is 0
	if (alt_up_av_config_read_acknowledge(av_config))
		return -1;

	return 0;
}

int alt_up_av_config_reset(alt_up_av_config_dev *av_config)
{
	IOWR_ALT_UP_AV_CONFIG_CONTROL_RESET(av_config->base);
	return 0;
}

int alt_up_av_config_enable_interrupt(alt_up_av_config_dev *av_config)
{
	IOWR_ALT_UP_AV_CONFIG_CONTROL_RIE_ENABLE(av_config->base);
	return 0;
}

int alt_up_av_config_disable_interrupt(alt_up_av_config_dev *av_config)
{
	IOWR_ALT_UP_AV_CONFIG_CONTROL_RIE_DISABLE(av_config->base);
	return 0;
}

int alt_up_av_config_read_acknowledge(alt_up_av_config_dev *av_config)
{
	if ((IORD_ALT_UP_AV_CONFIG_STATUS(av_config->base) & ALT_UP_AV_CONFIG_STATUS_RDY_MSK) >> ALT_UP_AV_CONFIG_STATUS_RDY_OFST)
		return ((IORD_ALT_UP_AV_CONFIG_STATUS(av_config->base) & ALT_UP_AV_CONFIG_STATUS_ACK_MSK) >> ALT_UP_AV_CONFIG_STATUS_ACK_OFST);
	return -1;
}

int alt_up_av_config_read_ready(alt_up_av_config_dev *av_config)
{
	return ((IORD_ALT_UP_AV_CONFIG_STATUS(av_config->base) & ALT_UP_AV_CONFIG_STATUS_RDY_MSK) >> ALT_UP_AV_CONFIG_STATUS_RDY_OFST);
}

int alt_up_av_config_write_audio_cfg_register(alt_up_av_config_dev *av_config, alt_u32 addr, alt_u32 data)
{
	// check the device is indeed audio configuration
	if (av_config->type != ON_BOARD_AUDIO_ONLY_CONFIG && av_config->type != ON_BOARD_DE2_CONFIG && av_config->type != ON_BOARD_DE2_70_CONFIG && av_config->type != ON_BOARD_DE2_115_CONFIG)
		return -EINVAL;

	// set the audio device to be configured in the Control register
	SELECTED_ON_BOARD_DEVICE device = AUDIO_DEVICE;
	IOWR_ALT_UP_AV_CONFIG_CONTROL_DEVICE(av_config->base, device);

	return alt_up_av_config_write_data(av_config, addr, data);
}

int alt_up_av_config_read_video_cfg_register(alt_up_av_config_dev *av_config, alt_u32 addr, alt_u32 *data, SELECTED_ON_BOARD_DEVICE video_port)
{
	// check the device is indeed audio configuration
	if (av_config->type != ON_BOARD_DE2_CONFIG && av_config->type != ON_BOARD_DE2_70_CONFIG && av_config->type != ON_BOARD_DE2_115_CONFIG)
		return -EINVAL;

	if (av_config->type == ON_BOARD_DE2_CONFIG || av_config->type == ON_BOARD_DE2_115_CONFIG)
	{
		if (video_port != FIRST_VIDEO_DEVICE)
			return -EINVAL;
	} else {
		if ((video_port != FIRST_VIDEO_DEVICE) && (video_port != SECOND_VIDEO_DEVICE))
			return -EINVAL;
	}

	// set the video device to be configured in the Control register
	IOWR_ALT_UP_AV_CONFIG_CONTROL_DEVICE(av_config->base, video_port);

	return alt_up_av_config_read_data(av_config, addr, data);
}

int alt_up_av_config_write_video_cfg_register(alt_up_av_config_dev *av_config, alt_u32 addr, alt_u32 data, SELECTED_ON_BOARD_DEVICE video_port)
{
	// check the device is indeed audio configuration
	if (av_config->type != ON_BOARD_DE2_CONFIG && av_config->type != ON_BOARD_DE2_70_CONFIG && av_config->type != ON_BOARD_DE2_115_CONFIG)
		return -EINVAL;

	if (av_config->type == ON_BOARD_DE2_CONFIG || av_config->type == ON_BOARD_DE2_115_CONFIG)
	{
		if (video_port != FIRST_VIDEO_DEVICE)
			return -EINVAL;
	} else {
		if ((video_port != FIRST_VIDEO_DEVICE) && (video_port != SECOND_VIDEO_DEVICE))
			return -EINVAL;
	}

	// set the video device to be configured in the Control register
	IOWR_ALT_UP_AV_CONFIG_CONTROL_DEVICE(av_config->base, video_port);

	return alt_up_av_config_write_data(av_config, addr, data);
}

int alt_up_av_config_read_DC2_cfg_register(alt_up_av_config_dev *av_config, alt_u32 addr, alt_u32 *data)
{
	if (av_config->type != TRDB_DC2_CONFIG)
		return -EINVAL;

	return alt_up_av_config_read_data(av_config, addr, data);
}

int alt_up_av_config_write_DC2_cfg_register(alt_up_av_config_dev *av_config, alt_u32 addr, alt_u32 data)
{
	if (av_config->type != TRDB_DC2_CONFIG)
		return -EINVAL;

	return alt_up_av_config_write_data(av_config, addr, data);
}

int alt_up_av_config_read_D5M_cfg_register(alt_up_av_config_dev *av_config, alt_u32 addr, alt_u32 *data)
{
	if (av_config->type != TRDB_D5M_CONFIG)
		return -EINVAL;
	
	return alt_up_av_config_read_data(av_config, addr, data);
}

int alt_up_av_config_write_D5M_cfg_register(alt_up_av_config_dev *av_config, alt_u32 addr, alt_u32 data)
{
	if (av_config->type != TRDB_D5M_CONFIG)
		return -EINVAL;
	
	return alt_up_av_config_write_data(av_config, addr, data);
}

int alt_up_av_config_read_LTM_cfg_register(alt_up_av_config_dev *av_config, alt_u32 addr, alt_u32 *data)
{
	if (av_config->type != TRDB_LTM_CONFIG)
		return -EINVAL;

	return alt_up_av_config_read_data(av_config, addr, data);
}

int alt_up_av_config_write_LTM_cfg_register(alt_up_av_config_dev *av_config, alt_u32 addr, alt_u32 data)
{
	if (av_config->type != TRDB_LTM_CONFIG)
		return -EINVAL;

	return alt_up_av_config_write_data(av_config, addr, data);
}

