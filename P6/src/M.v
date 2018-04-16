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
    output [31:0] Instr_out_M,
    output [31:0] Data_out_dm_out_M,
    output [31:0] ALU_Out_out_M,
    output [4:0] WriteReg_out_M,
    output [31:0] PC4_out_M
    );

	wire MemWriteM;
	wire MemReadM;
	wire [3:0] BE_in_dm;
	wire [31:0] Data_to_dm;
	
	two_mux ForwardRTM_MUX(Data_in_dm_in_M,ReaultW_in_M,ForwardRTM,Data_to_dm);
	
	ctrl CtrlM(.Instr(Instr_in_M),.MemRead(MemReadM),.MemWrite(MemWriteM));
	
	BE BE_M(.Instr(Instr_in_M),.Addr(ALU_Out_in_M[1:0]),.BE_out(BE_in_dm));
	
	dm DM(.addr(ALU_Out_in_M),.data_in(Data_to_dm),.BE_in(BE_in_dm),.MemWrite(MemWriteM),.MemRead(MemReadM),.clk(clk),.reset(reset),.data_out(Data_out_dm_out_M));
	
	assign Instr_out_M = Instr_in_M;
	assign ALU_Out_out_M = ALU_Out_in_M;
	assign WriteReg_out_M = WriteReg_in_M;
	assign PC4_out_M = PC4_in_M;

endmodule
