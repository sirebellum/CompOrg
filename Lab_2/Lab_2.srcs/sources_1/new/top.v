`timescale 1ns / 1ps

//BEGIN PARTIAL FULL ADDER
module pFulladder(
    input a, b, cin, //input bits
    output g, p, sum
    );
    
    assign g = a & b; //generate bit
    assign p = a ^ b; //propagate bit
    assign sum = p ^ cin;
    
endmodule //END PARTIAL FULL ADDER


//BEGIN CLA
module CLA(
    input prev, //carry from previous stage
    input g, p,  //prop and gen bit from current stage
    output cout
    );
    
    assign cout = g + (p & prev);
    
endmodule //END CLA


module CLA_4(
    input [3:0] a, b, //bits to sum
    input cin, //carry in
    output [3:0] sum, //output sum
    output cout //carry out
    );
    
    wire [3:0] g, p; //generate and propogate bits
    wire [3:0] c; //carry bits
    
    assign cout = c[3]; //last carry bit is cout
    
    CLA cla0(cin , g[0], p[0], c[0]);
    CLA cla1(c[0], g[1], p[1], c[1]);
    CLA cla2(c[1], g[2], p[2], c[2]);
    CLA cla3(c[2], g[3], p[3], c[3]);
    
    pFulladder add0(a[0], b[0], cin , g[0], p[0], sum[0]);
    pFulladder add1(a[1], b[1], c[0], g[1], p[1], sum[1]);
    pFulladder add2(a[2], b[2], c[1], g[2], p[2], sum[2]);
    pFulladder add3(a[3], b[3], c[2], g[3], p[3], sum[3]);
    
endmodule
