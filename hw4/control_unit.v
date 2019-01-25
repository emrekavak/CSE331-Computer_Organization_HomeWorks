module control_unit(select_bits_ALU, function_code);

input [5:0] function_code;
output [2:0] select_bits_ALU;
wire w1,w2,w3,w4,w11,w13;

xnor xn1(w1,function_code[2],function_code[5]);
or or1(w4, function_code[1],function_code[0]);
and and1(select_bits_ALU[0], w1,w4); 	// select 0

xnor xn2(select_bits_ALU[1], function_code[2],function_code[1]); // select1

not n11(w2,function_code[1]);
not not1(w13,function_code[0]);
xor xor2(w3, function_code[5],w2);
and an3(w11,w13,function_code[1]);
or or4(select_bits_ALU[2],w3,w11); //select 2


endmodule