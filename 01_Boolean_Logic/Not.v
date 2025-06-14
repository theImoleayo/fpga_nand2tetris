/**
 * Not gate:
 * out = not in
 */

`default_nettype none
module Not(
	input in,
	output out
);

	// Put your code here:
	Nand NAND1(
		.a(in),
		.b(in),
		.out(out)
	);

endmodule
