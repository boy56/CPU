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



`include "sign_compare.v"

module alu(
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALUOp,
	 output movz_rt_zero,
    output reg [31:0] C
    );
	
	
	wire [31:0] mid;	 
	wire [63:0] srav_mid;
	
	sign_compare Sign_compare(.A(A),.B(B),.C(mid));
	
	assign srav_mid = {{32{B[31]}},B} >> A[4:0];
	
	 always @(A or B or ALUOp or mid or srav_mid) begin
		case(ALUOp)
			4'b0000: C = A + B;//addu, lw, sw, jal, jr, j, beq, bne, sll, srl
			4'b0001: C = A - B;//subu
			4'b0010: C = (B == 0)?A:0;//movz
			4'b0011: C = A | B;//ori,or
			4'b0100: C = B<<16;//lui
			4'b0101: C = A & B;//and, andi
			4'b0110: C = A ^ B;//xor,xori
			4'b0111: C = ~(A | B);//nor
			4'b1000: C = mid;//slt, slti
			4'b1001: C = (A < B)?1:0;//sltu, sltiu
			4'b1010: C = B << A[4:0];//sllv 
			4'b1011: C = B >> A[4:0];//srlv
			4'b1100: C = srav_mid[31:0];//srav
		endcase
	 end
	 
	 assign movz_rt_zero = ((ALUOp == 3'b010)&&(B != 0))?1:0;//非零的时候赋值1，0的时候赋值0
		

endmodule



