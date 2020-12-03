`timescale 1ns/1ns
module PC(input clk,rst, input [9:0] inInst, output[9:0] outInst);
  reg [9:0] out;
  assign outInst = out;
  always@(posedge clk, posedge rst) begin
    if(rst) out <= 10'b0;
    else out <= inInst;
  end
endmodule