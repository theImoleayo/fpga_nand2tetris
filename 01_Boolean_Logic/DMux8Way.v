/**
 * 8-way demultiplexor:
 * {a, b, c, d, e, f, g, h} = {in, 0, 0, 0, 0, 0, 0, 0} if sel == 000
 *                            {0, in, 0, 0, 0, 0, 0, 0} if sel == 001
 *                            etc.
 *                            {0, 0, 0, 0, 0, 0, 0, in} if sel == 111
 */

`default_nettype none
module DMux8Way(
	input in,
	input [2:0] sel,
    output a,
	output b,
	output c,
	output d,
	output e,
	output f,
	output g,
	output h
);
	wire lo_in;
	wire hi_in;

	DMux DMUX1(
	in,
	sel[2],
	lo_in,
	hi_in
	);



	// Put your code here:
	DMux4Way DMUX_4_A(
	lo_in,
	sel[1:0],
	a,
	b,
	c,
	d
	);
		DMux4Way DMUX_4_B(
	hi_in,
	sel[1:0],
	e,
	f,
	g,
	h
	);

endmodule
