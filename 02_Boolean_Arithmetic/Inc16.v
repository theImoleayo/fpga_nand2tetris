/**
 * 16-bit incrementer:
 * out = in + 1 (arithmetic addition)
 */

`default_nettype none
module Inc16(
	input [15:0] in,
	output [15:0] out
);
	wire one;

	assign one = 1'b1;
	wire [15:0] carry;
	// assign in_1 = 1;
	// Put your code here:
	HalfAdder TWO_BIT_ADD1(
		in[0],
		one,
		out[0],
		carry[0]
	);
	genvar i;
	generate
		for(i = 0; i<15; i = i+1) begin: gen_inc16
			HalfAdder TWO_BIT_ADD2(
				in[i+1],
				carry[i],
				out[i+1],
				carry[i+1]
			);
		end
	endgenerate
endmodule
