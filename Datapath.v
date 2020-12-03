`timescale 1ns/1ns
module Datapath(input clk, rst, input ALUop2, winEn, memRead, memWrite, writeDataSel, regWrite, branch, jump, input[2:0] ALUControl, output[15:0] Instr,Data);
  wire[15:0] instruction, readData1, readData2, readDataMemory, writeDataMuxOut, readData1MuxOut, ALUResult;
  wire[9:0] inInstAdd, outInstAdd, newPC;
  wire zero;
  assign Data = readDataMemory;
  assign Instr = instruction; 
  PC pc(clk,rst,inInstAdd, outInstAdd);
  Adder adder(outInstAdd,10'b0000000001, newPC);
  Mux4to1 pcMux({(branch&zero),jump},newPC,instruction[9:0],{outInstAdd[9:8],instruction[7:0]}, inInstAdd);
  Memory memory(outInstAdd,instruction[9:0], readData1, memRead, memWrite, instruction, readDataMemory);
  RegisterFile registerFile(clk,rst,winEn,regWrite,instruction[11:10],instruction[9:8],instruction[11:10],instruction[1:0],writeDataMuxOut, readData1,readData2);
  Mux2to1 readData1Mux(ALUop2, readData1, {8'b0,instruction[7:0]}, readData1MuxOut);
  ALU alu(ALUControl, readData1MuxOut, readData2, zero, ALUResult);
  Mux2to1 writeDataMux(writeDataSel, ALUResult, readDataMemory, writeDataMuxOut);
endmodule