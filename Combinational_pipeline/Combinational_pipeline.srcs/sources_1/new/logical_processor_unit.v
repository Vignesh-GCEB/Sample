`timescale 1ns / 1ps
/****************************************
	SURE ProEd Integrated VLSI Internship
	
	Batch name : G4
	
	File Name  :  logical_processing_unit.v
	
	Module Name:  logical_processor_unit
	
	Description: Desiging the processing Unit 
	
	Engineer   : Vignesh
	
	History    : 08DEC2025 (created)
	
****************************************/
module logic_processor_unit(
	input              i_clk,
	input              i_rst,
	input      [7:0]   i_a,
	input      [7:0]   i_b,
	input      [7:0]   i_c,
	input      [7:0]   i_d,
	output reg [7:0]   o_e,
	output reg [7:0]   o_f
);
    //reg [1:0] cont;
    reg [7:0]o_w1,o_w2,o_w3;
    always@(posedge i_clk)begin
	   o_w1 <= (i_a|i_b&i_c);
	   o_e  <= (i_a|o_w1);
    end	
    always@(posedge i_clk)begin
	   o_w2 <= (i_a|i_d);
	   o_w1 <= (i_a|i_b&i_c);
	   o_w3 <= (o_w1^o_w2);
	   o_f  <= o_w3;
    end
endmodule 