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
    input [1:0]Compare_sel,
    output reg Compare_out
    );
	
	always @(*)begin
		case(Compare_sel)
			2'b00:Compare_out = (A == B)?1:0;//beq
			2'b01:Compare_out = (A != B)?1:0;//bne
			2'b10:Compare_out = (A[31] == 0)?1:0;//bgezal
		endcase
	end

endmodule
