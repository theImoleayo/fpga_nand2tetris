/**
 * 1-bit register:
 * If load[t] == 1 then out[t+1] = in[t]
 *    else out does not change (out[t+1] = out[t])
 */

`default_nettype none
module Bit(
	input clk,
	input in,
	input load,
	output out
);

	wire dff_out;
	wire dff_in;

	DFF FLIP_IN(
		clk,
		dff_in,
		out
	);

	Mux MEM_LOAD(
		out,
		in,
		load,
		dff_in
	);

endmodule
