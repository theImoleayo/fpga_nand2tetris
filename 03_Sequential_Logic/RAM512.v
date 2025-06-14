/**
* RAM512 implements 512 Bytes of RAM addressed from 0 - 511
* out = M[address]
* if (load =i= 1) M[address][t+1] = in[t]
*/

`default_nettype none
module RAM512(
	input clk,
	input [8:0] address,
	input [15:0] in,
	input load,
	output [15:0] out
);

	// wire [15:0] out_7bit;
	// wire [15:0] out_1_bit;

	reg [15:0] regRAM [0:511];
	always @(posedge clk)
		if (load) regRAM[address[8:0]] <= in;

	assign out = regRAM[address[8:0]];



/*
	RAM256 Bit_7_RAM(
		clk,
		address[7:0],
		in[15:0],
		load,
		out_7bit[15:0]
	);
	

	Register Bit_1_RAM(
		clk,
		in[15:0],
		load,
		out_1_bit[15:0]
	);

	reg [15:0] out_val;
	always @(posedge clk) begin
		if(address[7:0]) begin
			out_val<=out_7bit;
		end
		else if(address[8]) out_val<=out_1_bit;

	end
	assign out = out_val;*/
	// // Put your code here:
	// reg [15:0] ram_val;
	// always @(posedge clk) begin
	// 	if(load) ram_val[address[8:0]]<=in;
	// end
 //
	// assign out = ram_val;

endmodule
