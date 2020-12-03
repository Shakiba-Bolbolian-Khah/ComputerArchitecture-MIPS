`timescale 1ns/1ns
module Mux4to1(input [1:0]select, input [9:0]in1,in2,in3, output [9:0]MuxOut);
  assign MuxOut = select==2'b00 ? in1 :
          select==2'b01 ? in2 :
          select==2'b10 ? in3 : 10'bz;
endmodule