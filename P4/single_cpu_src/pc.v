`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:21:30 11/15/2016 
// Design Name: 
// Module Name:    pc 
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
module pc(
    input [31:0] newpc,
    input clk,
    input reset,
    output [31:0] oldpc
    );
	
	reg [31:0] _pc;
	
	always@(posedge clk)begin
		if(reset) _pc <= 32'h00003000;
		else begin
			_pc  <= newpc;
		end
	end
	
	assign oldpc = _pc;
	
endmodule
