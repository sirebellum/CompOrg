`timescale 1ns / 1ps
module test_bench();
    
    reg [31:0] f1, f2;
    wire [31:0] out;
    
    FPMultiply fp(f1, f2, out);
    
    initial begin

        //positive exponents
        f1 = 32'b00000000010100000000000000000000;
        f2 = 32'b01000000111000000000000000000000;
        #10
        //negative and positive exponent
        f1 = 32'b00111111010100000000000000000000;
        f2 = 32'b01000000111000000000000000000000;
        
    end
    
endmodule