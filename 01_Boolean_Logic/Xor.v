/**
 * Exclusive-or gate:
 * out = not (a == b)
 */

`default_nettype none
module Xor(
	input a,
	input b,
	output out
);

	//out = ~()(a&b)+(~a&~b))

	wire and_out1;
	wire not_a;
	wire not_b;
	wire and_out2;
	wire or_out;
	Not NOT1(a, not_a);
	Not NOT2(b, not_b);
	And AND1(a, b, and_out1);
	And AND2(not_a, not_b, and_out2);
	Or OR1(and_out1, and_out2, or_out);
	Not NOT3(or_out, out);
endmodule
