`timescale 1ns / 1ps

module FPMultiply(
    input [31:0] F1, F2,
    output [31:0] out
    );
    
    //Setup local variables for parts of FP numbers
    //Inputs
    wire sign1, sign2;
    wire [7:0] exp1, exp2;
    reg [23:0] val1, val2; //larger local variables for leading 1
    assign sign1 = F1[31];
    assign exp1 = F1[30:23] - 127; //adjust for exp bias
    assign sign2 = F2[31];
    assign exp2 = F2[30:23] - 127;
    //Output
    reg signout;
    reg [7:0] expout;
    reg [22:0] valout;
    reg [47:0] val; //placeholder for possibly huge value
    assign out[31] = signout;
    assign out[30:23] = expout + 127;
    assign out[22:0] = valout;
    
    reg [4:0] bits1, bits2; //number of bits in each mantissa
    
    reg [5:0] index; //index for selecting val digit
    reg [5:0] counter;
    
    always @(F1, F2) begin
    
    signout = 0;
    expout = exp1 + exp2;
    
    val1 = {1'b1, F1[22:0]}; //append leading 1
    val2 = {1'b1, F2[22:0]};
    
    //Remove trailing zeroes
    bits1 = 24;
    bits2 = 24;
    while (val1[0] != 1) begin
        val1 = val1 >> 1;
        bits1 = bits1 - 1; //count number of bits
    end
    while (val2[0] != 1) begin
        val2 = val2 >> 1;
        bits2 = bits2 - 1;
    end
    
    //Multiplication
    val = val1 * val2;
    
    //Find first non zero value in multiplied value
    index = 47;
    while (val[index] == 0 && index != 0) begin
      index = index - 1;
    end
    
    //Adjust exp for decimal shift that may occur during mult. of mantissa
    //Uses number of bits in multiplicands and number of bits in result to determine adjustment
    expout = expout + (index + 1 - (bits1 + bits2 - 2) - 1);
    
    //Populate valout register
    counter = 0;
    valout = 0;
    while (counter <= 22) begin
      counter = counter + 1;
      valout = valout << 1;
      val = val << 1; //comes before assignment to remove leading 1
      valout[0] = val[index];
    end

    end
    
endmodule
