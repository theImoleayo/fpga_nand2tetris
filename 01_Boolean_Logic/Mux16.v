/**
 * 16-bit multiplexor: 
 * for i = 0..15 out[i] = a[i] if sel == 0 
 *                        b[i] if sel == 1
 */

`default_nettype none
module Mux16(
	input [15:0] a,
	input [15:0] b,
   	input sel,
	output [15:0] out
);

	// Put your code here:
	genvar i;
	generate
		for(i = 0; i<16; i = i+1) begin: gen_Mux
			Mux Mux16_A(a[i], b[i], sel,  out[i]);
		end
	endgenerate

endmodule
