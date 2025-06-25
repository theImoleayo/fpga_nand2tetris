/**
* RAM3840 implements 3840 Bytes of RAM addressed from 0 - 3839
* out = M[address]
* if (load =i= 1) M[address][t+1] = in[t]
*/

`default_nettype none
module RAM3840(
    input wire clk,
    input wire [11:0] address,
    input wire [15:0] in,
    input wire load,
    output wire [15:0] out
);

    wire upper_bit = address[11];
    wire [2:0] lower_bit = address[10:8];
    wire [15:0] loads;
    wire low_bit;
    wire high_bit;
    wire [15:0] mux_out;
    wire [15:0] low_bit_out;
    wire [15:0] high_bit_out;

	DMux DMUX(
		load,
		upper_bit,
		low_bit,
		high_bit
	);

	DMux8Way DMUX_A(
		low_bit,
		lower_bit,
		loads[0],
		loads[1],
		loads[2],
		loads[3],
		loads[4],
		loads[5],
		loads[6],
		loads[7]
	);

	DMux8Way DMUX_B(
		high_bit,
		lower_bit,
		loads[8],
		loads[9],
		loads[10],
		loads[11],
		loads[12],
		loads[13],
		loads[14],
		loads[15]
	);
	wire [15:0] ram_out [14:0];
	genvar i;


	generate
		for(i=0; i<15; i=i+1) begin
			RAM256 RAM_I(
				clk,
				address[7:0],
				in,
				loads[i],
				ram_out[i]
			);
		end
	endgenerate

	Mux8Way16 MUX_A(
		ram_out[0],
		ram_out[1],
		ram_out[2],
		ram_out[3],
		ram_out[4],
		ram_out[5],
		ram_out[6],
		ram_out[7],
		lower_bit,
		low_bit_out
	);

	Mux8Way16 MUX_B(
		ram_out[8],
		ram_out[9],
		ram_out[10],
		ram_out[11],
		ram_out[12],
		ram_out[13],
		ram_out[14],
		16'b1,
		lower_bit,
		high_bit_out
	);

	Mux16 MUX_2WAY(
		low_bit_out,
		high_bit_out,
		upper_bit,
		mux_out
	);

	assign out = mux_out;

endmodule
