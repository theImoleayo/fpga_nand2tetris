/**
 * The ALU (Arithmetic Logic Unit).
 * Computes one of the following functions:
 * x+y, x-y, y-x, 0, 1, -1, x, y, -x, -y, !x, !y,
 * x+1, y+1, x-1, y-1, x&y, x|y on two 16-bit inputs, 
 * according to 6 input bits denoted zx,nx,zy,ny,f,no.
 * In addition, the ALU computes two 1-bit outputs:
 * if the ALU output == 0, zr is set to 1; otherwise zr is set to 0;
 * if the ALU output < 0, ng is set to 1; otherwise ng is set to 0.
 */

// Implementation: the ALU logic manipulates the x and y inputs
// and operates on the resulting values, as follows:
// if (zx == 1) set x = 0        // 16-bit constant
// if (nx == 1) set x = !x       // bitwise not
// if (zy == 1) set y = 0        // 16-bit constant
// if (ny == 1) set y = !y       // bitwise not
// if (f == 1)  set out = x + y  // integer 2's complement addition
// if (f == 0)  set out = x & y  // bitwise and
// if (no == 1) set out = !out   // bitwise not
// if (out == 0) set zr = 1
// if (out < 0) set ng = 1

`default_nettype none
module ALU(
	input [15:0] x,		// input x (16 bit)
	input [15:0] y,		// input y (16 bit)
    input zx, 				// zero the x input?
    input nx, 				// negate the x input?
    input zy, 				// zero the y input?
    input ny, 				// negate the y input?
    input f,  				// compute out = x + y (if 1) or x & y (if 0)
    input no, 				// negate the out output?
    output [15:0] out, 			// 16-bit output

   output zr, 				// 1 if (out == 0), 0 otherwise
    output ng 				// 1 if (out < 0),  0 otherwise
);
    wire [15:0] not_x;
    wire [15:0] zero_x;
    wire [15:0] not_y;
    wire [15:0] zero_y;
    wire [15:0] nz_x;
    wire [15:0] nz_y;
    wire [15:0] zx_out;
    wire [15:0] zy_out;
    wire [15:0] nzx_out;
    wire [15:0] nzy_out;

    Not16 NOT_X(
        x,
        not_x
    );
    Not16 NOT_Y(
        y,
        not_y
    );

    wire [15:0] x_out;
    wire [15:0] y_out;
    wire [15:0] inc_x;
    wire [15:0] inc_y;

    // assign new_z = (nz&1);
    /*
     * ------------
     * ------------
    */

    Inc16 INCREMENT_X(
            not_x,
            inc_x
    );
    Add16 ZERO_X(
        x,
        inc_x,
        zero_x
    );
    Not16 NegZero_X(
        zx_out,
        nz_x
    );


    Inc16 INCREMENT_Y(
        not_y,
        inc_y
    );

    Add16 ZERO_Y(
        y,
        inc_y,
        zero_y
    );
    Not16 NegZero_Y(
        zy_out,
        nz_y
    );

    // assign zx_out = zx ? zero_x : x;
    Mux16 MUX_ZX_OUT(
        x,
        zero_x,
        zx,
        zx_out
    );

    // assign nzx_out = nx ? nz_x : zx_out;

    Mux16 MUX_NZX_OUT(
        zx_out,
        nz_x,
        nx,
        nzx_out
    );




    // assign zy_out = zy ? zero_y : y;

        Mux16 MUX_ZY_OUT(
        y,
        zero_y,
        zy,
        zy_out
    );


    // assign nzy_out = ny ? nz_y : zy_out;
    Mux16 MUX_NZY_OUT(
        zy_out,
        nz_y,
        ny,
        nzy_out
    );

    wire [15:0] f_eq0;
    wire [15:0] f_eq1;


    Add16 ADD_XY(
        nzx_out,
        nzy_out,
        f_eq1
    );

    And16 AND_XY(
        nzx_out,
        nzy_out,
        f_eq0
    );

    wire [15:0] f_out;

    // assign f_out = f ? f_eq1 : f_eq0;
    Mux16 MUX_FOUT(
        f_eq0,
        f_eq1,
        f,
        f_out
    );

    wire [15:0] no_eq1;


    Not16 NOT_OUT(
        f_out,
        no_eq1
    );


    // assign out = no ? no_eq1 : f_out;
    Mux16 MUX_OUT(
        f_out,
        no_eq1,
        no,
        out
    );


    assign zr = out == 16'b0 ? 1 : 0;


    // assign ng = out[15] == 1 ? 1 : 0;

    Mux MUX_NG(
        1'b0,
        1'b1,
        out[15],
        ng
    );


endmodule
