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
`define sllv_func    6'b000100
`define srl_func     6'b000010
`define srlv_func    6'b000110
`define sra_func     6'b000011
`define srav_func    6'b000111
`define Or_func		6'b100101
`define nor_func		6'b100111
`define slt_func		6'b101010
`define sltu_func		6'b101011
`define jalr_func		6'b001001

`define mult_func		6'b011000
`define multu_func	6'b011001
`define div_func	   6'b011010
`define divu_func	   6'b011011
`define mfhi_func	   6'b010000
`define mflo_func	   6'b010010
`define mthi_func	   6'b010001
`define mtlo_func	   6'b010011
	
`define ori_op       6'b001101
`define addi_op      6'b001000
`define addiu_op     6'b001001
`define andi_op      6'b001100
`define xori_op      6'b001110
`define lui_op       6'b001111
`define slti_op      6'b001010
`define sltiu_op     6'b001011
`define j_op         6'b000010
`define lw_op        6'b100011
`define lb_op        6'b100000
`define lbu_op       6'b100100
`define lh_op        6'b100001
`define lhu_op       6'b100101
`define sw_op        6'b101011
`define sb_op        6'b101000
`define sh_op        6'b101001
`define beq_op       6'b000100
`define bne_op       6'b000101
`define jal_op       6'b000011

`define bgezal_op    6'b000001
`define bgezal_rt    5'b10001

`define bgtz_op      6'b000111
`define bgtz_rt      5'b00000

`define bltz_op      6'b000001
`define bltz_rt      5'b00000

`define bgez_op      6'b000001
`define bgez_rt      5'b00001

`define blez_op      6'b000110
`define blez_rt      5'b00000


