module _5x1mux(resu,inp1,inp0,select);

output [4:0] resu;
input [4:0] inp1,inp0;
input select;

_2x1mux a(resu[0],inp1[0],inp0[0],select);
_2x1mux b(resu[1],inp1[1],inp0[1],select);
_2x1mux c(resu[2],inp1[2],inp0[2],select);
_2x1mux d(resu[3],inp1[3],inp0[3],select);
_2x1mux e(resu[4],inp1[4],inp0[4],select);

endmodule