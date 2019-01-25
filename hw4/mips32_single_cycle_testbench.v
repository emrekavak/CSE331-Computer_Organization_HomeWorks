module mips32_single_cycle_testbench();

reg clocklong;
reg clockshort;
reg [7:0]index;

mips32_single_cycle test(clockshort,clocklong);

initial	clocklong =0;
initial	clockshort =0;
initial begin 
	index = -1;
end

	always begin 
		#30 clocklong = ~clocklong;
		end
	always begin
		#10 clockshort = ~clockshort;
		end
		
	always @(posedge clocklong) 
	begin
		if (index == 8'd15)
		begin
			$stop;
		end
	end
	
	always @(negedge clocklong)
	begin
		index = index+1;
	end
endmodule

