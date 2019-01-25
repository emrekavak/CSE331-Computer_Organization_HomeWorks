module _8x1mux(res8mux,I7, I6, I5, I4, I3, I2, I1, I0,S);

input [31:0] I0;
input [31:0] I1;
input [31:0] I2;
input [31:0] I3;
input [31:0] I4;
input [31:0] I5;
input [31:0] I6;
input [31:0] I7;
input [2:0] S;
output [31:0] res8mux;

wire [31:0]muxRes0;
wire [31:0]muxRes1;
wire [31:0]muxRes2;
wire [31:0]muxRes3;
wire [31:0]muxRes4;
wire [31:0]muxRes5;

_32bitmux m0(muxRes0, I1, I0,S[0]);
_32bitmux m1(muxRes1, I3,I2,S[0]);
_32bitmux m2(muxRes2, I5,I4,S[0]);
_32bitmux m3(muxRes3, I7,I6,S[0]);

_32bitmux m4(muxRes4, muxRes1,muxRes0,S[1]);
_32bitmux m5(muxRes5, muxRes3,muxRes2,S[1]);

_32bitmux m6(res8mux, muxRes5,muxRes4,S[2]);

endmodule