module Hazard(
    input [31:0] IR_D,
    input [31:0] IR_E,
    input [31:0] IR_M,
    input [31:0] IR_W,
	 input busy_E,
    output stall,
    output [1:0] ForwardAD,
    output [1:0] ForwardBD,
    output [1:0] ForwardAE,
    output [1:0] ForwardBE,
	 output ForwardRTM
    );
	 

	
	 
	 wire b_D;
	 wire b_rs_D;
	 wire jalr_D;
	 wire cal_r_D;
	 wire cal_i_D;
	 wire load_D;
	 wire store_D;
	 wire jal_D;
	 
	 wire b_E;
	 wire b_rs_E;
	 wire jalr_E;
	 wire cal_r_E;
	 wire cal_i_E;
	 wire load_E;
	 wire store_E;
	 wire jal_E;
	 
	 wire b_M;
	 wire b_rs_M;
	 wire jalr_M;
	 wire cal_r_M;
	 wire cal_i_M;
	 wire load_M;
	 wire store_M;
	 wire jal_M;
	 
	 wire b_W;
	 wire b_rs_W;
	 wire jalr_W;
	 wire cal_r_W;
	 wire cal_i_W;
	 wire load_W;
	 wire store_W;
	 wire jal_W;
	 
	 
	 
	 
	 assign b_D = (IR_D[`op] == `beq_op)||
					  (IR_D[`op] == `bne_op);//beq,bne
	
	 assign b_rs_D = ((IR_D[`op] == `bgezal_op)&&(IR_D[`rt] == `bgezal_rt))||
					     ((IR_D[`op] == `bgtz_op  )&&(IR_D[`rt] == `bgtz_rt  ))||
					     ((IR_D[`op] == `bltz_op  )&&(IR_D[`rt] == `bltz_rt  ))||
					     ((IR_D[`op] == `bgez_op  )&&(IR_D[`rt] == `bgez_rt  ))||
					     ((IR_D[`op] == `blez_op  )&&(IR_D[`rt] == `blez_rt  ))||
					     ((IR_D[`op] == `op_r     )&&(IR_D[`func] == `jr_func));//bgezal,bgtz,bltz,bgez,blez,jr
						  
	 assign jalr_D = (IR_D[`op] == `op_r)&&(IR_D[`func] == `jalr_func);//jalr
	
	 assign cal_r_D = ((IR_D[`op] == `op_r)&&(IR_D[`func] == `addu_func))||
	                  ((IR_D[`op] == `op_r)&&(IR_D[`func] == `add_func ))||
							((IR_D[`op] == `op_r)&&(IR_D[`func] == `subu_func))||
							((IR_D[`op] == `op_r)&&(IR_D[`func] == `sub_func ))||
							((IR_D[`op] == `op_r)&&(IR_D[`func] == `movz_func))||
							((IR_D[`op] == `op_r)&&(IR_D[`func] == `Or_func  ))||
							((IR_D[`op] == `op_r)&&(IR_D[`func] == `nor_func ))||
							((IR_D[`op] == `op_r)&&(IR_D[`func] == `And_func ))||
							((IR_D[`op] == `op_r)&&(IR_D[`func] == `Xor_func ))||
							((IR_D[`op] == `op_r)&&(IR_D[`func] == `slt_func ))||
							((IR_D[`op] == `op_r)&&(IR_D[`func] == `sltu_func))||
							((IR_D[`op] == `op_r)&&(IR_D[`func] == `sll_func ))||
							((IR_D[`op] == `op_r)&&(IR_D[`func] == `sllv_func))||
							((IR_D[`op] == `op_r)&&(IR_D[`func] == `sra_func ))||
							((IR_D[`op] == `op_r)&&(IR_D[`func] == `srav_func))||
							((IR_D[`op] == `op_r)&&(IR_D[`func] == `srlv_func))||
							((IR_D[`op] == `op_r)&&(IR_D[`func] == `mult_func))||
							((IR_D[`op] == `op_r)&&(IR_D[`func] == `multu_func))||
							((IR_D[`op] == `op_r)&&(IR_D[`func] == `div_func ))||
							((IR_D[`op] == `op_r)&&(IR_D[`func] == `divu_func))||
							((IR_D[`op] == `op_r)&&(IR_D[`func] == `mfhi_func))||
							((IR_D[`op] == `op_r)&&(IR_D[`func] == `mflo_func))||
							((IR_D[`op] == `op_r)&&(IR_D[`func] == `mthi_func))||
							((IR_D[`op] == `op_r)&&(IR_D[`func] == `mtlo_func))||
							((IR_D[`op] == `op_r)&&(IR_D[`func] == `srl_func ));//addu,add,subu,sub,movz,or,nor,and,xor,slt,sltu,sll,sllv,sra,srav,srlv,mult,multu,div,divu,mfhi,mflo,mthi,mtlo,srl
							
	 assign cal_i_D = (IR_D[`op] == `ori_op)   ||
							(IR_D[`op] == `lui_op)   ||
							(IR_D[`op] == `addi_op)  ||
							(IR_D[`op] == `andi_op)  ||
							(IR_D[`op] == `xori_op)  ||
							(IR_D[`op] == `slti_op)  ||
							(IR_D[`op] == `sltiu_op) ||
							(IR_D[`op] == `addiu_op);		//ori,lui,addi,andi,xori,slti,sltiu,addiu

	 assign load_D = (IR_D[`op] == `lw_op)  ||
						  (IR_D[`op] == `lb_op)  ||
	                 (IR_D[`op] == `lbu_op) ||
	                 (IR_D[`op] == `lh_op)  ||
	                 (IR_D[`op] == `lhu_op) ; //lw,lb,lbu,lh,lhu
	 
	 assign store_D = (IR_D[`op] == `sw_op) ||
	                  (IR_D[`op] == `sb_op) ||
							(IR_D[`op] == `sh_op);										//sw, sb, sh
	 
	 assign jal_D = (IR_D[`op] == `jal_op) ||
						 ((IR_D[`op] == `bgezal_op)&&(IR_D[`rt] == `bgezal_rt));                                 //jal,bgezal
	 
	 
	 assign b_E = (IR_E[`op] == `beq_op)||
					  (IR_E[`op] == `bne_op);//beq,bne
	
	 assign b_rs_E = ((IR_E[`op] == `bgezal_op)&&(IR_E[`rt] == `bgezal_rt))||
					     ((IR_E[`op] == `bgtz_op  )&&(IR_E[`rt] == `bgtz_rt  ))||
					     ((IR_E[`op] == `bltz_op  )&&(IR_E[`rt] == `bltz_rt  ))||
					     ((IR_E[`op] == `bgez_op  )&&(IR_E[`rt] == `bgez_rt  ))||
					     ((IR_E[`op] == `blez_op  )&&(IR_E[`rt] == `blez_rt  ))||
					     ((IR_E[`op] == `op_r     )&&(IR_E[`func] == `jr_func));//bgezal,bgtz,bltz,bgez,blez,jr
						  
	 assign jalr_E = (IR_E[`op] == `op_r)&&(IR_E[`func] == `jalr_func);//jalr
					  
	 assign cal_r_E = ((IR_E[`op] == `op_r)&&(IR_E[`func] == `addu_func))||
	                  ((IR_E[`op] == `op_r)&&(IR_E[`func] == `add_func ))||
							((IR_E[`op] == `op_r)&&(IR_E[`func] == `subu_func))||
							((IR_E[`op] == `op_r)&&(IR_E[`func] == `sub_func ))||
							((IR_E[`op] == `op_r)&&(IR_E[`func] == `movz_func))||
							((IR_E[`op] == `op_r)&&(IR_E[`func] == `Or_func  ))||
							((IR_E[`op] == `op_r)&&(IR_E[`func] == `nor_func ))||
							((IR_E[`op] == `op_r)&&(IR_E[`func] == `And_func ))||
							((IR_E[`op] == `op_r)&&(IR_E[`func] == `Xor_func ))||
							((IR_E[`op] == `op_r)&&(IR_E[`func] == `slt_func ))||
							((IR_E[`op] == `op_r)&&(IR_E[`func] == `sltu_func))||
							((IR_E[`op] == `op_r)&&(IR_E[`func] == `sll_func ))||
							((IR_E[`op] == `op_r)&&(IR_E[`func] == `sllv_func))||
							((IR_E[`op] == `op_r)&&(IR_E[`func] == `sra_func ))||
							((IR_E[`op] == `op_r)&&(IR_E[`func] == `srav_func))||
							((IR_E[`op] == `op_r)&&(IR_E[`func] == `srlv_func))||
							((IR_E[`op] == `op_r)&&(IR_E[`func] == `mult_func))||
							((IR_E[`op] == `op_r)&&(IR_E[`func] == `multu_func))||
							((IR_E[`op] == `op_r)&&(IR_E[`func] == `div_func ))||
							((IR_E[`op] == `op_r)&&(IR_E[`func] == `divu_func))||
							((IR_E[`op] == `op_r)&&(IR_E[`func] == `mfhi_func))||
							((IR_E[`op] == `op_r)&&(IR_E[`func] == `mflo_func))||
							((IR_E[`op] == `op_r)&&(IR_E[`func] == `mthi_func))||
							((IR_E[`op] == `op_r)&&(IR_E[`func] == `mtlo_func))||
							((IR_E[`op] == `op_r)&&(IR_E[`func] == `srl_func ));//addu,add,subu,sub,movz,or,nor,and,xor,slt,sltu,sll,sllv,sra,srav,srlv,srl
							
	 assign cal_i_E = (IR_E[`op] == `ori_op)   ||
							(IR_E[`op] == `lui_op)   ||
							(IR_E[`op] == `addi_op)  ||
							(IR_E[`op] == `andi_op)  ||
							(IR_E[`op] == `xori_op)  ||
							(IR_E[`op] == `slti_op)  ||
							(IR_E[`op] == `sltiu_op) ||
							(IR_E[`op] == `addiu_op);		//ori,lui,addi,andi,xori,slti,sltiu,addiu

	 assign load_E = (IR_E[`op] == `lw_op)  ||
	                 (IR_E[`op] == `lb_op)  ||
	                 (IR_E[`op] == `lbu_op) ||
	                 (IR_E[`op] == `lh_op)  ||
						  (IR_E[`op] == `lhu_op);										//lw,lb,lbu,lh,lhu
	 
	 assign store_E = (IR_E[`op] == `sw_op) ||
	                  (IR_E[`op] == `sb_op) ||
							(IR_E[`op] == `sh_op);										//sw, sb, sh
	 
	 assign jal_E = (IR_E[`op] == `jal_op)||
						 ((IR_E[`op] == `bgezal_op)&&(IR_E[`rt] == `bgezal_rt));                                 //jal,bgezal
	 
	 
	 
	 assign b_M = (IR_M[`op] == `beq_op)||
					  (IR_M[`op] == `bne_op);//beq,bne
	
	 assign b_rs_M = ((IR_M[`op] == `bgezal_op)&&(IR_M[`rt] == `bgezal_rt))||
					     ((IR_M[`op] == `bgtz_op  )&&(IR_M[`rt] == `bgtz_rt  ))||
					     ((IR_M[`op] == `bltz_op  )&&(IR_M[`rt] == `bltz_rt  ))||
					     ((IR_M[`op] == `bgez_op  )&&(IR_M[`rt] == `bgez_rt  ))||
					     ((IR_M[`op] == `blez_op  )&&(IR_M[`rt] == `blez_rt  ))||
					     ((IR_M[`op] == `op_r     )&&(IR_M[`func] == `jr_func));//bgezal,bgtz,bltz,bgez,blez,jr
		
	 assign jalr_M = (IR_M[`op] == `op_r)&&(IR_M[`func] == `jalr_func);//jalr
		
	 assign cal_r_M = ((IR_M[`op] == `op_r)&&(IR_M[`func] == `addu_func))||
	                  ((IR_M[`op] == `op_r)&&(IR_M[`func] == `add_func ))||
							((IR_M[`op] == `op_r)&&(IR_M[`func] == `subu_func))||
							((IR_M[`op] == `op_r)&&(IR_M[`func] == `sub_func ))||
							((IR_M[`op] == `op_r)&&(IR_M[`func] == `movz_func))||
							((IR_M[`op] == `op_r)&&(IR_M[`func] == `Or_func  ))||
							((IR_M[`op] == `op_r)&&(IR_M[`func] == `nor_func ))||
							((IR_M[`op] == `op_r)&&(IR_M[`func] == `And_func ))||
							((IR_M[`op] == `op_r)&&(IR_M[`func] == `Xor_func ))||
							((IR_M[`op] == `op_r)&&(IR_M[`func] == `slt_func ))||
							((IR_M[`op] == `op_r)&&(IR_M[`func] == `sltu_func))||
							((IR_M[`op] == `op_r)&&(IR_M[`func] == `sll_func ))||
							((IR_M[`op] == `op_r)&&(IR_M[`func] == `sllv_func))||
							((IR_M[`op] == `op_r)&&(IR_M[`func] == `sra_func ))||
							((IR_M[`op] == `op_r)&&(IR_M[`func] == `srav_func))||
							((IR_M[`op] == `op_r)&&(IR_M[`func] == `srlv_func))||
							((IR_M[`op] == `op_r)&&(IR_M[`func] == `mult_func))||
							((IR_M[`op] == `op_r)&&(IR_M[`func] == `multu_func))||
							((IR_M[`op] == `op_r)&&(IR_M[`func] == `div_func ))||
							((IR_M[`op] == `op_r)&&(IR_M[`func] == `divu_func))||
							((IR_M[`op] == `op_r)&&(IR_M[`func] == `mfhi_func))||
							((IR_M[`op] == `op_r)&&(IR_M[`func] == `mflo_func))||
							((IR_M[`op] == `op_r)&&(IR_M[`func] == `mthi_func))||
							((IR_M[`op] == `op_r)&&(IR_M[`func] == `mtlo_func))||
							((IR_M[`op] == `op_r)&&(IR_M[`func] == `srl_func ));//addu,add,subu,sub,movz,or,nor,and,xor,slt,sltu,sll,sllv,sra,srav,srlv,srl
							
	 assign cal_i_M = (IR_M[`op] == `ori_op)   ||
							(IR_M[`op] == `lui_op)   ||
							(IR_M[`op] == `addi_op)  ||
							(IR_M[`op] == `andi_op)  ||
							(IR_M[`op] == `xori_op)  ||
							(IR_M[`op] == `slti_op)  ||
							(IR_M[`op] == `sltiu_op) ||
							(IR_M[`op] == `addiu_op);		//ori,lui,addi,andi,xori,slti,sltiu,addiu

	 assign load_M = (IR_M[`op] == `lw_op)  ||
	                 (IR_M[`op] == `lb_op)  ||
	                 (IR_M[`op] == `lbu_op) ||
	                 (IR_M[`op] == `lh_op)  ||
						  (IR_M[`op] == `lhu_op);										//lw,lb,lbu,lh,lhu
	 
	 assign store_M = (IR_M[`op] == `sw_op) ||
	                  (IR_M[`op] == `sb_op) ||
							(IR_M[`op] == `sh_op);										//sw, sb, sh
	 
	 assign jal_M = (IR_M[`op] == `jal_op) ||
						 ((IR_M[`op] == `bgezal_op)&&(IR_M[`rt] == `bgezal_rt));                                 //jal,bgezal
	 
	 
	 assign b_W = (IR_W[`op] == `beq_op)||
					  (IR_W[`op] == `bne_op);//beq,bne
	
	 assign b_rs_W = ((IR_W[`op] == `bgezal_op)&&(IR_W[`rt] == `bgezal_rt))||
					     ((IR_W[`op] == `bgtz_op  )&&(IR_W[`rt] == `bgtz_rt  ))||
					     ((IR_W[`op] == `bltz_op  )&&(IR_W[`rt] == `bltz_rt  ))||
					     ((IR_W[`op] == `bgez_op  )&&(IR_W[`rt] == `bgez_rt  ))||
					     ((IR_W[`op] == `blez_op  )&&(IR_W[`rt] == `blez_rt  ))||
					     ((IR_W[`op] == `op_r     )&&(IR_W[`func] == `jr_func));//bgezal,bgtz,bltz,bgez,blez,jr
						  
	 assign jalr_W = (IR_W[`op] == `op_r)&&(IR_W[`func] == `jalr_func);//jalr
					  
	 assign cal_r_W = ((IR_W[`op] == `op_r)&&(IR_W[`func] == `addu_func))||
	                  ((IR_W[`op] == `op_r)&&(IR_W[`func] == `add_func ))||
							((IR_W[`op] == `op_r)&&(IR_W[`func] == `subu_func))||
							((IR_W[`op] == `op_r)&&(IR_W[`func] == `sub_func ))||
							((IR_W[`op] == `op_r)&&(IR_W[`func] == `movz_func))||
							((IR_W[`op] == `op_r)&&(IR_W[`func] == `Or_func  ))||
							((IR_W[`op] == `op_r)&&(IR_W[`func] == `nor_func ))||
							((IR_W[`op] == `op_r)&&(IR_W[`func] == `And_func ))||
							((IR_W[`op] == `op_r)&&(IR_W[`func] == `Xor_func ))||
							((IR_W[`op] == `op_r)&&(IR_W[`func] == `slt_func ))||
							((IR_W[`op] == `op_r)&&(IR_W[`func] == `sltu_func))||
							((IR_W[`op] == `op_r)&&(IR_W[`func] == `sll_func ))||
							((IR_W[`op] == `op_r)&&(IR_W[`func] == `sllv_func))||
							((IR_W[`op] == `op_r)&&(IR_W[`func] == `sra_func ))||
							((IR_W[`op] == `op_r)&&(IR_W[`func] == `srav_func))||
							((IR_W[`op] == `op_r)&&(IR_W[`func] == `srlv_func))||
							((IR_W[`op] == `op_r)&&(IR_W[`func] == `mult_func))||
							((IR_W[`op] == `op_r)&&(IR_W[`func] == `multu_func))||
							((IR_W[`op] == `op_r)&&(IR_W[`func] == `div_func ))||
							((IR_W[`op] == `op_r)&&(IR_W[`func] == `divu_func))||
							((IR_W[`op] == `op_r)&&(IR_W[`func] == `mfhi_func))||
							((IR_W[`op] == `op_r)&&(IR_W[`func] == `mflo_func))||
							((IR_W[`op] == `op_r)&&(IR_W[`func] == `mthi_func))||
							((IR_W[`op] == `op_r)&&(IR_W[`func] == `mtlo_func))||
							((IR_W[`op] == `op_r)&&(IR_W[`func] == `srl_func ));//addu,add,subu,sub,movz,or,nor,and,xor,slt,sltu,sll,sllv,sra,srav,srlv,srl
							
	 assign cal_i_W = (IR_W[`op] == `ori_op)   ||
							(IR_W[`op] == `lui_op)   ||
							(IR_W[`op] == `addi_op)  ||
							(IR_W[`op] == `andi_op)  ||
							(IR_W[`op] == `xori_op)  ||
							(IR_W[`op] == `slti_op)  ||
							(IR_W[`op] == `sltiu_op) ||
							(IR_W[`op] == `addiu_op);		//ori,lui,addi,andi,xori,slti,sltiu,addiu

	 assign load_W = (IR_W[`op] == `lw_op)  ||
	                 (IR_W[`op] == `lb_op)  ||
	                 (IR_W[`op] == `lbu_op) ||
	                 (IR_W[`op] == `lh_op)  ||
						  (IR_W[`op] == `lhu_op);										//lw,lb,lbu,lh,lhu
	 
	 assign store_W = (IR_W[`op] == `sw_op) ||
	                  (IR_W[`op] == `sb_op) ||
							(IR_W[`op] == `sh_op);										//sw, sb, sh
	 
	 assign jal_W = (IR_W[`op] == `jal_op) ||
						 ((IR_W[`op] == `bgezal_op)&&(IR_W[`rt] == `bgezal_rt));                      //jal,bgezal
	 
	 
	 //ÔÝÍ£ÅÐ¶Ï
	 wire stall_b;
	 wire stall_b_rs;
	 wire stall_jalr;
	 wire stall_cal_r;
	 wire stall_cal_i;
	 wire stall_load;
	 wire stall_store;
	 wire stall_md;
	 
	 assign stall_b =  b_D &&  ((cal_r_E && (((IR_D[`rs] != 0)&&(IR_D[`rs] == IR_E[`rd])) || ((IR_D[`rt] != 0)&&(IR_D[`rt] == IR_E[`rd])))) ||
									    (cal_i_E && (((IR_D[`rs] != 0)&&(IR_D[`rs] == IR_E[`rt])) || ((IR_D[`rt] != 0)&&(IR_D[`rt] == IR_E[`rt])))) ||
									    (load_E  && (((IR_D[`rs] != 0)&&(IR_D[`rs] == IR_E[`rt])) || ((IR_D[`rt] != 0)&&(IR_D[`rt] == IR_E[`rt])))) ||
									    (load_M  && (((IR_D[`rs] != 0)&&(IR_D[`rs] == IR_M[`rt])) || ((IR_D[`rt] != 0)&&(IR_D[`rt] == IR_M[`rt])))));
	 
	 assign stall_b_rs =  b_rs_D &&  ((cal_r_E && ((IR_D[`rs] != 0)&&(IR_D[`rs] == IR_E[`rd]))) ||
									          (cal_i_E && ((IR_D[`rs] != 0)&&(IR_D[`rs] == IR_E[`rt]))) ||
									          (load_E  && ((IR_D[`rs] != 0)&&(IR_D[`rs] == IR_E[`rt]))) ||
									          (load_M  && ((IR_D[`rs] != 0)&&(IR_D[`rs] == IR_M[`rt]))));
												 
	 assign stall_jalr =  jalr_D &&  ((cal_r_E && ((IR_D[`rs] != 0)&&(IR_D[`rs] == IR_E[`rd]))) ||
									          (cal_i_E && ((IR_D[`rs] != 0)&&(IR_D[`rs] == IR_E[`rt]))) ||
									          (load_E  && ((IR_D[`rs] != 0)&&(IR_D[`rs] == IR_E[`rt]))) ||
									          (load_M  && ((IR_D[`rs] != 0)&&(IR_D[`rs] == IR_M[`rt]))));
	 
	 assign stall_cal_r = cal_r_D && load_E && (((IR_D[`rs] != 0)&&(IR_D[`rs] == IR_E[`rt])) || ((IR_D[`rt] != 0)&&(IR_D[`rt] == IR_E[`rt]))); 
	 
	 assign stall_cal_i = cal_i_D && load_E && ((IR_D[`rs] != 0)&&(IR_D[`rs] == IR_E[`rt]));
	 
	 assign stall_load  = load_D  && load_E && ((IR_D[`rs] != 0)&&(IR_D[`rs] == IR_E[`rt]));
	 
	 assign stall_store = store_D && load_E && ((IR_D[`rs] != 0)&&(IR_D[`rs] == IR_E[`rt])) ;
	 
	 assign stall_md = busy_E && (((IR_D[`op] == `op_r)&&(IR_D[`func] == `mult_func))||
										   ((IR_D[`op] == `op_r)&&(IR_D[`func] == `multu_func))||
							            ((IR_D[`op] == `op_r)&&(IR_D[`func] == `div_func ))||
							            ((IR_D[`op] == `op_r)&&(IR_D[`func] == `divu_func))||
							            ((IR_D[`op] == `op_r)&&(IR_D[`func] == `mfhi_func))||
							            ((IR_D[`op] == `op_r)&&(IR_D[`func] == `mflo_func))||
							            ((IR_D[`op] == `op_r)&&(IR_D[`func] == `mthi_func))||
							            ((IR_D[`op] == `op_r)&&(IR_D[`func] == `mtlo_func)));
	 
	 assign stall = (stall_b || stall_b_rs || stall_jalr || stall_cal_r || stall_cal_i || stall_load || stall_store || stall_md)?1:0;
	 
	 assign ForwardAD =  b_D    && (cal_r_M && (IR_D[`rs]!=0) && (IR_D[`rs] == IR_M[`rd]))? 1:
								b_D    && (cal_i_M && (IR_D[`rs]!=0) && (IR_D[`rs] == IR_M[`rt]))? 1:
								b_D    && (jal_M   && (IR_D[`rs] == 31))                         ? 2:
								b_D    && (jalr_M  && (IR_D[`rs]!=0) && (IR_D[`rs] == IR_M[`rd]))? 2:
								b_rs_D && (cal_r_M && (IR_D[`rs]!=0) && (IR_D[`rs] == IR_M[`rd]))? 1:
								b_rs_D && (cal_i_M && (IR_D[`rs]!=0) && (IR_D[`rs] == IR_M[`rt]))? 1:
								b_rs_D && (jal_M   && (IR_D[`rs] == 31))                         ? 2:
								b_rs_D && (jalr_M  && (IR_D[`rs]!=0) && (IR_D[`rs] == IR_M[`rd]))? 2:
								jalr_D && (cal_r_M && (IR_D[`rs]!=0) && (IR_D[`rs] == IR_M[`rd]))? 1:
								jalr_D && (cal_i_M && (IR_D[`rs]!=0) && (IR_D[`rs] == IR_M[`rt]))? 1:
								jalr_D && (jal_M   && (IR_D[`rs] == 31))                         ? 2:
								jalr_D && (jalr_M  && (IR_D[`rs]!=0) && (IR_D[`rs] == IR_M[`rd]))? 2:
																													    0;
																													    
	 
	 assign ForwardBD =  b_D && (cal_r_M && (IR_D[`rt]!=0) && (IR_D[`rt] == IR_M[`rd]))? 1:
								b_D && (cal_i_M && (IR_D[`rt]!=0) && (IR_D[`rt] == IR_M[`rt]))? 1:
								b_D && (jal_M   && (IR_D[`rt] == 31))                         ? 2:
								b_D && (jalr_M  && (IR_D[`rt]!=0) && (IR_D[`rt] == IR_M[`rd]))? 2:
																													 0;
	 
	 assign ForwardAE =  cal_r_E && (cal_r_M && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_M[`rd]))? 1:
								cal_r_E && (cal_i_M && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_M[`rt]))? 1:
								cal_r_E && (cal_r_W && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_W[`rd]))? 2:
								cal_r_E && (cal_i_W && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_W[`rt]))? 2:
								cal_r_E && (load_W  && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_W[`rt]))? 2:
								cal_r_E && (jal_W   && (IR_E[`rs] == 31)) 								? 2:
								cal_r_E && (jalr_W  && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_W[`rd]))? 2:
								cal_r_E && (jal_M   && (IR_E[`rs] == 31))                         ? 3:
								cal_r_E && (jalr_M  && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_M[`rd]))? 3:
								cal_i_E && (cal_r_M && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_M[`rd]))? 1:
								cal_i_E && (cal_i_M && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_M[`rt]))? 1:
								cal_i_E && (cal_r_W && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_W[`rd]))? 2:
								cal_i_E && (cal_i_W && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_W[`rt]))? 2:
								cal_i_E && (load_W  && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_W[`rt]))? 2:
								cal_i_E && (jal_W   && (IR_E[`rs] == 31)) 								? 2:
								cal_i_E && (jalr_W  && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_W[`rd]))? 2:
								cal_i_E && (jal_M   && (IR_E[`rs] == 31))                         ? 3:
								cal_i_E && (jalr_M  && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_M[`rd]))? 3:
								load_E  && (cal_r_M && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_M[`rd]))? 1:
								load_E  && (cal_i_M && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_M[`rt]))? 1:
								load_E  && (cal_r_W && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_W[`rd]))? 2:
								load_E  && (cal_i_W && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_W[`rt]))? 2:
								load_E  && (load_W  && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_W[`rt]))? 2:
								load_E  && (jal_W   && (IR_E[`rs] == 31)) 								? 2:
								load_E  && (jalr_W  && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_W[`rd]))? 2:
								load_E  && (jal_M   && (IR_E[`rs] == 31))                         ? 3:
								load_E  && (jalr_M  && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_M[`rd]))? 3:
								store_E && (cal_r_M && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_M[`rd]))? 1:
								store_E && (cal_i_M && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_M[`rt]))? 1:
								store_E && (cal_r_W && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_W[`rd]))? 2:
								store_E && (cal_i_W && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_W[`rt]))? 2:
								store_E && (load_W  && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_W[`rt]))? 2:
								store_E && (jal_W   && (IR_E[`rs] == 31)) 								? 2:
								store_E && (jalr_W  && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_W[`rd]))? 2:
								store_E && (jal_M   && (IR_E[`rs] == 31))                         ? 3:
								store_E && (jalr_M  && (IR_E[`rs]!=0) && (IR_E[`rs] == IR_M[`rd]))? 3:
																														  0;
	 
	 assign ForwardBE =  cal_r_E && (cal_r_M && (IR_E[`rt]!=0) && (IR_E[`rt] == IR_M[`rd]))? 1:
								cal_r_E && (cal_i_M && (IR_E[`rt]!=0) && (IR_E[`rt] == IR_M[`rt]))? 1:
								cal_r_E && (cal_r_W && (IR_E[`rt]!=0) && (IR_E[`rt] == IR_W[`rd]))? 2:
								cal_r_E && (cal_i_W && (IR_E[`rt]!=0) && (IR_E[`rt] == IR_W[`rt]))? 2:
								cal_r_E && (load_W  && (IR_E[`rt]!=0) && (IR_E[`rt] == IR_W[`rt]))? 2:
								cal_r_E && (jal_W   && (IR_E[`rt] == 31)) 								? 2:
								cal_r_E && (jalr_W  && (IR_E[`rt]!=0) && (IR_E[`rt] == IR_W[`rd]))? 2:
								cal_r_E && (jal_M   && (IR_E[`rt] == 31))                         ? 3:
								cal_r_E && (jalr_M  && (IR_E[`rt]!=0) && (IR_E[`rt] == IR_M[`rd]))? 3:
								store_E && (cal_r_M && (IR_E[`rt]!=0) && (IR_E[`rt] == IR_M[`rd]))? 1:
								store_E && (cal_i_M && (IR_E[`rt]!=0) && (IR_E[`rt] == IR_M[`rt]))? 1:
								store_E && (cal_r_W && (IR_E[`rt]!=0) && (IR_E[`rt] == IR_W[`rd]))? 2:
								store_E && (cal_i_W && (IR_E[`rt]!=0) && (IR_E[`rt] == IR_W[`rt]))? 2:
								store_E && (load_W  && (IR_E[`rt]!=0) && (IR_E[`rt] == IR_W[`rt]))? 2:
								store_E && (jal_W   && (IR_E[`rt] == 31)) 								? 2:
								store_E && (jalr_W  && (IR_E[`rt]!=0) && (IR_E[`rt] == IR_W[`rd]))? 2:
								store_E && (jal_M   && (IR_E[`rt] == 31))                         ? 3:
								store_E && (jalr_M  && (IR_E[`rt]!=0) && (IR_E[`rt] == IR_M[`rd]))? 3:
																														  0;
	 
	 assign ForwardRTM = store_E && ((cal_r_W && (IR_M[`rt]!=0) && (IR_M[`rt] == IR_W[`rd])) ||
										      (cal_i_W && (IR_M[`rt]!=0) && (IR_M[`rt] == IR_W[`rt])) ||
												(load_W  && (IR_M[`rt]!=0) && (IR_M[`rt] == IR_W[`rt])) ||
												(jal_W   && (IR_M[`rt] == 31)) ||
												(jalr_W  && (IR_M[`rt]!=0) && (IR_M[`rt] == IR_W[`rd])));
	 
endmodule
