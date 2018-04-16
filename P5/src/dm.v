`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:46:53 11/15/2016 
// Design Name: 
// Module Name:    dm 
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
module dm(
    input [31:0] addr,
    input [31:0] data_in,
    input [1:0] addr_sel,
	 input MemWrite,
    input MemRead,
    input clk,
	 input reset,
    output [31:0] data_out
    );
	 
	 reg [31:0] _dm [1023:0];
	 reg [1:0] storeaddr_n ;//非标准偏移量
	 integer i;
	 
	 //assign storeaddr_n = addr[1:0];
	 //assign j = ((storeaddr_n+1)*8-1);
	
	initial begin
		for(i = 0; i < 1024; i = i+1)begin
				_dm[i] = 0;
			end
	end
	
	
	always @(posedge clk ) begin
		if(reset == 1)begin 
			for(i = 0; i < 1024; i = i+1)begin
				_dm[i] = 0;
			end
		end//the end of the if_reset_1
		
		else if(MemWrite == 1)begin
		
			if(addr_sel == 2'b01)begin
				storeaddr_n = addr[1:0];
				case(storeaddr_n)
					2'b00:_dm[addr[11:0]] = {_dm[addr[11:0]][31:8],data_in[31:24]};
					2'b01:_dm[addr[11:0]] = {_dm[addr[11:0]][31:16],data_in[31:16]};
					2'b10:_dm[addr[11:0]] = {_dm[addr[11:0]][31:24],data_in[31:8]};
					2'b11:_dm[addr[11:0]] = data_in;
				endcase
			end//swl处理
		
			else begin
					_dm[addr[11:2]] = data_in;
					$display("*%h <= %h",addr,data_in);
			end//the end of addr_sel == 2'b00
		end//the end of MemWrite == 1
	end
	
	assign data_out = (MemRead == 1)?_dm[addr[11:2]]:0;

endmodule
