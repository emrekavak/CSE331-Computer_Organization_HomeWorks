`define DELAY 10

module mips32_testbench();

reg [31:0] instruction_set;
wire[31:0] result;

mips32 testt(instruction_set,result);
initial begin

instruction_set = 32'b00000000100001010011000000100000;  
#`DELAY;
instruction_set = 32'b00000000110001110100000000100001; 
#`DELAY;
instruction_set = 32'b00000000111010000100100000100010; 
#`DELAY;

instruction_set = 32'b00000001001010000101000000100011; 
#`DELAY;


instruction_set = 32'b00000001001010000101100000100100;  
#`DELAY;


instruction_set = 32'b00000001001010000110000000100101; 
#`DELAY;

instruction_set = 32'b00000001001010000110100000100111; 
#`DELAY;


instruction_set = 32'b00000000000010010111000001000000;  
#`DELAY;


instruction_set = 32'b00000000000010010111100011000010; 
#`DELAY;


instruction_set = 32'b00000001110011111000000000101011;
#`DELAY;

end

initial
begin
$monitor("opcode = %6b | rs = %5b | rt = %5b | rd = %5b | shampt = %5b | func = %6b\n New rd =%32b \n",instruction_set[31:26],
	instruction_set[25:21],instruction_set[20:16],instruction_set[15:11],instruction_set[10:6],instruction_set[5:0],result);
end


endmodule