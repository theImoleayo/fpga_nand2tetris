/**
 * Demultiplexor:
 * {a, b} = {in, 0} if sel == 0
 *          {0, in} if sel == 1
 */

`default_nettype none
module DMux(
	input in,
	input sel,
    output a,
	output b
);

	// Put your code here:
	// a = in & ~sel
	// b = in & sel
	wire not_sel;

	Not NOT1(sel, not_sel);
	And AND1(in, not_sel, a);
	And AND2(in, sel, b);

endmodule
