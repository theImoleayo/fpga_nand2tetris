/**
 * 16-bit register:
 * If load[t] == 1 then out[t+1] = in[t]
 * else out does not change
 */

`default_nettype none

module Register(
	input clk,
	input [15:0] in,
	input load,
	output [15:0] out
);

	// Put your code here:
	reg [15:0] out_val;
	// always @(posedge clk) begin
	// 	if(load) out_val<=in;
	// end
 //
	// assign out = out_val;
 //

	// wire
	genvar i;
	generate
		for(i=0; i<16; i=i+1) begin: gen_Reg
			Bit BIT_REGISTER(
				clk,
				in[i],
				load,
				out[i]
			);
		end

	endgenerate
endmodule
