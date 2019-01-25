module mips32_single_cycle(clocksort,clocklong);

input clocksort,clocklong;
wire [31:0]instruction,AluResult,PcResult;
wire branch,jump,RegDst,MemRead,MemtoReg,MemWrite,AluSrc,RegWrite;
wire[5:0] opcode;
wire[4:0] rs;
wire[4:0] rt;
wire[4:0] rd;
wire[4:0] shamt;
wire[5:0] func;
wire [15:0] imm16;
wire[31:0] extended;
wire[31:0] busA;
wire[31:0] busB;
wire[31:0] busE;
wire[31:0] busD;
wire selectShamt;
wire[31:0] muxResult1,muxResult2,Aluresult;
wire [2:0] Aluop;
wire[31:0] resSltu;
wire[31:0] result2;
wire [31:0] result;
wire and_sltu;
wire [31:0] memoutput,lastRes;
wire[2:0] select;
wire[4:0] rdres;

pc one(PcResult, instruction,branch,jump,clocklong);  // ilk olarak pc cagrıldı ve adres hesabı yapıldı
instruction_memory inst_mem(instruction,PcResult,clocklong); // pc den alınan adres gönderıldi ve inst. alındı

or or31(opcode[5],instruction[31],instruction[31]); // bu kısımda inst. fieldlere ayrılıyor. 
or or30(opcode[4],instruction[30],instruction[30]);
or or29(opcode[3],instruction[29],instruction[29]);
or or28(opcode[2],instruction[28],instruction[28]);
or or27(opcode[1],instruction[27],instruction[27]);
or or26(opcode[0],instruction[26],instruction[26]);

or or25(rs[4],instruction[25],instruction[25]);
or or24(rs[3],instruction[24],instruction[24]);
or or23(rs[2],instruction[23],instruction[23]);
or or22(rs[1],instruction[22],instruction[22]);
or or21(rs[0],instruction[21],instruction[21]);

or or20(rt[4],instruction[20],instruction[20]);
or or19(rt[3],instruction[19],instruction[19]);
or or18(rt[2],instruction[18],instruction[18]);
or or17(rt[1],instruction[17],instruction[17]);
or or16(rt[0],instruction[16],instruction[16]);

or or15(rd[4],instruction[15],instruction[15]);
or or14(rd[3],instruction[14],instruction[14]);
or or13(rd[2],instruction[13],instruction[13]);
or or12(rd[1],instruction[12],instruction[12]);
or or11(rd[0],instruction[11],instruction[11]);

or or10(shamt[4],instruction[10],instruction[10]);
or or9(shamt[3],instruction[9],instruction[9]);
or or8(shamt[2],instruction[8],instruction[8]);
or or7(shamt[1],instruction[7],instruction[7]);
or or6(shamt[0],instruction[6],instruction[6]);

or or5(func[5],instruction[5],instruction[5]);
or or4(func[4],instruction[4],instruction[4]);
or or3(func[3],instruction[3],instruction[3]);
or or2(func[2],instruction[2],instruction[2]);
or or1(func[1],instruction[1],instruction[1]);
or or0(func[0],instruction[0],instruction[0]);

/// imm16 icin
or o15(imm16[15],instruction[15],instruction[15]);
or o14(imm16[14],instruction[14],instruction[14]);
or o13(imm16[13],instruction[13],instruction[13]);
or o12(imm16[12],instruction[12],instruction[12]);
or o11(imm16[11],instruction[11],instruction[11]);

or o10(imm16[10],instruction[10],instruction[10]);
or o9(imm16[9],instruction[9],instruction[9]);
or o8(imm16[8],instruction[8],instruction[8]);
or o7(imm16[7],instruction[7],instruction[7]);
or o6(imm16[6],instruction[6],instruction[6]);

or o5(imm16[5],instruction[5],instruction[5]);
or o4(imm16[4],instruction[4],instruction[4]);
or o3(imm16[3],instruction[3],instruction[3]);
or o2(imm16[2],instruction[2],instruction[2]);
or o1(imm16[1],instruction[1],instruction[1]);
or o0(imm16[0],instruction[0],instruction[0]);

