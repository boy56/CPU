`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:17:57 12/14/2016 
// Design Name: 
// Module Name:    CPO 
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
module CPO(
    input [4:0] Addr_rd,//外部连线为Instr_M[15:11]
    input [31:0] data_in,
    input [31:0] PC,
    input [6:2] ExcCode,
    input [5:0] HWInt,
	 input IF_Jump,
    input We,//执行mtco是产生使能信号
    input EXLSet,
    input EXLClr,
    input clk,
    input reset,
    output IntReq,//中断信号生成	
    output reg [31:0] EPC,
    output [31:0] data_out
    );
	 
	 reg [15:10] im;     //SR的6个中断屏蔽位
	 reg exl, ie;			//SR,exl,异常级,为1,进入异常,不允许再中断;为0,允许中断	 	ie为全局中断使能
	 reg [15:10] hwint_cause;
	 reg [6:2] ExcCode_cause;
	 
	 reg [31:0] PRID;		//	个性化ID
	 
	 initial begin
			PRID = 32'h00000056;
	 end
	 
	 always@(posedge clk) begin
			if(reset) begin
				im <= 0;
				exl <= 0;
				ie <= 0;
				hwint_cause <= 0;
				ExcCode_cause <= 0;
				EPC <= 0 ;
			end
			
			else begin
				
				hwint_cause <= HWInt;//6个设备中断
				ExcCode_cause <= ExcCode;//中断类型
				
				//此处默认三个if情况不会同时出现
				if(EXLSet) exl <= 1'b1;//外部异常信号来临时产生,此次设计中不会产生
				if(EXLClr) exl <= 1'b0;//执行eret指令时产生
				if(We)
					case(Addr_rd)
						5'b01100:{im,exl,ie} <= {data_in[15:10],data_in[1],data_in[0]};//SR
						5'b01110:EPC <= data_in;//EPC
						5'b01111:PRID <= 32'h00000056;//PRID
					endcase
				
				if(IntReq)begin
					if(IF_Jump) EPC <= PC - 4;
					else EPC <= PC;
					exl <= 1;
				end
					
					
			end
	 
	 end
	 
	 assign IntReq =  |(hwint_cause[15:10] & im[15:10]) & ie & !exl ;	 
	 
	 assign data_out = (Addr_rd == 5'b01100)? {16'b0,im[15:10],8'b0,exl,ie}:
							 (Addr_rd == 5'b01101)? {16'b0,hwint_cause[15:10],10'b0}:
							 (Addr_rd == 5'b01110)? EPC:
							 (Addr_rd == 5'b01111)? PRID:
														  0;

endmodule
