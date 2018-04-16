`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:30:31 11/24/2016 
// Design Name: 
// Module Name:    IF 
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

`include "im.v"
`include "pc.v"




module IF(
    input StallF,
    input PC_MUX_sel,
    input [31:0] NPC_out_PC,
    input clk,
    input reset,
    output [31:0] PC4,
    output [31:0] Instr
    );
	 
	 wire PC_en = ~StallF;
	 wire [31:0] PC_add_4;
	 wire [31:0] new_PC;
	 wire [31:0] old_PC;
	 
	 assign PC_add_4 = old_PC + 4;
	 
	 two_mux PC_MUX(.A(PC_add_4),.B(NPC_out_PC),.sel(PC_MUX_sel),.C(new_PC));
	 
	 pc PC(.newpc(new_PC),.clk(clk),.reset(reset),.StallF(StallF),.oldpc(old_PC));
	 
	 im IM(.Addr(old_PC[12:2]),.Out(Instr));
	 
	 assign PC4 = PC_add_4;

endmodule

module two_mux(
	input [31:0] A,
	input [31:0] B,
	input sel,
	output [31:0] C
	);
	
	assign C = (sel)?B:A; 
	
endmodule
