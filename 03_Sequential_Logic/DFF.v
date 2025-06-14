/**
* Data-Flip-Flop
* out[t+1] = in[t]
*/

`default_nettype none
module DFF(
		input clk,
		input in,
		output out
);

	// No need to implement this chip
	// This chip is implemented in verilog using reg-variables
	reg out_reg;
	always @(posedge clk)
		if (in) out_reg <= 1'b1;
		else out_reg <= 1'b0;
	assign out = out_reg;


endmodule
