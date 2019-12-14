//This module generates the control signal for the alu.
//It takes aluop given by control unit and func as the input

module alucontrol(aluop,clk,func,cont);
input[1:0] aluop;
input clk;
input[5:0] func;
output reg [3:0] cont;

always@(posedge clk)
  begin
    if(aluop == 2'b00)                  //Load or Store
      cont = 4'b0010;
    else if(aluop == 2'b01)             //Beq
      cont = 4'b0011;
    else                                //R-type instruction
      begin
        if(func == 6'b100000)           //ADD
          cont = 4'b0010;
        else if(func == 6'b100010)      //SUB
          cont = 4'b0011;
        else if(func == 6'b110000)      //MULT
          cont = 4'b0111;
        else if(func == 6'b100100)      //AND
          cont = 4'b0000;
        else                            //OR
          cont = 4'b0001;
      end
  end
endmodule
