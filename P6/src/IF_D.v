`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:52:01 11/24/2016 
// Design Name: 
// Module Name:    IF_D 
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
module IF_D(
    input [31:0] Instr,
    input clk,
    input reset,
    input StallD,
    input [31:0] PC4,
    output reg [31:0] InstrD,
    output reg [31:0] PC4_D
    );
	
	wire IR_D_en = ~StallD;
	
	initial begin
			InstrD = 0;
			PC4_D = 32'h00003000;		
	end
	
	always @(posedge clk)begin
		if(reset)begin
			InstrD = 0;
			PC4_D = 32'h00003000;
		end
		
		else if(IR_D_en)begin
			InstrD = Instr;
			PC4_D = PC4;
		end
		
	end
	

endmodule
