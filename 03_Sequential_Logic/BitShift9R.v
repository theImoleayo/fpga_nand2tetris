/**
* 9 bit Shiftregister (shifts to right)
* if      (load == 1)  out[t+1] = in[t]
* else if (shift == 1) out[t+1] = out[t]>>1 | (inMSB<<8)
* (shift one position to right and insert inMSB as most significant bit)
*/

`default_nettype none
module BitShift9R(
	input clk,
	input [8:0] in,
	input inMSB,
	input load,
	input shift,
	output [8:0] out
);

	// Put your code here:
	wire [8:0] out_prev;
	wire [8:0] mux_A_out;
	wire [8:0] mux_B_out;
	// wire [7:0]
	wire [8:0] new_in;

	assign new_in[7:0] = out_prev[8:1];
	assign new_in[8] = inMSB;


	// always @(posedge clk) begin
	// 	new_in[7:1] <= out_prev[6:0];
	// 	new_in[0] <= inLSB;
	// end

	// Put your code here:

	genvar i,j,k;

	generate
		for(i=0; i<9; i=i+1) begin: Mux_9BitA
			Mux Mux_9Bit(
				mux_B_out[i],
				in[i],
				load,
				mux_A_out[i]
			);
		end
	endgenerate

	generate
		for(j=0; j<9; j=j+1) begin: Mux_9BitB
			Mux Mux_9BitB(
				out_prev[j],
				new_in[j],
				shift,
				mux_B_out[j]
			);
		end
	endgenerate

	generate
		for(k=0; k<9; k=k+1) begin: Bit_9
			Bit Bit_Register(
				clk,
				mux_A_out[k],
				1'b1,
				out_prev[k]
			);
		end
	endgenerate

	assign out = out_prev;
endmodule
