 /**
 * Or gate:
 * out = 1 if (a == 1 or b == 1)
 *       0 otherwise
 */

`default_nettype none
module Or(
	input a,
	input b,
	output out
);

//noted that wires have to been declared first, noted!
	wire not_a;
	wire not_b;
	wire and_out;

	Not NOT1(a,not_a);
	Not NOT2(b,not_b);
	And AND1(not_a,not_b,and_out);
	Not NOT3(and_out, out);

endmodule
