`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:12:14 11/14/2016 
// Design Name: 
// Module Name:    ctrl 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

`define op 31:26
`define rs 25:21
`define rt 20:16
`define rd 15:11
`define func 5:0

module ctrl(
    input [31:0] Instr,
    output  [1:0] RegDst,
    output  [2:0] ALUSrc,
    output  MemRead,
    output  RegWrite,
    output  MemWrite,
    output  [1:0] DatatoReg,
    output  [1:0] NPC_sel,
	 output  PC_MUX_sel,
	 output  [2:0]compare_sel,
    output  ExtOp,
    output  [3:0] ALUCtrl,
	 output  [2:0] Dmdataex,
	 output  Start, //乘除法单元中使用
	 output  [1:0] ALUOut_sel, // 乘除法单元输出与ALU输出的选择,0为ALU输出,1为hi输出,2为lo输出
	 output  [2:0] md_op, //乘除法单元的功能选择
	 output  CPO_We,
	 output  ExlClr,
	 output  [1:0] addr_sel//dm中的地址特殊处理
    );
		
	wire mfco = (Instr[`op] == 6'b010000) && (Instr[`rs] == 5'b00000);
	wire mtco = (Instr[`op] == 6'b010000) && (Instr[`rs] == 5'b00100);	
	wire eret = (Instr == 32'b01000010000000000000000000011000);
	
	wire addu = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b100001);
	wire add  = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b100000);
	wire subu = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b100011);
	wire sub  = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b100010);
	wire movz = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b001010);
	wire And  = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b100100);
	wire Xor  = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b100110);
	wire sll  = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b000000);
	wire sllv = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b000100);
	wire srl  = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b000010);
	wire srlv = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b000110);
	wire sra  = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b000011);
	wire srav = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b000111);
	wire slt  = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b101010);
	wire sltu = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b101011);
	wire Or   = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b100101);
	wire Nor  = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b100111);
	
	
	wire mult  = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b011000);
	wire multu = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b011001);
	wire div   = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b011010);
	wire divu  = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b011011);
	wire mfhi  = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b010000);
	wire mflo  = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b010010);
	wire mthi  = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b010001);
	wire mtlo  = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b010011);
	
	
	wire ori   = (Instr[`op] == 6'b001101);
	wire addi  = (Instr[`op] == 6'b001000);
	wire addiu = (Instr[`op] == 6'b001001);
	wire andi  = (Instr[`op] == 6'b001100);
	wire xori  = (Instr[`op] == 6'b001110);
	wire lui   = (Instr[`op] == 6'b001111);
	wire slti  = (Instr[`op] == 6'b001010);
	wire sltiu = (Instr[`op] == 6'b001011);
	
	
	wire j    = (Instr[`op] == 6'b000010);
	wire lw   = (Instr[`op] == 6'b100011);
	wire lb   = (Instr[`op] == 6'b100000);
	wire lbu  = (Instr[`op] == 6'b100100);
	wire lh   = (Instr[`op] == 6'b100001);
	wire lhu  = (Instr[`op] == 6'b100101);
	wire sw   = (Instr[`op] == 6'b101011);
	wire sb   = (Instr[`op] == 6'b101000);
	wire sh   = (Instr[`op] == 6'b101001);
	wire beq  = (Instr[`op] == 6'b000100);
	wire bne  = (Instr[`op] == 6'b000101);
	wire jal  = (Instr[`op] == 6'b000011);
	wire jr   = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b001000);
	wire jalr = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b001001);

	wire bgezal  = (Instr[`op] == 6'b000001)&&(Instr[`rt] == 5'b10001);
	wire bgez    = (Instr[`op] == 6'b000001)&&(Instr[`rt] == 5'b00001);
	wire bgtz    = (Instr[`op] == 6'b000111)&&(Instr[`rt] == 5'b00000);
	wire bltz    = (Instr[`op] == 6'b000001)&&(Instr[`rt] == 5'b00000);
	wire blez    = (Instr[`op] == 6'b000110)&&(Instr[`rt] == 5'b00000);

	wire nop = (Instr == 0);
	
	
	assign RegDst 	 = (mfhi || mflo || addu || sll || sllv || srl || srlv || sra || srav || slt || sltu || add || subu || sub || Or || Nor || Xor || And || movz || jalr)? 1://rd
																																							                                        bgezal||jal? 2://31号
																																											                                         0;//rt
														 
	assign ALUSrc   = (ori || addi || addiu || andi || xori || lui || slti || sltiu || lw || lb || lbu || lh || lhu || sw || sb || sh)? 1:
																																								  (!nop)&&sll? 2:		
																																											 srl? 3:
																																											 sra? 4:
																																													0;//1选择立即数, 0选择rt的值,2为sll处理，3为srl处理
	
	assign MemRead  = lw || lb || lbu || lh || lhu;
	
	assign RegWrite = (!nop)&&(addu || add || addi || addiu || andi || xori || subu || sub || movz || ori || Or || Xor || 
							           Nor|| And || lui || lw || jal || bgezal || sll || srl || slt || sltu || slti || sltiu ||
										  sllv || srlv || sra || srav || jalr || lb || lbu || lh || lhu || mfhi || mflo || mfco);
	
	assign MemWrite = sw || sb || sh;
	
	assign DatatoReg = lw || lb || lbu || lh || lhu || mfco? 1://选择dm的值
				                        bgezal || jal || jalr ? 2://选择pc4的值
							                                       0;
									
	assign NPC_sel  = (j || jal)? 1:
							jalr || jr?	2:
									eret? 3:
									      0;
											
	assign PC_MUX_sel = beq || bne || j || jal || jr || jalr || bgezal || bgtz || bgez || bltz || blez || eret;
	
	assign compare_sel = bne? 1:
	          bgezal || bgez? 2:
							  bgtz? 3:
							  bltz? 4:
							  blez? 5:
	                          0;
	
	assign ExtOp = lw || lb || lbu || lh || lhu || sw || sb || sh || lui || addi || addiu || slti || sltiu;
	
	assign ALUCtrl = (subu || sub) ? 1:
									  movz ? 2:
				           ori || Or  ? 3:
						           lui  ? 4:
						   andi || And  ? 5:
						   xori || Xor  ? 6:
									  Nor  ? 7:
						    slt || slti ? 8:
						  sltu || sltiu ? 9:
									  sllv ?10:
									  srlv ?11:
									  srav ?12:
						                  0;
	assign Dmdataex = lbu ? 1:
	                  lb  ? 2:
	                  lhu ? 3:
	                  lh  ? 4:
							      0;//lw
	                 
	assign Start = mult || multu || div || divu ;
	
	assign ALUOut_sel = mfhi ? 1:
	                    mflo ? 2:
							         0;
	assign md_op =  mult  ? 0:
						 multu ? 1:
	                  div ? 2:
						  divu ? 3:
						  mthi ? 4:
						  mtlo ? 5:
	                        6;//mult
									
	assign CPO_We = mtco;
	assign ExlClr = eret;
	assign addr_sel = 0;
	
	
endmodule