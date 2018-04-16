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
    input [11:2] Addr,
    output [31:0] Out
    );

	reg [31:0] _im [1023:0];
	
	initial begin
		$readmemh("code.txt",_im);
	end
	
	assign Out = _im[Addr];
		//$display("%b",Addr);
		//$display("%h",Out);
	

endmodule
