`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:25:54 11/27/2016 
// Design Name: 
// Module Name:    M 
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
`include "dm.v"
`include "ctrl.v"
`include "BE.v"
`include "CPO.v"



module M(
    input [31:0] Instr_in_M,
    input [31:0] ALU_Out_in_M,
    input [31:0] Data_in_dm_in_M,
	 input [31:0] ReaultW_in_M,
    input [4:0] WriteReg_in_M,
	 input ForwardRTM,
    input clk,
    input reset,
	 input [31:0] PC4_in_M,
	 input IF_Jump,
	 input [5:0] HWInt,
	 input [31:0] Din_from_bridge,
	 input EXLClr_M,
    output [31:0] Instr_out_M,
    output [31:0] Data_out_dm_out_M,
    output [31:0] ALU_Out_out_M,
    output [4:0] WriteReg_out_M,
    output [31:0] PC4_out_M,
	 output IRQ,//中断信号
	 output [31:0] EPC_PC,
	 output PrWe,
	 output [31:0] Addr,
	 output [31:0] Dout_to_bridge	 
    );

	wire MemWriteM;
	wire MemReadM;
	wire [3:0] BE_in_dm;
	wire [31:0] Data_to_dm;
	wire [31:0] Data_out_dm;
	wire [31:0] PC_M;
	wire [31:0] data_out_CPO;//并入ALU_out里面加一个选择
	wire CPO_We;
	
	assign PC_M = PC4_in_M - 4;
	
	two_mux ForwardRTM_MUX(Data_in_dm_in_M,ReaultW_in_M,ForwardRTM,Data_to_dm);
	
	//CPO的We还未写,解析mtco时从Ctrl引出,以及EXTsel,EXTClr也可能是从ctrl中引出
	ctrl CtrlM(.Instr(Instr_in_M),.MemRead(MemReadM),.MemWrite(MemWriteM),.CPO_We(CPO_We));
	
	BE BE_M(.Instr(Instr_in_M),.Addr(ALU_Out_in_M[1:0]),.BE_out(BE_in_dm));
	
	dm DM(.addr(ALU_Out_in_M),.data_in(Data_to_dm),.BE_in(BE_in_dm),.MemWrite(MemWriteM),.MemRead(MemReadM),.clk(clk),.reset(reset),.data_out(Data_out_dm));
	
	CPO CPO_M(.Addr_rd(Instr_in_M[15:11]),.data_in(Data_to_dm),.PC(PC_M),.HWInt(HWInt),.IF_Jump(IF_Jump),.We(CPO_We),.EXLClr(EXLClr_M),
				 .clk(clk),.reset(reset),.IntReq(IRQ),.EPC(EPC_PC),.data_out(data_out_CPO));
	
	assign Instr_out_M = Instr_in_M;
	assign ALU_Out_out_M = ALU_Out_in_M;
	
	assign WriteReg_out_M = WriteReg_in_M;
	assign PC4_out_M = PC4_in_M;
	assign Data_out_dm_out_M = (Instr_in_M[31:21] == 11'b01000000000)												  ? data_out_CPO    ://当指令为mfco时取该值
										(ALU_Out_in_M < 32'h00003000)													        ? Data_out_dm     :
										((ALU_Out_in_M[31:4] == 28'h00007f0)||(ALU_Out_in_M[31:4] == 28'h00007f1))? Din_from_bridge :
																																				 32'hffffffff ;
	assign PrWe = MemWriteM;
	assign Addr = ALU_Out_in_M;
	assign Dout_to_bridge = Data_to_dm;


endmodule
