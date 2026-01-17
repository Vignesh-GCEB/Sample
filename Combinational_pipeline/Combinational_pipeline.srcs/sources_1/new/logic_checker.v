`timescale 1ns / 1ps
/****************************************
	SURE ProEd Integrated VLSI Internship
	Batch name : G4
	
	File Name  :  logic_checker.v
	
	Module Name:  logic_checker
	
	Description: designing logic checker
	
	Engineer   : Vignesh
	
	History    : 08DEC2025 (created)
	
****************************************/
module logic_checker(
	input 				i_clk,
	input 				i_rst,
	input 		[7:0]	i_e,
	input 		[7:0]	i_f,
	output reg 	[7:0]	o_d1,
	output reg 	[32:0] 	o_count,
	output              o_valid,
	output      [7:0]   o_val
);
	always@(posedge i_clk)begin
		o_d1 <= i_e;
			if(o_d1==i_f)begin
				o_count <= o_count+1;
			end
	end
   assign  o_val   = (i_e==i_f);
   assign  o_valid = (o_val[0] & o_val[1] & o_val[2] & o_val[3] & o_val[4] & o_val[5] & o_val[6] & o_val[7]);
endmodule