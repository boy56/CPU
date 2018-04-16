`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:01:24 12/06/2016
// Design Name:   mips
// Module Name:   F:/CPU/P5/pipelin_cpu/mipstest.v
// Project Name:  pipelin_cpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mips
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mipstest;

	// Inputs
	reg clk;
	reg reset;

	// Instantiate the Unit Under Test (UUT)
	mips uut (
		.clk(clk), 
		.reset(reset)
	);


	always#5 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#10;
     reset = 0;
		
		
		//#500
		//reset = 1;
		
		//#10
		//reset = 0;
		
		//#1100
		//reset = 1;
		
		//#20
		//reset = 0;
		
		//#2000
		
		//reset = 1;
		
		//#30
		//reset = 0;
		
		// Add stimulus here

	end
      
endmodule

