`timescale 1ns / 1ps
/****************************************
	SURE ProEd Integrated VLSI Internship
	
	Batch name : G4
	
	File Name  :  pulse_gen.v
	
	Module Name:  pulse_gen
	
	Description: Deginging a pulse generator
	
	Engineer   : Vignesh
	
	History    : 07DEC2025 (created)
	
****************************************/

module pulse_gen(
	input          i_clk,
	input          i_rst,
	input          i_pulse_duration,
	input          i_pulse_period,
	output reg     o_pulse,
	output reg     o_invalid_pulse
);
	reg [2:0]pulse_conrt_cont = 3'd0;
	reg [2:0]high_pulse_count = 3'd0;
	reg [2:0]low_pulse_count  = 3'd0;

always@(posedge i_clk)begin

	if(i_rst)begin
		pulse_conrt_cont <=  0;
	end
	
	else begin
		pulse_conrt_cont <= pulse_conrt_cont+1;
	end
	
end

always@(*)begin

	if(i_rst)begin
		o_pulse           <= 0;
		o_invalid_pulse   <= 0;
	end
	
	else begin
	
		if(pulse_conrt_cont<i_pulse_duration && i_pulse_duration<=i_pulse_period)begin
			o_pulse          <= 1'b1;
			o_invalid_pulse  <= 1'b0;
			high_pulse_count <= high_pulse_count+1;
		end
		else begin
			o_pulse          <=  1'b0;
			o_invalid_pulse  <=  1'b1;
			low_pulse_count  <=  low_pulse_count+1;
		end
	end
end

	//$display("total no of high pulse = %0d",high_pulse_count);
	//$display("total no of low pulse = %0d",low_pulse_count);
endmodule
