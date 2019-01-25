module orop(orout, A, B);
input [31:0] A;
input [31:0] B;
output [31:0] orout;

or o1(orout[0], A[0], B[0]);
or o2(orout[1], A[1], B[1]);
or o3(orout[2], A[2], B[2]);
or o4(orout[3], A[3], B[3]);
or o5(orout[4], A[4], B[4]);
or o6(orout[5], A[5], B[5]);
or o7(orout[6], A[6], B[6]);
or o8(orout[7], A[7], B[7]);
or o9(orout[8], A[8], B[8]);
or o10(orout[9], A[9], B[9]);
or o11(orout[10], A[10], B[10]);
or o12(orout[11], A[11], B[11]);
or o13(orout[12], A[12], B[12]);
or o14(orout[13], A[13], B[13]);
or o15(orout[14], A[14], B[14]);
or o16(orout[15], A[15], B[15]);
or o17(orout[16], A[16], B[16]);
or o18(orout[17], A[17], B[17]);
or o19(orout[18], A[18], B[18]);
or o20(orout[19], A[19], B[19]);
or o21(orout[20], A[20], B[20]);
or o22(orout[21], A[21], B[21]);
or o23(orout[22], A[22], B[22]);
or o24(orout[23], A[23], B[23]);
or o25(orout[24], A[24], B[24]);
or o26(orout[25], A[25], B[25]);
or o27(orout[26], A[26], B[26]);
or o28(orout[27], A[27], B[27]);
or o29(orout[28], A[28], B[28]);
or o30(orout[29], A[29], B[29]);
or o31(orout[30], A[30], B[30]);
or o32(orout[31], A[31], B[31]);

endmodule
