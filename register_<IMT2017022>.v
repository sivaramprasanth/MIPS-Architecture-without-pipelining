//This is the register module which has 14 registers.
//s0 - s7
//t0 - t7 These are the temporary registers.

module register(inp,clk,ctrlunit,ctrl,out);

input [31:0]inp;
input [3:0] ctrl;
input clk;
input [8:0]ctrlunit;  //Ths will contain the control bits for instruction operations.
wire [31:0] temp;
output reg [31:0] out;
reg [31:0]reg_out1;
reg [31:0]reg_out2,reg_x;
reg f_write = 1'b0;

reg [31:0] s0 = 32'b0;
reg [31:0] s1 = 32'b0;
reg [31:0] s2 = 32'b0;
reg [31:0] s3 = 32'b0;
reg [31:0] s4 = 32'b0;
reg [31:0] s5 = 32'b0;
reg [31:0] s6 = 32'b0;
reg [31:0] s7 = 32'b0;

reg [31:0] t0 = 32'b0;
reg [31:0] t1 = 32'b0;
reg [31:0] t2 = 32'b0;
reg [31:0] t3 = 32'b0;
reg [31:0] t4 = 32'b0;
reg [31:0] t5 = 32'b0;
reg [31:0] t6 = 32'b0;
reg [31:0] t7 = 32'b0;

always @ (posedge clk) begin
  if(inp[31:26]==6'b111111) f_write = 1'b1;  //This is for the file handling.
end

//Checking the register and assigning the respected values as inputs.
always@(posedge clk)
  begin
      if(inp[25:21] == 5'b10000)reg_out1 = s0;
      if(inp[25:21] == 5'b10001)reg_out1 = s1;
      if(inp[25:21] == 5'b10010)reg_out1 = s2;
      if(inp[25:21] == 5'b10011)reg_out1 = s3;
      if(inp[25:21] == 5'b10100)reg_out1 = s4;
      if(inp[25:21] == 5'b10101)reg_out1 = s5;
      if(inp[25:21] == 5'b10110)reg_out1 = s6;
      if(inp[25:21] == 5'b10111)reg_out1 = s7;
      if(inp[25:21] == 5'b01000)reg_out1 = t0;
      if(inp[25:21] == 5'b01001)reg_out1 = t1;
      if(inp[25:21] == 5'b01010)reg_out1 = t2;
      if(inp[25:21] == 5'b01011)reg_out1 = t3;
      if(inp[25:21] == 5'b01100)reg_out1 = t4;
      if(inp[25:21] == 5'b01101)reg_out1 = t5;
      if(inp[25:21] == 5'b01110)reg_out1 = t6;
      if(inp[25:21] == 5'b01111)reg_out1 = t7;

      if(inp[20:16] == 5'b10000)reg_out2 = s0;
      if(inp[20:16] == 5'b10001)reg_out2 = s1;
      if(inp[20:16] == 5'b10010)reg_out2 = s2;
      if(inp[20:16] == 5'b10011)reg_out2 = s3;
      if(inp[20:16] == 5'b10100)reg_out2 = s4;
      if(inp[20:16] == 5'b10101)reg_out2 = s5;
      if(inp[20:16] == 5'b10110)reg_out2 = s6;
      if(inp[20:16] == 5'b10111)reg_out2 = s7;
      if(inp[20:16] == 5'b01000)reg_out2 = t0;
      if(inp[20:16] == 5'b01001)reg_out2 = t1;
      if(inp[20:16] == 5'b01010)reg_out2 = t2;
      if(inp[20:16] == 5'b01011)reg_out2 = t3;
      if(inp[20:16] == 5'b01100)reg_out2 = t4;
      if(inp[20:16] == 5'b01101)reg_out2 = t5;
      if(inp[20:16] == 5'b01110)reg_out2 = t6;
      if(inp[20:16] == 5'b01111)reg_out2 = t7;
  end

assign temp = reg_out2;
wire [31:0]alu_output,mem_out;

// in1 is from reg and in2 is from signed extension of input[16:0] for load and store instructions.

//Mux between registers and ALU which selects the second input gither from register or instruction depending on the opcode.
always@(posedge clk) begin
  case (ctrlunit[7])                        //ctrlunit[7:7] is the ALUSRC control bit to select the input.
    1'b0:reg_x = reg_out2;
    1'b1:reg_x = inp[15:0];
    default:reg_x = reg_out2 ;
    endcase
  end

alu u1(reg_out1,reg_x,clk,ctrl,alu_output);
mainmemory m1(alu_output,clk,ctrlunit[2],ctrlunit[6],temp,f_write,mem_out);

//Mux between the ALU and main memory.
always @ (posedge clk ) begin
  case (ctrlunit[3])
    1'b0:out = alu_output;
    1'b1:out = mem_out;
    default:out = out;
  endcase
end

reg [4:0] reg_dst;
always @ (posedge clk ) begin
  case (ctrlunit[0])
    1'b0:reg_dst = inp[20:16];
    1'b1:reg_dst = inp[15:11];
    default:reg_dst = inp[15:11];
  endcase
end


always @ (posedge clk) begin
  if(ctrlunit[8]==1)
  begin
  if(reg_dst == 5'b10000)s0 = out;
  if(reg_dst == 5'b10001)s1 = out;
  if(reg_dst == 5'b10010)s2 = out;
  if(reg_dst == 5'b10011)s3 = out;
  if(reg_dst == 5'b10100)s4 = out;
  if(reg_dst == 5'b10101)s5 = out;
  if(reg_dst == 5'b10110)s6 = out;
  if(reg_dst == 5'b10111)s7 = out;
  if(reg_dst == 5'b01000)t0 = out;
  if(reg_dst == 5'b01001)t1 = out;
  if(reg_dst == 5'b01010)t2 = out;
  if(reg_dst == 5'b01011)t3 = out;
  if(reg_dst == 5'b01100)t4 = out;
  if(reg_dst == 5'b01101)t5 = out;
  if(reg_dst == 5'b01110)t6 = out;
  if(reg_dst == 5'b01111)t7 = out;
  end
end

endmodule
