`timescale 1ns/1ns
module ALUController(input [7:0]func, input [2:0] ALUOp, output WinEn, output [2:0] ALUControl);
	reg [2:0] aluControl;
	reg winEn;
  assign WinEn = winEn;
  assign ALUControl = aluControl;
	always@(func,ALUOp) begin
		aluControl = 3'b110; //nop
		winEn = 0;
		case(ALUOp)
		    3'b000: begin //BranchZ
				  aluControl = 3'b010; //sub
				  winEn = 0;
			  end
			  3'b001: begin //C-type
			    if(func == 8'b00000001) begin
			      aluControl = 3'b000; //move
			      winEn = 0;
			    end
			    else if(func == 8'b00000010) begin
			      aluControl = 3'b001; //add
			      winEn = 0;
			    end
			    else if(func == 8'b00000100) begin
			      aluControl = 3'b010; //sub
			      winEn = 0;
			    end
			    else if(func == 8'b00001000) begin
			      aluControl = 3'b011; //and
			      winEn = 0;
			    end
			    else if(func == 8'b00010000) begin
			      aluControl = 3'b100; //or
			      winEn = 0;
			    end
			    else if(func == 8'b00100000) begin
			      aluControl = 3'b101; //not
			      winEn = 0;
			    end
			    else if(func == 8'b01000000) begin
			      aluControl = 3'b110; //nop
			      winEn = 0;
			    end
			    else if(func == 8'b10000000) begin //wnd0
			      aluControl = 3'b110; //wnd0
			      winEn = 1;
			    end
			    else if(func == 8'b10000001) begin //wnd1
			      aluControl = 3'b110; //wnd1
			      winEn = 1;
			    end
			    else if(func == 8'b10000010) begin //wnd2
			      aluControl = 3'b110; //wnd2
			      winEn = 1;
			    end
			    else if(func == 8'b10000011) begin //wnd3
			      aluControl = 3'b110; //nop
			      winEn = 1;
			    end
			  end
			  3'b011: begin //load,store,jump
				  aluControl = 3'b110; //nop
				  winEn = 0;
			  end
			  3'b100: begin //addi
				  aluControl = 3'b001; //add
				  winEn = 0;
			  end
			  3'b101: begin //subi
				  aluControl = 3'b010; //sub
				  winEn = 0;
			  end
			  3'b110: begin //andi
				  aluControl = 3'b011; //and
				  winEn = 0;
			  end
			  3'b111: begin //ori
				  aluControl = 3'b100; //or
				  winEn = 0;
			  end
			  default: begin
			    aluControl = 3'b110; //nop
			    winEn = 0;
			  end
		endcase
	end
endmodule
