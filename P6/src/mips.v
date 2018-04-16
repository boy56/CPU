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

`include "IF.v"
`include "IF_D.v"
`include "D.v"
`include "D_E.v"
`include "E.v"
`include "E_M.v"
`include "M.v"
`include "M_W.v"
`include "W.v"
`include "Hazard.v"


module mips(
    input clk,
    input reset
    );
	
	wire Stall;
	wire [1:0] ForwardAD;
	wire [1:0] ForwardBD;
	wire [1:0] ForwardAE;
	wire [1:0] ForwardBE;
	wire ForwardRTM;
	
	wire PC_MUX_sel;
	wire [31:0] NPC_out;
	wire [31:0] Instr_to_IF_D;
	wire [31:0] PC4_to_IF_D;
	
	
	wire [31:0] Instr_to_D;
	wire [31:0] PC4_to_D;
	
	wire [31:0] Instr_to_D_E;
	wire [31:0] RF_RD1_to_D_E;
	wire [31:0] RF_RD2_to_D_E;
	wire [31:0] Ext_out_to_D_E;
	wire [31:0] PC4_to_D_E;
	
	
	wire [31:0] Instr_to_E;
	wire [31:0] RF_RD1_to_E;
	wire [31:0] RF_RD2_to_E;
	wire [31:0] Ext_out_to_E;
	wire [31:0] PC4_to_E;
	
	wire [31:0] Instr_to_E_M;
	wire [31:0] ALUOut_to_E_M;
	wire [31:0] Datatodm_to_E_M;
	wire [4:0] WriteReg_to_E_M;
	wire [31:0] PC4_to_E_M;
	wire movz_rt_zero_to_E_M;
	
	wire [31:0] Instr_to_M;
	wire [31:0] ALUOutM;
	wire [31:0] Datatodm_to_M;
	wire [4:0]  WriteReg_to_M;
	wire [31:0] PC4_to_M;
	
	wire [31:0] Instr_to_M_W;
	wire [31:0] Dataoutdm_to_M_W;
	wire [31:0] ALUOut_to_M_W;
	wire [4:0]  WriteReg_to_M_W;
	wire [31:0] PC4_to_M_W;
	
	wire [31:0] Instr_to_W;
	wire [31:0] ALUOut_to_W;
	wire [31:0] Dataoutdm_to_W;
	wire [4:0]  WriteReg_to_W;
	wire [31:0] PC4_to_W;
	
	wire RegWriteW;
	wire [31:0] ResultW;
	wire [4:0] WriteRegW;
	
	wire busy_E;
	
	IF IF_mips(.StallF(Stall),.PC_MUX_sel(PC_MUX_sel),.NPC_out_PC(NPC_out),.clk(clk),.reset(reset),.PC4(PC4_to_IF_D),.Instr(Instr_to_IF_D));
	
	IF_D IF_D_mips(.Instr(Instr_to_IF_D),.clk(clk),.reset(reset),.StallD(Stall),.PC4(PC4_to_IF_D),.InstrD(Instr_to_D),.PC4_D(PC4_to_D));
	
	D D_mips(.InstrD(Instr_to_D),.PC4_D(PC4_to_D),.Data_to_reg(ResultW),.RegWrite(RegWriteW),.A3(WriteRegW),.PC_M(PC4_to_M),.ForwardRSD(ForwardAD),.ForwardRTD(ForwardBD),.ALUOutM(ALUOutM),.clk(clk),
				.reset(reset),.Instr_out_D(Instr_to_D_E),.RF_RD1_E(RF_RD1_to_D_E),.RF_RD2_E(RF_RD2_to_D_E),.Ext_Out_E(Ext_out_to_D_E),.NPC_out_PC(NPC_out),.PC_MUX_sel(PC_MUX_sel),.PC4_to_DE(PC4_to_D_E));
	
	D_E D_E_mips(.Instr(Instr_to_D_E),.clk(clk),.reset(reset),.FlushE(Stall),.RD1(RF_RD1_to_D_E),.RD2(RF_RD2_to_D_E),
					 .Extend_out(Ext_out_to_D_E),.PC4_in_D_E(PC4_to_D_E),.RD1_E(RF_RD1_to_E),.RD2_E(RF_RD2_to_E),.Instr_E(Instr_to_E),
					 .Extend_out_E(Ext_out_to_E),.PC4_out_E(PC4_to_E));
					 
	E E_mips(.RD1_in_E(RF_RD1_to_E),.RD2_in_E(RF_RD2_to_E),.Instr_in_E(Instr_to_E),.extend_out_in_E(Ext_out_to_E),
				.ForwardAE(ForwardAE),.ForwardBE(ForwardBE),.PC_M(PC4_to_M),.ALUOutM(ALUOutM),.ResultW(ResultW),.PC4_in_E(PC4_to_E),
				.clk(clk),.reset(reset),.ALU_out_out_E(ALUOut_to_E_M),.Data_to_dm_out_E(Datatodm_to_E_M),.WriteReg_out_E(WriteReg_to_E_M),
            .Instr_out_E(Instr_to_E_M),.PC4_out_E(PC4_to_E_M),.movz_rt_zero_out_E(movz_rt_zero_to_E_M),.busy_out_E(busy_E));
				
	E_M E_M_mips(.ALU_Out_in_E_M(ALUOut_to_E_M),.Data_to_dm_in_E_M(Datatodm_to_E_M),.WriteReg_in_E_M(WriteReg_to_E_M),.Instr_in_E_M(Instr_to_E_M),.movz_rt_zero_in_E_M(movz_rt_zero_to_E_M),
					 .clk(clk),.reset(reset),.PC4_in_E_M(PC4_to_E_M),.ALU_Out_out_E_M(ALUOutM),.Data_to_dm_out_E_M(Datatodm_to_M),
                .WriteReg_out_E_M(WriteReg_to_M),.Instr_out_E_M(Instr_to_M),.PC4_out_E_M(PC4_to_M));
	
	M M_mips(.Instr_in_M(Instr_to_M),.ALU_Out_in_M(ALUOutM),.Data_in_dm_in_M(Datatodm_to_M),.ReaultW_in_M(ResultW),
            .WriteReg_in_M(WriteReg_to_M),.ForwardRTM(ForwardRTM),.clk(clk),.reset(reset),.PC4_in_M(PC4_to_M),
				.Instr_out_M(Instr_to_M_W),.Data_out_dm_out_M(Dataoutdm_to_M_W),.ALU_Out_out_M(ALUOut_to_M_W),.WriteReg_out_M(WriteReg_to_M_W),
            .PC4_out_M(PC4_to_M_W));
				
	M_W M_W_mips(.Instr_in_M_W(Instr_to_M_W),.ALU_Out_in_M_W(ALUOut_to_M_W),.Data_out_dm_in_M_W(Dataoutdm_to_M_W),.WriteReg_in_M_W(WriteReg_to_M_W),
					 .clk(clk),.reset(reset),.PC4_in_M_W(PC4_to_M_W),.Instr_out_M_W(Instr_to_W),.ALU_Out_out_M_W(ALUOut_to_W),
                .Data_out_dm_out_M_W(Dataoutdm_to_W),.WriteReg_out_M_W(WriteReg_to_W),.PC4_out_M_W(PC4_to_W));
					 
	W W_mips(.Instr_in_W(Instr_to_W),.ALU_Out_in_W(ALUOut_to_W),.Data_out_dm_in_W(Dataoutdm_to_W),.WriteReg_in_W(WriteReg_to_W),
            .PC4_in_W(PC4_to_W),.RegWrite_out_W(RegWriteW),.Result_out_W(ResultW),.WriteReg_out_W(WriteRegW));
				
	
	Hazard  Hazard_mips(.IR_D(Instr_to_D),.IR_E(Instr_to_E),.IR_M(Instr_to_M),.IR_W(Instr_to_W),.busy_E(busy_E),.stall(Stall),.ForwardAD(ForwardAD),
							  .ForwardBD(ForwardBD),.ForwardAE(ForwardAE),.ForwardBE(ForwardBE),.ForwardRTM(ForwardRTM));
	
endmodule
