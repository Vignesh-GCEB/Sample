`timescale 1ns / 1ps
/****************************************
	SURE ProEd Integrated VLSI Internship
	
	Batch name : G4
	
	File Name  :  generator.v
	
	Module Name:  generator
	
	Description: Desiging the processing Unit 
	
	Engineer   : Vignesh
	
	History    : 08DEC2025 (created)
	
****************************************/
module generator(
    input               i_clk,
	input               i_rst, 
	output  reg [31:0]  o_generator
	);
    always@(posedge i_clk)begin
	   if(i_rst)begin
	       o_generator<=0;
	   end
	   else begin
	    o_generator<=o_generator+1;
	   end
    end
endmodule 
