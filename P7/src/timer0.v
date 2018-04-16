`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:51:11 12/14/2016 
// Design Name: 
// Module Name:    timer0 
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

`define IDLE 2'b00
`define LOAD 2'b01
`define COUNTING 2'b10
`define INT 2'b11	


module timer0(
    input clk,
    input reset,
    input [3:2] Addr,
    input we,
    input [31:0] data_in,
    output [31:0] data_out,
    output IRQ
    );
	 
	 reg [1:0] State;	//状态机
	 reg [31:0] Ctrl; //Addr = 0
	 reg [31:0] Preset;//Addr = 1
	 reg [31:0] Count;//Addr = 2
	 
	 reg Int;//中断信号寄存器
	 
	 wire [1:0] Mode;
	 wire Enable;
	 
	 assign Mode = Ctrl[2:1];
	 assign Enable = Ctrl[0];
	
	 always@(posedge clk)begin
			if(reset)begin
				State  = `IDLE;
				Ctrl   = 0;
				Preset = 0;
				Count  = 0;
				Int = 0;
			end
			
			else begin
				if(we)begin
					case(Addr)
						2'b00: Ctrl = data_in;
						2'b01: Preset = data_in;
						2'b10: Count = data_in;
					endcase
					
					State = `IDLE;
					Int = 0;
				end
				
				else begin
					if(Enable == 0) State = `IDLE;
					else begin
						case(State)
							`IDLE: begin
										Count = Preset;
										if(Count ==0) begin
											State = `INT;
											Int = 1;
										end
										else State = `COUNTING;
									 end
							`COUNTING:begin
											Count = Count - 1;
											if(Count == 0) begin 
												State = `INT;
												Int = 1;
											end
										 end
							`INT:begin
									 if(Mode == 1)begin
										Count = Preset;
										if(Count ==0) State = `INT;
										else begin 
											State = `COUNTING;
											Int = 0;
										end
									 end//模式1
									 
									 else begin
										Ctrl[0] = 0;				//	改变了Enable的值
										State = `IDLE;
									 end//模式0
								  end
						endcase
					end// the end of enable
				
				end // the end of we
			end	//the end of reset
	 end //the end of always
	 
	 assign IRQ = Ctrl[3] && Int;
	 assign data_out = (Addr == 2'b00)? Ctrl  :
							 (Addr == 2'b01)? Preset:
													Count ;

endmodule
