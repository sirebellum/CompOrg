`timescale 1ns / 1ps
module test_bench(

    );
    
    reg c_in;
    wire c_out;
    reg [3:0] A, B;
    wire [3:0] sum;
    
    Adder add(c_in, A, B, sum, c_out);
    
    initial begin
    c_in = 1;
    A = 4'b1100;
    B = 4'b1001;
    
    #10 c_in = 1;
    A = 4'b0001;
    B = 4'b1001;
    
    #10 c_in = 0;
    A = 4'b1100;
    B = 4'b1101;
    end
    
endmodule
