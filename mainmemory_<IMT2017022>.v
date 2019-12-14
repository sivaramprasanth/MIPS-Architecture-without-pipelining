//This is the main memory ahere the data is stored.
//It takes the address from the alu and store or load according to the instruction opcode.

module mainmemory(address,clk,mem_read,mem_write,input_data,f_write,data);
input f_write;
integer f;
input [31:0] address,input_data;
input clk;
input [0:0] mem_read,mem_write;
output reg [31:0] data;
integer adr = 0;
reg [31:0] memory[100:0];

initial begin
     memory[0] =  32'b1001;
     memory[1] =  32'b1001;
     memory[2] =  32'b1001;
     memory[3] =  32'b1001;
     memory[4] =  32'b1001;
     memory[5] =  32'b1001;
     memory[6] =  32'b1001;
     memory[7] =  32'b1001;
     memory[8] =  32'b1001;
     memory[9] =  32'b1001;
     memory[10] =  32'b1001;
     memory[11] =  32'b1001;
     memory[12] =  32'b1001;
     memory[13] =  32'b1001;
     memory[14] =  32'b1001;
     memory[15] =  32'b1001;
     memory[16] =  32'b1001;
     memory[17] =  32'b1001;
     memory[18] =  32'b1001;
     memory[19] =  32'b1110;
     memory[20] =  32'b1111;
     memory[21] =  32'b1011;
end

always@(posedge clk) begin
    adr = address;
    if(mem_read == 1)        //Checking whether to store or load.
      data = memory[adr];
    else if(mem_write == 1)
    begin
      memory[adr] = input_data;
    end
  end

//Here we are doing the file handling.

always @ (posedge clk) begin
  if(f_write==1)
  begin
    f = $fopen("output_<IMT2017022>.txt","w");
    $fwrite(f,"%0d ", memory[50]);
    $fwrite(f,"%0d ", memory[51]);
    $fwrite(f,"%0d\n", memory[52]);
    $fwrite(f,"%0d ", memory[53]);
    $fwrite(f,"%0d ", memory[54]);
    $fwrite(f,"%0d\n", memory[55]);
    $fwrite(f,"%0d ", memory[56]);
    $fwrite(f,"%0d ", memory[57]);
    $fwrite(f,"%0d\n", memory[58]);
    $fclose(f);

  end
end
endmodule
