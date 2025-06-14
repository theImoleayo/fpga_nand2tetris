/**
 * 16-bit bitwise Buffer:
 * for i = 0..15: out[i] = in[i]
 */

`default_nettype none
module Buffer16(
	input [15:0] in,
	output [15:0] out
);
	wire [15:0] not_out;
	// Put your code here:
	Not16 NOT16_A(in, not_out);
	Not16 NOT16_B(not_out, out);

endmodule
