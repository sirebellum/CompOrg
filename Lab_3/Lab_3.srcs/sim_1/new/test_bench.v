`timescale 1ns / 1ps
module test_bench(
    );
    
    wire [7:0] result;
    wire [7:0] A, B;
    reg [2:0] F;
    integer i;
    
    ALU alu(A, B, F, result);
    
    assign A = 8'b00101010;
    assign B = 8'b01010110;
    
    initial begin
      for (i = 0; i < 9; i = i + 1) begin
        F = #10 i;
      end
    end 
    
endmodule
