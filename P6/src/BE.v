`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:24:29 12/10/2016 
// Design Name: 
// Module Name:    BE 
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
`define op 31:26
`define rs 25:21
`define rt 20:16
`define rd 15:11
`define func 5:0




module BE(
    input [31:0] Instr,
	 input [1:0] Addr,
    output [3:0] BE_out
    );
	 
	 wire sw = (Instr[`op] == 6'b101011);
	 wire sb = (Instr[`op] == 6'b101000);
	 wire sh = (Instr[`op] == 6'b101001);
	 
	 
	 assign BE_out = 	sb &&(Addr == 2'b00) ? 4'b0001:
							sb &&(Addr == 2'b01) ? 4'b0010:
							sb &&(Addr == 2'b10) ? 4'b0100:
							sb &&(Addr == 2'b11) ? 4'b1000:
							sh &&(Addr == 2'b00) ? 4'b0011:
							sh &&(Addr == 2'b10) ? 4'b1100:
		     				                       4'b1111;//sw
																			           
 

endmodule
