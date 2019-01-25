module alu_control(select_bits_ALU, function_code,Aluop);

input [5:0] function_code;
input [2:0] Aluop;
output [2:0] select_bits_ALU;
wire x1,w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w11,w13,w14,w15,w16,w17,w18,w10,n1,n2,n3,n4,n5,n6,n7,n8,n9,n10;

// select_bits_ALU 2. bit icin
not (w0,Aluop[1]);
and (x1,w0,Aluop[0]);



//nor (x1,w0,Aluop[1]);
//not(n2,function_code[1]);
//xnor(n3,function_code[5],n2);
//not (n4,function_code[0]);
//and(n5,n4,function_code[1]);
//or (select_bits_ALU[2],n3,n5);
not (n1,function_code[0]);
not (n2,function_code[1]);
not (n3,function_code[2]);
not (n4,function_code[3]);
not (n5,function_code[4]);
not (n10,function_code[5]);
and (w3,n1,n2,n3,n4,n5,n10);
or(select_bits_ALU[2],x1,w3,function_code[1]);

// select_bits_ALU 1. bit icin
not (n6,Aluop[0]);
not (n7,Aluop[1]);
not (n8,Aluop[2]);

and (w18,n6,n7,n8);
xnor (w4,function_code[1],function_code[2]);
or (select_bits_ALU[1],w18,w4);

// select_bits_ALU 0. bit icin
not(w5,Aluop[0]);
not(w6,Aluop[1]);
//and(w7,w5,w6);
and(w8,w5,w6,Aluop[2]);

xnor(w14,function_code[2],function_code[5]);
or (w15,function_code[1],function_code[0]);
and(w16,w14,w15);
or(select_bits_ALU[0],w8,w16);

endmodule