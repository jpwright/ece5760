	reg signed[15:0] value_0_0;
	reg signed[15:0] prev_0_0;
	reg signed[15:0] prev2_0_0;
	always@(posedge clk50)
	begin
		value_0_0 = ((((value_1_0+value_1_0+value_0_1+value_0_1- (prev_0_0<<<2))>>>2) + (prev_0_0<<<1) - (prev2_0_0>>>4))<<<4);
		prev2_0_0 = prev_0_0
		prev_0_0 = value_0_0;
	end
	reg signed[15:0] value_0_1;
	reg signed[15:0] prev_0_1;
	reg signed[15:0] prev2_0_1;
	always@(posedge clk50)
	begin
		value_0_1 = ((((value_1_1+value_1_1+value_0_2+value_0_0- (prev_0_1<<<2))>>>2) + (prev_0_1<<<1) - (prev2_0_1>>>4))<<<4);
		prev2_0_1 = prev_0_1
		prev_0_1 = value_0_1;
	end
	reg signed[15:0] value_0_2;
	reg signed[15:0] prev_0_2;
	reg signed[15:0] prev2_0_2;
	always@(posedge clk50)
	begin
		value_0_2 = ((((value_1_2+value_1_2+value_0_3+value_0_1- (prev_0_2<<<2))>>>2) + (prev_0_2<<<1) - (prev2_0_2>>>4))<<<4);
		prev2_0_2 = prev_0_2
		prev_0_2 = value_0_2;
	end
	reg signed[15:0] value_0_3;
	reg signed[15:0] prev_0_3;
	reg signed[15:0] prev2_0_3;
	always@(posedge clk50)
	begin
		value_0_3 = ((((value_1_3+value_1_3+value_0_4+value_0_2- (prev_0_3<<<2))>>>2) + (prev_0_3<<<1) - (prev2_0_3>>>4))<<<4);
		prev2_0_3 = prev_0_3
		prev_0_3 = value_0_3;
	end
	reg signed[15:0] value_0_4;
	reg signed[15:0] prev_0_4;
	reg signed[15:0] prev2_0_4;
	always@(posedge clk50)
	begin
		value_0_4 = ((((value_1_4+value_1_4+value_0_5+value_0_3- (prev_0_4<<<2))>>>2) + (prev_0_4<<<1) - (prev2_0_4>>>4))<<<4);
		prev2_0_4 = prev_0_4
		prev_0_4 = value_0_4;
	end
	reg signed[15:0] value_0_5;
	reg signed[15:0] prev_0_5;
	reg signed[15:0] prev2_0_5;
	always@(posedge clk50)
	begin
		value_0_5 = ((((value_1_5+value_1_5+value_0_6+value_0_4- (prev_0_5<<<2))>>>2) + (prev_0_5<<<1) - (prev2_0_5>>>4))<<<4);
		prev2_0_5 = prev_0_5
		prev_0_5 = value_0_5;
	end
	reg signed[15:0] value_0_6;
	reg signed[15:0] prev_0_6;
	reg signed[15:0] prev2_0_6;
	always@(posedge clk50)
	begin
		value_0_6 = ((((value_1_6+value_1_6+value_0_7+value_0_5- (prev_0_6<<<2))>>>2) + (prev_0_6<<<1) - (prev2_0_6>>>4))<<<4);
		prev2_0_6 = prev_0_6
		prev_0_6 = value_0_6;
	end
	reg signed[15:0] value_0_7;
	reg signed[15:0] prev_0_7;
	reg signed[15:0] prev2_0_7;
	always@(posedge clk50)
	begin
		value_0_7 = ((((value_1_7+value_1_7+value_0_8+value_0_6- (prev_0_7<<<2))>>>2) + (prev_0_7<<<1) - (prev2_0_7>>>4))<<<4);
		prev2_0_7 = prev_0_7
		prev_0_7 = value_0_7;
	end
	reg signed[15:0] value_0_8;
	reg signed[15:0] prev_0_8;
	reg signed[15:0] prev2_0_8;
	always@(posedge clk50)
	begin
		value_0_8 = ((((value_1_8+value_1_8+value_0_9+value_0_7- (prev_0_8<<<2))>>>2) + (prev_0_8<<<1) - (prev2_0_8>>>4))<<<4);
		prev2_0_8 = prev_0_8
		prev_0_8 = value_0_8;
	end
	reg signed[15:0] value_0_9;
	reg signed[15:0] prev_0_9;
	reg signed[15:0] prev2_0_9;
	always@(posedge clk50)
	begin
		value_0_9 = ((((value_1_9+value_1_9++value_0_8- (prev_0_9<<<2))>>>2) + (prev_0_9<<<1) - (prev2_0_9>>>4))<<<4);
		prev2_0_9 = prev_0_9
		prev_0_9 = value_0_9;
	end
	reg signed[15:0] value_1_0;
	reg signed[15:0] prev_1_0;
	reg signed[15:0] prev2_1_0;
	always@(posedge clk50)
	begin
		value_1_0 = ((((value_0_0+value_2_0+value_1_1+value_1_1- (prev_1_0<<<2))>>>2) + (prev_1_0<<<1) - (prev2_1_0>>>4))<<<4);
		prev2_1_0 = prev_1_0
		prev_1_0 = value_1_0;
	end
	reg signed[15:0] value_1_1;
	reg signed[15:0] prev_1_1;
	reg signed[15:0] prev2_1_1;
	always@(posedge clk50)
	begin
		value_1_1 = ((((value_0_1+value_2_1+value_1_2+value_1_0- (prev_1_1<<<2))>>>2) + (prev_1_1<<<1) - (prev2_1_1>>>4))<<<4);
		prev2_1_1 = prev_1_1
		prev_1_1 = value_1_1;
	end
	reg signed[15:0] value_1_2;
	reg signed[15:0] prev_1_2;
	reg signed[15:0] prev2_1_2;
	always@(posedge clk50)
	begin
		value_1_2 = ((((value_0_2+value_2_2+value_1_3+value_1_1- (prev_1_2<<<2))>>>2) + (prev_1_2<<<1) - (prev2_1_2>>>4))<<<4);
		prev2_1_2 = prev_1_2
		prev_1_2 = value_1_2;
	end
	reg signed[15:0] value_1_3;
	reg signed[15:0] prev_1_3;
	reg signed[15:0] prev2_1_3;
	always@(posedge clk50)
	begin
		value_1_3 = ((((value_0_3+value_2_3+value_1_4+value_1_2- (prev_1_3<<<2))>>>2) + (prev_1_3<<<1) - (prev2_1_3>>>4))<<<4);
		prev2_1_3 = prev_1_3
		prev_1_3 = value_1_3;
	end
	reg signed[15:0] value_1_4;
	reg signed[15:0] prev_1_4;
	reg signed[15:0] prev2_1_4;
	always@(posedge clk50)
	begin
		value_1_4 = ((((value_0_4+value_2_4+value_1_5+value_1_3- (prev_1_4<<<2))>>>2) + (prev_1_4<<<1) - (prev2_1_4>>>4))<<<4);
		prev2_1_4 = prev_1_4
		prev_1_4 = value_1_4;
	end
	reg signed[15:0] value_1_5;
	reg signed[15:0] prev_1_5;
	reg signed[15:0] prev2_1_5;
	always@(posedge clk50)
	begin
		value_1_5 = ((((value_0_5+value_2_5+value_1_6+value_1_4- (prev_1_5<<<2))>>>2) + (prev_1_5<<<1) - (prev2_1_5>>>4))<<<4);
		prev2_1_5 = prev_1_5
		prev_1_5 = value_1_5;
	end
	reg signed[15:0] value_1_6;
	reg signed[15:0] prev_1_6;
	reg signed[15:0] prev2_1_6;
	always@(posedge clk50)
	begin
		value_1_6 = ((((value_0_6+value_2_6+value_1_7+value_1_5- (prev_1_6<<<2))>>>2) + (prev_1_6<<<1) - (prev2_1_6>>>4))<<<4);
		prev2_1_6 = prev_1_6
		prev_1_6 = value_1_6;
	end
	reg signed[15:0] value_1_7;
	reg signed[15:0] prev_1_7;
	reg signed[15:0] prev2_1_7;
	always@(posedge clk50)
	begin
		value_1_7 = ((((value_0_7+value_2_7+value_1_8+value_1_6- (prev_1_7<<<2))>>>2) + (prev_1_7<<<1) - (prev2_1_7>>>4))<<<4);
		prev2_1_7 = prev_1_7
		prev_1_7 = value_1_7;
	end
	reg signed[15:0] value_1_8;
	reg signed[15:0] prev_1_8;
	reg signed[15:0] prev2_1_8;
	always@(posedge clk50)
	begin
		value_1_8 = ((((value_0_8+value_2_8+value_1_9+value_1_7- (prev_1_8<<<2))>>>2) + (prev_1_8<<<1) - (prev2_1_8>>>4))<<<4);
		prev2_1_8 = prev_1_8
		prev_1_8 = value_1_8;
	end
	reg signed[15:0] value_1_9;
	reg signed[15:0] prev_1_9;
	reg signed[15:0] prev2_1_9;
	always@(posedge clk50)
	begin
		value_1_9 = ((((value_0_9+value_2_9++value_1_8- (prev_1_9<<<2))>>>2) + (prev_1_9<<<1) - (prev2_1_9>>>4))<<<4);
		prev2_1_9 = prev_1_9
		prev_1_9 = value_1_9;
	end
	reg signed[15:0] value_2_0;
	reg signed[15:0] prev_2_0;
	reg signed[15:0] prev2_2_0;
	always@(posedge clk50)
	begin
		value_2_0 = ((((value_1_0+value_3_0+value_2_1+value_2_1- (prev_2_0<<<2))>>>2) + (prev_2_0<<<1) - (prev2_2_0>>>4))<<<4);
		prev2_2_0 = prev_2_0
		prev_2_0 = value_2_0;
	end
	reg signed[15:0] value_2_1;
	reg signed[15:0] prev_2_1;
	reg signed[15:0] prev2_2_1;
	always@(posedge clk50)
	begin
		value_2_1 = ((((value_1_1+value_3_1+value_2_2+value_2_0- (prev_2_1<<<2))>>>2) + (prev_2_1<<<1) - (prev2_2_1>>>4))<<<4);
		prev2_2_1 = prev_2_1
		prev_2_1 = value_2_1;
	end
	reg signed[15:0] value_2_2;
	reg signed[15:0] prev_2_2;
	reg signed[15:0] prev2_2_2;
	always@(posedge clk50)
	begin
		value_2_2 = ((((value_1_2+value_3_2+value_2_3+value_2_1- (prev_2_2<<<2))>>>2) + (prev_2_2<<<1) - (prev2_2_2>>>4))<<<4);
		prev2_2_2 = prev_2_2
		prev_2_2 = value_2_2;
	end
	reg signed[15:0] value_2_3;
	reg signed[15:0] prev_2_3;
	reg signed[15:0] prev2_2_3;
	always@(posedge clk50)
	begin
		value_2_3 = ((((value_1_3+value_3_3+value_2_4+value_2_2- (prev_2_3<<<2))>>>2) + (prev_2_3<<<1) - (prev2_2_3>>>4))<<<4);
		prev2_2_3 = prev_2_3
		prev_2_3 = value_2_3;
	end
	reg signed[15:0] value_2_4;
	reg signed[15:0] prev_2_4;
	reg signed[15:0] prev2_2_4;
	always@(posedge clk50)
	begin
		value_2_4 = ((((value_1_4+value_3_4+value_2_5+value_2_3- (prev_2_4<<<2))>>>2) + (prev_2_4<<<1) - (prev2_2_4>>>4))<<<4);
		prev2_2_4 = prev_2_4
		prev_2_4 = value_2_4;
	end
	reg signed[15:0] value_2_5;
	reg signed[15:0] prev_2_5;
	reg signed[15:0] prev2_2_5;
	always@(posedge clk50)
	begin
		value_2_5 = ((((value_1_5+value_3_5+value_2_6+value_2_4- (prev_2_5<<<2))>>>2) + (prev_2_5<<<1) - (prev2_2_5>>>4))<<<4);
		prev2_2_5 = prev_2_5
		prev_2_5 = value_2_5;
	end
	reg signed[15:0] value_2_6;
	reg signed[15:0] prev_2_6;
	reg signed[15:0] prev2_2_6;
	always@(posedge clk50)
	begin
		value_2_6 = ((((value_1_6+value_3_6+value_2_7+value_2_5- (prev_2_6<<<2))>>>2) + (prev_2_6<<<1) - (prev2_2_6>>>4))<<<4);
		prev2_2_6 = prev_2_6
		prev_2_6 = value_2_6;
	end
	reg signed[15:0] value_2_7;
	reg signed[15:0] prev_2_7;
	reg signed[15:0] prev2_2_7;
	always@(posedge clk50)
	begin
		value_2_7 = ((((value_1_7+value_3_7+value_2_8+value_2_6- (prev_2_7<<<2))>>>2) + (prev_2_7<<<1) - (prev2_2_7>>>4))<<<4);
		prev2_2_7 = prev_2_7
		prev_2_7 = value_2_7;
	end
	reg signed[15:0] value_2_8;
	reg signed[15:0] prev_2_8;
	reg signed[15:0] prev2_2_8;
	always@(posedge clk50)
	begin
		value_2_8 = ((((value_1_8+value_3_8+value_2_9+value_2_7- (prev_2_8<<<2))>>>2) + (prev_2_8<<<1) - (prev2_2_8>>>4))<<<4);
		prev2_2_8 = prev_2_8
		prev_2_8 = value_2_8;
	end
	reg signed[15:0] value_2_9;
	reg signed[15:0] prev_2_9;
	reg signed[15:0] prev2_2_9;
	always@(posedge clk50)
	begin
		value_2_9 = ((((value_1_9+value_3_9++value_2_8- (prev_2_9<<<2))>>>2) + (prev_2_9<<<1) - (prev2_2_9>>>4))<<<4);
		prev2_2_9 = prev_2_9
		prev_2_9 = value_2_9;
	end
	reg signed[15:0] value_3_0;
	reg signed[15:0] prev_3_0;
	reg signed[15:0] prev2_3_0;
	always@(posedge clk50)
	begin
		value_3_0 = ((((value_2_0+value_4_0+value_3_1+value_3_1- (prev_3_0<<<2))>>>2) + (prev_3_0<<<1) - (prev2_3_0>>>4))<<<4);
		prev2_3_0 = prev_3_0
		prev_3_0 = value_3_0;
	end
	reg signed[15:0] value_3_1;
	reg signed[15:0] prev_3_1;
	reg signed[15:0] prev2_3_1;
	always@(posedge clk50)
	begin
		value_3_1 = ((((value_2_1+value_4_1+value_3_2+value_3_0- (prev_3_1<<<2))>>>2) + (prev_3_1<<<1) - (prev2_3_1>>>4))<<<4);
		prev2_3_1 = prev_3_1
		prev_3_1 = value_3_1;
	end
	reg signed[15:0] value_3_2;
	reg signed[15:0] prev_3_2;
	reg signed[15:0] prev2_3_2;
	always@(posedge clk50)
	begin
		value_3_2 = ((((value_2_2+value_4_2+value_3_3+value_3_1- (prev_3_2<<<2))>>>2) + (prev_3_2<<<1) - (prev2_3_2>>>4))<<<4);
		prev2_3_2 = prev_3_2
		prev_3_2 = value_3_2;
	end
	reg signed[15:0] value_3_3;
	reg signed[15:0] prev_3_3;
	reg signed[15:0] prev2_3_3;
	always@(posedge clk50)
	begin
		value_3_3 = ((((value_2_3+value_4_3+value_3_4+value_3_2- (prev_3_3<<<2))>>>2) + (prev_3_3<<<1) - (prev2_3_3>>>4))<<<4);
		prev2_3_3 = prev_3_3
		prev_3_3 = value_3_3;
	end
	reg signed[15:0] value_3_4;
	reg signed[15:0] prev_3_4;
	reg signed[15:0] prev2_3_4;
	always@(posedge clk50)
	begin
		value_3_4 = ((((value_2_4+value_4_4+value_3_5+value_3_3- (prev_3_4<<<2))>>>2) + (prev_3_4<<<1) - (prev2_3_4>>>4))<<<4);
		prev2_3_4 = prev_3_4
		prev_3_4 = value_3_4;
	end
	reg signed[15:0] value_3_5;
	reg signed[15:0] prev_3_5;
	reg signed[15:0] prev2_3_5;
	always@(posedge clk50)
	begin
		value_3_5 = ((((value_2_5+value_4_5+value_3_6+value_3_4- (prev_3_5<<<2))>>>2) + (prev_3_5<<<1) - (prev2_3_5>>>4))<<<4);
		prev2_3_5 = prev_3_5
		prev_3_5 = value_3_5;
	end
	reg signed[15:0] value_3_6;
	reg signed[15:0] prev_3_6;
	reg signed[15:0] prev2_3_6;
	always@(posedge clk50)
	begin
		value_3_6 = ((((value_2_6+value_4_6+value_3_7+value_3_5- (prev_3_6<<<2))>>>2) + (prev_3_6<<<1) - (prev2_3_6>>>4))<<<4);
		prev2_3_6 = prev_3_6
		prev_3_6 = value_3_6;
	end
	reg signed[15:0] value_3_7;
	reg signed[15:0] prev_3_7;
	reg signed[15:0] prev2_3_7;
	always@(posedge clk50)
	begin
		value_3_7 = ((((value_2_7+value_4_7+value_3_8+value_3_6- (prev_3_7<<<2))>>>2) + (prev_3_7<<<1) - (prev2_3_7>>>4))<<<4);
		prev2_3_7 = prev_3_7
		prev_3_7 = value_3_7;
	end
	reg signed[15:0] value_3_8;
	reg signed[15:0] prev_3_8;
	reg signed[15:0] prev2_3_8;
	always@(posedge clk50)
	begin
		value_3_8 = ((((value_2_8+value_4_8+value_3_9+value_3_7- (prev_3_8<<<2))>>>2) + (prev_3_8<<<1) - (prev2_3_8>>>4))<<<4);
		prev2_3_8 = prev_3_8
		prev_3_8 = value_3_8;
	end
	reg signed[15:0] value_3_9;
	reg signed[15:0] prev_3_9;
	reg signed[15:0] prev2_3_9;
	always@(posedge clk50)
	begin
		value_3_9 = ((((value_2_9+value_4_9++value_3_8- (prev_3_9<<<2))>>>2) + (prev_3_9<<<1) - (prev2_3_9>>>4))<<<4);
		prev2_3_9 = prev_3_9
		prev_3_9 = value_3_9;
	end
	reg signed[15:0] value_4_0;
	reg signed[15:0] prev_4_0;
	reg signed[15:0] prev2_4_0;
	always@(posedge clk50)
	begin
		value_4_0 = ((((value_3_0+value_5_0+value_4_1+value_4_1- (prev_4_0<<<2))>>>2) + (prev_4_0<<<1) - (prev2_4_0>>>4))<<<4);
		prev2_4_0 = prev_4_0
		prev_4_0 = value_4_0;
	end
	reg signed[15:0] value_4_1;
	reg signed[15:0] prev_4_1;
	reg signed[15:0] prev2_4_1;
	always@(posedge clk50)
	begin
		value_4_1 = ((((value_3_1+value_5_1+value_4_2+value_4_0- (prev_4_1<<<2))>>>2) + (prev_4_1<<<1) - (prev2_4_1>>>4))<<<4);
		prev2_4_1 = prev_4_1
		prev_4_1 = value_4_1;
	end
	reg signed[15:0] value_4_2;
	reg signed[15:0] prev_4_2;
	reg signed[15:0] prev2_4_2;
	always@(posedge clk50)
	begin
		value_4_2 = ((((value_3_2+value_5_2+value_4_3+value_4_1- (prev_4_2<<<2))>>>2) + (prev_4_2<<<1) - (prev2_4_2>>>4))<<<4);
		prev2_4_2 = prev_4_2
		prev_4_2 = value_4_2;
	end
	reg signed[15:0] value_4_3;
	reg signed[15:0] prev_4_3;
	reg signed[15:0] prev2_4_3;
	always@(posedge clk50)
	begin
		value_4_3 = ((((value_3_3+value_5_3+value_4_4+value_4_2- (prev_4_3<<<2))>>>2) + (prev_4_3<<<1) - (prev2_4_3>>>4))<<<4);
		prev2_4_3 = prev_4_3
		prev_4_3 = value_4_3;
	end
	reg signed[15:0] value_4_4;
	reg signed[15:0] prev_4_4;
	reg signed[15:0] prev2_4_4;
	always@(posedge clk50)
	begin
		value_4_4 = ((((value_3_4+value_5_4+value_4_5+value_4_3- (prev_4_4<<<2))>>>2) + (prev_4_4<<<1) - (prev2_4_4>>>4))<<<4);
		prev2_4_4 = prev_4_4
		prev_4_4 = value_4_4;
	end
	reg signed[15:0] value_4_5;
	reg signed[15:0] prev_4_5;
	reg signed[15:0] prev2_4_5;
	always@(posedge clk50)
	begin
		value_4_5 = ((((value_3_5+value_5_5+value_4_6+value_4_4- (prev_4_5<<<2))>>>2) + (prev_4_5<<<1) - (prev2_4_5>>>4))<<<4);
		prev2_4_5 = prev_4_5
		prev_4_5 = value_4_5;
	end
	reg signed[15:0] value_4_6;
	reg signed[15:0] prev_4_6;
	reg signed[15:0] prev2_4_6;
	always@(posedge clk50)
	begin
		value_4_6 = ((((value_3_6+value_5_6+value_4_7+value_4_5- (prev_4_6<<<2))>>>2) + (prev_4_6<<<1) - (prev2_4_6>>>4))<<<4);
		prev2_4_6 = prev_4_6
		prev_4_6 = value_4_6;
	end
	reg signed[15:0] value_4_7;
	reg signed[15:0] prev_4_7;
	reg signed[15:0] prev2_4_7;
	always@(posedge clk50)
	begin
		value_4_7 = ((((value_3_7+value_5_7+value_4_8+value_4_6- (prev_4_7<<<2))>>>2) + (prev_4_7<<<1) - (prev2_4_7>>>4))<<<4);
		prev2_4_7 = prev_4_7
		prev_4_7 = value_4_7;
	end
	reg signed[15:0] value_4_8;
	reg signed[15:0] prev_4_8;
	reg signed[15:0] prev2_4_8;
	always@(posedge clk50)
	begin
		value_4_8 = ((((value_3_8+value_5_8+value_4_9+value_4_7- (prev_4_8<<<2))>>>2) + (prev_4_8<<<1) - (prev2_4_8>>>4))<<<4);
		prev2_4_8 = prev_4_8
		prev_4_8 = value_4_8;
	end
	reg signed[15:0] value_4_9;
	reg signed[15:0] prev_4_9;
	reg signed[15:0] prev2_4_9;
	always@(posedge clk50)
	begin
		value_4_9 = ((((value_3_9+value_5_9++value_4_8- (prev_4_9<<<2))>>>2) + (prev_4_9<<<1) - (prev2_4_9>>>4))<<<4);
		prev2_4_9 = prev_4_9
		prev_4_9 = value_4_9;
	end
	reg signed[15:0] value_5_0;
	reg signed[15:0] prev_5_0;
	reg signed[15:0] prev2_5_0;
	always@(posedge clk50)
	begin
		value_5_0 = ((((value_4_0+value_6_0+value_5_1+value_5_1- (prev_5_0<<<2))>>>2) + (prev_5_0<<<1) - (prev2_5_0>>>4))<<<4);
		prev2_5_0 = prev_5_0
		prev_5_0 = value_5_0;
	end
	reg signed[15:0] value_5_1;
	reg signed[15:0] prev_5_1;
	reg signed[15:0] prev2_5_1;
	always@(posedge clk50)
	begin
		value_5_1 = ((((value_4_1+value_6_1+value_5_2+value_5_0- (prev_5_1<<<2))>>>2) + (prev_5_1<<<1) - (prev2_5_1>>>4))<<<4);
		prev2_5_1 = prev_5_1
		prev_5_1 = value_5_1;
	end
	reg signed[15:0] value_5_2;
	reg signed[15:0] prev_5_2;
	reg signed[15:0] prev2_5_2;
	always@(posedge clk50)
	begin
		value_5_2 = ((((value_4_2+value_6_2+value_5_3+value_5_1- (prev_5_2<<<2))>>>2) + (prev_5_2<<<1) - (prev2_5_2>>>4))<<<4);
		prev2_5_2 = prev_5_2
		prev_5_2 = value_5_2;
	end
	reg signed[15:0] value_5_3;
	reg signed[15:0] prev_5_3;
	reg signed[15:0] prev2_5_3;
	always@(posedge clk50)
	begin
		value_5_3 = ((((value_4_3+value_6_3+value_5_4+value_5_2- (prev_5_3<<<2))>>>2) + (prev_5_3<<<1) - (prev2_5_3>>>4))<<<4);
		prev2_5_3 = prev_5_3
		prev_5_3 = value_5_3;
	end
	reg signed[15:0] value_5_4;
	reg signed[15:0] prev_5_4;
	reg signed[15:0] prev2_5_4;
	always@(posedge clk50)
	begin
		value_5_4 = ((((value_4_4+value_6_4+value_5_5+value_5_3- (prev_5_4<<<2))>>>2) + (prev_5_4<<<1) - (prev2_5_4>>>4))<<<4);
		prev2_5_4 = prev_5_4
		prev_5_4 = value_5_4;
	end
	reg signed[15:0] value_5_5;
	reg signed[15:0] prev_5_5;
	reg signed[15:0] prev2_5_5;
	always@(posedge clk50)
	begin
		value_5_5 = ((((value_4_5+value_6_5+value_5_6+value_5_4- (prev_5_5<<<2))>>>2) + (prev_5_5<<<1) - (prev2_5_5>>>4))<<<4);
		prev2_5_5 = prev_5_5
		prev_5_5 = value_5_5;
	end
	reg signed[15:0] value_5_6;
	reg signed[15:0] prev_5_6;
	reg signed[15:0] prev2_5_6;
	always@(posedge clk50)
	begin
		value_5_6 = ((((value_4_6+value_6_6+value_5_7+value_5_5- (prev_5_6<<<2))>>>2) + (prev_5_6<<<1) - (prev2_5_6>>>4))<<<4);
		prev2_5_6 = prev_5_6
		prev_5_6 = value_5_6;
	end
	reg signed[15:0] value_5_7;
	reg signed[15:0] prev_5_7;
	reg signed[15:0] prev2_5_7;
	always@(posedge clk50)
	begin
		value_5_7 = ((((value_4_7+value_6_7+value_5_8+value_5_6- (prev_5_7<<<2))>>>2) + (prev_5_7<<<1) - (prev2_5_7>>>4))<<<4);
		prev2_5_7 = prev_5_7
		prev_5_7 = value_5_7;
	end
	reg signed[15:0] value_5_8;
	reg signed[15:0] prev_5_8;
	reg signed[15:0] prev2_5_8;
	always@(posedge clk50)
	begin
		value_5_8 = ((((value_4_8+value_6_8+value_5_9+value_5_7- (prev_5_8<<<2))>>>2) + (prev_5_8<<<1) - (prev2_5_8>>>4))<<<4);
		prev2_5_8 = prev_5_8
		prev_5_8 = value_5_8;
	end
	reg signed[15:0] value_5_9;
	reg signed[15:0] prev_5_9;
	reg signed[15:0] prev2_5_9;
	always@(posedge clk50)
	begin
		value_5_9 = ((((value_4_9+value_6_9++value_5_8- (prev_5_9<<<2))>>>2) + (prev_5_9<<<1) - (prev2_5_9>>>4))<<<4);
		prev2_5_9 = prev_5_9
		prev_5_9 = value_5_9;
	end
	reg signed[15:0] value_6_0;
	reg signed[15:0] prev_6_0;
	reg signed[15:0] prev2_6_0;
	always@(posedge clk50)
	begin
		value_6_0 = ((((value_5_0+value_7_0+value_6_1+value_6_1- (prev_6_0<<<2))>>>2) + (prev_6_0<<<1) - (prev2_6_0>>>4))<<<4);
		prev2_6_0 = prev_6_0
		prev_6_0 = value_6_0;
	end
	reg signed[15:0] value_6_1;
	reg signed[15:0] prev_6_1;
	reg signed[15:0] prev2_6_1;
	always@(posedge clk50)
	begin
		value_6_1 = ((((value_5_1+value_7_1+value_6_2+value_6_0- (prev_6_1<<<2))>>>2) + (prev_6_1<<<1) - (prev2_6_1>>>4))<<<4);
		prev2_6_1 = prev_6_1
		prev_6_1 = value_6_1;
	end
	reg signed[15:0] value_6_2;
	reg signed[15:0] prev_6_2;
	reg signed[15:0] prev2_6_2;
	always@(posedge clk50)
	begin
		value_6_2 = ((((value_5_2+value_7_2+value_6_3+value_6_1- (prev_6_2<<<2))>>>2) + (prev_6_2<<<1) - (prev2_6_2>>>4))<<<4);
		prev2_6_2 = prev_6_2
		prev_6_2 = value_6_2;
	end
	reg signed[15:0] value_6_3;
	reg signed[15:0] prev_6_3;
	reg signed[15:0] prev2_6_3;
	always@(posedge clk50)
	begin
		value_6_3 = ((((value_5_3+value_7_3+value_6_4+value_6_2- (prev_6_3<<<2))>>>2) + (prev_6_3<<<1) - (prev2_6_3>>>4))<<<4);
		prev2_6_3 = prev_6_3
		prev_6_3 = value_6_3;
	end
	reg signed[15:0] value_6_4;
	reg signed[15:0] prev_6_4;
	reg signed[15:0] prev2_6_4;
	always@(posedge clk50)
	begin
		value_6_4 = ((((value_5_4+value_7_4+value_6_5+value_6_3- (prev_6_4<<<2))>>>2) + (prev_6_4<<<1) - (prev2_6_4>>>4))<<<4);
		prev2_6_4 = prev_6_4
		prev_6_4 = value_6_4;
	end
	reg signed[15:0] value_6_5;
	reg signed[15:0] prev_6_5;
	reg signed[15:0] prev2_6_5;
	always@(posedge clk50)
	begin
		value_6_5 = ((((value_5_5+value_7_5+value_6_6+value_6_4- (prev_6_5<<<2))>>>2) + (prev_6_5<<<1) - (prev2_6_5>>>4))<<<4);
		prev2_6_5 = prev_6_5
		prev_6_5 = value_6_5;
	end
	reg signed[15:0] value_6_6;
	reg signed[15:0] prev_6_6;
	reg signed[15:0] prev2_6_6;
	always@(posedge clk50)
	begin
		value_6_6 = ((((value_5_6+value_7_6+value_6_7+value_6_5- (prev_6_6<<<2))>>>2) + (prev_6_6<<<1) - (prev2_6_6>>>4))<<<4);
		prev2_6_6 = prev_6_6
		prev_6_6 = value_6_6;
	end
	reg signed[15:0] value_6_7;
	reg signed[15:0] prev_6_7;
	reg signed[15:0] prev2_6_7;
	always@(posedge clk50)
	begin
		value_6_7 = ((((value_5_7+value_7_7+value_6_8+value_6_6- (prev_6_7<<<2))>>>2) + (prev_6_7<<<1) - (prev2_6_7>>>4))<<<4);
		prev2_6_7 = prev_6_7
		prev_6_7 = value_6_7;
	end
	reg signed[15:0] value_6_8;
	reg signed[15:0] prev_6_8;
	reg signed[15:0] prev2_6_8;
	always@(posedge clk50)
	begin
		value_6_8 = ((((value_5_8+value_7_8+value_6_9+value_6_7- (prev_6_8<<<2))>>>2) + (prev_6_8<<<1) - (prev2_6_8>>>4))<<<4);
		prev2_6_8 = prev_6_8
		prev_6_8 = value_6_8;
	end
	reg signed[15:0] value_6_9;
	reg signed[15:0] prev_6_9;
	reg signed[15:0] prev2_6_9;
	always@(posedge clk50)
	begin
		value_6_9 = ((((value_5_9+value_7_9++value_6_8- (prev_6_9<<<2))>>>2) + (prev_6_9<<<1) - (prev2_6_9>>>4))<<<4);
		prev2_6_9 = prev_6_9
		prev_6_9 = value_6_9;
	end
	reg signed[15:0] value_7_0;
	reg signed[15:0] prev_7_0;
	reg signed[15:0] prev2_7_0;
	always@(posedge clk50)
	begin
		value_7_0 = ((((value_6_0+value_8_0+value_7_1+value_7_1- (prev_7_0<<<2))>>>2) + (prev_7_0<<<1) - (prev2_7_0>>>4))<<<4);
		prev2_7_0 = prev_7_0
		prev_7_0 = value_7_0;
	end
	reg signed[15:0] value_7_1;
	reg signed[15:0] prev_7_1;
	reg signed[15:0] prev2_7_1;
	always@(posedge clk50)
	begin
		value_7_1 = ((((value_6_1+value_8_1+value_7_2+value_7_0- (prev_7_1<<<2))>>>2) + (prev_7_1<<<1) - (prev2_7_1>>>4))<<<4);
		prev2_7_1 = prev_7_1
		prev_7_1 = value_7_1;
	end
	reg signed[15:0] value_7_2;
	reg signed[15:0] prev_7_2;
	reg signed[15:0] prev2_7_2;
	always@(posedge clk50)
	begin
		value_7_2 = ((((value_6_2+value_8_2+value_7_3+value_7_1- (prev_7_2<<<2))>>>2) + (prev_7_2<<<1) - (prev2_7_2>>>4))<<<4);
		prev2_7_2 = prev_7_2
		prev_7_2 = value_7_2;
	end
	reg signed[15:0] value_7_3;
	reg signed[15:0] prev_7_3;
	reg signed[15:0] prev2_7_3;
	always@(posedge clk50)
	begin
		value_7_3 = ((((value_6_3+value_8_3+value_7_4+value_7_2- (prev_7_3<<<2))>>>2) + (prev_7_3<<<1) - (prev2_7_3>>>4))<<<4);
		prev2_7_3 = prev_7_3
		prev_7_3 = value_7_3;
	end
	reg signed[15:0] value_7_4;
	reg signed[15:0] prev_7_4;
	reg signed[15:0] prev2_7_4;
	always@(posedge clk50)
	begin
		value_7_4 = ((((value_6_4+value_8_4+value_7_5+value_7_3- (prev_7_4<<<2))>>>2) + (prev_7_4<<<1) - (prev2_7_4>>>4))<<<4);
		prev2_7_4 = prev_7_4
		prev_7_4 = value_7_4;
	end
	reg signed[15:0] value_7_5;
	reg signed[15:0] prev_7_5;
	reg signed[15:0] prev2_7_5;
	always@(posedge clk50)
	begin
		value_7_5 = ((((value_6_5+value_8_5+value_7_6+value_7_4- (prev_7_5<<<2))>>>2) + (prev_7_5<<<1) - (prev2_7_5>>>4))<<<4);
		prev2_7_5 = prev_7_5
		prev_7_5 = value_7_5;
	end
	reg signed[15:0] value_7_6;
	reg signed[15:0] prev_7_6;
	reg signed[15:0] prev2_7_6;
	always@(posedge clk50)
	begin
		value_7_6 = ((((value_6_6+value_8_6+value_7_7+value_7_5- (prev_7_6<<<2))>>>2) + (prev_7_6<<<1) - (prev2_7_6>>>4))<<<4);
		prev2_7_6 = prev_7_6
		prev_7_6 = value_7_6;
	end
	reg signed[15:0] value_7_7;
	reg signed[15:0] prev_7_7;
	reg signed[15:0] prev2_7_7;
	always@(posedge clk50)
	begin
		value_7_7 = ((((value_6_7+value_8_7+value_7_8+value_7_6- (prev_7_7<<<2))>>>2) + (prev_7_7<<<1) - (prev2_7_7>>>4))<<<4);
		prev2_7_7 = prev_7_7
		prev_7_7 = value_7_7;
	end
	reg signed[15:0] value_7_8;
	reg signed[15:0] prev_7_8;
	reg signed[15:0] prev2_7_8;
	always@(posedge clk50)
	begin
		value_7_8 = ((((value_6_8+value_8_8+value_7_9+value_7_7- (prev_7_8<<<2))>>>2) + (prev_7_8<<<1) - (prev2_7_8>>>4))<<<4);
		prev2_7_8 = prev_7_8
		prev_7_8 = value_7_8;
	end
	reg signed[15:0] value_7_9;
	reg signed[15:0] prev_7_9;
	reg signed[15:0] prev2_7_9;
	always@(posedge clk50)
	begin
		value_7_9 = ((((value_6_9+value_8_9++value_7_8- (prev_7_9<<<2))>>>2) + (prev_7_9<<<1) - (prev2_7_9>>>4))<<<4);
		prev2_7_9 = prev_7_9
		prev_7_9 = value_7_9;
	end
	reg signed[15:0] value_8_0;
	reg signed[15:0] prev_8_0;
	reg signed[15:0] prev2_8_0;
	always@(posedge clk50)
	begin
		value_8_0 = ((((value_7_0+value_9_0+value_8_1+value_8_1- (prev_8_0<<<2))>>>2) + (prev_8_0<<<1) - (prev2_8_0>>>4))<<<4);
		prev2_8_0 = prev_8_0
		prev_8_0 = value_8_0;
	end
	reg signed[15:0] value_8_1;
	reg signed[15:0] prev_8_1;
	reg signed[15:0] prev2_8_1;
	always@(posedge clk50)
	begin
		value_8_1 = ((((value_7_1+value_9_1+value_8_2+value_8_0- (prev_8_1<<<2))>>>2) + (prev_8_1<<<1) - (prev2_8_1>>>4))<<<4);
		prev2_8_1 = prev_8_1
		prev_8_1 = value_8_1;
	end
	reg signed[15:0] value_8_2;
	reg signed[15:0] prev_8_2;
	reg signed[15:0] prev2_8_2;
	always@(posedge clk50)
	begin
		value_8_2 = ((((value_7_2+value_9_2+value_8_3+value_8_1- (prev_8_2<<<2))>>>2) + (prev_8_2<<<1) - (prev2_8_2>>>4))<<<4);
		prev2_8_2 = prev_8_2
		prev_8_2 = value_8_2;
	end
	reg signed[15:0] value_8_3;
	reg signed[15:0] prev_8_3;
	reg signed[15:0] prev2_8_3;
	always@(posedge clk50)
	begin
		value_8_3 = ((((value_7_3+value_9_3+value_8_4+value_8_2- (prev_8_3<<<2))>>>2) + (prev_8_3<<<1) - (prev2_8_3>>>4))<<<4);
		prev2_8_3 = prev_8_3
		prev_8_3 = value_8_3;
	end
	reg signed[15:0] value_8_4;
	reg signed[15:0] prev_8_4;
	reg signed[15:0] prev2_8_4;
	always@(posedge clk50)
	begin
		value_8_4 = ((((value_7_4+value_9_4+value_8_5+value_8_3- (prev_8_4<<<2))>>>2) + (prev_8_4<<<1) - (prev2_8_4>>>4))<<<4);
		prev2_8_4 = prev_8_4
		prev_8_4 = value_8_4;
	end
	reg signed[15:0] value_8_5;
	reg signed[15:0] prev_8_5;
	reg signed[15:0] prev2_8_5;
	always@(posedge clk50)
	begin
		value_8_5 = ((((value_7_5+value_9_5+value_8_6+value_8_4- (prev_8_5<<<2))>>>2) + (prev_8_5<<<1) - (prev2_8_5>>>4))<<<4);
		prev2_8_5 = prev_8_5
		prev_8_5 = value_8_5;
	end
	reg signed[15:0] value_8_6;
	reg signed[15:0] prev_8_6;
	reg signed[15:0] prev2_8_6;
	always@(posedge clk50)
	begin
		value_8_6 = ((((value_7_6+value_9_6+value_8_7+value_8_5- (prev_8_6<<<2))>>>2) + (prev_8_6<<<1) - (prev2_8_6>>>4))<<<4);
		prev2_8_6 = prev_8_6
		prev_8_6 = value_8_6;
	end
	reg signed[15:0] value_8_7;
	reg signed[15:0] prev_8_7;
	reg signed[15:0] prev2_8_7;
	always@(posedge clk50)
	begin
		value_8_7 = ((((value_7_7+value_9_7+value_8_8+value_8_6- (prev_8_7<<<2))>>>2) + (prev_8_7<<<1) - (prev2_8_7>>>4))<<<4);
		prev2_8_7 = prev_8_7
		prev_8_7 = value_8_7;
	end
	reg signed[15:0] value_8_8;
	reg signed[15:0] prev_8_8;
	reg signed[15:0] prev2_8_8;
	always@(posedge clk50)
	begin
		value_8_8 = ((((value_7_8+value_9_8+value_8_9+value_8_7- (prev_8_8<<<2))>>>2) + (prev_8_8<<<1) - (prev2_8_8>>>4))<<<4);
		prev2_8_8 = prev_8_8
		prev_8_8 = value_8_8;
	end
	reg signed[15:0] value_8_9;
	reg signed[15:0] prev_8_9;
	reg signed[15:0] prev2_8_9;
	always@(posedge clk50)
	begin
		value_8_9 = ((((value_7_9+value_9_9++value_8_8- (prev_8_9<<<2))>>>2) + (prev_8_9<<<1) - (prev2_8_9>>>4))<<<4);
		prev2_8_9 = prev_8_9
		prev_8_9 = value_8_9;
	end
	reg signed[15:0] value_9_0;
	reg signed[15:0] prev_9_0;
	reg signed[15:0] prev2_9_0;
	always@(posedge clk50)
	begin
		value_9_0 = ((((value_8_0+0+value_9_1+value_9_1- (prev_9_0<<<2))>>>2) + (prev_9_0<<<1) - (prev2_9_0>>>4))<<<4);
		prev2_9_0 = prev_9_0
		prev_9_0 = value_9_0;
	end
	reg signed[15:0] value_9_1;
	reg signed[15:0] prev_9_1;
	reg signed[15:0] prev2_9_1;
	always@(posedge clk50)
	begin
		value_9_1 = ((((value_8_1+0+value_9_2+value_9_0- (prev_9_1<<<2))>>>2) + (prev_9_1<<<1) - (prev2_9_1>>>4))<<<4);
		prev2_9_1 = prev_9_1
		prev_9_1 = value_9_1;
	end
	reg signed[15:0] value_9_2;
	reg signed[15:0] prev_9_2;
	reg signed[15:0] prev2_9_2;
	always@(posedge clk50)
	begin
		value_9_2 = ((((value_8_2+0+value_9_3+value_9_1- (prev_9_2<<<2))>>>2) + (prev_9_2<<<1) - (prev2_9_2>>>4))<<<4);
		prev2_9_2 = prev_9_2
		prev_9_2 = value_9_2;
	end
	reg signed[15:0] value_9_3;
	reg signed[15:0] prev_9_3;
	reg signed[15:0] prev2_9_3;
	always@(posedge clk50)
	begin
		value_9_3 = ((((value_8_3+0+value_9_4+value_9_2- (prev_9_3<<<2))>>>2) + (prev_9_3<<<1) - (prev2_9_3>>>4))<<<4);
		prev2_9_3 = prev_9_3
		prev_9_3 = value_9_3;
	end
	reg signed[15:0] value_9_4;
	reg signed[15:0] prev_9_4;
	reg signed[15:0] prev2_9_4;
	always@(posedge clk50)
	begin
		value_9_4 = ((((value_8_4+0+value_9_5+value_9_3- (prev_9_4<<<2))>>>2) + (prev_9_4<<<1) - (prev2_9_4>>>4))<<<4);
		prev2_9_4 = prev_9_4
		prev_9_4 = value_9_4;
	end
	reg signed[15:0] value_9_5;
	reg signed[15:0] prev_9_5;
	reg signed[15:0] prev2_9_5;
	always@(posedge clk50)
	begin
		value_9_5 = ((((value_8_5+0+value_9_6+value_9_4- (prev_9_5<<<2))>>>2) + (prev_9_5<<<1) - (prev2_9_5>>>4))<<<4);
		prev2_9_5 = prev_9_5
		prev_9_5 = value_9_5;
	end
	reg signed[15:0] value_9_6;
	reg signed[15:0] prev_9_6;
	reg signed[15:0] prev2_9_6;
	always@(posedge clk50)
	begin
		value_9_6 = ((((value_8_6+0+value_9_7+value_9_5- (prev_9_6<<<2))>>>2) + (prev_9_6<<<1) - (prev2_9_6>>>4))<<<4);
		prev2_9_6 = prev_9_6
		prev_9_6 = value_9_6;
	end
	reg signed[15:0] value_9_7;
	reg signed[15:0] prev_9_7;
	reg signed[15:0] prev2_9_7;
	always@(posedge clk50)
	begin
		value_9_7 = ((((value_8_7+0+value_9_8+value_9_6- (prev_9_7<<<2))>>>2) + (prev_9_7<<<1) - (prev2_9_7>>>4))<<<4);
		prev2_9_7 = prev_9_7
		prev_9_7 = value_9_7;
	end
	reg signed[15:0] value_9_8;
	reg signed[15:0] prev_9_8;
	reg signed[15:0] prev2_9_8;
	always@(posedge clk50)
	begin
		value_9_8 = ((((value_8_8+0+value_9_9+value_9_7- (prev_9_8<<<2))>>>2) + (prev_9_8<<<1) - (prev2_9_8>>>4))<<<4);
		prev2_9_8 = prev_9_8
		prev_9_8 = value_9_8;
	end
	reg signed[15:0] value_9_9;
	reg signed[15:0] prev_9_9;
	reg signed[15:0] prev2_9_9;
	always@(posedge clk50)
	begin
		value_9_9 = ((((value_8_9+0++value_9_8- (prev_9_9<<<2))>>>2) + (prev_9_9<<<1) - (prev2_9_9>>>4))<<<4);
		prev2_9_9 = prev_9_9
		prev_9_9 = value_9_9;
	end
