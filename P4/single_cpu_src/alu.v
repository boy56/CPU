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
    output reg [31:0] C,
	 output reg zero
    );
	

	 always @(A or B or ALUOp) begin
		case(ALUOp)
			3'b000: C = A + B;//addu, lw, sw, jal, jr
			3'b001: C = A - B;//subu
			3'b010: zero=(A==B)?1'b1:1'b0;//beq
			3'b011: C = A | B;//ori,or
			3'b100: C = B<<16;//lui
			3'b101: C = (A < B)? 1:0;//sltiu无符号比较
			3'b110: zero = (A[31]==0)?1:0;//bgez若最高位为0，则A为正数或0, zero = 1跳转;若最高位为1, 则A为负数, zero = 0,不跳转
		endcase
	 end
	 


endmodule



