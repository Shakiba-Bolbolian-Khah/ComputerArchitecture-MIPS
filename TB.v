`timescale 1ns/1ns
module TB();
  wire [15:0] Data;
  reg clk = 0, rst = 0;
  MIPS mips( clk, rst, Data);
  initial begin
    repeat(140) #10 clk = ~clk;
  end
  initial begin
    rst = 1;
    #20
    rst = 0;
    #1300;
  end
endmodule
