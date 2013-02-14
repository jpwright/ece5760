 #include "altera_up_avalon_video_pixel_buffer_dma.h"
#include "altera_up_avalon_video_character_buffer_with_dma.h"
#include "sys/alt_stdio.h"
#include "sprites.h"
#include <math.h>

void draw_landscape(alt_up_pixel_buffer_dma_dev *);
void draw_sprite(alt_up_pixel_buffer_dma_dev *, unsigned int x, unsigned int y, unsigned int theta, int thrusting);

/*
int sprite[30][30]={{  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0},
						{  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0},
						{  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0},
						{  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0},
						{  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0},
						{  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 255, 255, 255,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0},
						{  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 255, 255, 255,   0,   0,   0, 255, 255,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0},
						{  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 255,   0,   0,   0,   0,   0,   0,   0,   0, 255, 255,   0,   0,   0,   0,   0,   0,   0,   0},
						{  0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 255,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 255,   0,   0,   0,   0,   0,   0,   0,   0},
						{  0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 255,   0,   0,   0,   0,   0, 240,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0},
						{  0,   0,   0,   0,   0,   0,   0,   0,   0, 255,   0,   0,   0,   0,   0, 240,   0, 240,   0,   0,   0,   0, 255,   0,   0,   0,   0,   0,   0,   0},
						{  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 240, 240,   0,   0, 240,   0,   0,   0, 255,   0,   0,   0,   0,   0,   0,   0},
						{  0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 255,   0,   0,   0, 240,   0,   0,   0,   0,   0,   0,   0,   0, 255,   0,   0,   0,   0,   0,   0},
						{  0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 255,   0,   0,   0, 240,   0,   0,   0,   0,   0,   0,   0, 255,   0,   0,   0,   0,   0,   0,   0},
						{  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 255,   0,   0, 240, 240, 240,   0,   0,   0,   0,   0, 255,   0,   0,   0,   0,   0,   0,   0},
						{  0,   0,   0,   0,   0,   0,   0,   0, 255, 255, 255,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 255,   0,   0,   0,   0,   0,   0,   0,   0},
						{  0,   0,   0,   0,   0,   0,   0, 255,   0, 255,   0, 255, 255,   0,   0,   0,   0,   0,   0,   0, 255, 255,   0,   0,   0,   0,   0,   0,   0,   0},
						{  0,   0,   0,   0,   0, 255, 255,   0, 255,   0,   0,   0,   0, 255, 255, 255,   0, 255, 255,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0},
						{  0,   0,   0,   0,   0, 255,   0,   0, 255, 255, 255,   0,   0,   0,   0, 255, 255, 255,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0},
						{  0,   0,   0,   0, 255,   0,   0,   0,   0,   0, 255, 255, 255,   0,   0,   0,   0, 255,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0},
						{  0,   0,   0, 255, 255,   0,   0,   0,   0,   0,   0,   0,   0, 255, 255,   0,   0, 255, 255,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0},
						{  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 255, 255,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0},
						{  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 255,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0},
						{  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0},
						{  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 255,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0},
						{  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 255,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0},
						{  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 255, 255,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0},
						{  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 255,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0},
						{  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0},
						{  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0}};
*/

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
	float x1, y1, x2, y2, deltax, deltay, delay = 0.0;
	float g = 0.02;
	float thrust = 0.08;
	float theta = 18.0;
	float turning = 0.3;
	
	int thrusting = 0;
	
	int stillAlive = 1; //I'm doing science and I'm still alive.
	int deadWait = 0;
	
	int initx = 320;
	int inity = 10;
	

	/* create a message to be displayed on the VGA display */
	//char text_top_row[40] = "ECE5760\0";
	//char text_bottom_row[40] = "Bruce is cool.\0";

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

	/* now draw a background box for the text */
	

	/* now draw the landscape */
	draw_landscape (pixel_buffer_dev);

	/* now draw a red rectangle with diagonal green lines */
	x1 = initx;
	y1 = inity;
	x2 = initx + 30;
	y2 = inity + 30;
	alt_up_pixel_buffer_dma_draw_box(pixel_buffer_dev, x1, y1, x2, y2, 0xff, 0);
	//alt_up_pixel_buffer_dma_draw_rectangle(pixel_buffer_dev, x1, y1, x2, y2, 0xF800, 0);
	//alt_up_pixel_buffer_dma_draw_line(pixel_buffer_dev, x1, y1, x2, y2, 0x07e0, 0);
	//alt_up_pixel_buffer_dma_draw_line(pixel_buffer_dev, x1, y2, x2, y1, 0x07e0, 0);
	//alt_up_pixel_buffer_dma_swap_buffers(pixel_buffer_dev);

	/* set the direction in which the box will move */
	deltax = 0;
	deltay = 0;
	
	

	while(1)
	{
	
	int * green_leds = (int *) GREEN_LEDS_BASE; /* red_leds is a pointer to the LEDRs */
	int * pushbuttons = (int *) PUSHBUTTONS_BASE; /* points to pushbuttons */
	*(green_leds) = *(pushbuttons); /* Green LEDG[k] is set equal to PB[k] */

	
	
		if (alt_up_pixel_buffer_dma_check_swap_buffers_status(pixel_buffer_dev) == 0)
		{
			/* If the screen has been drawn completely then we can draw a new image. This 
			 * section of the code will only be entered once every 60th of a second, because 
			 * this is how long it take the VGA controller to copy the image from memory to 
			 * the screen. */
			delay = 1 - delay;

			if (delay == 0)
			{
				/* The delay is inserted to slow down the animation from 60 frames per second 
				 * to 30. Every other refresh cycle the code below will execute. We first erase 
				 * the box with Erase Rectangle */
				alt_up_pixel_buffer_dma_draw_box(pixel_buffer_dev, (int)x1, (int)y1, (int)x2, (int)y2, 0, 0);
				//alt_up_pixel_buffer_dma_draw_line(pixel_buffer_dev, x1, y1, x2, y2, 0, 0);
				//alt_up_pixel_buffer_dma_draw_line(pixel_buffer_dev, x1, y2, x2, y1, 0, 0);

				//Right Thruster
				if (stillAlive) {
					if ((*pushbuttons) & 0x02)
					{
						//alt_up_pixel_buffer_dma_draw_box(pixel_buffer_dev, 0, 0, 50, 50, 3, 0);
						//deltax = deltax + 1.0;
						if (theta < (37.0 - turning)) {
							theta = theta + turning;
						}
					}
					//Left Thruster
					if ((*pushbuttons) & 0x08)
					{
						//alt_up_pixel_buffer_dma_draw_box(pixel_buffer_dev, 0, 0, 50, 50, 3, 0);
						//deltax = deltax - 1.0;
						if (theta > (0.0 + turning)) {
							theta = theta - turning;
						}
					}
					
					//Main Thruster
					if ((*pushbuttons) & 0x04)
					{
						//alt_up_pixel_buffer_dma_draw_box(pixel_buffer_dev, 0, 0, 50, 50, 3, 0);
						deltay = (deltay - thrust*cos((theta*5.0)-90.0));
						deltax = (deltax - thrust*sin((theta*5.0)-90.0));
						thrusting = 1;
					} else {
						thrusting = 0;
					}
				} else {
					deltax = 0.0;
					deltay = 0.0;
				}
				
				// move the rectangle
				x1 = x1 + deltax;
				//x2 = x2 + deltax;
				y1 = y1 + deltay;
				//y2 = y2 + deltay;
				
				
				if ((deltax > 0.0) && (x1 >= alt_up_pixel_buffer_dma_x_res(pixel_buffer_dev) - 31.0))
				{
					x1 = alt_up_pixel_buffer_dma_x_res(pixel_buffer_dev) - 31.0;
					deltax = 0.0;
					stillAlive = 0;
					deadWait = 1;
				}
				else if ((deltax < 0.0) && (x1 <= 0.0))
				{
					x1 = 0.0;
					deltax = 0.0;
					stillAlive = 0;
					deadWait = 1;
				}

				if ((deltay > 0.0) && (y1 >= alt_up_pixel_buffer_dma_y_res(pixel_buffer_dev) - 31.0))
				{
					y1 = alt_up_pixel_buffer_dma_y_res(pixel_buffer_dev) - 31.0;
					deltay = 0.0;
					stillAlive = 0;
					deadWait = 1;
				}
				else if ((deltay < 0.0) && (y1 <= 0.0))
				{
					y1 = 0.0;
					deltay = -deltay;
					stillAlive = 0;
					deadWait = 1;
				}
				
				x2 = x1 + 30.0;
				y2 = y1 + 30.0;
			
				// redraw Rectangle with diagonal lines
				//alt_up_pixel_buffer_dma_draw_rectangle(pixel_buffer_dev, x1, y1, x2, y2, 0xF800, 0);
				//alt_up_pixel_buffer_dma_draw_line(pixel_buffer_dev, x1, y1, x2, y2, 0x07e0, 0);
				//alt_up_pixel_buffer_dma_draw_line(pixel_buffer_dev, x1, y2, x2, y1, 0x07e0, 0);
				
				//%%%%//alt_up_pixel_buffer_dma_draw_box(pixel_buffer_dev, x1, y1, x2, y2, 0x60, 0);
				//draw_sprite(pixel_buffer_dev, x1, y1);
				
				// redraw the box in the foreground 
				//%%%%//alt_up_pixel_buffer_dma_draw_box(pixel_buffer_dev, 34*4, 28*4, 50*4, 32*4, 0xf0, 0);
				draw_sprite(pixel_buffer_dev, (int)x1, (int)y1, (int)theta, thrusting);
				draw_landscape (pixel_buffer_dev);
				
				deltay = deltay + g;
				
				if (!stillAlive) {
					char you_died[40] = "You died!\0";
					deltax = 0.0;
					deltay = 0.0;
					alt_up_char_buffer_string (char_buffer_dev, you_died, 5, 5);
					if (deadWait) {
						if ((*pushbuttons) == 0x00) {
							deadWait = 0;
						}
					} else {
						if ((*pushbuttons) & 0x0e)
						{
							stillAlive = 1;
							char you_alive[40] = "         \0";
							alt_up_char_buffer_string (char_buffer_dev, you_alive, 5, 5);
							alt_up_pixel_buffer_dma_draw_box(pixel_buffer_dev, (int)x1, (int)y1, (int)x2, (int)y2, 0, 0);
							x1 = initx;
							y1 = inity;
							deltax = 0.0;
							deltay = 0.0;
							theta = 18.0;
							turning = 0.3;
						}
					}
				}
			}

			/* Execute a swap buffer command. This will allow us to check if the screen has 
			 * been redrawn before generating a new animation frame. */
			alt_up_pixel_buffer_dma_swap_buffers(pixel_buffer_dev);
		}
	}
}

