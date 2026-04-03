/**********************************************************************************************************************
							Hardware Modelling Series
	Module Name : FA

	File Name   : FA.v

	Description : 1-bit full adder 

	Engineer    : Vignesh
	
	History     : 26/FEB/2026

***************************************************************************************************************************/

'timescale 1ns/1ps
'default_nettype none

module FA(
	input  wire   i_A,      // operand A
	input  wire   i_B,	// operand B
	input  wire   i_Cin,    // Carry input
	output wire   o_sum,    // Sum output
	output wire   o_carry   // Carry Output
);	
	// Sum equation : A ^ B ^ Carry input
	assign o_sum   = i_A ^ i_B ^i_Cin;

	// Carry Equation : AB + carry input(A^B)
	assign o_carry = (i_A&i_B) | (i_Cin&(i_A^i_B));	
endmodule

'default_nettype wire
