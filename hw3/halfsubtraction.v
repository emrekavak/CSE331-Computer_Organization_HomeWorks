module halfsubtraction(ressub,B0,A,B);
input A,B;
output ressub,B0;
wire A1;

xor resof(ressub,A,B);
not resNot(A1,A);
and resEnd(B0,A1,B);

endmodule