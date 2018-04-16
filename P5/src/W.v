`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:08:29 11/27/2016 
// Design Name: 
// Module Name:    W 
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


module W(
    input [31:0] Instr_in_W,
    input [31:0] ALU_Out_in_W,
    input [31:0] Data_out_dm_in_W,
    input [4:0] WriteReg_in_W,
    input [31:0] PC4_in_W,
    output RegWrite_out_W,
    output [31:0] Result_out_W,
    output [4:0] WriteReg_out_W
    );

	wire [1:0] DatatoReg_sel_W;
	wire [31:0] PC8_W;
	
	assign PC8_W = PC4_in_W + 4;
	
	ctrl CtrlW(.Instr(Instr_in_W),.RegWrite(RegWrite_out_W),.DatatoReg(DatatoReg_sel_W));

	DatatoReg_mux DatatoReg_MUX_W(.ALU_data(ALU_Out_in_W),.Mem_data(Data_out_dm_in_W),.PC_to_Reg(PC8_W),.DatatoReg(DatatoReg_sel_W),.DatatoReg_out(Result_out_W));
	
	assign WriteReg_out_W = WriteReg_in_W;
	
endmodule


module DatatoReg_mux(
	input [31:0] ALU_data,
	input [31:0] Mem_data,
	input [31:0] PC_to_Reg,
	input [1:0]  DatatoReg,
	output reg [31:0] DatatoReg_out
	);
	
	always@(ALU_data or Mem_data or PC_to_Reg or DatatoReg)begin
		case(DatatoReg)
			2'b00: DatatoReg_out = ALU_data;
			2'b01: begin 
				DatatoReg_out = Mem_data;
			end
			2'b10: DatatoReg_out = PC_to_Reg;
		endcase
	end
	
	
endmodule
