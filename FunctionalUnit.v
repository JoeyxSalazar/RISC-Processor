`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:14:32 12/09/2021 
// Design Name: 
// Module Name:    FunctionalUnit 
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
module FunctionalUnit(FS, A, B, A_thru, B_thru, zero_flag, out);

	parameter nBit = 16;
	
	input [2:0] FS;
	input [nBit-1:0] A, B;
	input A_thru, B_thru;
	
	output reg zero_flag;
	output reg [nBit-1:0] out;
	
	wire [nBit-1:0] ALU_out;
	wire [nBit-1:0] shift_out;
	
	ALU #(nBit) CE2(.FS(FS),
						 .A(A),
						 .B(B),
						 .out(ALU_out));
	
	ShiftArray #(nBit) CE3(.In(A),
								  .sh_cond(FS[0]),
								  .out(shift_out));
	
	always@(*)
	begin
		if(B_thru)
			out <= B;
		else if(A_thru)
			out <= A;
		else
		begin
			if(FS[2] && FS[1])
				out <= shift_out;
			else
				out <= ALU_out;
		end
	end
	
	always@(*)
	begin
		if(out == 0)
			zero_flag <= 1;
		else
			zero_flag <= 0;
	end
	
endmodule
