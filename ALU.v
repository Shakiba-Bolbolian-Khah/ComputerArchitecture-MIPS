`timescale 1ns/1ns
module ALU(input [2:0]ALUControl, input [15:0]in1,in2, output Zero, output [15:0]ALUResult);
 	reg [15:0] aluResult;
	reg zero;
 	always@(ALUControl,in1,in2) begin
    aluResult = 16'b0;
    zero = 0;
    case(ALUControl)
			  3'b000: begin //move
				  aluResult = in2;
				  zero = 0;
			  end
			  3'b001: begin //add
				  aluResult = in1 + in2;
				  zero = 0;
			  end
			  3'b010: begin //sub
				  aluResult = in1 - in2;
				  if (aluResult == 16'b0) zero = 1;
				  else zero = 0;
			  end
			  3'b011: begin //and
				  aluResult = in1 & in2;
				  zero = 0;
			  end
			  3'b100: begin //or
				  aluResult = in1 | in2;
				  zero = 0;
			  end
			  3'b101: begin //not
				  aluResult = ~in2;
				  zero = 0;
			  end
			  3'b110: begin //nop
				  aluResult = 16'b0;
				  zero = 0;
			  end
			  default: begin
			    aluResult = 16'b0;
			    zero = 0;
			  end
		endcase
	end
	assign ALUResult = aluResult;
	assign Zero = zero;
endmodule