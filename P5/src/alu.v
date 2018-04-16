`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:12:48 10/11/2016 
// Design Name: 
// Module Name:    alu 
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

//`include "sign_compare.v"

module alu(
    input [31:0] A,
    input [31:0] B,
    input [2:0] ALUOp,
	 output movz_rt_zero,
    output reg [31:0] C
    );
	

	 always @(A or B or ALUOp) begin
		case(ALUOp)
			3'b000: C = A + B;//addu, lw, sw, jal, jr, j, beq, bne, sll, srl
			3'b001: C = A - B;//subu
			3'b010: C = (B == 0)?A:0;//movz
			3'b011: C = A | B;//ori,or
			3'b100: C = B<<16;//lui
			3'b101: C = A & B;//and
			3'b110: C = A ^ B;//xor
		endcase
	 end
	 
	 assign movz_rt_zero = ((ALUOp == 3'b010)&&(B != 0))?1:0;//非零的时候赋值1，0的时候赋值0


endmodule



