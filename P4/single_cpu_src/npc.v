`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:04:33 11/14/2016 
// Design Name: 
// Module Name:    npc 
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
module npc(
    input [31:0] oldPC,
	 input [15:0] beq_imm,
	 input  beq_zero,
    input [25:0] jal_imm,
    input [31:0] jr_reg,
    input [1:0] PC_sel,
    output reg [31:0] PC_to_Reg,
    output reg [31:0] newPC
    );

	 always @(oldPC or beq_imm or beq_zero or jal_imm or jr_reg or PC_sel) begin
		case(PC_sel)
			2'b00:begin
				newPC = oldPC + 4;
			end
			2'b01:
			begin
				if(beq_zero == 1) newPC = oldPC + 4 + {{14{beq_imm[15]}},beq_imm[15:0],2'b00};//beq
				else newPC = oldPC + 4;
			end
			2'b10:begin
				newPC = {oldPC[31:28],jal_imm[25:0],2'b00};//jal
			end
			2'b11:newPC = jr_reg;//jr			
		endcase
		
		PC_to_Reg = oldPC + 4;
	 end
	 

endmodule
