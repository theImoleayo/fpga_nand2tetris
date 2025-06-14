/**
 * 16-bit multiplexor: 
 * for i = 0..15 out[i] = a[i] if sel == 0 
 *                        b[i] if sel == 1

 */

`default_nettype none
module Mux4Way16(
	input [15:0] a,
	input [15:0] b,
	input [15:0] c,
	input [15:0] d,
   	input [1:0] sel,
	output [15:0] out
);


	
	// Put your code here:
	wire not_s0;
	wire not_s1;
	wire [15:0] or_out1;
	wire [15:0] or_out2;
	wire [15:0] and_out1;
	wire [15:0] and_out2;
	wire [15:0] and_out3;
	wire [15:0] and_out4;
	wire s_out1;
	wire s_out2;
	wire s_out3;
	wire s_out4;

	Not NOT1(sel[0], not_s0);
	Not NOT2(sel[1], not_s1);

	And AND1(not_s0, not_s1, s_out1);

	wire [15:0] s_mask1 = {16{s_out1}};
	And16 AND2(a, s_mask1, and_out1);
	// And AND2(a, s_out1, and_out1);

	And AND3(not_s1, sel[0], s_out2);
	wire [15:0] s_mask2 = {16{s_out2}};
	And16 AND4(b, s_mask2, and_out2);

	// And AND4(s_out2, b, and_out2);

	And AND5(sel[1], not_s0, s_out3);
	wire [15:0] s_mask3 = {16{s_out3}};
	And16 AND6(c, s_mask3, and_out3);
	// And AND6(s_out3, c, and_out3);

	And AND7(sel[1], sel[0], s_out4);
	wire [15:0] s_mask4 = {16{s_out4}};
	And16 AND8(d, s_mask4, and_out4);
	// And AND8(s_out4, d, and_out4);

	Or16 OR1(and_out1, and_out2, or_out1);
	Or16 OR2(and_out3, and_out4, or_out2);
	Or16 OR3(or_out1, or_out2, out);

endmodule
