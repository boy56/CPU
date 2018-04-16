`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:25:16 11/14/2016
// Design Name:   ctrl
// Module Name:   F:/CPU/P4/single_cpu/ctrltext.v
// Project Name:  single_cpu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ctrl
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ctrltext;

	// Inputs
	reg [5:0] opcode;
	reg [5:0] func;

	// Outputs
	wire [1:0] RegDst;
	wire ALUSrc;
	wire MemRead;
	wire RegWrite;
	wire MemWrite;
	wire [1:0] DatatoReg;
	wire [1:0] PC_sel;
	wire ExtOp;
	wire [2:0] ALUCtrl;

	// Instantiate the Unit Under Test (UUT)
	ctrl uut (
		.opcode(opcode), 
		.func(func), 
		.RegDst(RegDst), 
		.ALUSrc(ALUSrc), 
		.MemRead(MemRead), 
		.RegWrite(RegWrite), 
		.MemWrite(MemWrite), 
		.DatatoReg(DatatoReg), 
		.PC_sel(PC_sel), 
		.ExtOp(ExtOp), 
		.ALUCtrl(ALUCtrl)
	);

	initial begin
		// Initialize Inputs
		opcode = 6'b000000;
		func = 6'b100001;

		// Wait 100 ns for global reset to finish
		#100;
		opcode = 6'b000000;
		func = 6'b100011;
      
		#100;
		opcode = 6'b000000;
		func = 6'b001000;
       
		#100;
		opcode = 6'b001101;
		func = 6'b100011;
        		 
		#100;
		opcode = 6'b100011;
		func = 6'b100011;
      
		#100;
		opcode = 6'b101011;
		func = 6'b100011;
		
		#100;
		opcode = 6'b000100;
		func = 6'b100011;
		
		#100;
		opcode = 6'b001111;
		func = 6'b100011;
		
		#100;
		opcode = 6'b000011;
		func = 6'b100011;
        
        
		// Add stimulus here

	end
      
endmodule

