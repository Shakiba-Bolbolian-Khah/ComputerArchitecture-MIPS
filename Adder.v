`timescale 1ns/1ns
module Adder(input [9:0] op1, op2, output [9:0] result);
  assign result = op1 + op2;
endmodule