`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:25:29 11/15/2016 
// Design Name: 
// Module Name:    MUX 
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
	input ALUSrc,
	output reg [31:0] ALUSrc_mux_out
	);
	
	
	always@(grf_out or extend_out or ALUSrc)begin
		if(ALUSrc == 1) ALUSrc_mux_out = extend_out;
		else ALUSrc_mux_out = grf_out;
	end
	

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
