`timescale 1ns / 1ps

// FullAdder MODULE //
module FullAdder(
    input c_in, A, B,
    output sum, c_out);

        assign sum = (A ^ B) ^ c_in;
        assign c_out = A & B | c_in & (A ^ B);

endmodule //END FullAdder MODULE

// TOP LEVEL MODULE //
module Adder (
    input c_in,
    input [3:0] A, B,
    output [3:0] sum,
    output c_out);

        wire [3:0] c;
        assign c_out = c[3];

        FullAdder Add0(c_in, A[0], B[0], sum[0], c[0]);
        FullAdder Add1(c[0], A[1], B[1], sum[1], c[1]);
        FullAdder Add2(c[1], A[2], B[2], sum[2], c[2]);
        FullAdder Add3(c[2], A[3], B[3], sum[3], c[3]);
        

endmodule