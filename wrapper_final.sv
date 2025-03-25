`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 12.03.2025 16:25:08
// Design Name:
// Module Name: wrapper
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module wrapper(
    input logic CLK100MHZ,

    input logic BTNC,
    input logic BTND,

    output CA,
    output CB,
    output CC,
    output CD,
    output CE,
    output CF,
    output CG
    );

    logic [3:0] shift_enbl;
    logic [3:0] shift_disbl;
    logic flag;
    shift_reg shft_en(
        .clk(CLK100MHZ),
        .en(BTNC),
        .ISL(1'b1),
        .rst(~BTNC),
        .OSL(flag),
        .shift_rg(shift_enbl)
    );
    logic [3:0] temp;
    counter count (
        .en(~shift_enbl[3] & shift_enbl[2]),
        .clk(CLK100MHZ),
        .rst(BTND),
        .cnt(temp)
    );
    decoder decc(
        .in(temp),
        .out({CG, CF, CE, CD, CC, CB, CA})
    );
endmodule
