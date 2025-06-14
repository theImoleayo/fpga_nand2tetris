/**
 * A 16-bit counter with load and reset control bits.
 * if      (reset[t] == 1) out[t+1] = 0
 * else if (load[t] == 1)  out[t+1] = in[t]
 * else if (inc[t] == 1)   out[t+1] = out[t] + 1  (integer addition)
 * else                    out[t+1] = out[t]
 */

`default_nettype none
module PC(
	input clk,
	input [15:0] in,
	input load,
	input inc,
	input reset,
	output [15:0] out
);	
	reg [15:0] out_cnt;
	always @(posedge clk) begin
		if(reset) out_cnt<=16'b0;
		else if(load) out_cnt<=in;
		else if(inc) out_cnt<=out_cnt+1'b1;
	end
	
	assign out = out_cnt;
	// wire [15:0] dff_out;
	// genvar i;
	// generate
	// 	for(i=0; i<16; i=i+1)
	// 		DFF DATA_MEM(
	// 			clk,
	// 			in[i],
	// 			dff_out[i]
	// 		);
	// endgenerate
	// // reg out_priv/;
 //
	// reg [15:0] pos_out;
	// always @(posedge clk) begin
	// 	// out_priv = pos_out;
	// 	if (reset) pos_out<=16'b0;
	// 	else if (load) pos_out<=dff_out;
	// 	else if (inc) pos_out <=pos_out+1'b1;
	// end
	// // Put your code here:
 //
	// assign out = pos_out;


endmodule
