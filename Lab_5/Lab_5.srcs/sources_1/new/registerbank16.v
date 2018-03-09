`timescale 1ns / 1ps
module registerbank16(
    input [15:0] wrt,
    input [2:0] waddr, raddr1, raddr2,
    output [15:0] rd1, rd2,
    input write_enable, clk, reset
    );
    
    reg [15:0] r0, r1, r2, r3, r4, r5, r6, r7; //Registers
    reg [15:0] p0, p1, p2, p3, p4, p5, p6, p7; //Previous values of registers
    reg [15:0] read1, read2;
    reg [15:0] write;
    
    assign rd1 = read1;
    assign rd2 = read2;
    
    always @(posedge clk) begin
    
      //Store previous values
      p0 = r0;
      p1 = r1;
      p2 = r2;
      p3 = r3;
      p4 = r4;
      p5 = r5;
      p6 = r6;
      p7 = r7;
    
      write = wrt; //local storage of write value
    
      if (reset == 1) begin
        r0 = 0;
        r1 = 0;
        r2 = 0;
        r3 = 0;
        r4 = 0;
        r5 = 0;
        r6 = 0;
        r7 = 0;
        write = 0; //ensure value doesn't get written later
      end
    
      case (write_enable)
      0: begin //Read case
        case (raddr1) //Read port 1
          3'b000: read1 = r0;
          3'b001: read1 = r1;
          3'b010: read1 = r2;
          3'b011: read1 = r3;
          3'b100: read1 = r4;
          3'b101: read1 = r5;
          3'b110: read1 = r6;
          3'b111: read1 = r7;
        endcase
        case (raddr2) //Read port 2
          3'b000: read2 = r0;
          3'b001: read2 = r1;
          3'b010: read2 = r2;
          3'b011: read2 = r3;
          3'b100: read2 = r4;
          3'b101: read2 = r5;
          3'b110: read2 = r6;
          3'b111: read2 = r7;
        endcase
      end
      1: begin //Write case
        case (waddr)
          3'b000: r0 = 16'b0000000000000000;
          3'b001: r1 = write;
          3'b010: r2 = write;
          3'b011: r3 = write;
          3'b100: r4 = write;
          3'b101: r5 = write;
          3'b110: r6 = write;
          3'b111: r7 = write;
        endcase
        case (raddr2) //Read port 2 previous value
          3'b000: read2 = p0;
          3'b001: read2 = p1;
          3'b010: read2 = p2;
          3'b011: read2 = p3;
          3'b100: read2 = p4;
          3'b101: read2 = p5;
          3'b110: read2 = p6;
          3'b111: read2 = p7;
        endcase
        case (raddr1) //Read port 1 current value
          3'b000: read1 = r0;
          3'b001: read1 = r1;
          3'b010: read1 = r2;
          3'b011: read1 = r3;
          3'b100: read1 = r4;
          3'b101: read1 = r5;
          3'b110: read1 = r6;
          3'b111: read1 = r7;
        endcase
      end    
      endcase
      
    end
    
endmodule