/* draws a landscape */
void draw_landscape(alt_up_pixel_buffer_dma_dev *pixel_buffer_dev ){
	alt_up_pixel_buffer_dma_draw_line(pixel_buffer_dev, 4, 430, 150, 430, 0xffff, 0);
	alt_up_pixel_buffer_dma_draw_line(pixel_buffer_dev, 150, 430, 300, 400, 0xffff, 0);
	alt_up_pixel_buffer_dma_draw_line(pixel_buffer_dev, 300, 400, 480, 430, 0xffff, 0);
	alt_up_pixel_buffer_dma_draw_line(pixel_buffer_dev, 480, 430, 636, 430, 0xffff, 0);

}

int groundCollision(unsigned int x, unsigned int y) {
	if (1) {
		return 0;
	}
}


void draw_sprite(alt_up_pixel_buffer_dma_dev *pixel_buffer_dev , unsigned int x, unsigned int y, unsigned int theta, int thrusting) {
	int i = 0;
	int j = 0;
	for(i = 0; i < 30; i++) {
		for(j = 0; j < 30; j++) {
			if (landers[theta][i][j]) {
			//alt_up_pixel_buffer_dma_draw(alt_up_pixel_buffer_dma_dev *pixel_buffer, unsigned int color, unsigned int x, unsigned int y);
				//alt_up_pixel_buffer_dma_draw_hline(pixel_buffer_dev, x, x, y, 0xffff, 0);
				alt_up_pixel_buffer_dma_draw(pixel_buffer_dev, (int)((landers[theta][i][j] << 8) + landers[theta][i][j]), x+j, y+i );
			}
		}
	}
}



