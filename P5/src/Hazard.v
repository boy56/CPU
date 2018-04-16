`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:21:25 11/27/2016 
// Design Name: 
// Module Name:    Hazard 
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
`define op 31:26
`define rs 25:21
`define rt 20:16
`define rd 15:11
`define func 5:0

`define op_r 			6'b000000
`define addu_func 	6'b100001
`define add_func 	   6'b100000
`define subu_func 	6'b100011
`define sub_func 	   6'b100010
`define jr_func 	   6'b001000
`define movz_func    6'b001010
`define And_func     6'b100100
`define Xor_func     6'b100110
`define sll_func     6'b000000
`define srl_func     6'b000010
`define Or_func		6'b100101
	
`define ori_op       6'b001101
`define addi_op      6'b001000
`define addiu_op     6'b001001
`define lui_op       6'b001111
`define j_op         6'b000010
`define lw_op        6'b100011
`define sw_op        6'b101011
`define beq_op       6'b000100
`define bne_op       6'b000101
`define jal_op       6'b000011
`define bgezal_op    6'b000001
`define bgezal_rt    5'b10001

module Hazard(
    input [31:0] IR_D,
    input [31:0] IR_E,
    input [31:0] IR_M,
    input [31:0] IR_W,
    output stall,
    output [1:0] ForwardAD,
    output [1:0] ForwardBD,
    output [1:0] ForwardAE,
    output [1:0] ForwardBE,
	 output ForwardRTM
    );
	 

	
	 
	 wire b_D;
	 wire cal_r_D;
	 wire cal_i_D;
	 wire load_D;
	 wire store_D;
	 wire jal_D;
	 
	 wire b_E;
	 wire cal_r_E;
	 wire cal_i_E;
	 wire load_E;
	 wire store_E;
	 wire jal_E;
	 
	 wire b_M;
	 wire cal_r_M;
	 wire cal_i_M;
	 wire load_M;
	 wire store_M;
	 wire jal_M;
	 
	 wire b_W;
	 wire cal_r_W;
	 wire cal_i_W;
	 wire load_W;
	 wire store_W;
	 wire jal_W;
	 
	 
	 
	 
	 
	 assign b_D = (IR_D[`op] == `beq_op)||
					  (IR_D[`op] == `bne_op)||
					  ((IR_D[`op] == `bgezal_op)&&(IR_D[`rt] == `bgezal_rt))||
					  ((IR_D[`op] == `op_r)&&(IR_D[`func] == `jr_func));//beq,bne,bgezal,jr
					  
	 assign cal_r_D = ((IR_D[`op] == `op_r)&&(IR_D[`func] == `addu_func))||
	                  ((IR_D[`op] == `op_r)&&(IR_D[`func] == `add_func ))||
							((IR_D[`op] == `op_r)&&(IR_D[`func] == `subu_func))||
							((IR_D[`op] == `op_r)&&(IR_D[`func] == `sub_func ))||
							((IR_D[`op] == `op_r)&&(IR_D[`func] == `movz_func))||
							((IR_D[`op] == `op_r)&&(IR_D[`func] == `Or_func  ))||
							((IR_D[`op] == `op_r)&&(IR_D[`func] == `And_func ))||
							((IR_D[`op] == `op_r)&&(IR_D[`func] == `Xor_func ))||
							((IR_D[`op] == `op_r)&&(IR_D[`func] == `sll_func ))||
							((IR_D[`op] == `op_r)&&(IR_D[`func] == `srl_func ));//addu,add,subu,sub,movz,or,and,xor,sll,srl
							
	 assign cal_i_D = (IR_D[`op] == `ori_op)  ||
							(IR_D[`op] == `lui_op)  ||
							(IR_D[`op] == `addi_op) ||
							(IR_D[`op] == `addiu_op);		//ori,lui,addi,addiu

	 assign load_D = (IR_D[`op] == `lw_op);										//lw
	 
	 assign store_D = (IR_D[`op] == `sw_op);										//sw
	 
	 assign jal_D = (IR_D[`op] == `jal_op) ||
						 ((IR_D[`op] == `bgezal_op)&&(IR_D[`rt] == `bgezal_rt));                                 //jal,bgezal
	 
	 assign b_E = (IR_E[`op] == `beq_op)||
					  (IR_E[`op] == `bne_op)||
					  ((IR_E[`op] == `bgezal_op)&&(IR_E[`rt] == `bgezal_rt))||
					  ((IR_E[`op] == `op_r)&&(IR_E[`func] == `jr_func));//beq,bne,bgezal,jr
					  
	 assign cal_r_E = ((IR_E[`op] == `op_r)&&(IR_E[`func] == `addu_func))||
	                  ((IR_E[`op] == `op_r)&&(IR_E[`func] == `add_func ))||
							((IR_E[`op] == `op_r)&&(IR_E[`func] == `subu_func))||
							((IR_E[`op] == `op_r)&&(IR_E[`func] == `sub_func ))||
							((IR_E[`op] == `op_r)&&(IR_E[`func] == `movz_func))||
							((IR_E[`op] == `op_r)&&(IR_E[`func] == `Or_func  ))||
							((IR_E[`op] == `op_r)&&(IR_E[`func] == `And_func ))||
							((IR_E[`op] == `op_r)&&(IR_E[`func] == `Xor_func ))||
							((IR_E[`op] == `op_r)&&(IR_E[`func] == `sll_func ))||
							((IR_E[`op] == `op_r)&&(IR_E[`func] == `srl_func ));//addu,add,subu,sub,movz,or,and,xor,sll,srl
							
	 assign cal_i_E = (IR_E[`op] == `ori_op)  ||
							(IR_E[`op] == `lui_op)  ||
							(IR_E[`op] == `addi_op) ||
							(IR_E[`op] == `addiu_op);		//ori,lui,addi,addiu

	 assign load_E = (IR_E[`op] == `lw_op);										//lw
	 
	 assign store_E = (IR_E[`op] == `sw_op);										//sw
	 
	 assign jal_E = (IR_E[`op] == `jal_op)||
						 ((IR_E[`op] == `bgezal_op)&&(IR_E[`rt] == `bgezal_rt));                                 //jal,bgezal
	 
	 
	 
	 assign b_M = (IR_M[`op] == `beq_op)||
					  (IR_M[`op] == `bne_op)||
					  ((IR_M[`op] == `bgezal_op)&&(IR_M[`rt] == `bgezal_rt))||
					  ((IR_M[`op] == `op_r)&&(IR_M[`func] == `jr_func));//beq,bne,bgezal,jr
					  
	 assign cal_r_M = ((IR_M[`op] == `op_r)&&(IR_M[`func] == `addu_func))||
	                  ((IR_M[`op] == `op_r)&&(IR_M[`func] == `add_func ))||
							((IR_M[`op] == `op_r)&&(IR_M[`func] == `subu_func))||
							((IR_M[`op] == `op_r)&&(IR_M[`func] == `sub_func ))||
							((IR_M[`op] == `op_r)&&(IR_M[`func] == `movz_func))||
							((IR_M[`op] == `op_r)&&(IR_M[`func] == `Or_func  ))||
							((IR_M[`op] == `op_r)&&(IR_M[`func] == `And_func ))||
							((IR_M[`op] == `op_r)&&(IR_M[`func] == `Xor_func ))||
							((IR_M[`op] == `op_r)&&(IR_M[`func] == `sll_func ))||
							((IR_M[`op] == `op_r)&&(IR_M[`func] == `srl_func ));//addu,add,subu,sub,movz,or,and,xor,sll,srl
							
	 assign cal_i_M = (IR_M[`op] == `ori_op)  ||
							(IR_M[`op] == `lui_op)  ||
							(IR_M[`op] == `addi_op) ||
							(IR_M[`op] == `addiu_op);		//ori,lui,addi,addiu

	 assign load_M = (IR_M[`op] == `lw_op);										//lw
	 
	 assign store_M = (IR_M[`op] == `sw_op);										//sw
	 
	 assign jal_M = (IR_M[`op] == `jal_op) ||
						 ((IR_M[`op] == `bgezal_op)&&(IR_M[`rt] == `bgezal_rt));                                 //jal,bgezal
	 
	 
	 assign b_W = (IR_W[`op] == `beq_op)||
					  (IR_W[`op] == `bne_op)||
					  ((IR_W[`op] == `bgezal_op)&&(IR_W[`rt] == `bgezal_rt))||
					  ((IR_W[`op] == `op_r)&&(IR_W[`func] == `jr_func));//beq,bne,bgezal,jr
					  
	 assign cal_r_W = ((IR_W[`op] == `op_r)&&(IR_W[`func] == `addu_func))||
	                  ((IR_W[`op] == `op_r)&&(IR_W[`func] == `add_func ))||
							((IR_W[`op] == `op_r)&&(IR_W[`func] == `subu_func))||
							((IR_W[`op] == `op_r)&&(IR_W[`func] == `sub_func ))||
							((IR_W[`op] == `op_r)&&(IR_W[`func] == `movz_func))||
							((IR_W[`op] == `op_r)&&(IR_W[`func] == `Or_func  ))||
							((IR_W[`op] == `op_r)&&(IR_W[`func] == `And_func ))||
							((IR_W[`op] == `op_r)&&(IR_W[`func] == `Xor_func ))||
							((IR_W[`op] == `op_r)&&(IR_W[`func] == `sll_func ))||
							((IR_W[`op] == `op_r)&&(IR_W[`func] == `srl_func ));//addu,add,subu,sub,movz,or,and,xor,sll,srl
							
	 assign cal_i_W = (IR_W[`op] == `ori_op)  ||
							(IR_W[`op] == `lui_op)  ||
							(IR_W[`op] == `addi_op) ||
							(IR_W[`op] == `addiu_op);		//ori,lui,addi,addiu

	 assign load_W = (IR_W[`op] == `lw_op);										//lw
	 
	 assign store_W = (IR_W[`op] == `sw_op);										//sw
	 
	 assign jal_W = (IR_W[`op] == `jal_op) ||
						 ((IR_W[`op] == `bgezal_op)&&(IR_W[`rt] == `bgezal_rt));                      //jal,bgezal
	 
	 
	 //ÔÝÍ£ÅÐ¶Ï
	 wire stall_b;
	 wire stall_cal_r;
	 wire stall_cal_i;
	 wire stall_load;
	 wire stall_store;
	 
	 assign stall_b =  b_D &&  ((cal_r_E && (((IR_D[`rs] != 0)&&(IR_D[`rs] == IR_E[`rd])) || ((IR_D[`rt] != 0)&&(IR_D[`rt] == IR_E[`rd])))) ||
									    (cal_i_E && (((IR_D[`rs] != 0)&&(IR_D[`rs] == IR_E[`rt])) || ((IR_D[`rt] != 0)&&(IR_D[`rt] == IR_E[`rt])))) ||
									    (load_E  && (((IR_D[`rs] != 0)&&(IR_D[`rs] == IR_E[`rt])) || ((IR_D[`rt] != 0)&&(IR_D[`rt] == IR_E[`rt])))) ||
									    (load_M  && (((IR_D[`rs] != 0)&&(IR_D[`rs] == IR_M[`rt])) || ((IR_D[`rt] != 0)&&(IR_D[`rt] == IR_M[`rt])))));
	 
	 assign stall_cal_r = cal_r_D && load_E && (((IR_D[`rs] != 0)&&(IR_D[`rs] == IR_E[`rt])) || ((IR_D[`rt] != 0)&&(IR_D[`rt] == IR_E[`rt]))); 
	 
	 assign stall_cal_i = cal_i_D && load_E && ((IR_D[`rs] != 0)&&(IR_D[`rs] == IR_E[`rt]));
	 
	 assign stall_load  = load_D  && load_E && ((IR_D[`rs] != 0)&&(IR_D[`rs] == IR_E[`rt]));
	 
	 assign stall_store = store_D && load_E && ((IR_D[`rs] != 0)&&(IR_D[`rs] == IR_E[`rt])) ;
	 
	 assign stall = (stall_b || stall_cal_r || stall_cal_i || stall_load || stall_store)?1:0;
	 
	 assign ForwardAD =  b_D && (cal_r_M && (IR_D[`rs]!=0) && (IR_D[`rs] == IR_M[`rd]))? 1:
								b_D && (cal_i_M && (IR_D[`rs]!=0) && (IR_D[`rs] == IR_M[`rt]))? 1:
								b_D && (jal_M   && (IR_D[`rs] == 31))                         ? 2:
																													 0;
	 
	 assign ForwardBD =  b_D && (cal_r_M && (IR_D[`rt]!=0) && (IR_D[`rt] == IR_M[`rd]))? 1:
								b_D && (cal_i_M && (IR_D[`rt]!=0) && (IR_D[`rt] == IR_M[`rt]))? 1:
								b_D && (jal_M   && (IR_D[`rt] == 31))                         ? 2:
																													 0;
	 
	 assign ForwardAE =  cal_r_E && (cal_r_M && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_M[`rd]))? 1:
								cal_r_E && (cal_i_M && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_M[`rt]))? 1:
								cal_r_E && (cal_r_W && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_W[`rd]))? 2:
								cal_r_E && (cal_i_W && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_W[`rt]))? 2:
								cal_r_E && (load_W  && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_W[`rt]))? 2:
								cal_r_E && (jal_W   && (IR_E[`rs] == 31)) 								? 2:
								cal_r_E && (jal_M   && (IR_E[`rs] == 31))                         ? 3:
								cal_i_E && (cal_r_M && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_M[`rd]))? 1:
								cal_i_E && (cal_i_M && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_M[`rt]))? 1:
								cal_i_E && (cal_r_W && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_W[`rd]))? 2:
								cal_i_E && (cal_i_W && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_W[`rt]))? 2:
								cal_i_E && (load_W  && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_W[`rt]))? 2:
								cal_i_E && (jal_W   && (IR_E[`rs] == 31)) 								? 2:
								cal_i_E && (jal_M   && (IR_E[`rs] == 31))                         ? 3:
								load_E  && (cal_r_M && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_M[`rd]))? 1:
								load_E  && (cal_i_M && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_M[`rt]))? 1:
								load_E  && (cal_r_W && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_W[`rd]))? 2:
								load_E  && (cal_i_W && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_W[`rt]))? 2:
								load_E  && (load_W  && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_W[`rt]))? 2:
								load_E  && (jal_W   && (IR_E[`rs] == 31)) 								? 2:
								load_E  && (jal_M   && (IR_E[`rs] == 31))                         ? 3:
								store_E && (cal_r_M && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_M[`rd]))? 1:
								store_E && (cal_i_M && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_M[`rt]))? 1:
								store_E && (cal_r_W && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_W[`rd]))? 2:
								store_E && (cal_i_W && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_W[`rt]))? 2:
								store_E && (load_W  && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_W[`rt]))? 2:
								store_E && (jal_W   && (IR_E[`rs] == 31)) 								? 2:
								store_E && (jal_M   && (IR_E[`rs] == 31))                         ? 3:
																														  0;
	 
	 assign ForwardBE =  cal_r_E && (cal_r_M && (IR_E[`rt]!=0) && (IR_E[`rt] == IR_M[`rd]))? 1:
								cal_r_E && (cal_i_M && (IR_E[`rt]!=0) && (IR_E[`rt] == IR_M[`rt]))? 1:
								cal_r_E && (cal_r_W && (IR_E[`rt]!=0) && (IR_E[`rt] == IR_W[`rd]))? 2:
								cal_r_E && (cal_i_W && (IR_E[`rt]!=0) && (IR_E[`rt] == IR_W[`rt]))? 2:
								cal_r_E && (load_W  && (IR_E[`rt]!=0) && (IR_E[`rt] == IR_W[`rt]))? 2:
								cal_r_E && (jal_W   && (IR_E[`rt] == 31)) 								? 2:
								cal_r_E && (jal_M   && (IR_E[`rt] == 31))                         ? 3:
								store_E && (cal_r_M && (IR_E[`rt]!=0) && (IR_E[`rt] == IR_M[`rd]))? 1:
								store_E && (cal_i_M && (IR_E[`rt]!=0) && (IR_E[`rt] == IR_M[`rt]))? 1:
								store_E && (cal_r_W && (IR_E[`rt]!=0) && (IR_E[`rt] == IR_W[`rd]))? 2:
								store_E && (cal_i_W && (IR_E[`rt]!=0) && (IR_E[`rt] == IR_W[`rt]))? 2:
								store_E && (load_W  && (IR_E[`rt]!=0) && (IR_E[`rt] == IR_W[`rt]))? 2:
								store_E && (jal_W   && (IR_E[`rt] == 31)) 								? 2:
								store_E && (jal_M   && (IR_E[`rt] == 31))                         ? 3:
																														  0;
	 
	 assign ForwardRTM = store_E && ((cal_r_W && (IR_M[`rt]!=0) && (IR_M[`rt] == IR_W[`rd])) ||
										      (cal_i_W && (IR_M[`rt]!=0) && (IR_M[`rt] == IR_W[`rt])) ||
												(load_W  && (IR_M[`rt]!=0) && (IR_M[`rt] == IR_W[`rt])) ||
												(jal_W   && (IR_M[`rt] == 31)));
	 
endmodule
