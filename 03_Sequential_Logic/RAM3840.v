/**
* RAM3840 implements 3840 Bytes of RAM addressed from 0 - 3839
* out = M[address]
* if (load =i= 1) M[address][t+1] = in[t]
*/

`default_nettype none
module RAM3840(
	input clk,
	input [11:0] address,
	input [15:0] in,
	input load,
	output [15:0] out
);
	
	// Put your code here:
	wire [8:0] slice_1;
	wire [8:0] slice_2;
	wire [8:0] slice_3;
	wire [8:0] slice_4;
	wire [8:0] slice_5;
	wire [8:0] slice_6;
	wire [8:0] slice_7;
	wire [8:0] slice_8;
	wire [15:0] slice_out_1;
	wire [15:0] slice_out_2;
	wire [15:0] slice_out_3;
	wire [15:0] slice_out_4;
	wire [15:0] slice_out_5;
	wire [15:0] slice_out_6;
	wire [15:0] slice_out_7;
	wire [15:0] slice_out_8;


	wire [15:0] mux_out;

	wire [2:0] sel_ADDRESS;

	assign sel_ADDRESS = address[11:9];


		assign slice_1 = (sel_ADDRESS===3'b000) ? address[8:0] : 9'b0;
		assign slice_2 = (sel_ADDRESS===3'b001) ? address[8:0] : 9'b0;
		assign slice_3 = (sel_ADDRESS===3'b010) ? address[8:0] : 9'b0;
		assign slice_4 = (sel_ADDRESS===3'b011) ? address[8:0] : 9'b0;
		assign slice_5 = (sel_ADDRESS===3'b100) ? address[8:0] : 9'b0;
		assign slice_6 = (sel_ADDRESS===3'b101) ? address[8:0] : 9'b0;
		assign slice_7 = (sel_ADDRESS===3'b110) ? address[8:0] : 9'b0;
		assign slice_8 = (sel_ADDRESS===3'b111) ? address[8:0] : 9'b0;

	RAM512 RAM512_1(
		clk,
		slice_1,
		in,
		load,
		slice_out_1
	);

	RAM512 RAM512_2(
		clk,
		slice_2,
		in,
		load,
		slice_out_2
	);

	RAM512 RAM512_3(
		clk,
		slice_3,
		in,
		load,
		slice_out_3
	);

	RAM512 RAM512_4(
		clk,
		slice_4,
		in,
		load,
		slice_out_4
	);

	RAM512 RAM512_5(
		clk,
		slice_5,
		in,
		load,
		slice_out_5
	);

	RAM512 RAM512_6(
		clk,
		slice_6,
		in,
		load,
		slice_out_6
	);

	RAM512 RAM512_7(
		clk,
		slice_7,
		in,
		load,
		slice_out_7
	);

	RAM512 RAM512_8(
		clk,
		slice_8,
		in,
		load,
		slice_out_8
	);

	Mux8Way16 OUTPUT(
		slice_out_1,
		slice_out_2,
		slice_out_3,
		slice_out_4,
		slice_out_5,
		slice_out_6,
		slice_out_7,
		slice_out_8,
		address[11:9],
		mux_out
	);

	assign out = mux_out;

endmodule
