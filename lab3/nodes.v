module nodes (restart, clk50, audio_out);
	output wire signed [15:0] audio_out;
	input wire clk50, restart;



	reg signed[15:0] value_0_0;
	reg signed[15:0] prev_0_0;
	reg signed[15:0] prev2_0_0;
	always@(posedge clk50)
	begin
		case(restart)
			1'b1 :
			begin
				value_0_0 = 16'b0101000101111101;
				prev2_0_0 = 0;
				prev_0_0 = 0;
			end
			1'b0:
			begin
				value_0_0 =((((value_1_0+value_1_0+value_0_1+value_0_1- (prev_0_0<<<2))>>>2) + (prev_0_0<<<1) -(prev2_0_0>>>4))>>>4);
				prev2_0_0 = prev_0_0;
				prev_0_0 = value_0_0;
			end
		endcase
	end

	reg signed[15:0] value_0_1;
	reg signed[15:0] prev_0_1;
	reg signed[15:0] prev2_0_1;
	always@(posedge clk50)
	begin
		case(restart)
			1'b1 :
			begin
				value_0_1 = 16'b011000101101101;
				prev2_0_1 = 0;
				prev_0_1 = 0;
			end
			1'b0:
			begin
				value_0_1 =((((value_1_1+value_1_1+value_0_2+value_0_0- (prev_0_1<<<2))>>>2) + (prev_0_1<<<1) -(prev2_0_1>>>4))>>>4);
				prev2_0_1 = prev_0_1;
				prev_0_1 = value_0_1;
			end
		endcase
	end

	reg signed[15:0] value_0_2;
	reg signed[15:0] prev_0_2;
	reg signed[15:0] prev2_0_2;
	always@(posedge clk50)
	begin
		case(restart)
			1'b1 :
			begin
				value_0_2 = 16'b0101100000111;
				prev2_0_2 = 0;
				prev_0_2 = 0;
			end
			1'b0:
			begin
				value_0_2 =((((value_1_2+value_1_2+value_0_3+value_0_1- (prev_0_2<<<2))>>>2) + (prev_0_2<<<1) -(prev2_0_2>>>4))>>>4);
				prev2_0_2 = prev_0_2;
				prev_0_2 = value_0_2;
			end
		endcase
	end

	reg signed[15:0] value_0_3;
	reg signed[15:0] prev_0_3;
	reg signed[15:0] prev2_0_3;
	always@(posedge clk50)
	begin
		case(restart)
			1'b1 :
			begin
				value_0_3 = 16'b011101000;
				prev2_0_3 = 0;
				prev_0_3 = 0;
			end
			1'b0:
			begin
				value_0_3 =((((value_1_3+value_1_3+16'b0+value_0_2- (prev_0_3<<<2))>>>2) + (prev_0_3<<<1) -(prev2_0_3>>>4))>>>4);
				prev2_0_3 = prev_0_3;
				prev_0_3 = value_0_3;
			end
		endcase
	end

	reg signed[15:0] value_1_0;
	reg signed[15:0] prev_1_0;
	reg signed[15:0] prev2_1_0;
	always@(posedge clk50)
	begin
		case(restart)
			1'b1 :
			begin
				value_1_0 = 16'b011000101101101;
				prev2_1_0 = 0;
				prev_1_0 = 0;
			end
			1'b0:
			begin
				value_1_0 =((((value_0_0+value_2_0+value_1_1+value_1_1- (prev_1_0<<<2))>>>2) + (prev_1_0<<<1) -(prev2_1_0>>>4))>>>4);
				prev2_1_0 = prev_1_0;
				prev_1_0 = value_1_0;
			end
		endcase
	end

	reg signed[15:0] value_1_1;
	reg signed[15:0] prev_1_1;
	reg signed[15:0] prev2_1_1;
	always@(posedge clk50)
	begin
		case(restart)
			1'b1 :
			begin
				value_1_1 = 16'b01110111111010;
				prev2_1_1 = 0;
				prev_1_1 = 0;
			end
			1'b0:
			begin
				value_1_1 =((((value_0_1+value_2_1+value_1_2+value_1_0- (prev_1_1<<<2))>>>2) + (prev_1_1<<<1) -(prev2_1_1>>>4))>>>4);
				prev2_1_1 = prev_1_1;
				prev_1_1 = value_1_1;
			end
		endcase
	end

	reg signed[15:0] value_1_2;
	reg signed[15:0] prev_1_2;
	reg signed[15:0] prev2_1_2;
	always@(posedge clk50)
	begin
		case(restart)
			1'b1 :
			begin
				value_1_2 = 16'b011010110000;
				prev2_1_2 = 0;
				prev_1_2 = 0;
			end
			1'b0:
			begin
				value_1_2 =((((value_0_2+value_2_2+value_1_3+value_1_1- (prev_1_2<<<2))>>>2) + (prev_1_2<<<1) -(prev2_1_2>>>4))>>>4);
				prev2_1_2 = prev_1_2;
				prev_1_2 = value_1_2;
			end
		endcase
	end

	reg signed[15:0] value_1_3;
	reg signed[15:0] prev_1_3;
	reg signed[15:0] prev2_1_3;
	always@(posedge clk50)
	begin
		case(restart)
			1'b1 :
			begin
				value_1_3 = 16'b010001101;
				prev2_1_3 = 0;
				prev_1_3 = 0;
			end
			1'b0:
			begin
				value_1_3 =((((value_0_3+value_2_3+16'b0+value_1_2- (prev_1_3<<<2))>>>2) + (prev_1_3<<<1) -(prev2_1_3>>>4))>>>4);
				prev2_1_3 = prev_1_3;
				prev_1_3 = value_1_3;
			end
		endcase
	end

	reg signed[15:0] value_2_0;
	reg signed[15:0] prev_2_0;
	reg signed[15:0] prev2_2_0;
	always@(posedge clk50)
	begin
		case(restart)
			1'b1 :
			begin
				value_2_0 = 16'b0101100000111;
				prev2_2_0 = 0;
				prev_2_0 = 0;
			end
			1'b0:
			begin
				value_2_0 =((((value_1_0+value_3_0+value_2_1+value_2_1- (prev_2_0<<<2))>>>2) + (prev_2_0<<<1) -(prev2_2_0>>>4))>>>4);
				prev2_2_0 = prev_2_0;
				prev_2_0 = value_2_0;
			end
		endcase
	end

	reg signed[15:0] value_2_1;
	reg signed[15:0] prev_2_1;
	reg signed[15:0] prev2_2_1;
	always@(posedge clk50)
	begin
		case(restart)
			1'b1 :
			begin
				value_2_1 = 16'b011010110000;
				prev2_2_1 = 0;
				prev_2_1 = 0;
			end
			1'b0:
			begin
				value_2_1 =((((value_1_1+value_3_1+value_2_2+value_2_0- (prev_2_1<<<2))>>>2) + (prev_2_1<<<1) -(prev2_2_1>>>4))>>>4);
				prev2_2_1 = prev_2_1;
				prev_2_1 = value_2_1;
			end
		endcase
	end

	reg signed[15:0] value_2_2;
	reg signed[15:0] prev_2_2;
	reg signed[15:0] prev2_2_2;
	always@(posedge clk50)
	begin
		case(restart)
			1'b1 :
			begin
				value_2_2 = 16'b0101111110;
				prev2_2_2 = 0;
				prev_2_2 = 0;
			end
			1'b0:
			begin
				value_2_2 =((((value_1_2+value_3_2+value_2_3+value_2_1- (prev_2_2<<<2))>>>2) + (prev_2_2<<<1) -(prev2_2_2>>>4))>>>4);
				prev2_2_2 = prev_2_2;
				prev_2_2 = value_2_2;
			end
		endcase
	end

	reg signed[15:0] value_2_3;
	reg signed[15:0] prev_2_3;
	reg signed[15:0] prev2_2_3;
	always@(posedge clk50)
	begin
		case(restart)
			1'b1 :
			begin
				value_2_3 = 16'b011111;
				prev2_2_3 = 0;
				prev_2_3 = 0;
			end
			1'b0:
			begin
				value_2_3 =((((value_1_3+value_3_3+16'b0+value_2_2- (prev_2_3<<<2))>>>2) + (prev_2_3<<<1) -(prev2_2_3>>>4))>>>4);
				prev2_2_3 = prev_2_3;
				prev_2_3 = value_2_3;
			end
		endcase
	end

	reg signed[15:0] value_3_0;
	reg signed[15:0] prev_3_0;
	reg signed[15:0] prev2_3_0;
	always@(posedge clk50)
	begin
		case(restart)
			1'b1 :
			begin
				value_3_0 = 16'b011101000;
				prev2_3_0 = 0;
				prev_3_0 = 0;
			end
			1'b0:
			begin
				value_3_0 =((((value_2_0+16'b0+value_3_1+value_3_1- (prev_3_0<<<2))>>>2) + (prev_3_0<<<1) -(prev2_3_0>>>4))>>>4);
				prev2_3_0 = prev_3_0;
				prev_3_0 = value_3_0;
			end
		endcase
	end

	reg signed[15:0] value_3_1;
	reg signed[15:0] prev_3_1;
	reg signed[15:0] prev2_3_1;
	always@(posedge clk50)
	begin
		case(restart)
			1'b1 :
			begin
				value_3_1 = 16'b010001101;
				prev2_3_1 = 0;
				prev_3_1 = 0;
			end
			1'b0:
			begin
				value_3_1 =((((value_2_1+16'b0+value_3_2+value_3_0- (prev_3_1<<<2))>>>2) + (prev_3_1<<<1) -(prev2_3_1>>>4))>>>4);
				prev2_3_1 = prev_3_1;
				prev_3_1 = value_3_1;
			end
		endcase
	end

	reg signed[15:0] value_3_2;
	reg signed[15:0] prev_3_2;
	reg signed[15:0] prev2_3_2;
	always@(posedge clk50)
	begin
		case(restart)
			1'b1 :
			begin
				value_3_2 = 16'b011111;
				prev2_3_2 = 0;
				prev_3_2 = 0;
			end
			1'b0:
			begin
				value_3_2 =((((value_2_2+16'b0+value_3_3+value_3_1- (prev_3_2<<<2))>>>2) + (prev_3_2<<<1) -(prev2_3_2>>>4))>>>4);
				prev2_3_2 = prev_3_2;
				prev_3_2 = value_3_2;
			end
		endcase
	end

	reg signed[15:0] value_3_3;
	reg signed[15:0] prev_3_3;
	reg signed[15:0] prev2_3_3;
	always@(posedge clk50)
	begin
		case(restart)
			1'b1 :
			begin
				value_3_3 = 16'b00;
				prev2_3_3 = 0;
				prev_3_3 = 0;
			end
			1'b0:
			begin
				value_3_3 =((((value_2_3+16'b0+16'b0+value_3_2- (prev_3_3<<<2))>>>2) + (prev_3_3<<<1) -(prev2_3_3>>>4))>>>4);
				prev2_3_3 = prev_3_3;
				prev_3_3 = value_3_3;
			end
		endcase
	end

	assign audio_out = value_0_0[15:0];
endmodule
