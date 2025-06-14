/**
 * Computes the sum of two bits.
 */

`default_nettype none
module HalfAdder(
	input a,		//1-bit input
	input b,		//1-bit inpur
	output sum,	//Right bit of a + b
	output carry	//Lef bit of a + b
);

	// Put your code here:
	Xor SUM(a,b,sum);
	And CARRY_OUT(a, b, carry);

endmodule
