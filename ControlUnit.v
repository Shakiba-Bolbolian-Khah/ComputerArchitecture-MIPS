`timescale 1ns/1ns
module ControlUnit(input [3:0]Opcode, output WriteDataSel,MemRead,MemWrite,RegWrite,Branch,Jump, output [2:0] ALUOp);
	reg [2:0] aluop;
	reg writeDataSel,memRead,memWrite,regWrite,branch,jump;
  assign ALUOp = aluop;
  assign WriteDataSel = writeDataSel;
  assign MemRead = memRead;
  assign MemWrite = memWrite;
  assign RegWrite = regWrite;
  assign Branch = branch;
  assign Jump = jump;
  
	always@(Opcode) begin
		aluop = 3'b010; //nothing
		{writeDataSel,memRead,memWrite,regWrite,branch,jump} = 6'b0;
		case(Opcode)
		    4'b0000: begin //Load
				  aluop = 3'b010; //nothing
				  writeDataSel = 1;
				  memRead = 1;
				  regWrite = 1;
			  end
			  4'b0001: begin //Store
				  aluop = 3'b010; //nothing
				  memWrite = 1;
			  end
			  4'b0010: begin //Jump
				  aluop = 3'b010; //nothing
				  jump = 1;
			  end
			  4'b0100: begin //BranchZ
				  aluop = 3'b000; //BranchZ
				  branch = 1;
			  end
			  4'b1000: begin //C-type
				  aluop = 3'b001; //C-type
				  regWrite = 1;
			  end
			  4'b1100: begin //Addi
				  aluop = 3'b100; //Addi
				  regWrite = 1;
			  end
			  4'b1101: begin //Subi
				  aluop = 3'b101; //Subi
				  regWrite = 1;
			  end
			  4'b1110: begin //Andi
				  aluop = 3'b110; //Andi
				  regWrite = 1;
			  end
			  4'b1111: begin //Ori
				  aluop = 3'b111; //Ori
				  regWrite = 1;
			  end
			  default: begin
			    aluop = 3'b010; //nothing
		      {writeDataSel,memRead,memWrite,regWrite,branch,jump} = 6'b0;
		    end
		endcase
	end
endmodule