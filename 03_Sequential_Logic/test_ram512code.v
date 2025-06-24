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

	wire [15:0] ram256_out1;
	wire [15:0] ram256_out2;
	wire [15:0] reg_out;
	wire [15:0] final_output;
	wire [15:0] mux_out;
	wire [7:0] slice;
	wire [7:0] addr_A = address[7:0];
	wire [7:0] slice_addr;
	wire [7:0] nought;

	assign nought = 7'b0;

	genvar i;
	generate
		for(i = 0; i<8; i = i+1) begin: gen_ADDR8
			Mux Mux16_A( addr_A[i], address[i], address[8],  slice[i]);
		end
	endgenerate

	generate
		for(i = 0; i<8; i = i+1) begin: gen_ADDR7
			Mux Mux16_A( address[i], nought[i], address[8],  addr_A[i]);
		end
	endgenerate

	RAM256 RAM256_1(
		clk,
		addr_A,
		in,
		load,
		ram256_out1
	);

	RAM256 RAM256_2(
		clk,
		slice,
		in,
		load,
		ram256_out2
	);



	// assign slice = address[8] ? address[7:0] : addr_A;
	// assign addr_A = address[8]==1'b0 ? address[7:0] : 7'b0;



	Mux16 RAM512(
		ram256_out1,
		ram256_out2,
		address[8],
		final_output
	);

	assign out = final_output;
endmodule
