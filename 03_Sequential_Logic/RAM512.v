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

	wire [15:0] ram_output;
	wire [15:0] ram_output2;
	wire [15:0] final_output;

	wire [7:0] addr_A;
	wire [7:0] addr_B;

	// wire [7:0] addr_A = address[8:1];
	// wire [7:0] addr_B = address[7:0];

	assign addr_A = (address[8]===1'b0) ? address[7:0]: 7'b0;
	assign addr_B = (address[8]===1'b1) ? address[7:0]: 7'b0;


	RAM256 RAM_BUILT(
		clk,
		addr_A,
		in,
		load,
		ram_output
	);
	RAM256 RAM_BUILT2(
		clk,
		addr_B,
		in,
		load,
		ram_output2
	);

	Mux16 RAM512(
		ram_output,
		ram_output2,
		address[8],
		final_output
	);

	assign out = final_output;




	//SUPRISINGLY, THE CODE CAN ALSO BE LIKE THIS

	/*

	wire [15:0] ram_output;
	wire [15:0] ram_output2;
	wire [15:0] reg_out;
	wire [15:0] final_output;
	wire [15:0] mux_out;
	wire [7:0] slice;
	wire [7:0] addr_A;

	RAM256 RAM_BUILT(
		clk,
		addr_A,
		in,
		load,
		ram_output
	);
	RAM256 RAM_BUILT2(
		clk,
		slice,
		in,
		load,
		ram_output2
	);
	wire [7:0] nought;

	assign nought = 8'b0;

		genvar i, j;
	generate
		for(i = 0; i<8; i = i+1) begin: gen_ADDR8
			Mux Mux16_A( addr_A[i], address[i], address[8],  slice[i]);
		end
	endgenerate

	generate
		for(j = 0; j<8; j = j+1) begin: gen_ADDR7
			Mux Mux16_A( address[j], nought[j], address[8],  addr_A[j]);
		end
	endgenerate


	//assign slice = address[8] ? address[7:0] : addr_A;
	//assign addr_A = address[8]==1'b0 ? address[7:0] : 8'b0;


	Mux16 RAM512(
		ram_output,
		ram_output2,
		address[8],
		final_output
	);

	assign out = final_output;
	*/


endmodule
