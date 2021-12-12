`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:19:16 12/09/2021 
// Design Name: 
// Module Name:    program_counter 
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
module program_counter(A, AA, BA, PS, clk, reset, PC, PC_prev);

	input [5:0] A;
	input [3:0] AA, BA;
	input [1:0] PS;
	input clk, reset;
	
	output reg [5:0] PC;
	output reg [5:0] PC_prev;
	
	always@(negedge clk)
	begin
		if(reset)
		begin
			PC <= 0;
			PC_prev <= 0;
		end
		else
		begin
			case(PS)
				2'b00: 
				begin
					PC <= PC;
					PC_prev <= PC_prev;
				end
				
				2'b01:
				begin
					PC <= PC + 1'b1;
					PC_prev <= PC_prev + 1'b1;
				end
				
				2'b10:
				begin
					PC <= PC + 1'b1 + ({AA[1:0], BA});
					PC_prev <= PC_prev + 1'b1;
				end
				
				2'b11:
				begin
					PC <= A;
					PC_prev <= A;
				end
			endcase
		end
	end

endmodule
