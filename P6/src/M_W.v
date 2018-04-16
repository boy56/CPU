`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:44:21 11/27/2016 
// Design Name: 
// Module Name:    M_W 
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
module M_W(
    input [31:0] Instr_in_M_W,
    input [31:0] ALU_Out_in_M_W,
    input [31:0] Data_out_dm_in_M_W,
    input [4:0] WriteReg_in_M_W,
    input clk,
    input reset,
	 input [31:0] PC4_in_M_W,
    output reg [31:0] Instr_out_M_W,
    output reg [31:0] ALU_Out_out_M_W,
    output reg [31:0] Data_out_dm_out_M_W,
    output reg [4:0] WriteReg_out_M_W,
    output reg [31:0] PC4_out_M_W
    );

	initial begin
		   Instr_out_M_W = 0;
			ALU_Out_out_M_W = 0;
			Data_out_dm_out_M_W = 0;
			WriteReg_out_M_W = 0;
			PC4_out_M_W = 0;
	end
	
	always @(posedge clk)begin
		if(reset)begin
			Instr_out_M_W = 0;
			ALU_Out_out_M_W = 0;
			Data_out_dm_out_M_W = 0;
			WriteReg_out_M_W = 0;
			PC4_out_M_W = 0;
		end
		
		else begin
			Instr_out_M_W = Instr_in_M_W;
			ALU_Out_out_M_W = ALU_Out_in_M_W;
			Data_out_dm_out_M_W = Data_out_dm_in_M_W;
			WriteReg_out_M_W = WriteReg_in_M_W;
			PC4_out_M_W = PC4_in_M_W;
		end
	
	end

endmodule
