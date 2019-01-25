module xorop(xorout, A, B);
input [31:0] A;
input [31:0] B;
output [31:0] xorout;

xor xo1(xorout[0], A[0], B[0]);
xor xo2(xorout[1], A[1], B[1]);
xor xo3(xorout[2], A[2], B[2]);
xor xo4(xorout[3], A[3], B[3]);
xor xo5(xorout[4], A[4], B[4]);
xor xo6(xorout[5], A[5], B[5]);
xor xo7(xorout[6], A[6], B[6]);
xor xo8(xorout[7], A[7], B[7]);
xor xo9(xorout[8], A[8], B[8]);
xor xo0(xorout[9], A[9], B[9]);
xor xo11(xorout[10], A[10], B[10]);
xor xo12(xorout[11], A[11], B[11]);
xor xo13(xorout[12], A[12], B[12]);
xor xo14(xorout[13], A[13], B[13]);
xor xo15(xorout[14], A[14], B[14]);
xor xo16(xorout[15], A[15], B[15]);
xor xo17(xorout[16], A[16], B[16]);
xor xo18(xorout[17], A[17], B[17]);
xor xo19(xorout[18], A[18], B[18]);
xor Ao0(xorout[19], A[19], B[19]);
xor xo21(xorout[20], A[20], B[20]);
xor xo22(xorout[21], A[21], B[21]);
xor xo23(xorout[22], A[22], B[22]);
xor xo24(xorout[23], A[23], B[23]);
xor xo25(xorout[24], A[24], B[24]);
xor xo26(xorout[25], A[25], B[25]);
xor xo27(xorout[26], A[26], B[26]);
xor xo28(xorout[27], A[27], B[27]);
xor xo29(xorout[28], A[28], B[28]);
xor xo30(xorout[29], A[29], B[29]);
xor xo31(xorout[30], A[30], B[30]);
xor xo32(xorout[31], A[31], B[31]);

endmodule
