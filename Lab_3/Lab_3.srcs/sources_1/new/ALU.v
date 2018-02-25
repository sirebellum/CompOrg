`timescale 1ns / 1ps
module ALU(
    input [7:0] A, B,
    input [2:0] F,
    output [7:0] out
    );
    
    reg [7:0] result;
    assign out = result;
    
    always @(*) begin
    
    case (F)
      3'b000:
        result = A & B;
      3'b001:
        result = A | B;
      3'b010:
        result = A + B;
      3'b011:
        result = 8'b00000000;
      3'b100:
        result = A & ~B;
      3'b101:
        result = A | ~B;
      3'b110:
        result = A - B;
      3'b111: begin //if less than
        if (A < B)
          result = 8'b11111111;
        else result = 8'b00000000;
      end
      endcase

    end
    
endmodule
