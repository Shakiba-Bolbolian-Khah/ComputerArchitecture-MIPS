`timescale 1ns/1ns
module MIPS(input clk, rst, output[15:0] Data);
  wire winEn, memRead, memWrite, writeDataSel, regWrite, branch, jump;
  wire[15:0] Instr;
  wire [2:0] ALUOp,ALUControl;
  Datapath datapath(clk,rst,ALUOp[2],winEn,memRead,memWrite,writeDataSel,regWrite,branch,jump,ALUControl, Instr,Data);
  ALUController aluController(Instr[7:0],ALUOp, winEn,ALUControl);
  ControlUnit controlUnit(Instr[15:12], writeDataSel,memRead,memWrite,regWrite,branch,jump,ALUOp);
endmodule