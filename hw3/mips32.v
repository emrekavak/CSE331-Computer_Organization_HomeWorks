module mips32(instruction,result);

input[31:0] instruction;
output[31:0] result;
wire[31:0] busA;
wire[31:0] busB;
wire[31:0] busD;
wire[31:0] busE;
wire[5:0] opcode;
wire[4:0] rs;
wire[4:0] rt;
wire[4:0] rd;
wire[4:0] shamt;
wire[5:0] func;
wire[2:0] select;
wire selectShamt;
wire[31:0] muxResult1,muxResult2;
wire[31:0] shamt32,sltu32;
wire and_sltu;
wire[31:0] resSltu;
wire[31:0] result2;

or or31(opcode[5],instruction[31],instruction[31]);
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

buf (shamt32[0],shamt[0]);
buf (shamt32[1],shamt[1]);
buf (shamt32[2],shamt[2]);
buf (shamt32[3],shamt[3]);
buf (shamt32[4],shamt[4]);
buf (shamt32[5],1'b0);
buf (shamt32[6],1'b0);
buf (shamt32[7],1'b0);
buf (shamt32[8],1'b0);
buf (shamt32[9],1'b0);
buf (shamt32[10],1'b0);
buf (shamt32[11],1'b0);
buf (shamt32[12],1'b0);
buf (shamt32[13],1'b0);
buf (shamt32[14],1'b0);
buf (shamt32[15],1'b0);
buf (shamt32[16],1'b0);
buf (shamt32[17],1'b0);
buf (shamt32[18],1'b0);
buf (shamt32[19],1'b0);
buf (shamt32[20],1'b0);
buf (shamt32[21],1'b0);
buf (shamt32[22],1'b0);
buf (shamt32[23],1'b0);
buf (shamt32[24],1'b0);
buf (shamt32[25],1'b0);
buf (shamt32[26],1'b0);
buf (shamt32[27],1'b0);
buf (shamt32[28],1'b0);
buf (shamt32[29],1'b0);
buf (shamt32[30],1'b0);
buf (shamt32[31],1'b0);

or shamtor(selectShamt, shamt[4],shamt[3],shamt[2],shamt[1],shamt[0]);
mips_registers A(busA, busB, result2, rs, rt, rd, 1'b0, 1'b1);
control_unit B(select,func);

_32bitmux m1(muxResult1,shamt32,busB,selectShamt); // 
_32bitmux m2(muxResult2,busB,busA,selectShamt);

alu32 C(result2,muxResult2,muxResult1,select);
and sltU(and_sltu,func[0],func[1],func[3]);

and andsltu1(resSltu[0],result2[31],result2[31]);
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

_32bitmux m3(result,resSltu,result2,and_sltu);
mips_registers D(busD, busE, result, rs, rt, rd, 1'b1, 1'b1);


// read_data_1, read_data_2, write_data, read_reg_1, read_reg_2, write_reg, signal_reg_write, clk );

//this module use just structural verilog
//Check page 17 from lecture6 slides

//Needs alu32 module(from hw2), mips_register module(completely finished from TA) and
//control unit part(you need to design) 

//mips32 has to work correctly for 10 instruction.
//alu32 design has to stay same(8:1 selection in order hw2)

//for srl instruction, you have to add 1 mux in sra module in alu32 
//(if selectbit==1(sra) use msb, if selectbit==0(srl) use 0)
//after this addition, if select bits == 101, alu32 can work both sra and srl.
//for this project sra not used. selection bit for adding mux is always 0.

//for srl,srl alu32 use A,B. 
//for srl,srl use rt and shamt. 
// A = $rt, B = shamt(need to extended with 0).
//for other instructions, 
// A = $rt, B = $rs 


endmodule