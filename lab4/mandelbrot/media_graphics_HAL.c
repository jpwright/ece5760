#include "altera_up_avalon_video_pixel_buffer_dma.h"
#include "altera_up_avalon_video_character_buffer_with_dma.h"
#include "sys/alt_stdio.h"
#include <stdio.h>
#include <math.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"

/********************************************************************************
 * This program demonstrates use of the character and pixel buffer HAL code for
 * the DE2 Media computer. It:
 * 	-- places a blue box on the VGA display, and places a text string inside the box.
 *		-- draws a big A on the screen, for ALTERA
 *		-- "bounces" a colored box around the screen 
********************************************************************************/
int main(void){
	alt_up_pixel_buffer_dma_dev *pixel_buffer_dev;
	alt_up_char_buffer_dev *char_buffer_dev;

	/* used for drawing coordinates */
	float delay = 0.0;
	int x;
	int y;
	int t = 0;
	float zr[640][480];
	float zi[640][480];
	
	float xoff;
	float yoff;
	float xscale = 0.005;
	float yscale = 0.005;
	
	int num_iterations = 50;
	
	//Good values for initial (centered) set
	xoff = -1.0*2.0*640.0*xscale/3.0;
	yoff = -1.0*480.0*yscale/2.0;

	/* initialize the pixel buffer HAL */
	pixel_buffer_dev = alt_up_pixel_buffer_dma_open_dev ("/dev/VGA_Pixel_Buffer");
	if ( pixel_buffer_dev == NULL)
		alt_printf ("Error: could not open VGA pixel buffer device\n");
	else
		alt_printf ("Opened character VGA pixel buffer device\n");
	/* clear the graphics screen */
	alt_up_pixel_buffer_dma_clear_screen(pixel_buffer_dev, 0);

	/* output text message in the middle of the VGA monitor */
	char_buffer_dev = alt_up_char_buffer_open_dev ("/dev/VGA_Char_Buffer");
	if (char_buffer_dev == NULL)
	{
		alt_printf ("Error: could not open character buffer device\n");
		return -1;
	}
	else
		alt_printf ("Opened character buffer device\n");
	//alt_up_char_buffer_string (char_buffer_dev, text_top_row, 35, 29);
	//alt_up_char_buffer_string (char_buffer_dev, text_bottom_row, 35, 30);

	
		
	//TIMER RESET
	//0 - Hold at Zero
	//1 - Reset to Zero
	//2 - Stop Incremeting and Hold
	//3 - Actively Incrementing
	
	IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE, 0);

	while(1)
	{
	
		int reset = 0;
		
		IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE, 1);
		IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE, 3);
	
		//int * green_leds = (int *) GREEN_LEDS_BASE; /* red_leds is a pointer to the LEDRs */
		int * pushbuttons = (int *) PUSHBUTTONS_BASE; /* points to pushbuttons */
		//*(green_leds) = *(pushbuttons); /* Green LEDG[k] is set equal to PB[k] */
		
		for (x=0; x<640; x++) {
			for (y=0; y<480; y++) {
				float xc = (float)(x*xscale + xoff);
				float yc = (float)(y*yscale + yoff);
				//printf ("xc=%f\n",xc);
				//printf ("yc=%f\n",yc);
				zr[x][y] = xc;
				zi[x][y] = yc;
				t = 0;
				//float q = pow((xc - 0.25), 2) + pow(yc, 2);
				//if (q*(q+(xc-0.25)) >= 0.25*pow(yc, 2)) {
					while (t<num_iterations){
						if (((*pushbuttons) & 0x08) && reset == 0) {
							//alt_printf ("Button Pushed ");
							reset = 1;
							
							break;
						}
						float zr_xy = zr[x][y];
						float zi_xy = zi[x][y];
						float zr_n = zr_xy*zr_xy - zi_xy*zi_xy + xc;
						float zi_n = 2.0*zr_xy*zi_xy + yc;
						if (zr_n*zi_n < 4.0) {
							
							zr[x][y] = zr_n;
							zi[x][y] = zi_n;
						}else{
							alt_up_pixel_buffer_dma_draw(pixel_buffer_dev, t, x, y);
							t = num_iterations;
						}
						if (t == num_iterations - 1)
						{
							alt_up_pixel_buffer_dma_draw(pixel_buffer_dev, 255, x, y);
						}
						t = t +1;
					}
					if (reset == 1) {
						break;
					}
				//} else {
				//	alt_up_pixel_buffer_dma_draw(pixel_buffer_dev, 0, x, y);
				//}
				//
			}
			if (reset == 1) {
				break;	
			}
		}
		
		IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE, 2);
	
		//Permit user input for zooming.
		//We only allow zooming by a factor of two, so only neeed input is the center to zoom to.
		
		
		float xoff_n;
		float yoff_n;
		//alt_printf ("What is the new X Offset? ");
		//scanf ("%f",&xoff_n);
		//alt_printf ("What is the new Y Offset? ");
		//scanf ("%f",&yoff_n);
		//alt_printf ("Scaling ");
		//scanf ("%f",&xscale);
		//yscale = xscale;
		float xmin;
		float ymin;
		float xmax;
		float ymax;
		if (reset == 0) {
			printf ("\nCurrent X Offset=%f\n",xoff);
			printf ("Current Y Offset=%f\n",yoff);
			alt_printf ("x min? ");
			scanf ("%f",&xmin);
			alt_printf ("x max? ");
			scanf ("%f",&xmax);
			alt_printf ("y min? ");
			scanf ("%f",&ymin);
			alt_printf ("y max? ");
			scanf ("%f",&ymax);
			alt_printf ("Number of Iterations? ");
			scanf ("%d",&num_iterations);
			alt_printf ("Cool. Get ready for some crazy zooming action.\n");
		} else {
			//alt_printf ("Reset ");
			alt_up_pixel_buffer_dma_clear_screen(pixel_buffer_dev, 0);
			xmin = -2.0;
			xmax = 1.0;
			ymin = -1.0;
			ymax = 1.0;
			num_iterations = 25;
		}
		
		float xrange = xmax - xmin;
		float yrange = ymax - ymin;
		
		xscale = xrange/640.0;
		yscale = yrange/480.0;
		
		//xscale = 0.005/xscale;
		//yscale = 0.005/yscale;
		
		//xoff = xmin*640.0*xscale/xrange;
		//yoff = ymin*480.0*yscale/yrange;
	
		xoff = xmin;
		yoff = ymin;
		
		t=0;

		
		
		if (alt_up_pixel_buffer_dma_check_swap_buffers_status(pixel_buffer_dev) == 0)
		{
			/* If the screen has been drawn completely then we can draw a new image. This 
			 * section of the code will only be entered once every 60th of a second, because 
			 * this is how long it take the VGA controller to copy the image from memory to 
			 * the screen. */
			delay = 1 - delay;

			if (delay == 0)
			{
				
				//alt_up_pixel_buffer_dma_draw(pixel_buffer_dev, 255, 15, 20);
				
			}

			/* Execute a swap buffer command. This will allow us to check if the screen has 
			 * been redrawn before generating a new animation frame. */
			alt_up_pixel_buffer_dma_swap_buffers(pixel_buffer_dev);
		}
	}
}


