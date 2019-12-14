//This is to test the code and to get the output.

module main_tb;
  reg [31:0] PC;
  reg clk;
  wire [31:0] out;

  main uut(
    .PC(PC),
    .out(out),
    .clk(clk)
    );

  initial begin
    $dumpfile("main_out_<IMT2017022>.vcd");
    $dumpvars(0,main_tb);
    clk = 1;
    PC = 32'b0;
    end

//Increasing the PC number for every 30 clock cycles.
always
  #30 PC += 32'b1;


//Here we are defining the clock.

  always
  #0.5 clk = ~clk;
  initial #3270 $stop;
endmodule
