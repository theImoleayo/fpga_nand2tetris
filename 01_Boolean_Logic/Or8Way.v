/**
 * 8-way Or: 
 * out = (in[0] or in[1] or ... or in[7])
 */

`default_nettype none
module Or8Way(
	input [7:0] in,
	output out
);

wire or1, or2, or3, or4;
	wire or5, or6;

	Or OR1(.a(in[0]), .b(in[1]), .out(or1));
	Or OR2(.a(in[2]), .b(in[3]), .out(or2));
	Or OR3(.a(in[4]), .b(in[5]), .out(or3));
	Or OR4(.a(in[6]), .b(in[7]), .out(or4));

	Or OR5(.a(or1), .b(or2), .out(or5));
	Or OR6(.a(or3), .b(or4), .out(or6));

	Or OR7(.a(or5), .b(or6), .out(out));

endmodule
