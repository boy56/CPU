`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:09:57 11/24/2016 
// Design Name: 
// Module Name:    D_E 
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
module D_E(
    input [31:0] Instr,
    input clk,
    input reset,
    input FlushE,
    input [31:0] RD1,
    input [31:0] RD2,
    input [31:0] Extend_out,
	 input [31:0] PC4_in_D_E,
	 input IRQ,
    output reg [31:0] RD1_E,
    output reg [31:0] RD2_E,
    output reg [31:0] Instr_E,
	 output reg [31:0] Extend_out_E,
	 output reg [31:0] PC4_out_E
    );
	
	initial begin
		   RD1_E = 0;
			RD2_E = 0;
			Instr_E = 0;
			Extend_out_E = 0;
			PC4_out_E = 0;
	
	end
	
	
	always @(posedge clk )begin
		if(reset || IRQ)begin
			RD1_E = 0;
			RD2_E = 0;
			Instr_E = 0;
			Extend_out_E = 0;
			PC4_out_E = 0;
		end
		
		
		else if(FlushE)begin
			RD1_E = 0;
			RD2_E = 0;
			Instr_E = 0;
			Extend_out_E = 0;
		end
		
		else begin
			RD1_E = RD1;
			RD2_E = RD2;
			Instr_E = Instr;
			Extend_out_E = Extend_out;
			PC4_out_E = PC4_in_D_E;
		end
	
	end

endmodule
