module control(opcode,RegDst,Branch,MemRead,MemtoReg,Aluop,MemWrite,AluSrc,RegWrite,jump);

input [5:0] opcode;
output RegDst,Branch,MemRead,MemtoReg,MemWrite,AluSrc,RegWrite,jump;
output [2:0] Aluop;
wire[2:0]one,six,w6;
wire two,three,four,five,seven,eight,nine,ten,eleven,sixty,w1,w2,w3,w4,w5,w7,w8,n1,n2,n3,n4,n5,n6;

/// jump /// opcode[1] and not(opcode[0]);
not (w1,opcode[0]);
and (jump,opcode[1],w1);


///ALUOP
and (Aluop[2],opcode[2],opcode[3]); // 2. bit icin 

xnor(ten,opcode[2],opcode[3]); // 1. bit icin ; (opcode[2]xnor opcode[3]) and ( and ( (not opcıde[1]) and (not opcode[0]))
not (two,opcode[0]);
not (sixty,opcode[1]);
and(w7,sixty,ten);
and(Aluop[1],ten,w7);

not (w2, opcode[3]); //0. bit icin ; (not opcode[3] and (opcode[2]);
and (Aluop[0],w2,opcode[2]); // 0.bit icin
///ALUOP end

///RegWrite /// ( opcode[5] xor opcode[3] ) or ( and(not(opcode[3:1])) 
xor (w3, opcode[5], opcode[3]);
not(n1,opcode[1]);
not(n2,opcode[2]);
not(n3,opcode[3]);
and (three, n1,n2,n3);
or(RegWrite,w3,three);
///RegWrite end


///Regdst /// and((not(opcode[2:0]));
not(n4,opcode[0]);
not(n5,opcode[1]);
not(n6,opcode[2]);
and(RegDst,n4,n5,n6);
/// Regdst end

///ALUSrc /// opcode[0] or opcode[3]

not(seven,opcode[3]);
and(AluSrc,seven,opcode[2]);
/// ALUSrc end

///Branch /// opcode[2] and not(opcode[3])

not(eight,opcode[3]);
and(Branch,eight,opcode[2]);
///Branch end

/// MemWrite //opcode[5] and opcode[3]
and(MemWrite,opcode[5],opcode[3]);

/// MemRead // opcode[0]. not(opcode[3])

not(w4, opcode[3]);
and(MemRead, w4,opcode[0]);

/// MemtoReg // pcode[5] and not(opcode[3])
not(w5, opcode[3]);
and(MemtoReg, w5,opcode[5]);
endmodule