`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:03:31 11/27/2016 
// Design Name: 
// Module Name:    E 
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
`include "alu.v"



module E(
    input [31:0] RD1_in_E,
    input [31:0] RD2_in_E,
    input [31:0] Instr_in_E,
    input [31:0] extend_out_in_E,
    input [1:0] ForwardAE,
    input [1:0] ForwardBE,
	 input [31:0] PC_M,
    input [31:0] ALUOutM,
    input [31:0] ResultW,
	 input [31:0] PC4_in_E,
    output [31:0] ALU_out_out_E,
    output [31:0] Data_to_dm_out_E,
    output [4:0] WriteReg_out_E,
    output [31:0] Instr_out_E,
    output [31:0] PC4_out_E,
	 output movz_rt_zero_out_E
    );
	 
	 wire [31:0] ForwardAE_Mux_E_out;
	 wire [31:0] ForwardBE_Mux_E_out;
	 wire [31:0] SrcBE;
	 wire [1:0] RegDstE;
	 wire [1:0] ALUSrcE;
	 wire [2:0] ALUCtrlE;
	
	 ctrl CtrlE(.Instr(Instr_in_E),.RegDst(RegDstE),.ALUSrc(ALUSrcE),.ALUCtrl(ALUCtrlE));
	 
	 RegDst_mux RegDst_MUX_E(.RegDst(RegDstE),.Instrl_rs(Instr_in_E[20:16]),.Instrl_rt(Instr_in_E[15:11]),.Reg_rd(WriteReg_out_E));
	 
	 four_mux ForwardAE_MUX_E(.A(RD1_in_E),.B(ALUOutM),.C(ResultW),.D(PC_M),.sel(ForwardAE),.out(ForwardAE_Mux_E_out));
	 four_mux ForwardBE_MUX_E(.A(RD2_in_E),.B(ALUOutM),.C(ResultW),.D(PC_M),.sel(ForwardBE),.out(ForwardBE_Mux_E_out));
	 
	 ALUSrc_mux ALUSrc_MUX_E(.grf_out(ForwardBE_Mux_E_out),.extend_out(extend_out_in_E),.ALUSrc(ALUSrcE),.ALUSrc_mux_out(SrcBE));
	 
	 
	 alu ALU_E(.A(ForwardAE_Mux_E_out),.B(SrcBE),.ALUOp(ALUCtrlE),.movz_rt_zero(movz_rt_zero_out_E),.C(ALU_out_out_E));
	 
	 assign Data_to_dm_out_E = ForwardBE_Mux_E_out;
	 assign Instr_out_E = Instr_in_E;
	 assign PC4_out_E = PC4_in_E;

endmodule

module RegDst_mux(
		input [1:0] RegDst,
		input [20:16] Instrl_rs,
		input [15:11] Instrl_rt,
		output reg [4:0] Reg_rd
    );
	 
	always@(RegDst or Instrl_rs or Instrl_rt)begin
		case(RegDst)
			2'b00: Reg_rd = Instrl_rs[20:16];
			2'b01: Reg_rd = Instrl_rt[15:11];
			2'b10: Reg_rd = 31;
		endcase
	end


endmodule


module ALUSrc_mux(
	input [31:0] grf_out,
	input [31:0] extend_out,
	input [1:0] ALUSrc,
	output reg [31:0] ALUSrc_mux_out
	);
	
	
	always@(grf_out or extend_out or ALUSrc)begin
		case(ALUSrc)
			2'b00: ALUSrc_mux_out = grf_out;
		   2'b01: ALUSrc_mux_out = extend_out;
			2'b10: ALUSrc_mux_out = grf_out<<extend_out[10:6];//sll
			2'b11: ALUSrc_mux_out = grf_out>>extend_out[10:6];//srl
		endcase
	end
	

endmodule

module four_mux(
	input [31:0] A,
	input [31:0] B,
	input [31:0] C,
	input [31:0] D,
	input [1:0] sel,
	output reg [31:0] out
	);
	
	always @(*) begin
		case(sel)
			2'b00: out = A;
			2'b01: out = B;
			2'b10: out = C;
			2'b11: out = D + 4;
		endcase
	end
	
endmodule
