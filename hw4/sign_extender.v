module sign_extender(result,imm16);

output [31:0]result;
input [15:0]imm16;

	
	and(result[0],imm16[0],imm16[0]);
	and(result[1],imm16[1],imm16[1]);
	and(result[2],imm16[2],imm16[2]);
	and(result[3],imm16[3],imm16[3]);
	and(result[4],imm16[4],imm16[4]);
	and(result[5],imm16[5],imm16[5]);
	and(result[6],imm16[6],imm16[6]);
	and(result[7],imm16[7],imm16[7]);
	and(result[8],imm16[8],imm16[8]);
	and(result[9],imm16[9],imm16[9]);
	and(result[10],imm16[10],imm16[10]);
	and(result[11],imm16[11],imm16[11]);
	and(result[12],imm16[12],imm16[12]);
	and(result[13],imm16[13],imm16[13]);
	and(result[14],imm16[14],imm16[14]);
	and(result[15],imm16[15],imm16[15]);
	and(result[16],1'b0,1'b0);
	and(result[17],1'b0,1'b0);
	and(result[18],1'b0,1'b0);
	and(result[19],1'b0,1'b0);
	and(result[20],1'b0,1'b0);
	and(result[21],1'b0,1'b0);
	and(result[22],1'b0,1'b0);
	and(result[23],1'b0,1'b0);
	and(result[24],1'b0,1'b0);
	and(result[25],1'b0,1'b0);
	and(result[26],1'b0,1'b0);
	and(result[27],1'b0,1'b0);
	and(result[28],1'b0,1'b0);
	and(result[29],1'b0,1'b0);
	and(result[30],1'b0,1'b0);
	and(result[31],1'b0,1'b0);


endmodule