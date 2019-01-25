module pc(result,instruction,branch,jump,clock);

output reg[31:0] result;
input [31:0] instruction;
input clock,branch,jump;
reg [15:0] extend;
reg [31:0] add_one;
reg [31:0] ex;

initial begin
	 result = 32'b00000000000000000000000000000000;
	 add_one = 32'b00000000000000000000000000000001;
	 
end
	always @(posedge clock)
		begin
			result = result + add_one; // PC+1
			if (branch == 1'b1)
				begin
				ex <= $signed(instruction[15:0]); // sign extend
				result <= result + ex;
				end
			//if (jump == 1'b1)
				
		end

endmodule
