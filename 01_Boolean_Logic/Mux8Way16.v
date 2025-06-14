/**
 * 16-bit multiplexor: 
 * for i = 0..15 out[i] = a[i] if sel == 0 
 *                        b[i] if sel == 1
 */

`default_nettype none
module Mux8Way16(
	input [15:0] a,
	input [15:0] b,
	input [15:0] c,
	input [15:0] d,
	input [15:0] e,
	input [15:0] f,
	input [15:0] g,
	input [15:0] h,
   	input [2:0] sel,
	output [15:0] out
);

	wire [15:0] mux4_1;
	wire [15:0] mux4_2;

	// Put your code here:
	Mux4Way16 MUX4_16A(
	a,
	b,
	c,
	d,
	sel[1:0],
	mux4_1
	);

	Mux4Way16 MUX4_16B(
	e,
	f,
	g,
	h,
	sel[1:0],
	mux4_2
	);

	Mux16 MUX2_16(
	mux4_1,
	mux4_2,
	sel[2],
	out
	);


endmodule
