#include "altera_up_avalon_video_pixel_buffer_dma.h"
#include "altera_up_avalon_video_character_buffer_with_dma.h"
#include "sys/alt_stdio.h"
#include "sprites.h"
#include <math.h>

#define PI 3.14159265

/*Landscape Coordinates */
int x_land_0 = 0;
int	x_land_1 = 200;
int	x_land_2 = 250;
int	x_land_3 = 450;
int	x_land_f = 640;
int	y_land_1 = 350;
int	y_land_2 = 400;
int	y_land_f = 480;

void draw_landscape(alt_up_pixel_buffer_dma_dev *);
void draw_sprite(alt_up_pixel_buffer_dma_dev *, unsigned int x, unsigned int y, unsigned int theta, int thrusting);
void draw_fuel_guage(alt_up_pixel_buffer_dma_dev *, float fuel);



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
	float fuel = 100.0;
	float g = 0.02;
	float thrust = 0.08;
	float theta = 18.0;
	float turning = 0.3;
	
	float initial_x_velocity = -2.0;
	
	int thrusting = 0;
	
	int stillAlive = 1; //I'm doing science and I'm still alive.
	int deadWait = 0;
	
	int initx = 600;
	int inity = 10;
	
	int flat_area_1 = 0;
	int flat_area_2 = 0;

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
	
	/*Draw the full fuel guage */
	draw_fuel_guage(pixel_buffer_dev, fuel);

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
	deltax = initial_x_velocity;
	deltay = 0;
	
	float slope_b = ((float)y_land_2-(float)y_land_1)/((float)x_land_2-(float)x_land_1);
	float slope_d = ((float)y_land_f-(float)y_land_1)/((float)x_land_f-(float)x_land_3);

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
						fuel = fuel - 0.65;
						draw_fuel_guage(pixel_buffer_dev, fuel);
					
						//alt_up_pixel_buffer_dma_draw_box(pixel_buffer_dev, 0, 0, 50, 50, 3, 0);
						deltay = (deltay - thrust*cos(((theta*5.0)-90.0)*PI/180));
						deltax = (deltax - thrust*sin(((theta*5.0)-90.0)*PI/180));
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
				
				//Dead if you go off right side of the screen
				if ((deltax > 0.0) && (x1 >= alt_up_pixel_buffer_dma_x_res(pixel_buffer_dev) - 31.0))
				{
					x1 = alt_up_pixel_buffer_dma_x_res(pixel_buffer_dev) - 31.0;
					deltax = 0.0;
					stillAlive = 0;
					deadWait = 1;
				}
				//Dead if you go off the left side of the screen
				else if ((deltax < 0.0) && (x1 <= 0.0))
				{
					x1 = 0.0;
					deltax = 0.0;
					stillAlive = 0;
					deadWait = 1;
				}

				//Calculate slopes to sprite box to determine collision state
				float slope_bottom_left_b  = ((float)y_land_2-((float)y1 + 25.0))/(((float)x1 + 5.0 ) - (float)x_land_1);
				float slope_bottom_right_b = ((float)y_land_2-((float)y1 + 25.0))/(((float)x1 + 25.0) - (float)x_land_1);
				float slope_bottom_left_d  = ((float)y_land_f-((float)y1 + 25.0))/((float)x_land_f - ((float)x1 + 5.0));
				float slope_bottom_right_d = ((float)y_land_f-((float)y1 + 25.0))/( (float)x_land_f - ((float)x1 + 25.0));
				
				flat_area_1 = 0;
				flat_area_2 = 0;
				
				if (((x1+25.0) > x_land_0) && ((x1 + 5.0) < x_land_1))
					flat_area_1 = 1;
				else if (((x1 + 25.0) > x_land_2) && ((x1 + 5.0) < x_land_3))
					flat_area_2 = 1;
				
				//Dead if you hit the landscape
				if (
					(deltay > 0.0)
					&& 
					(
						( 
							//Intersection with Slope a (flat line)
							(y1 >= y_land_2 - 25.0) && flat_area_1
						)
						||
						(
							//Intersection with Slope b
							(x1 > x_land_1) && (x1 < x_land_2) && ( (slope_bottom_left_b < slope_b) || (slope_bottom_right_b < slope_b) )
						)
						||
						(
							//Intersection with Slope c (flat line)
							(y1 >= y_land_1 - 25.0) && flat_area_2
						)
						||
						(
							//Intersection with slope d
							(x1 > x_land_3) && (x1 < x_land_f) && ( (slope_bottom_left_d < slope_d) || (slope_bottom_right_d < slope_d) )
						)
						
					)
				   )
				{
					
					
					//Are we in a flat landing area?
					if ((flat_area_1 || flat_area_2) && deltay < 3.0 && deltax < 1.5 && theta == 18)
					{
						deadWait = 1;
						deltay = 0.0;
						deltax = 0.0;
						stillAlive = 2;
					}
					else
					{
						//y1 = alt_up_pixel_buffer_dma_y_res(pixel_buffer_dev) - 31.0;
						deltay = 0.0;
						stillAlive = 0;
						deadWait = 1;
					}
					
				}
				//Dead if you go off the top of the screen
				else if ((deltay < 0.0) && (y1 <= 0.0))
				{
					y1 = 0.0;
					deltay = -deltay;
					stillAlive = 0;
					deadWait = 1;
				}
				
				//Dead if you run out of fuel
				else if (fuel <= 0.0)
				{
					stillAlive = 0;
					deadWait = 1;
					fuel = 100.0;
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
				
				//you exploded!
				if (stillAlive == 0) {
					char you_died[40] = "You died!\0";
					deltax = 0.0;
					deltay = 0.0;
					alt_up_char_buffer_string (char_buffer_dev, you_died, 5, 0);
					if (deadWait) {
						if ((*pushbuttons) == 0x00) {
							deadWait = 0;
						}
					} else {
						if ((*pushbuttons) & 0x0e)
						{
							stillAlive = 1;
							char you_alive[40] = "         \0";
							alt_up_char_buffer_string (char_buffer_dev, you_alive, 5, 0);
							alt_up_pixel_buffer_dma_draw_box(pixel_buffer_dev, (int)x1, (int)y1, (int)x2, (int)y2, 0, 0);
							x1 = initx;
							y1 = inity;
							deltax = initial_x_velocity;
							fuel = 100.0;
							deltay = 0.0;
							theta = 18.0;
							turning = 0.3;
						}
					}
				}
				//you won!
				else if (stillAlive == 2) {
					char you_died[40] = "Perfect Landing!\0";
					deltax = 0.0;
					deltay = 0.0;
					alt_up_char_buffer_string (char_buffer_dev, you_died, 5, 0);
					if (deadWait) {
						if ((*pushbuttons) == 0x00) {
							deadWait = 0;
						}
					} else {
						if ((*pushbuttons) & 0x0e)
						{
							stillAlive = 1;
							char you_alive[40] = "                \0";
							alt_up_char_buffer_string (char_buffer_dev, you_alive, 5, 0);
							alt_up_pixel_buffer_dma_draw_box(pixel_buffer_dev, (int)x1, (int)y1, (int)x2, (int)y2, 0, 0);
							x1 = initx;
							y1 = inity;
							deltax = initial_x_velocity;
							fuel = 100.0;
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
	//Line segment 1: (x_land_0, y_land_2) <-> (x_land_1, y_land_2)
	alt_up_pixel_buffer_dma_draw_line(pixel_buffer_dev, x_land_0, y_land_2, x_land_1, y_land_2, 0xffff, 0);
	
	//Line segment 2: (x_land_1, y_land_2) <-> (x_land_2, y_land_1)
	alt_up_pixel_buffer_dma_draw_line(pixel_buffer_dev, x_land_1, y_land_2, x_land_2, y_land_1, 0xffff, 0);
	
	//Line segment 3: (x_land_2, y_land_1) <-> (x_land_3, y_land_1)
	alt_up_pixel_buffer_dma_draw_line(pixel_buffer_dev, x_land_2, y_land_1, x_land_3, y_land_1, 0xffff, 0);
	
	//Line Segment 4: (x_land_3, y_land_1) <-> (x_land_f, y_land_f)
	alt_up_pixel_buffer_dma_draw_line(pixel_buffer_dev, x_land_3, y_land_1, x_land_f, y_land_f, 0xffff, 0);

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
			char color = landers[theta][i][j];
			if (color) {
				if ((!thrusting) && (color > (char)0) && (color < (char)5))
				{
					color = 0;
				}
				alt_up_pixel_buffer_dma_draw(pixel_buffer_dev, (int)((color << 8) + color), x+j, y+i );
			}
		}
	}
}

void draw_fuel_guage(alt_up_pixel_buffer_dma_dev *pixel_buffer_dev, float fuel) {
	//Draw the surrounding rectangle
	alt_up_pixel_buffer_dma_draw_box(pixel_buffer_dev, 20, 20, 124, 44, 0xFFFF, 0);
	//Draw the empty fuel guage
	alt_up_pixel_buffer_dma_draw_box(pixel_buffer_dev, 22, 22, 122, 42, 0x0000, 0);
	
	int color = 0x0000;
	if (fuel > 66.0)
		color = 0x1c1c; 
	else if (fuel > 33.0)
		color = 0xfcfc;
	else
		color = 0xe0e0;
		
		alt_up_pixel_buffer_dma_draw_box(pixel_buffer_dev, 22, 22, 22+(int)fuel, 42, color, 0);

}

