`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:23:36 11/13/2016 
// Design Name: 
// Module Name:    mips 
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
`include "ctrl.v"
`include "dm.v"
`include "extend.v"
`include "alu.v"
`include "gpr.v"
`include "im.v"
`include "npc.v"
`include "pc.v"
`include "MUX.v"
`include "sign_compare.v"


module mips(
    input clk,
    input reset
    );
	 
	 wire [31:0] old_PC;
	 wire [31:0] new_PC;
	 wire [31:0] PC_to_Reg;
	 wire beq_zero;
	 wire [1:0]  PC_sel;
	 wire [31:0] Instrl;
	
	 wire ExtOp;
	 wire [31:0] ext_out;
	 
	 wire [1:0]  Data_to_Reg_sel;//д��Ĵ������ݵ�ѡ���ź�
	 wire [31:0] Data_to_Reg;//д��Ĵ����ѵ�����
	 wire [1:0]  RegDst;//д��Ĵ�����ַ��ѡ���ź�
	 wire [4:0]  Reg_rd;//д��Ĵ�����ַ
	 wire RegWrite;
	 wire [31:0] grf_out_A;
	 wire [31:0] grf_out_B;
	 
	 wire ALUSrc;//ALU�ĵڶ�������ѡ���ź�
	 wire [31:0] ALUSrc_out;//ALU�ĵڶ�����������
	 wire [2:0]  ALUCtr;
	 wire [31:0] ALU_out;
	 
	 wire [1:0] dm_addr_sel;//dm����Ҫ�����ݴ洢�����⴦��ʱѡ��ʹ��
	 wire [31:0] dm_data_out;
	 wire MemWrite;
	 wire MemRead;
	 
	 im  IM(old_PC[11:2],Instrl);//im��Ԫ
	 npc NPC(old_PC,Instrl[15:0],beq_zero,Instrl[25:0],ALU_out,PC_sel,PC_to_Reg,new_PC);//npc��Ԫ
	 pc  PC(new_PC,clk,reset,old_PC);//pc��Ԫ

	 
	 RegDst_mux REGDST(RegDst,Instrl[20:16],Instrl[15:11],Reg_rd);//�Ĵ����������ַѡ����
	 DatatoReg_mux DATATOREG(ALU_out,dm_data_out,PC_to_Reg,Data_to_Reg_sel,Data_to_Reg);//�Ĵ�������������ѡ����
	 gpr GRF(clk,reset,Instrl[25:21],Instrl[20:16],Reg_rd,Data_to_Reg,RegWrite,grf_out_A,grf_out_B);//�Ĵ�����
    
	 extend EXTEND(Instrl[15:0],ExtOp,ext_out);//������չ��Ԫ
	 
	 ALUSrc_mux ALUSRC(grf_out_B,ext_out,ALUSrc,ALUSrc_out);//alu�ڶ�����������ѡ����
	 alu ALU(grf_out_A,ALUSrc_out,ALUCtr,ALU_out,beq_zero);//alu���㵥Ԫ
	 
	 ctrl CTRL(Instrl[31:26],Instrl[5:0],RegDst,ALUSrc,MemRead,RegWrite,MemWrite,Data_to_Reg_sel,PC_sel,ExtOp,ALUCtr,dm_addr_sel);//Controller��Ԫ
	 
	 dm DM(ALU_out,grf_out_B,dm_addr_sel,MemWrite,MemRead,clk,reset,dm_data_out);//dm��Ԫ

endmodule
