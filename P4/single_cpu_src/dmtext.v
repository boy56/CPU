`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:58:00 11/15/2016
// Design Name:   dm
// Module Name:   F:/CPU/P4/single_cpu/dmtext.v
// Project Name:  single_cpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dmtext;

	// Inputs
	reg [11:2] addr;
	reg [31:0] data_in;
	reg MemWrite;
	reg MemRead;
	reg clk;
	reg reset;

	// Outputs
	wire [31:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	dm uut (
		.addr(addr), 
		.data_in(data_in), 
		.MemWrite(MemWrite), 
		.MemRead(MemRead), 
		.clk(clk), 
		.reset(reset), 
		.data_out(data_out)
	);
	
	always #25 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		addr = 0;
		data_in = 16;
		MemWrite = 0;
		MemRead = 0;
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#25;
		addr = 0;
		data_in = 16;
		MemWrite = 1;
		MemRead = 0;
		reset = 0;
		
		#50;
		addr = 0;
		data_in = 0;
		MemWrite = 0;
		MemRead = 1;
		reset = 0;
		
		#50;
		addr = 0;
		data_in = 16;
		MemWrite = 0;
		MemRead = 0;
		reset = 1;
		
		#50;
		addr = 0;
		data_in = 0;
		MemWrite = 0;
		MemRead = 1;
		reset = 0;
        
		// Add stimulus here

	end
      
endmodule

