`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:33:01 12/11/2016 
// Design Name: 
// Module Name:    md 
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
module md(
    input [31:0] Data1,
    input [31:0] Data2,
    input Start,
    input clk,
    input reset,
    input [2:0] md_op,
    output reg [31:0] hi,
    output reg [31:0] lo,
	 output  busy
    );
	
	reg [3:0] count;
	reg [1:0] over;
	
	initial begin
			count = 0;
			hi = 0;
			lo = 0;
			over = 0;		
	end
	
	
	always @(posedge clk)begin
		if(reset)begin
			count = 0;
			hi = 0;
			lo = 0;
			over = 0;
		end
		
		else if(Start) begin
		
			
			case(md_op)
				3'b000: begin
								{hi,lo} = $signed(Data1) * $signed(Data2);
								count = 5;
				        end
				3'b001: begin
								{over,hi,lo} = {1'b0,Data1} * {1'b0,Data2};
								count = 5;
						  end
				3'b010: begin
								lo = $signed(Data1) / $signed(Data2);
								hi = $signed(Data1) % $signed(Data2);
								count = 10;
						  end
				3'b011: begin
								lo = {1'b0,Data1} / {1'b0,Data2};
								hi = {1'b0,Data1} % {1'b0,Data2};
								count = 10;
						  end

				default: count = 0;
				
			endcase
		end
		
		else begin
			   
				case(md_op)
					3'b100: begin
									hi = Data1;
							  end
						  
					3'b101: begin
									lo = Data1;
							  end
				
				endcase
						  
				if(count != 0) count = count - 1;
		end
	
	
	end
	
   assign busy = ((count == 0)&&(Start == 0))?0:1;//count等于零的时候busy = 0
	

endmodule
