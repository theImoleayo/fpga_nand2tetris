/**
 * Buffer:
 * out = in
 */

`default_nettype none

module Buffer(
	input in,

	output out
);

	// Put your code here:
	// assign out = in;
	nand(out, in, in);
	not(out, out);



endmodule
