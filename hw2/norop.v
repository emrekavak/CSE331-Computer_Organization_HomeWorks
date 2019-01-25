module norop(norout, A, B);
input [31:0] A;
input [31:0] B;
output [31:0] norout;

nor nor0(norout[0], A[0], B[0]);
nor nor1(norout[1], A[1], B[1]);
nor nor2(norout[2], A[2], B[2]);
nor nor3(norout[3], A[3], B[3]);
nor nor4(norout[4], A[4], B[4]);
nor nor5(norout[5], A[5], B[5]);
nor nor6(norout[6], A[6], B[6]);
nor nor7(norout[7], A[7], B[7]);
nor nor8(norout[8], A[8], B[8]);
nor nor9(norout[9], A[9], B[9]);
nor nor10(norout[10], A[10], B[10]);
nor nor11(norout[11], A[11], B[11]);
nor nor12(norout[12], A[12], B[12]);
nor nor13(norout[13], A[13], B[13]);
nor nor14(norout[14], A[14], B[14]);
nor nor15(norout[15], A[15], B[15]);
nor nor16(norout[16], A[16], B[16]);
nor nor17(norout[17], A[17], B[17]);
nor nor18(norout[18], A[18], B[18]);
nor nor19(norout[19], A[19], B[19]);
nor nor20(norout[20], A[20], B[20]);
nor nor21(norout[21], A[21], B[21]);
nor nor22(norout[22], A[22], B[22]);
nor nor23(norout[23], A[23], B[23]);
nor nor24(norout[24], A[24], B[24]);
nor nor25(norout[25], A[25], B[25]);
nor nor26(norout[26], A[26], B[26]);
nor nor27(norout[27], A[27], B[27]);
nor nor28(norout[28], A[28], B[28]);
nor nor29(norout[29], A[29], B[29]);
nor nor30(norout[30], A[30], B[30]);
nor nor31(norout[31], A[31], B[31]);

endmodule