sign_extender sig_ex(extended,imm16); // sign exten
or shamtor(selectShamt, shamt[4],shamt[3],shamt[2],shamt[1],shamt[0]); // 
control ctrl(opcode,RegDst,branch,MemRead,MemtoReg,Aluop,MemWrite,AluSrc,RegWrite,jump); // jumpu tasarlıcaz;
_5x1mux _2x1m(rdres,rd,rs,RegDst); // select write reg
mips_registers A(busA, busB, result2, rs, rt, rdres, 1'b0,clocksort);
alu_control B(select,func,Aluop);
initial begin
$monitor("opcode = %6b | rs = %5b | rt = %5b | rd = %5b | shampt = %5b | func = %6b\n",instruction[31:26],
	instruction[25:21],instruction[20:16],instruction[15:11],instruction[10:6],instruction[5:0]);
//$monitor("rs = %32b rt = %32b", busA,busB);
//$monitor("aluop = %3b", select);
end

_32bitmux m1(muxResult1,extended,busB,selectShamt); // // rt mi signextend mi secilcek mux
_32bitmux m2(muxResult2,busB,busA,selectShamt); // rt icin singextend yapmısım
alu32 a32(result2,muxResult2,muxResult1,select);

initial begin
$monitor("opcode = %6b | rs = %5b | rt = %5b | rd = %5b | shampt = %5b | func = %6b\n | Result = %32b",instruction[31:26],
	instruction[25:21],instruction[20:16],instruction[15:11],instruction[10:6],instruction[5:0],result2);
//$monitor("rs = %32b rt = %32b", busA,busB);
//$monitor("aluop = %3b", select);
end


and sltU(and_sltu,func[0],func[1],func[3]); // sltu mux icin secme biti
and andsltu1(resSltu[0],result2[31],result2[31]); // ilk biti ms bitin aynısı olması gerek
xor andsltu2(resSltu[1],result2[31],result2[31]);
xor andsltu3(resSltu[2],result2[31],result2[31]);
xor andsltu4(resSltu[3],result2[31],result2[31]);
xor andsltu5(resSltu[4],result2[31],result2[31]);
xor andsltu6(resSltu[5],result2[31],result2[31]);
xor andsltu7(resSltu[6],result2[31],result2[31]);
xor andsltu8(resSltu[7],result2[31],result2[31]);

xor andsltu9(resSltu[8],result2[31],result2[31]);
xor andsltu10(resSltu[9],result2[31],result2[31]);
xor andsltu11(resSltu[10],result2[31],result2[31]);
xor andsltu12(resSltu[11],result2[31],result2[31]);
xor andsltu13(resSltu[12],result2[31],result2[31]);
xor andsltu14(resSltu[13],result2[31],result2[31]);
xor andsltu15(resSltu[14],result2[31],result2[31]);
xor andsltu16(resSltu[15],result2[31],result2[31]);

xor andsltu17(resSltu[16],result2[31],result2[31]);
xor andsltu18(resSltu[17],result2[31],result2[31]);
xor andsltu19(resSltu[18],result2[31],result2[31]);
xor andsltu20(resSltu[19],result2[31],result2[31]);
xor andsltu21(resSltu[20],result2[31],result2[31]);
xor andsltu22(resSltu[21],result2[31],result2[31]);
xor andsltu23(resSltu[22],result2[31],result2[31]);
xor andsltu24(resSltu[23],result2[31],result2[31]);

xor andsltu25(resSltu[24],result2[31],result2[31]);
xor andsltu26(resSltu[25],result2[31],result2[31]);
xor andsltu27(resSltu[26],result2[31],result2[31]);
xor andsltu28(resSltu[27],result2[31],result2[31]);
xor andsltu29(resSltu[28],result2[31],result2[31]);
xor andsltu30(resSltu[29],result2[31],result2[31]);
xor andsltu31(resSltu[30],result2[31],result2[31]);
xor andsltu32(resSltu[31],result2[31],result2[31]);

_32bitmux m3(result,resSltu,result2,and_sltu); // write data icin, bunun sonucnu data memorye göndericem,
data_memory dm(memoutput,result,busB,MemWrite,clocksort);
_32bitmux m4(lastRes,memoutput,result,MemtoReg);


mips_registers D(busD, busE, lastRes, rs, rt, rdres, RegWrite, clocksort);


endmodule
