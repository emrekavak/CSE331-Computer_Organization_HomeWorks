module add(res, adress,counter);

output [31:0] res;
input [31:0] adress,counter;
wire carry_out;

_32bitadder one1(res, carry_out,adress,counter,1'b0);

endmodule