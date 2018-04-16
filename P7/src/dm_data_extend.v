`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:44:15 12/11/2016 
// Design Name: 
// Module Name:    dm_data_extend 
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
module dm_data_extend(
    input [31:0] Addr,
    input [31:0] Din,
    input [2:0] Op,
    output [31:0] DOut
    );
	
	assign DOut = (Op == 3'b001) && (Addr[1:0] == 2'b00) ? {{24{1'b0}},Din[7:0]     }:
	              (Op == 3'b001) && (Addr[1:0] == 2'b01) ? {{24{1'b0}},Din[15:8]    }:
	              (Op == 3'b001) && (Addr[1:0] == 2'b10) ? {{24{1'b0}},Din[23:16]   }:
	              (Op == 3'b001) && (Addr[1:0] == 2'b11) ? {{24{1'b0}},Din[31:24]   }:   //lbu 
	              (Op == 3'b010) && (Addr[1:0] == 2'b00) ? {{24{Din[7]}},Din[7:0]   }: 
	              (Op == 3'b010) && (Addr[1:0] == 2'b01) ? {{24{Din[15]}},Din[15:8] }: 
	              (Op == 3'b010) && (Addr[1:0] == 2'b10) ? {{24{Din[23]}},Din[23:16]}: 
	              (Op == 3'b010) && (Addr[1:0] == 2'b11) ? {{24{Din[31]}},Din[31:24]}:   //lb 
	              (Op == 3'b011) && (Addr[1:0] == 2'b00) ? {{16{1'b0}},Din[15:0]    }: 
	              (Op == 3'b011) && (Addr[1:0] == 2'b10) ? {{16{1'b0}},Din[31:16]   }:   //lhu 
	              (Op == 3'b100) && (Addr[1:0] == 2'b00) ? {{16{Din[15]}},Din[15:0] }:    
	              (Op == 3'b100) && (Addr[1:0] == 2'b10) ? {{16{Din[31]}},Din[31:16]}:   //lh    
																					                 Din ;   //lw
	

endmodule
