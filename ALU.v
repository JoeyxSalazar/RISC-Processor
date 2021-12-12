`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:15:41 12/09/2021 
// Design Name: 
// Module Name:    ALU 
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
module ALU(FS, A, B, out);

	parameter nBit = 16;
	
	input [2:0] FS;
	input [nBit-1:0] A, B;
	
	output reg [nBit-1:0] out;
	
	wire [nBit-1:0] arith_out;
	
	add_sub #(nBit) CE1(.A(A),
							  .B(B),
							  .cond(FS[0]),
							  .out(arith_out));
	
	always@(*)
	begin
		if(FS[2:1] == 2'b00)
			out <= arith_out;
		else if(FS[2] || FS[1])
		begin
			case(FS[1:0])
				2'b10: out <= A & B;
				2'b11: out <= A | B;
				2'b00: out <= A ^ B;
				2'b01: out <= ~A;
			endcase
		end
	end
		
endmodule
