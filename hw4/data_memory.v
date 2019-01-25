module data_memory(read_data,adress,write_data,mem_write,clock);

output reg [31:0] read_data; // memory outputu
input [31:0] adress; // alu da olusan output
input [31:0] write_data; // register outputu olan rt
input mem_write,clock; // controlden çıkan sinyal

reg [31:0] data_mem [31:0];

initial begin
	$readmemb("data_memory.mem", data_mem);	// dosya okunuyor
end
always @(negedge clock)
		begin
			if (mem_write == 1'b1) 
				data_mem[adress] = write_data;
			if (mem_write == 1'b0) 
				read_data = data_mem[adress];
		end
endmodule
