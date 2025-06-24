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
    wire [15:0] reg_out;
    wire [15:0] inc_out;
    wire [15:0] mux_out;
    wire [15:0] inc_mux_out;
    wire [15:0] load_mux_out;

    // Internal register
    Register REG_16 (
        clk,
        mux_out,
        1'b1,      // Always load into Register each clock cycle
        reg_out
    );

    // Increment logic
    Inc16 INCREMENT (
        reg_out,
        inc_out
    );

    // First Mux: choose between current value and incremented value
    Mux16 MUX_INC (
        reg_out,
        inc_out,
        inc,
        inc_mux_out
    );

    // Second Mux: choose between increment result and external input
    Mux16 MUX_LOAD (
        inc_mux_out,
        in,
        load,
        load_mux_out
    );

    // Final Mux: reset logic
    Mux16 MUX_RESET (
        load_mux_out,
        16'b0,
        reset,
        mux_out
    );

    assign out = reg_out;

	//--------------------


endmodule
