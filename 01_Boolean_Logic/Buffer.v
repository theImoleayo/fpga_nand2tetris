/**
 * Buffer:
 * out = in
 */

`default_nettype none

module Buffer(
	input in,

	output out
);
	wire out1;

	// Positional port mapping: follows the exact order of ports in module definition
	//--------------------------
	// Nand NAND1(in, in, out1);
	// Nand NAND2(out1, out1, out);
	//--------------------------

	// Named port mapping: .port_name(signal_name)

	//--------------------------
	// Nand NAND1(.a(in), .b(in), .out(out1));
	// Nand NAND2(.a(out1), .b(out1), .out(out));
	//--------------------------

	//Making of NOT GATE

	Not NOT1(in, out1);
	Not NOT2(out1, out);


endmodule
