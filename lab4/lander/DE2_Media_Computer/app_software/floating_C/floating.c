/* This program demonstrates use of floating-point numbers in the DE2 Media Computer
 *
 * It performs the following: 
 * 	1. reads two FP numbers from the Terminal window
 * 	2. performs +, 1, *, and / on the numbers, then prints results on Terminal window
*/
int main(void)
{
	float x, y, add, sub, mult, div;

	while(1)
	{
		printf ("Enter FP values X Y:\n");
		scanf ("%f", &x);
		printf ("%f ", x);		// echo the typed data to the Terminal window
		scanf ("%f", &y);
		printf ("%f\n", y);		// echo the typed data to the Terminal window
		add = x + y;
		sub = x - y;
		mult = x * y;
		div = x / y;
		printf ("X + Y = %f\n", add);
		printf ("X - Y = %f\n", sub);
		printf ("X * Y = %f\n", mult);
		printf ("X / Y = %f\n", div);
	}
}
