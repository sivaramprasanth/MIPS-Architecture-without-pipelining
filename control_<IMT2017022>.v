//This is the main module where we are creating the control bits and calling the modules.

module main(PC,clk,out);
  input [31:0] PC;
  input clk;
  output [31:0] out;
  reg k = 0;
  reg [8:0] main_control;
  wire [5:0] in;
  wire [3:0] control;
  wire [31:0] inp;

//This is the control bits that the control unit is generating.

  /*main_control[0] = regdest
    main_control[1] = Branch equal
    main_control[2] = Mem read
    main_control[3] = Mem to reg
    main_control[4] = ALuop[0]
    main_control[5] = ALuop[1]
    main_control[6] = Memwrite
    main_control[7] = Alusrc
    main_control[8] = Reg write*/

instructionset k1(PC,clk,inp);    //Loading the instruction from instruction set.
assign in = inp[31:26];           //Opcode to get the control bits.

always@(posedge clk) begin
    main_control[0] = (~in[0])&(~in[1])&(~in[2])&(~in[3])&(~in[4])&(~in[5]);
    main_control[1] = (~in[0])&(~in[1])&(in[2])&(~in[3])&(~in[4])&(~in[5]);
    main_control[2] = (in[0])&(in[1])&(~in[2])&(~in[3])&(~in[4])&(in[5]);
    main_control[3] = (in[0])&(in[1])&(~in[2])&(~in[3])&(~in[4])&(in[5]);
    main_control[4] = (~in[0])&(~in[1])&(in[2])&(~in[3])&(~in[4])&(~in[5]);
    main_control[5] = (~in[0])&(~in[1])&(~in[2])&(~in[3])&(~in[4])&(~in[5]);
    main_control[6] = (in[0])&(in[1])&(~in[2])&(in[3])&(~in[4])&(in[5]);
    main_control[7] = (in[0])&(in[1])&(~in[2])&(~in[3])&(~in[4])&(in[5]) || (in[0])&(in[1])&(~in[2])&(in[3])&(~in[4])&(in[5]);
    main_control[8] = ((~in[0])&(~in[1])&(~in[2])&(~in[3])&(~in[4])&(~in[5]) || (in[0])&(in[1])&(~in[2])&(~in[3])&(~in[4])&(in[5]));
    k = 1;
    end

alucontrol m0(main_control[5:4],clk,inp[5:0],control);  //Here we are calling the alucontrol module whch generates the control for ALU.
register u0(inp,clk,main_control,control,out);          //This is to get the data from the register.
endmodule
