`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:22:27 11/20/2016 
// Design Name: 
// Module Name:    sign_compare 
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
module sign_compare(
    input [31:0] A,
    input [31:0] B,
    output reg [31:0] C
    );
	//A小于B时, C = 1
	//A大于等于B时, C = 0
	
	always@(A or B)begin
		if(A[31]==B[31]) C = (A[30:0]>=B[30:0])?0:1;
		else if(A[31]==1 && B[31]==0) C = 1;
		else C = 0;//这种情况是A[31] == 0,B[31] == 1,A>B
	end
	

endmodule
