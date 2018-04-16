`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:39:54 11/15/2016 
// Design Name: 
// Module Name:    extend 
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
module extend(
    input [15:0] in,
    input ExtOp,
    output reg[31:0] out
    );
	
	always@(in or ExtOp)begin
		if(ExtOp == 1) out = {{16{in[15]}},in[15:0]};//有符号扩展
		else out = {{16{1'b0}},in[15:0]};//无符号扩展
	end

endmodule
