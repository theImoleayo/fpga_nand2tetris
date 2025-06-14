/**
 * Computes the sum of three bits.
 */

`default_nettype none
module FullAdder(
	input a,		//1-bit input
	input b,		//1-bit input
	input c,		//1-bit input
	output sum,		//Right bit of a + b + c
	output carry	//Left bit of a + b + c
);

	// Put your code here:
	//sum = aXORbXORc
	//carry-out = (a.b)+(c.(aXORb))

	wire xor_out1;
	wire xor_out3;
	wire and_out1;
	wire and_out2;


	Xor XOR1(
		a,
		b,
		xor_out1
	);
	Xor XOR2(
		xor_out1,
		c,
		sum
	);

	//carry_gates

	And AND1(
		c,
		xor_out1,
		and_out1
	);


	And AND2(
		a,
		b,
		and_out2
	);

	Or OR1(
		and_out1,
		and_out2,
		carry
	);
endmodule
