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
    output  [1:0] ALUSrc,
    output  MemRead,
    output  RegWrite,
    output  MemWrite,
    output  [1:0] DatatoReg,
    output  [1:0] NPC_sel,
	 output  PC_MUX_sel,
	 output  [1:0]compare_sel,
    output  ExtOp,
    output  [2:0] ALUCtrl,
	 output  [1:0] addr_sel//dm中的地址特殊处理
    );
		
	wire addu = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b100001);
	wire add  = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b100000);
	wire subu = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b100011);
	wire sub  = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b100010);
	wire jr   = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b001000);
	wire movz = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b001010);
	wire And  = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b100100);
	wire Xor  = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b100110);
	wire sll  = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b000000);
	wire srl  = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b000010);
	wire ori  = (Instr[`op] == 6'b001101);
	wire Or   = (Instr[`op] == 6'b000000) && (Instr[`func] == 6'b100101);
	wire addi = (Instr[`op] == 6'b001000);
	wire addiu = (Instr[`op] == 6'b001001);
	wire lui  = (Instr[`op] == 6'b001111);
	wire j    = (Instr[`op] == 6'b000010);
	wire lw   = (Instr[`op] == 6'b100011);
	wire sw   = (Instr[`op] == 6'b101011);
	wire beq  = (Instr[`op] == 6'b000100);
	wire bne  = (Instr[`op] == 6'b000101);
	wire jal  = (Instr[`op] == 6'b000011);
	wire bgezal  = (Instr[`op] == 6'b000001)&&(Instr[`rt] == 5'b10001);
	wire nop = (Instr == 0);
	
	
	assign RegDst 	 = (addu || sll || srl || add || subu || sub || Or || Xor || And || movz)? 1://rd
																										  bgezal||jal? 2://31号
																															0;//rt
														 
	assign ALUSrc   = (ori || addi || addiu || lui || lw || sw)? 1:
																	(!nop)&&sll? 2:		
																			  srl? 3:
																			       0;//1选择立即数, 0选择rt的值,2为sll处理，3为srl处理
	
	assign MemRead  = lw;
	
	assign RegWrite = (!nop)&&(addu || add || addi || addiu || subu || sub || movz || ori || Or || Xor || 
							And || lui || lw || jal || bgezal || sll || srl);
	
	assign MemWrite = sw;
	
	assign DatatoReg = lw ? 1://选择dm的值
				bgezal || jal? 2://选择pc4的值
							      0;
									
	assign NPC_sel  = (j || jal)? 1:
									  jr?	2:
									      0;
											
	assign PC_MUX_sel = beq || bne || j || jal || jr || bgezal;
	
	assign compare_sel = bne? 1:
	                  bgezal? 2:
	                          0;
	
	assign ExtOp = lw || sw || lui || addi || addiu;
	
	assign ALUCtrl = (subu || sub) ? 1:
									  movz ? 2:
				           ori || Or  ? 3:
						           lui  ? 4:
						           And  ? 5:
						           Xor  ? 6:
						                  0;
									
	assign addr_sel = 0;
	
	
endmodule