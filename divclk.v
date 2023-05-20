module divclk
	#(
	parameter N=488)
	(
	input clk,
	input rstn,
	output clk_out,
	//output wire [3:0] cnt,
	//output reg odd_clk_out1,
	o//utput reg odd_clk_out2
	);

	//even
	reg [30:0] even_cnt;
	reg   	  even_clk_out;

	always@(posedge clk, negedge rstn)	begin
		if(!rstn)
			even_cnt <= 1'b0;
		else if(even_cnt == (N>>1'b1)-1'b1)
			even_cnt <= 1'b0;
		else
			even_cnt <= even_cnt + 1'b1;
	end

	always@(posedge clk, negedge rstn)	begin
		if(!rstn)
			even_clk_out <= 1'b0;
		else if(even_cnt == (N>>1'b1)-1'b1)
			even_clk_out <= ~even_clk_out;
		else
			even_clk_out <= even_clk_out;
	end
	
	//odd
	reg [30:0] odd_cnt;
	reg 	  odd_clk_out1;
	reg	  odd_clk_out2;
	wire 	  odd_clk_out;

	always@(posedge clk, negedge rstn)	begin
		if(!rstn)
			odd_cnt <= 1'b0;
		else if(odd_cnt == N-1'b1)
			odd_cnt <= 1'b0;
		else
			odd_cnt <= odd_cnt + 1'b1;
	end

	always@(posedge clk, negedge rstn)	begin
		if(!rstn)
			odd_clk_out1 <= 1'b0;
		else if(odd_cnt == N>>1'b1 | odd_cnt == 1'b0)
			odd_clk_out1 <= ~odd_clk_out1;
		else
			odd_clk_out1 <= odd_clk_out1;
	end

	always@(negedge clk, negedge rstn)	begin
		if(!rstn)
			odd_clk_out2 <= 1'b0;
		else if(odd_cnt == (N>>1'b1)+1'b1 | odd_cnt == 1'b1)
			odd_clk_out2 <= ~odd_clk_out2;
		else
			odd_clk_out2 <= odd_clk_out2;
	end
	
	assign odd_clk_out = odd_clk_out1 | odd_clk_out2;
	assign clk_out = (N%2==0) ? even_clk_out : odd_clk_out;
	//assign cnt = (N%2==0) ? even_cnt : odd_cnt;

endmodule

