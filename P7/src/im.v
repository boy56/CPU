`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:47:35 09/28/2016 
// Design Name: 
// Module Name:    im 
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
module im(
    input [31:0] PC,
    output [31:0] Out
    );

	reg [31:0] _im [3071:1024];
	reg [31:0] _handler [1024:96];
	
	initial begin
		$readmemh("code.txt",_im);
		$readmemh("handler.txt",_handler);
	end
	
	assign Out = (PC > 32'h0000417f)?_handler[PC[12:2]] :
														_im[PC[12:2]];
		//$display("%b",Addr);
		//$display("%h",Out);
	

endmodule
