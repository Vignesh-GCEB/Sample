/*****************************************************************************************************************************************
								Hardware Modelling Series
	Module_Name  : primitive_carry

	File_Name    : primitive_carry.v

	Description  : Designing the carry circuit using primitive method 
		      -in this type of design we use the truth table

	Engineer     : Vignesh 

	Date 	     : 03/Mar/26

******************************************************************************************************************************************/

'timescale 1ns/1ps
'default_nettype none

primitive primitive_adder (
	output  o_carry, //output carry
	input   i_a,    // operand a
	input   i_b,    //operand b
	input   i_c,    // carry input
	);

	table
		i_a i_b i_c : o_carry
		1   1   ?   : 1 ;      
		1   ?   1   : 1 ;
		?   1   1   : 1 ;      // if any two inputs are high the carry will generate otherwise not 
		0   0   ?   : 0 ;      // in UDP Method we can only able to build the circuit with one out put only
		0   ?   0   : 0 ;
		?   0   0   : 0 ;
	endtable
endprimitive
default_nettype wire
	      	    
