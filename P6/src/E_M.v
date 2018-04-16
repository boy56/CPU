`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:46:34 11/27/2016 
// Design Name: 
// Module Name:    E_M 
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
module E_M(
    input [31:0] ALU_Out_in_E_M,
    input [31:0] Data_to_dm_in_E_M,
    input [4:0] WriteReg_in_E_M,
    input [31:0] Instr_in_E_M,
	 input movz_rt_zero_in_E_M,
    input clk,
    input reset,
	 input [31:0] PC4_in_E_M,
    output reg [31:0] ALU_Out_out_E_M,
    output reg [31:0] Data_to_dm_out_E_M,
    output reg [4:0] WriteReg_out_E_M,
    output reg [31:0] Instr_out_E_M,
    output reg [31:0] PC4_out_E_M
    );


	initial begin
		   ALU_Out_out_E_M = 0;
			Data_to_dm_out_E_M = 0;
			WriteReg_out_E_M = 0;
			Instr_out_E_M = 0;
			PC4_out_E_M = 0;
		
	end
	
	always@(posedge clk)begin
		if(reset || movz_rt_zero_in_E_M)begin
			ALU_Out_out_E_M = 0;
			Data_to_dm_out_E_M = 0;
			WriteReg_out_E_M = 0;
			Instr_out_E_M = 0;
			PC4_out_E_M = 0;
		end
		else begin
			ALU_Out_out_E_M = ALU_Out_in_E_M;
			Data_to_dm_out_E_M = Data_to_dm_in_E_M;
			WriteReg_out_E_M = WriteReg_in_E_M;
			Instr_out_E_M = Instr_in_E_M;
			PC4_out_E_M = PC4_in_E_M;
		end
	end

endmodule
