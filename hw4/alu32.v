module alu32(resAlu32, a, b, S);

input [31:0] b;
input [31:0] a;
input [2:0]S;
output [31:0]resAlu32;

wire [31:0]rest0;
wire [31:0]rest1;
wire [31:0]rest2;
wire [31:0]rest3;
wire [31:0]rest4;
wire [31:0]rest5;
wire [31:0]rest6;
wire [31:0]rest7;
wire carry_out;

andop _0(rest0,a,b);
orop  _1(rest1,a,b);
_32bitadder _2(rest2,carry_out,a ,b,1'b0);

_32bitsubtraction _4(rest4,carry_out,a,b,1'b0);
_32bitRight_shifter _5 (rest5,a,b);
_32bitLeft_shifter _6 (rest6,a,b);
norop _7(rest7,a,b);

_8x1mux mux(resAlu32,rest7,rest6,rest5,rest4,rest3,rest2,rest1,rest0,S);

endmodule
 