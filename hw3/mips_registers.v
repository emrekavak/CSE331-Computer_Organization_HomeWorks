module mips_registers
( read_data_1, read_data_2, write_data, read_reg_1, read_reg_2, write_reg, signal_reg_write, clk );

	output reg[31:0] read_data_1, read_data_2;
	input[31:0] write_data;
	input[4:0] read_reg_1, read_reg_2, write_reg;
	input signal_reg_write, clk;
	reg[31:0] registers [31:0];
	
	always @(*)
		begin
			//#`DELAY;
			$readmemb("registers.mem", registers);		
			read_data_1 = registers[read_reg_1];
			read_data_2 = registers[read_reg_2];
			
			if (signal_reg_write == 1'b1 ) 
				begin
					if (write_reg != 32'b00000000000000000000000000000000)
						registers[write_reg] = write_data;
				$writememb("registers.mem", registers);
				end
	end
	//this module use behavioral verilog
	//Complete the work of the module using the following.
	//Check register module from datapath
	
	//register is one of a small set of data holding places.
	//holding place = file = modelsim/register.mem 
	//for memory file read & write using followings
	//$writememb("registers.mem", registers);
	
	//assign data = registers[adress];
	//data <= registers[adress];,
	//learn clock usage
	
endmodule