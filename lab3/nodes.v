module nodes (restart, clk50, audio_out);
	output wire signed [15:0] audio_out;
	input clk50, restart;



	wire signed[17:0] vwire_0_0;
	reg signed[17:0] left_0_0;
	reg signed[17:0] right_0_0;
	reg signed[17:0] up_0_0;
	reg signed[17:0] down_0_0;
	node n0_0(.left(left_1_0), .right(right_0_0), .up(up_0_0), .down(down_0_1), .clk(clk50), .reset(restart), .resetval(18'b000010100010111110), .value(vwire_0_0));

	wire signed[17:0] vwire_0_1;
	reg signed[17:0] left_0_1;
	reg signed[17:0] right_0_1;
	reg signed[17:0] up_0_1;
	reg signed[17:0] down_0_1;
	node n0_1(.left(left_1_1), .right(right_0_1), .up(up_0_1), .down(down_0_1), .clk(clk50), .reset(restart), .resetval(18'b000001100010110110), .value(vwire_0_1));

	wire signed[17:0] vwire_0_2;
	reg signed[17:0] left_0_2;
	reg signed[17:0] right_0_2;
	reg signed[17:0] up_0_2;
	reg signed[17:0] down_0_2;
	node n0_2(.left(left_1_2), .right(right_0_2), .up(up_0_2), .down(down_0_2), .clk(clk50), .reset(restart), .resetval(18'b000000010110000100), .value(vwire_0_2));

	wire signed[17:0] vwire_0_3;
	reg signed[17:0] left_0_3;
	reg signed[17:0] right_0_3;
	reg signed[17:0] up_0_3;
	reg signed[17:0] down_0_3;
	node n0_3(.left(left_1_3), .right(right_0_3), .up(up_0_3), .down(down_0_3), .clk(clk50), .reset(restart), .resetval(18'b000000000001110100), .value(vwire_0_3));

	wire signed[17:0] vwire_0_4;
	reg signed[17:0] left_0_4;
	reg signed[17:0] right_0_4;
	reg signed[17:0] up_0_4;
	reg signed[17:0] down_0_4;
	node n0_4(.left(left_1_4), .right(right_0_4), .up(18'b0), .down(down_0_4), .clk(clk50), .reset(restart), .resetval(18'b00), .value(vwire_0_4));

	wire signed[17:0] vwire_1_0;
	reg signed[17:0] left_1_0;
	reg signed[17:0] right_1_0;
	reg signed[17:0] up_1_0;
	reg signed[17:0] down_1_0;
	node n1_0(.left(left_1_0), .right(right_1_0), .up(up_1_0), .down(down_1_1), .clk(clk50), .reset(restart), .resetval(18'b000001100010110110), .value(vwire_1_0));

	wire signed[17:0] vwire_1_1;
	reg signed[17:0] left_1_1;
	reg signed[17:0] right_1_1;
	reg signed[17:0] up_1_1;
	reg signed[17:0] down_1_1;
	node n1_1(.left(left_1_1), .right(right_1_1), .up(up_1_1), .down(down_1_1), .clk(clk50), .reset(restart), .resetval(18'b000000111011111101), .value(vwire_1_1));

	wire signed[17:0] vwire_1_2;
	reg signed[17:0] left_1_2;
	reg signed[17:0] right_1_2;
	reg signed[17:0] up_1_2;
	reg signed[17:0] down_1_2;
	node n1_2(.left(left_1_2), .right(right_1_2), .up(up_1_2), .down(down_1_2), .clk(clk50), .reset(restart), .resetval(18'b000000001101011000), .value(vwire_1_2));

	wire signed[17:0] vwire_1_3;
	reg signed[17:0] left_1_3;
	reg signed[17:0] right_1_3;
	reg signed[17:0] up_1_3;
	reg signed[17:0] down_1_3;
	node n1_3(.left(left_1_3), .right(right_1_3), .up(up_1_3), .down(down_1_3), .clk(clk50), .reset(restart), .resetval(18'b000000000001000110), .value(vwire_1_3));

	wire signed[17:0] vwire_1_4;
	reg signed[17:0] left_1_4;
	reg signed[17:0] right_1_4;
	reg signed[17:0] up_1_4;
	reg signed[17:0] down_1_4;
	node n1_4(.left(left_1_4), .right(right_1_4), .up(18'b0), .down(down_1_4), .clk(clk50), .reset(restart), .resetval(18'b00), .value(vwire_1_4));

	wire signed[17:0] vwire_2_0;
	reg signed[17:0] left_2_0;
	reg signed[17:0] right_2_0;
	reg signed[17:0] up_2_0;
	reg signed[17:0] down_2_0;
	node n2_0(.left(left_2_0), .right(right_2_0), .up(up_2_0), .down(down_2_1), .clk(clk50), .reset(restart), .resetval(18'b000000010110000100), .value(vwire_2_0));

	wire signed[17:0] vwire_2_1;
	reg signed[17:0] left_2_1;
	reg signed[17:0] right_2_1;
	reg signed[17:0] up_2_1;
	reg signed[17:0] down_2_1;
	node n2_1(.left(left_2_1), .right(right_2_1), .up(up_2_1), .down(down_2_1), .clk(clk50), .reset(restart), .resetval(18'b000000001101011000), .value(vwire_2_1));

	wire signed[17:0] vwire_2_2;
	reg signed[17:0] left_2_2;
	reg signed[17:0] right_2_2;
	reg signed[17:0] up_2_2;
	reg signed[17:0] down_2_2;
	node n2_2(.left(left_2_2), .right(right_2_2), .up(up_2_2), .down(down_2_2), .clk(clk50), .reset(restart), .resetval(18'b000000000010111111), .value(vwire_2_2));

	wire signed[17:0] vwire_2_3;
	reg signed[17:0] left_2_3;
	reg signed[17:0] right_2_3;
	reg signed[17:0] up_2_3;
	reg signed[17:0] down_2_3;
	node n2_3(.left(left_2_3), .right(right_2_3), .up(up_2_3), .down(down_2_3), .clk(clk50), .reset(restart), .resetval(18'b000000000000010000), .value(vwire_2_3));

	wire signed[17:0] vwire_2_4;
	reg signed[17:0] left_2_4;
	reg signed[17:0] right_2_4;
	reg signed[17:0] up_2_4;
	reg signed[17:0] down_2_4;
	node n2_4(.left(left_2_4), .right(right_2_4), .up(18'b0), .down(down_2_4), .clk(clk50), .reset(restart), .resetval(18'b00), .value(vwire_2_4));

	wire signed[17:0] vwire_3_0;
	reg signed[17:0] left_3_0;
	reg signed[17:0] right_3_0;
	reg signed[17:0] up_3_0;
	reg signed[17:0] down_3_0;
	node n3_0(.left(left_3_0), .right(right_3_0), .up(up_3_0), .down(down_3_1), .clk(clk50), .reset(restart), .resetval(18'b000000000001110100), .value(vwire_3_0));

	wire signed[17:0] vwire_3_1;
	reg signed[17:0] left_3_1;
	reg signed[17:0] right_3_1;
	reg signed[17:0] up_3_1;
	reg signed[17:0] down_3_1;
	node n3_1(.left(left_3_1), .right(right_3_1), .up(up_3_1), .down(down_3_1), .clk(clk50), .reset(restart), .resetval(18'b000000000001000110), .value(vwire_3_1));

	wire signed[17:0] vwire_3_2;
	reg signed[17:0] left_3_2;
	reg signed[17:0] right_3_2;
	reg signed[17:0] up_3_2;
	reg signed[17:0] down_3_2;
	node n3_2(.left(left_3_2), .right(right_3_2), .up(up_3_2), .down(down_3_2), .clk(clk50), .reset(restart), .resetval(18'b000000000000010000), .value(vwire_3_2));

	wire signed[17:0] vwire_3_3;
	reg signed[17:0] left_3_3;
	reg signed[17:0] right_3_3;
	reg signed[17:0] up_3_3;
	reg signed[17:0] down_3_3;
	node n3_3(.left(left_3_3), .right(right_3_3), .up(up_3_3), .down(down_3_3), .clk(clk50), .reset(restart), .resetval(18'b000000000000000000), .value(vwire_3_3));

	wire signed[17:0] vwire_3_4;
	reg signed[17:0] left_3_4;
	reg signed[17:0] right_3_4;
	reg signed[17:0] up_3_4;
	reg signed[17:0] down_3_4;
	node n3_4(.left(left_3_4), .right(right_3_4), .up(18'b0), .down(down_3_4), .clk(clk50), .reset(restart), .resetval(18'b00), .value(vwire_3_4));

	wire signed[17:0] vwire_4_0;
	reg signed[17:0] left_4_0;
	reg signed[17:0] right_4_0;
	reg signed[17:0] up_4_0;
	reg signed[17:0] down_4_0;
	node n4_0(.left(left_4_0), .right(18'b0), .up(up_4_0), .down(down_4_1), .clk(clk50), .reset(restart), .resetval(18'b00), .value(vwire_4_0));

	wire signed[17:0] vwire_4_1;
	reg signed[17:0] left_4_1;
	reg signed[17:0] right_4_1;
	reg signed[17:0] up_4_1;
	reg signed[17:0] down_4_1;
	node n4_1(.left(left_4_1), .right(18'b0), .up(up_4_1), .down(down_4_1), .clk(clk50), .reset(restart), .resetval(18'b00), .value(vwire_4_1));

	wire signed[17:0] vwire_4_2;
	reg signed[17:0] left_4_2;
	reg signed[17:0] right_4_2;
	reg signed[17:0] up_4_2;
	reg signed[17:0] down_4_2;
	node n4_2(.left(left_4_2), .right(18'b0), .up(up_4_2), .down(down_4_2), .clk(clk50), .reset(restart), .resetval(18'b00), .value(vwire_4_2));

	wire signed[17:0] vwire_4_3;
	reg signed[17:0] left_4_3;
	reg signed[17:0] right_4_3;
	reg signed[17:0] up_4_3;
	reg signed[17:0] down_4_3;
	node n4_3(.left(left_4_3), .right(18'b0), .up(up_4_3), .down(down_4_3), .clk(clk50), .reset(restart), .resetval(18'b00), .value(vwire_4_3));

	wire signed[17:0] vwire_4_4;
	reg signed[17:0] left_4_4;
	reg signed[17:0] right_4_4;
	reg signed[17:0] up_4_4;
	reg signed[17:0] down_4_4;
	node n4_4(.left(left_4_4), .right(18'b0), .up(18'b0), .down(down_4_4), .clk(clk50), .reset(restart), .resetval(18'b00), .value(vwire_4_4));

	always @ (negedge clk50)
	begin
		left_1_0 <= vwire_0_0;
		down_0_1 <= vwire_0_0;
		left_1_1 <= vwire_0_1;
		up_0_0 <= vwire_0_1;
		down_0_2 <= vwire_0_1;
		left_1_2 <= vwire_0_2;
		up_0_1 <= vwire_0_2;
		down_0_3 <= vwire_0_2;
		left_1_3 <= vwire_0_3;
		up_0_2 <= vwire_0_3;
		down_0_4 <= vwire_0_3;
		left_1_4 <= vwire_0_4;
		up_0_3 <= vwire_0_4;
		right_0_0 <= vwire_1_0;
		left_2_0 <= vwire_1_0;
		down_1_1 <= vwire_1_0;
		right_0_1 <= vwire_1_1;
		left_2_1 <= vwire_1_1;
		up_1_0 <= vwire_1_1;
		down_1_2 <= vwire_1_1;
		right_0_2 <= vwire_1_2;
		left_2_2 <= vwire_1_2;
		up_1_1 <= vwire_1_2;
		down_1_3 <= vwire_1_2;
		right_0_3 <= vwire_1_3;
		left_2_3 <= vwire_1_3;
		up_1_2 <= vwire_1_3;
		down_1_4 <= vwire_1_3;
		right_0_4 <= vwire_1_4;
		left_2_4 <= vwire_1_4;
		up_1_3 <= vwire_1_4;
		right_1_0 <= vwire_2_0;
		left_3_0 <= vwire_2_0;
		down_2_1 <= vwire_2_0;
		right_1_1 <= vwire_2_1;
		left_3_1 <= vwire_2_1;
		up_2_0 <= vwire_2_1;
		down_2_2 <= vwire_2_1;
		right_1_2 <= vwire_2_2;
		left_3_2 <= vwire_2_2;
		up_2_1 <= vwire_2_2;
		down_2_3 <= vwire_2_2;
		right_1_3 <= vwire_2_3;
		left_3_3 <= vwire_2_3;
		up_2_2 <= vwire_2_3;
		down_2_4 <= vwire_2_3;
		right_1_4 <= vwire_2_4;
		left_3_4 <= vwire_2_4;
		up_2_3 <= vwire_2_4;
		right_2_0 <= vwire_3_0;
		left_4_0 <= vwire_3_0;
		down_3_1 <= vwire_3_0;
		right_2_1 <= vwire_3_1;
		left_4_1 <= vwire_3_1;
		up_3_0 <= vwire_3_1;
		down_3_2 <= vwire_3_1;
		right_2_2 <= vwire_3_2;
		left_4_2 <= vwire_3_2;
		up_3_1 <= vwire_3_2;
		down_3_3 <= vwire_3_2;
		right_2_3 <= vwire_3_3;
		left_4_3 <= vwire_3_3;
		up_3_2 <= vwire_3_3;
		down_3_4 <= vwire_3_3;
		right_2_4 <= vwire_3_4;
		left_4_4 <= vwire_3_4;
		up_3_3 <= vwire_3_4;
		right_3_0 <= vwire_4_0;
		down_4_1 <= vwire_4_0;
		right_3_1 <= vwire_4_1;
		up_4_0 <= vwire_4_1;
		down_4_2 <= vwire_4_1;
		right_3_2 <= vwire_4_2;
		up_4_1 <= vwire_4_2;
		down_4_3 <= vwire_4_2;
		right_3_3 <= vwire_4_3;
		up_4_2 <= vwire_4_3;
		down_4_4 <= vwire_4_3;
		right_3_4 <= vwire_4_4;
		up_4_3 <= vwire_4_4;
	end

	assign audio_out = vwire_0_0;
endmodule
