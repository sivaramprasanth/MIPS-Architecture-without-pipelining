//This is the instruction set which takes the PC number and gives the instruction in that memory.

module instructionset(PC,clk,output_instruction);

input [31:0] PC;
output reg [31:0] output_instruction;
input clk;
reg [31:0] instruction[150:0];

integer num;

//These are the instructions that we use for matrix multiplication.

initial begin
    instruction[0] = 32'b10001110111100000000000000000000;
    instruction[1] = 32'b10001110111100010000000000001001;
    instruction[2] = 32'b00000010000100010100000000110000;
    instruction[3] = 32'b10001110111100000000000000000001;
    instruction[4] = 32'b10001110111100010000000000001100;
    instruction[5] = 32'b00000010000100010100100000110000;
    instruction[6] = 32'b10001110111100000000000000000010;
    instruction[7] = 32'b10001110111100010000000000001111;
    instruction[8] = 32'b00000010000100010101000000110000;
    instruction[9] = 32'b00000001000010010101100000100000;
    instruction[10] = 32'b00000001010010110110000000100000;
    instruction[11] = 32'b10101110111011000000000000110010;
// end
    instruction[12] = 32'b10001110111100000000000000000000;
    instruction[13] = 32'b10001110111100010000000000001010;
    instruction[14] = 32'b00000010000100010100000000110000;
    instruction[15] = 32'b10001110111100000000000000000001;
    instruction[16] = 32'b10001110111100010000000000001101;
    instruction[17] = 32'b00000010000100010100100000110000;
    instruction[18] = 32'b10001110111100000000000000000010;
    instruction[19] = 32'b10001110111100010000000000010000;
    instruction[20] = 32'b00000010000100010101000000110000;
    instruction[21] = 32'b00000001000010010101100000100000;
    instruction[22] = 32'b00000001010010110110000000100000;
    instruction[23] = 32'b10101110111011000000000000110011;
//end
    instruction[24] = 32'b10001110111100000000000000000000;
    instruction[25] = 32'b10001110111100010000000000001011;
    instruction[26] = 32'b00000010000100010100000000110000;
    instruction[27] = 32'b10001110111100000000000000000001;
    instruction[28] = 32'b10001110111100010000000000001110;
    instruction[29] = 32'b00000010000100010100100000110000;
    instruction[30] = 32'b10001110111100000000000000000010;
    instruction[31] = 32'b10001110111100010000000000010001;
    instruction[32] = 32'b00000010000100010101000000110000;
    instruction[33] = 32'b00000001000010010101100000100000;
    instruction[34] = 32'b00000001010010110110000000100000;
    instruction[35] = 32'b10101110111011000000000000110100;
//end
    instruction[36] = 32'b10001110111100000000000000000011;
    instruction[37] = 32'b10001110111100010000000000001001;
    instruction[38] = 32'b00000010000100010100000000110000;
    instruction[39] = 32'b10001110111100000000000000000100;
    instruction[40] = 32'b10001110111100010000000000001100;
    instruction[41] = 32'b00000010000100010100100000110000;
    instruction[42] = 32'b10001110111100000000000000000101;
    instruction[43] = 32'b10001110111100010000000000001111;
    instruction[44] = 32'b00000010000100010101000000110000;
    instruction[45] = 32'b00000001000010010101100000100000;
    instruction[46] = 32'b00000001010010110110000000100000;
    instruction[47] = 32'b10101110111011000000000000110101;
//end
    instruction[48] = 32'b10001110111100000000000000000011;
    instruction[49] = 32'b10001110111100010000000000001010;
    instruction[50] = 32'b00000010000100010100000000110000;
    instruction[51] = 32'b10001110111100000000000000000100;
    instruction[52] = 32'b10001110111100010000000000001101;
    instruction[53] = 32'b00000010000100010100100000110000;
    instruction[54] = 32'b10001110111100000000000000000101;
    instruction[55] = 32'b10001110111100010000000000010000;
    instruction[56] = 32'b00000010000100010101000000110000;
    instruction[57] = 32'b00000001000010010101100000100000;
    instruction[58] = 32'b00000001010010110110000000100000;
    instruction[59] = 32'b10101110111011000000000000110110;
//end
    instruction[60] = 32'b10001110111100000000000000000011;
    instruction[61] = 32'b10001110111100010000000000001011;
    instruction[62] = 32'b00000010000100010100000000110000;
    instruction[63] = 32'b10001110111100000000000000000100;
    instruction[64] = 32'b10001110111100010000000000001110;
    instruction[65] = 32'b00000010000100010100100000110000;
    instruction[66] = 32'b10001110111100000000000000000101;
    instruction[67] = 32'b10001110111100010000000000010001;
    instruction[68] = 32'b00000010000100010101000000110000;
    instruction[69] = 32'b00000001000010010101100000100000;
    instruction[70] = 32'b00000001010010110110000000100000;
    instruction[71] = 32'b10101110111011000000000000110111;
//end
    instruction[72] = 32'b10001110111100000000000000000110;
    instruction[73] = 32'b10001110111100010000000000001001;
    instruction[74] = 32'b00000010000100010100000000110000;
    instruction[75] = 32'b10001110111100000000000000000111;
    instruction[76] = 32'b10001110111100010000000000001100;
    instruction[77] = 32'b00000010000100010100100000110000;
    instruction[78] = 32'b10001110111100000000000000001000;
    instruction[79] = 32'b10001110111100010000000000001111;
    instruction[80] = 32'b00000010000100010101000000110000;
    instruction[81] = 32'b00000001000010010101100000100000;
    instruction[82] = 32'b00000001010010110110000000100000;
    instruction[83] = 32'b10101110111011000000000000111000;
//end
    instruction[84] = 32'b10001110111100000000000000000110;
    instruction[85] = 32'b10001110111100010000000000001010;
    instruction[86] = 32'b00000010000100010100000000110000;
    instruction[87] = 32'b10001110111100000000000000000111;
    instruction[88] = 32'b10001110111100010000000000001101;
    instruction[89] = 32'b00000010000100010100100000110000;
    instruction[90] = 32'b10001110111100000000000000001000;
    instruction[91] = 32'b10001110111100010000000000010000;
    instruction[92] = 32'b00000010000100010101000000110000;
    instruction[93] = 32'b00000001000010010101100000100000;
    instruction[94] = 32'b00000001010010110110000000100000;
    instruction[95] = 32'b10101110111011000000000000111001;
//end
    instruction[96] = 32'b10001110111100000000000000000110;
    instruction[97] = 32'b10001110111100010000000000001011;
    instruction[98] = 32'b00000010000100010100000000110000;
    instruction[99] = 32'b10001110111100000000000000000111;
    instruction[100] = 32'b10001110111100010000000000001110;
    instruction[101] = 32'b00000010000100010100100000110000;
    instruction[102] = 32'b10001110111100000000000000001000;
    instruction[103] = 32'b10001110111100010000000000010001;
    instruction[104] = 32'b00000010000100010101000000110000;
    instruction[105] = 32'b00000001000010010101100000100000;
    instruction[106] = 32'b00000001010010110110000000100000;
    instruction[107] = 32'b10101110111011000000000000111010;

//instruction for file_handling
    instruction[108] = 32'b11111111111111111111111111111111;

end

always@(posedge clk)
  begin
    num = PC;
    output_instruction = instruction[num];  //Here we are assigning the instruction present in the memory.
  end


endmodule