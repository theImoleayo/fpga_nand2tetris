/**
 * 16-bit Not:
 * for i=0..15: out[i] = not in[i]
 */

`default_nettype none
module Not16(
	input [15:0] in,
	output [15:0] out
);

	genvar i;

	generate
		for(i=0; i<16; i=i+1) begin: gen_not
				Not NOT1(in[i], out[i]);
		end
	endgenerate

endmodule
