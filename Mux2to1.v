`timescale 1ns/1ns
module Mux2to1(input select, input [15:0]in1,in2, output [15:0]MuxOut);
  assign MuxOut = ~select ? in1 : in2;
endmodule