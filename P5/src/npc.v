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
	input [31:0] PC_D,//pc+4后的值
	input [31:0] InstrD,//D级指令
	input Compare_out,//b类比较是否跳转,1跳转,则正常
	input [31:0] j_reg,//跳转寄存器的值
	input [1:0] NPC_sel,
	output reg [31:0] new_PC
    );
	
	reg [31:0]oldPC; 
	
	 always @(*) begin
		case(NPC_sel)
			2'b00: new_PC = (Compare_out)?PC_D+{{14{InstrD[15]}},InstrD[15:0],2'b00}:PC_D+4;//beq,bgez
			2'b01:begin 
				oldPC = PC_D - 4;
				new_PC = {oldPC[31:28],InstrD[25:0],2'b00};//j,jal
			end
			2'b10: new_PC = j_reg;//jr,jalr				
		endcase
	 end
	 

endmodule
