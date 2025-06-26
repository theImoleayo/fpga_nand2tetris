/**
* 8-bit Shiftregister (shifts to left)
* if      (load == 1)  out[t+1] = in[t]
* else if (shift == 1) out[t+1] = out[t]<<1 | inLSB
* (shift one position to left and insert inLSB as least significant bit)
*/

`default_nettype none
module BitShift8L(
	input clk,
	input [7:0] in,
	input inLSB,
	input load,
	input shift,
	output [7:0] out
);

	wire [7:0] out_prev;
	wire [7:0] mux_A_out;
	wire [7:0] mux_B_out;
	// wire [7:0]
	wire [7:0] new_in;

	assign new_in[7:1] = out_prev[6:0];
	assign new_in[0] = inLSB;


	// always @(posedge clk) begin
	// 	new_in[7:1] <= out_prev[6:0];
	// 	new_in[0] <= inLSB;
	// end

	// Put your code here:

	genvar i,j,k;

	generate
		for(i=0; i<8; i=i+1) begin: Mux_8BitA
			Mux Mux_8BitA(
				mux_B_out[i],
				in[i],
				load,
				mux_A_out[i]
			);
		end
	endgenerate

	generate
		for(j=0; j<8; j=j+1) begin: Mux_8BitB
			Mux Mux_8BitB(
				out_prev[j],
				new_in[j],
				shift,
				mux_B_out[j]
			);
		end
	endgenerate

	generate
		for(k=0; k<8; k=k+1) begin: Bit_8
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
