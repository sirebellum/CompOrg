`timescale 1ns / 1ps

module test_bench(
    );
    
    wire [3:0] sum; //sum output
    wire cout; //carry out
    reg [3:0] a, b; //input bits
    reg cin; //carry in
    
    CLA_4 lookaheadAdder(a, b, cin, sum, cout);
    
    wire CLK;
    assign CLK = 1;
    
    always @ (CLK) begin
        //Case with carry in and no carry out
        a = 4'b0000;
        b = 4'b0001;
        cin = 1;
    #100//Case with no carry in but a carry out
        a = 4'b1010;
        b = 4'b0111;
        cin = 0;
    #100//Case with a carry in and a carry out
        a = 4'b1001;
        b = 4'b1100;
        cin = 1;

    end
    
endmodule
