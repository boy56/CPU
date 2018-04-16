`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:17:10 11/23/2016 
// Design Name: 
// Module Name:    CMP 
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
module CMP(
    input [31:0] A,
    input [31:0] B,
    input [2:0]Compare_sel,
    output reg Compare_out
    );
	
	always @(*)begin
		case(Compare_sel)
			3'b000:Compare_out = (A == B)?1:0;//beq
			3'b001:Compare_out = (A != B)?1:0;//bne
			3'b010:Compare_out = (A[31] == 0)?1:0;//bgezal,大于等于零时转移
			3'b011:Compare_out = ((A[31] == 0)&&(A[30:0]>0))?1:0;//bgtz,大于零时转移
			3'b100:Compare_out = (A[31] == 1)?1:0;//bltz,小于零时转移
			3'b101:Compare_out = ((A[31] == 1)||(A == 0))?1:0;//blez,小于等于零时转移
		endcase
	end

endmodule
