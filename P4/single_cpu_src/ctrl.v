`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:12:14 11/14/2016 
// Design Name: 
// Module Name:    ctrl 
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
module ctrl(
    input [5:0] opcode,
    input [5:0] func,
    output reg [1:0] RegDst,
    output reg ALUSrc,
    output reg MemRead,
    output reg RegWrite,
    output reg MemWrite,
    output reg [1:0] DatatoReg,
    output reg [1:0] PC_sel,
    output reg ExtOp,
    output reg [2:0] ALUCtrl,
	 output reg [1:0] addr_sel//dm中的地址特殊处理
    );
	
	always @(opcode or func ) begin
		case(opcode)
			//addu,subu,jr
			6'b000000:
				case(func)
					//addu
					6'b100001:
					begin
						RegDst = 2'b01;
						ALUSrc = 0;
						MemRead = 0;
						RegWrite = 1;
						MemWrite = 0;
						DatatoReg = 2'b00;
						PC_sel = 2'b00;
						ExtOp = 0;
						ALUCtrl = 3'b000;
						addr_sel = 2'b00;
					end
			
					//subu
					6'b100011:
					begin
						RegDst = 2'b01;
						ALUSrc = 0;
						MemRead = 0;
						RegWrite = 1;
						MemWrite = 0;
						DatatoReg = 2'b00;
						PC_sel = 2'b00;
						ExtOp = 0;
						ALUCtrl = 3'b001;
						addr_sel = 2'b00;
					end
					
					//or
					6'b100101:
					begin
						RegDst = 2'b01;
						ALUSrc = 0;
						MemRead = 0;
						RegWrite = 1;
						MemWrite = 0;
						DatatoReg = 2'b00;
						PC_sel = 2'b00;
						ExtOp = 0;
						ALUCtrl = 3'b011;
						addr_sel = 2'b00;
					end
					
					//jr
					6'b001000:
					begin
						RegDst = 2'b00;
						ALUSrc = 0;
						MemRead = 0;
						RegWrite = 0;
						MemWrite = 0;
						DatatoReg = 2'b00;
						PC_sel = 2'b11;
						ExtOp = 0;
						ALUCtrl = 3'b000;
						addr_sel = 2'b00;
					end
					
					default:
					begin
						RegDst = 2'b00;
						ALUSrc = 0;
						MemRead = 0;
						RegWrite = 0;
						MemWrite = 0;
						DatatoReg = 2'b00;
						PC_sel = 2'b00;
						ExtOp = 0;
						ALUCtrl = 3'b000;
						addr_sel = 2'b00;
					end
				endcase//the end of the func
			
			//ori
			6'b001101:
			begin
				RegDst = 2'b00;
				ALUSrc = 1;
				MemRead = 0;
				RegWrite = 1;
				MemWrite = 0;
				DatatoReg = 2'b00;
				PC_sel = 2'b00;
				ExtOp = 0;
				ALUCtrl = 3'b011;
				addr_sel = 2'b00;
			end
					
			//lw
			6'b100011:
			begin
				RegDst = 2'b00;
				ALUSrc = 1;
				MemRead = 1;
				RegWrite = 1;
				MemWrite = 0;
				DatatoReg = 2'b01;
				PC_sel = 2'b00;
				ExtOp = 1;
				ALUCtrl = 3'b000;
				addr_sel = 2'b00;
			end
			
			//sw 
			6'b101011:
			begin
				RegDst = 2'b00;
				ALUSrc = 1;
				MemRead = 0;
				RegWrite = 0;
				MemWrite = 1;
				DatatoReg = 2'b00;
				PC_sel = 2'b00;
				ExtOp = 1;
				ALUCtrl = 3'b000;
				addr_sel = 2'b00;
			end
			
			//beq 
			6'b000100:
			begin
				RegDst = 2'b00;
				ALUSrc = 0;
				MemRead = 0;
				RegWrite = 0;
				MemWrite = 0;
				DatatoReg = 2'b00;
				PC_sel = 2'b01;
				ExtOp = 0;
				ALUCtrl = 3'b010;
				addr_sel = 2'b00;
			end
			
			//lui
			6'b001111:
			begin
				RegDst = 2'b00;
				ALUSrc = 1;
				MemRead = 0;
				RegWrite = 1;
				MemWrite = 0;
				DatatoReg = 2'b00;
				PC_sel = 2'b00;
				ExtOp = 1;
				ALUCtrl = 3'b100;
				addr_sel = 2'b00;
			end
				
			//jal
			6'b000011:
			begin
				RegDst = 2'b10;
				ALUSrc = 0;
				MemRead = 0;
				RegWrite = 1;
				MemWrite = 0;
				DatatoReg = 2'b10;
				PC_sel = 2'b10;
				ExtOp = 0;
				ALUCtrl = 3'b000;
				addr_sel = 2'b00;
			end
			
			//sltiu, 无符号比较
			6'b000011:
			begin
				RegDst = 2'b00;
				ALUSrc = 1;
				MemRead = 0;
				RegWrite = 1;
				MemWrite = 0;
				DatatoReg = 2'b00;
				PC_sel = 2'b00;
				ExtOp = 1;
				ALUCtrl = 3'b101;//sltiu
				addr_sel = 2'b00;
			end
			
			//bgez,不能直接用大于等于号 
			6'b000001:
			begin
				RegDst = 2'b00;
				ALUSrc = 0;
				MemRead = 0;
				RegWrite = 0;
				MemWrite = 0;
				DatatoReg = 2'b00;
				PC_sel = 2'b01;
				ExtOp = 0;
				ALUCtrl = 3'b110;
				addr_sel = 2'b00;
			end
			
			//swl 
			6'b101010:
			begin
				RegDst = 2'b00;
				ALUSrc = 1;
				MemRead = 0;
				RegWrite = 0;
				MemWrite = 1;
				DatatoReg = 2'b00;
				PC_sel = 2'b00;
				ExtOp = 1;
				ALUCtrl = 3'b000;
				addr_sel = 2'b01;
			end
			
			default:
					begin
						RegDst = 2'b00;
						ALUSrc = 0;
						MemRead = 0;
						RegWrite = 0;
						MemWrite = 0;
						DatatoReg = 2'b00;
						PC_sel = 2'b00;
						ExtOp = 0;
						ALUCtrl = 3'b000;
						addr_sel = 2'b00;
					end
			
		endcase
	 end
	 

endmodule
