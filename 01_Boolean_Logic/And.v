/**
 * And gate: 
 * out = 1 if (a == 1 and b == 1)
 *       0 otherwise
 */

`default_nettype none
// `include "Not.v"  // Includes the Not gate

module And(
	input a,
	input b,
	output out
);
	wire out1;
	//using positional port mapping
	Nand NAND1(a, b, out1);
	// Nand NAND2(out1, out1, out);
	//using NOT GATE
	Not NOT1(out1, out);

endmodule
