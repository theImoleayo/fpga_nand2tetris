/** 
 * Multiplexor:
 * out = a if sel == 0
 *       b otherwise
 */

`default_nettype none
module Mux(
	input a,
	input b,
	input sel,
	output out
);

	// Put your code here:
	//OUT = (a&b)+(~a&b&sel)+(a&~b&~sel)
	wire not_a;
	wire not_b;
	wire not_sel;
	wire and_out1;
	wire and_out2;
	wire and_out3;
	wire and_out4;
	wire and_out5;
	wire or_out1;

	Not NOT1(a, not_a);
	Not NOT2(b, not_b);
	Not NOT3(sel, not_sel);

	And AND1(a, b,and_out1);
	And AND2(not_a, b, and_out2);
	And AND3(and_out2, sel, and_out3);
	And AND4(a, not_b, and_out4);
	And AND5(and_out4, not_sel, and_out5);

	Or OR1(and_out1, and_out3, or_out1);

	Or OR2(or_out1, and_out5, out);




endmodule
