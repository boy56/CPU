`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:10:18 11/23/2016 
// Design Name: 
// Module Name:    D 
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
`include "npc.v"
`include "gpr.v"
`include "extend.v"
`include "CMP.v"

`define op 31:26
`define rs 25:21
`define rt 20:16
`define rd 15:11
`define func 5:0



module D(
    input [31:0] InstrD,
    input [31:0] PC4_D,
	 input [31:0] Data_to_reg,
	 input RegWrite,
	 input [4:0] A3,
	 input [31:0] PC_M,
    input [1:0] ForwardRSD,
    input [1:0] ForwardRTD,
	 input [31:0] ALUOutM,
	 input clk,
    input reset,
    output [31:0] Instr_out_D,
    output [31:0] RF_RD1_E,
    output [31:0] RF_RD2_E,
    output [31:0] Ext_Out_E,
	 output [31:0] NPC_out_PC,
	 output PC_MUX_sel,
	 output [31:0] PC4_to_DE
    );
	
	wire bgezal  = (InstrD[`op] == 6'b000001)&&(InstrD[`rt] == 5'b10001);

	wire [2:0] Compare_sel;//CMP选择信号
	wire Compare_out;
	wire [1:0]NPC_sel;
	wire extend_sel;
	
	wire [31:0] RF_RD1;
	wire [31:0] RF_RD2;
	wire [31:0] CMP_in_RD1;
	wire [31:0] CMP_in_RD2;
	
	wire [31:0] extend_out;
	
	ctrl CtrlD(.Instr(InstrD),.NPC_sel(NPC_sel),.PC_MUX_sel(PC_MUX_sel),.compare_sel(Compare_sel),.ExtOp(extend_sel));
	
	gpr GPR(clk,reset,InstrD[25:21],InstrD[20:16],A3,Data_to_reg,RegWrite,RF_RD1,RF_RD2);
	
	three_mux RD1_MUX_D(RF_RD1,ALUOutM,PC_M,ForwardRSD,CMP_in_RD1);
	three_mux RD2_MUX_D(RF_RD2,ALUOutM,PC_M,ForwardRTD,CMP_in_RD2);
	
	CMP CMPD(CMP_in_RD1,CMP_in_RD2,Compare_sel,Compare_out);
	
	extend EXTEND(InstrD[15:0],extend_sel,extend_out);
	
	npc NPC(PC4_D,InstrD,Compare_out,CMP_in_RD1,NPC_sel,NPC_out_PC);//跳转的寄存器也应该经过转发选择处理
	
	assign Instr_out_D = (bgezal && (~Compare_out))?0:InstrD;
	assign RF_RD1_E = RF_RD1;
	assign RF_RD2_E = RF_RD2;
	assign Ext_Out_E = extend_out;
	assign PC4_to_DE = PC4_D;

endmodule

module three_mux(
	input [31:0] A,
	input [31:0] B,
	input [31:0] C,
	input [1:0] sel,
	output reg [31:0] out
	);
	
	always @(*) begin
		case(sel)
			2'b00: out = A;
			2'b01: out = B;
			2'b10: out = C + 4;
		endcase
	end
	
endmodule