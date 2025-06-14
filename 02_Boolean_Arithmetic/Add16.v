/**
 * Adds two 16-bit values.
 * The most significant carry bit is ignored.
 * out = a + b (16 bit)
 */

`default_nettype none
module Add16(
	input [15:0] a,
	input [15:0] b,
	output [15:0] out
);
	wire [15:0] carry_out1;
	// wire [15:0] sum1;

	// Put your code here:
	HalfAdder TWO_BIT_ADD(
		a[0],
		b[0],
		out[0],
		carry_out1[0]
	);
	genvar i;

	generate
		for(i = 0; i<15; i = i+1) begin: gen_adder16
			//code here
			// integer j = i+1;
			FullAdder 	THREE_BIT_ADD(
				a[i+1],
				b[i+1],
				carry_out1[i],
				out[i+1],
				carry_out1[i+1]
			);

		end
	endgenerate

endmodule
