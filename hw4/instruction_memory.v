module instruction_memory(instruction,read_adress,clock);

output reg[31:0] instruction; // bu outputumuz
input [31:0] read_adress; // bu pc counterdan gelicek
reg[31:0] memory [31:0];
input clock;

initial begin
	$readmemb("instruction_memory.mem", memory);	// dosya okunuyor
end
	always @(negedge clock) begin
		instruction = memory[read_adress]; // adrese göre instruction outputa gönderiliyor
	end
endmodule
