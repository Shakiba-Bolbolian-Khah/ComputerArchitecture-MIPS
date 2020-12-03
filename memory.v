`timescale 1ns/1ns
module Memory(input[9:0] instAdd, dataAdd, input[15:0] writeData, input memRead, memWrite, output[15:0] instruction, data);
  reg[15:0] daTa;
  reg [15:0] memoryData[0:1023];
  initial begin
    memoryData[0] = 16'b1000000010000000;
    memoryData[1] = 16'b1110000000000000;
    memoryData[2] = 16'b1100010000001010;
    memoryData[3] = 16'b0001010111110100;
    memoryData[4] = 16'b1100010000001011;
    memoryData[5] = 16'b0001010111110101;
    memoryData[6] = 16'b1100010000001100;
    memoryData[7] = 16'b0001010111110110;
    memoryData[8] = 16'b1100010000001101;
    memoryData[9] = 16'b0001010111110111;
    memoryData[10] = 16'b1100010000001110;
    memoryData[11] = 16'b0001010111111000;
    memoryData[12] = 16'b1100010000001111;
    memoryData[13] = 16'b0001010111111001;
    memoryData[14] = 16'b1100010000010000;
    memoryData[15] = 16'b0001010111111010;
    memoryData[16] = 16'b1100010000010001;
    memoryData[17] = 16'b0001010111111011;
    memoryData[18] = 16'b1100010000010010;
    memoryData[19] = 16'b0001010111111100;
    memoryData[20] = 16'b1100010000010011;
    memoryData[21] = 16'b0001010111111101;
    memoryData[22] = 16'b1000000010000001;
    memoryData[23] = 16'b1110000000000000;
    memoryData[24] = 16'b0000010111110100;
    memoryData[25] = 16'b1000000100000010;
    memoryData[26] = 16'b0000010111110101;
    memoryData[27] = 16'b1000000100000010;
    memoryData[28] = 16'b0000010111110110;
    memoryData[29] = 16'b1000000100000010;
    memoryData[30] = 16'b0000010111110111;
    memoryData[31] = 16'b1000000100000010;
    memoryData[32] = 16'b0000010111111000;
    memoryData[33] = 16'b1000000100000010;
    memoryData[34] = 16'b0000010111111001;
    memoryData[35] = 16'b1000000100000010;
    memoryData[36] = 16'b0000010111111010;
    memoryData[37] = 16'b1000000100000010;
    memoryData[38] = 16'b0000010111111011;
    memoryData[39] = 16'b1000000100000010;
    memoryData[40] = 16'b0000010111111100;
    memoryData[41] = 16'b1000000100000010;
    memoryData[42] = 16'b0000010111111101;
    memoryData[43] = 16'b1000000100000010;
    memoryData[44] = 16'b0001000111111110;
    memoryData[45] = 16'b0000100111111110;
  end
  always@(posedge memRead,posedge memWrite)begin
    if(memRead)
      daTa = memoryData[dataAdd];
    if(memWrite)
      memoryData[dataAdd] = writeData;
  end
  assign data = daTa;
  assign instruction = memoryData[instAdd];
endmodule