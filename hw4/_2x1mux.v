module _2x1mux(res2x1, I1, I0, S);
input I0,I1,S;
output res2x1;
wire w1,w2,w3;

not one(w1,S);
and two(w2,w1,I0);
and three(w3,S,I1);
or four(res2x1,w2,w3);

endmodule