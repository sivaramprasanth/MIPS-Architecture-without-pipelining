//This is the alu module that takes the alu control and gives the desire output.

module alu(in1,in2,clk,control,out);

input [31:0] in1,in2;
input clk;
input[3:0] control;
output reg [31:0] out;

always@(posedge clk)
  begin
    case(control)
      4'b0000 : out = (in1 & in2);   //AND
      4'b0001 : out = (in1 || in2);  //OR
      4'b0010 : out = in1 + in2;     //ADD
      4'b0011 : out = in1 - in2;     //SUB
      4'b0111 : out = in1*in2;       //MULT
      default : out  = 32'b000000;
    endcase
  end
endmodule
