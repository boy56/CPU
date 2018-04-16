`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:05:51 09/26/2016 
// Design Name: 
// Module Name:    gpr 
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
module gpr(
    input clk,
	 input rst,
	 input [4:0] rs,
    input [4:0] rt,
    input [4:0] rd,
    input [31:0] wd,
    input we,
    output [31:0] outa,
    output [31:0] outb
    );
	
	reg [31:0] _reg [31:0];
	integer  i;
	
	always @(posedge clk or posedge rst) begin
		if(rst)begin
			for(i = 0; i < 32; i = i+1)begin
				_reg[i] = 0;
			end
		end
		
		else if(we)begin
				_reg[rd] = (rd == 0)?0:wd;
				$display("$%d <= %h",rd,wd);
		end
	end
	
	assign outa = rs == 0 ? 0: _reg[rs];
	
	assign outb = rt == 0 ? 0: _reg[rt];

endmodule
