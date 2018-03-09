`timescale 1ns / 1ps

module test_bench();

    reg [15:0] write;
    wire [15:0] read1, read2;
    reg [2:0] write_addr, read_addr1, read_addr2;
    reg write_enable, reset;
    reg clk = 0;
    
    integer i = 0;

    registerbank16 REG(write, write_addr, read_addr1, read_addr2, read1, read2, write_enable, clk, reset);
    
    always #10 clk = !clk;
    
    initial begin
      write_enable = 0;
      reset = 1; //set all registers to 0
      #15 reset = 0;
      
      for (i=0; i < 8; i=i+1) begin //read all values from port1
        #20 read_addr1 = i;
      end
      
      #20 i = 0;
      for (i=0; i < 8; i=i+1) begin //write and read from port1
        #20 write = $random;
        write_enable = 1;
        write_addr = i;
        read_addr1 = i;
      end
      
      #20 i = 0;
      write_enable = 0;
      for (i=0; i < 8; i=i+1) begin //read all values from port2
        #20 read_addr2 = i;
      end
      
      #20 i = 0;
      for (i=0; i < 8; i=i+1) begin //write and read from both ports
        #20 write = $random;
        write_enable = 1;
        write_addr = i;
        read_addr1 = i;
        read_addr2 = i;
      end
      
    end
    
endmodule
