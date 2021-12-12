`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:16:09 12/09/2021 
// Design Name: 
// Module Name:    add_sub 
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
module add_sub(A, B, cond, out);

	parameter nBit = 16;
	
	input [nBit-1:0] A, B;
	input cond;
	
	output [nBit-1:0] out;
	
	reg [nBit-1:0] B_actual;
	wire [nBit-1:0] c;
	
	always@(*)
	begin
		if(cond)
			B_actual <= ~B + cond;
		else
			B_actual <= B;
	end
	
	genvar i;
	generate
		for(i=0; i <= nBit-1; i=i+1)
		begin: generate_add_sub
			if(i==0)
				half_adder HA(A[0], B_actual[0], c[0], out[0]);
			else
				full_adder FA(A[i], B_actual[i], c[i-1], c[i], out[i]);
		end
	endgenerate
	
endmodule
