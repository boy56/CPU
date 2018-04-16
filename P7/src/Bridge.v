`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:16:50 12/14/2016 
// Design Name: 
// Module Name:    Bridge 
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

`define DEBUG_DEV_DATA 32'hffffffff

module Bridge(
    input [31:0] PrAddr,
    input [31:0] PrWD,
    input PrWe,
    input [31:0] Timer0_Data,
    input [31:0] Timer1_Data,
    output [31:0] PrRD,
    output Timer0_We,
    output Timer1_We,
    output [3:0] DevAddr,
    output [31:0] DevWD
    );
	 
	 wire HitTimer0;
	 wire HitTimer1;
	
	 assign HitTimer0 = (PrAddr[31:4] == 28'h00007f0);
	 assign HitTimer1 = (PrAddr[31:4] == 28'h00007f1);
	 
	 assign Timer0_We = PrWe && HitTimer0;
	 assign Timer1_We = PrWe && HitTimer1;
	 
	 assign DevAddr = PrAddr[3:0];
	 
	 assign DevWD = PrWD;
	 
	 assign PrRD = (HitTimer0) ? Timer0_Data:
	               (HitTimer1) ? Timer1_Data:
									 `DEBUG_DEV_DATA;
	           

endmodule
