/**
 * 4-way demultiplexor:
 * {a, b, c, d} = {in, 0, 0, 0} if sel == 00
 *                {0, in, 0, 0} if sel == 01
 *                {0, 0, in, 0} if sel == 10
 *                {0, 0, 0, in} if sel == 11
 */

`default_nettype none
module DMux4Way(
	input in,
	input [1:0] sel,
    output a,
	output b,
	output c,
	output d
);
	
	wire s0;
	wire s1;
	wire sout1;
	wire sout2;
	wire sout3;
	wire sout4;

	// Put your code here:	
	Not NOT1(sel[0], s0);
	Not NOT2(sel[1], s1);
	And AND1(s0, s1, sout1);
	And AND2(s1,sel[0], sout2);
	And AND3(sel[1], s0, sout3);
	And AND4(sel[1], sel[0], sout4);


	And AND5(in, sout1, a);
	And AND6(in, sout2, b);
	And AND7(in, sout3, c);
	And AND8(in, sout4, d);


endmodule
