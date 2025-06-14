/**
 * 16-bit bitwise Or:
 * for i = 0..15: out[i] = (a[i] or b[i])
 */

`default_nettype none
module Or16(
	input [15:0] a,
	input [15:0] b,
	output [15:0] out
);

	wire [15:0] not_a;
	wire [15:0] not_b;



	// Put your code here:
	genvar i;
	generate
		for(i = 0; i<16; i = i+1) begin: gen_or
			Not NOT16_A(a[i], not_a[i]);
			Not NOT16_B(b[i], not_b[i]);
			Nand NAND(not_a[i], not_b[i], out[i]);
		end
	endgenerate

endmodule
