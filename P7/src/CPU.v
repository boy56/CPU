`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:16:00 12/20/2016 
// Design Name: 
// Module Name:    CPU 
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
`include "mips.v"
`include "Bridge.v"
`include "timer0.v"
`include "timer1.v"



module CPU(
    input clk,
    input reset
    );
	 
	 wire [31:0] data_from_bridge;
	 wire [5:0] HWInt;
	 wire [31:0] Addr_to_bridge;
	 wire [31:0] data_to_bridge;
	 wire We_to_bridge;
	 wire [31:0] Timer0_data;
	 wire [31:0] Timer1_data;
	 wire Timer0_We;
	 wire Timer1_We;
	 wire [3:0] DevAddr;
	 wire [31:0] Devdata;
	 wire IRQ0;
	 wire IRQ1;
	 
	 assign HWInt = {4'b0,IRQ1,IRQ0};
	 
	 mips MIPS(.data_from_bridge(data_from_bridge),.HWInt(HWInt),.clk(clk),.reset(reset),.PrAddr(Addr_to_bridge),.PrWD(data_to_bridge),.PrWe(We_to_bridge));
	 Bridge BRIDGE(.PrAddr(Addr_to_bridge),.PrWD(data_to_bridge),.PrWe(We_to_bridge),.Timer0_Data(Timer0_data),.Timer1_Data(Timer1_data),
						.PrRD(data_from_bridge),.Timer0_We(Timer0_We),.Timer1_We(Timer1_We),.DevAddr(DevAddr),.DevWD(Devdata)); 
	 
	 timer0 Timer0(.clk(clk),.reset(reset),.Addr(DevAddr[3:2]),.we(Timer0_We),.data_in(Devdata),.data_out(Timer0_data),.IRQ(IRQ0));
	 timer1 Timer1(.clk(clk),.reset(reset),.Addr(DevAddr[3:2]),.we(Timer1_We),.data_in(Devdata),.data_out(Timer1_data),.IRQ(IRQ1));
	 
	 
endmodule
