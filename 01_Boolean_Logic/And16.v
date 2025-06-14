/**
 * 16-bit bitwise And:
 * for i = 0..15: out[i] = (a[i] and b[i])
 */

`default_nettype none
module And16(
	input [15:0] a,
	input [15:0] b,
	output [15:0] out
);

	genvar i;
	generate
		for(i = 0; i<16; i = i+1) begin: gen_and
		And ANDi(a[i], b[i], out[i]);
		end
	endgenerate

endmodule
