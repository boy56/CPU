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
	 input StallF,//由冲突控制单元引出
    output [31:0] oldpc
    );
	
	reg [31:0] _pc;
	wire PC_en = ~StallF;
	
	initial begin
		_pc <= 32'h00003000;
	end
	
	
	always@(posedge clk)begin
		if(reset) begin
			_pc <= 32'h00003000;
		end
		else begin
			if(PC_en) _pc  <= newpc;
		end	
	end
	
	assign oldpc = _pc;
	
endmodule
