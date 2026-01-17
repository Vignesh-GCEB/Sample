`timescale 1ns / 1ps
/****************************************
	SURE ProEd Integrated VLSI Internship
	Batch name : G4
	
	File Name  :  top_module.v
	
	Module Name:  top_module
	
	Description: integrating all the sub modules
	
	Engineer   : Vignesh
	
	History    : 08DEC2025 (created)
	
****************************************/

module top_module (
   input             i_clk,
   input             i_rst,
   output            o_valid,
   output [32:0]     o_hit_cnt
);
   wire [31:0] data; 
   wire [7:0] e; 
   wire [7:0] f;
   wire  [7:0] o_val;
    
   // ---------- Generator Instantiation ------------
   generator data_gen_inst_1 (
      .i_clk      (i_clk),
      .i_rst      (i_rst),
      .o_generator(data )
   );
   // -------------- LPU Instantiation ----------------
   logic_processor_unit lpu_inst_1 (
      .i_clk     (i_clk      ),
      .i_rst     (i_rst      ),
      .i_a       (data[7:0]  ),
      .i_b       (data[15:8] ),
      .i_c       (data[23:16]),
      .i_d       (data[31:24]),
      .o_e       (e          ),
      .o_f       (f          )
   );
   // ------------ Checker Instantiation --------------
   logic_checker check_inst_1 (
      .i_clk     (i_clk      ),
      .i_rst     (i_rst      ),
      .i_e       (e          ),
      .i_f       (f          ),
      .o_count   (o_hit_cnt  ),
      .o_valid   (o_valid    ),
      .o_val     (o_val      )
   );
endmodule
