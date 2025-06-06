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
	wire mid;
	// Put your code here:
	nand(mid, a, b);
	not(out,mid);

endmodule
