`timescale 1ns / 1ps
module test_bench(

    );
    
    wire c_in, c_out;
    wire [3:0] A, B, sum;
    
    assign c_in = 0;
    assign A = 4'b0001;
    assign B = 4'b1001;
    
    Adder add(c_in, A, B, sum, c_out);
    
endmodule
