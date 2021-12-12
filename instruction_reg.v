`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:19:43 12/09/2021 
// Design Name: 
// Module Name:    instruction_reg 
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
module instruction_reg(control_word, instruct_load, reset, clk, opcode, DA, AA, BA);

	parameter nBit = 16;
	
	input [nBit-1:0] control_word;
	input instruct_load;
	input reset, clk;
	
	output reg [3:0] opcode, DA, AA, BA;

	always@(negedge clk)
	begin
		if(reset)
		begin
			opcode <= 0;
			DA <= 0;
			AA <= 0;
			BA <= 0;
		end
		else
		begin
			if(instruct_load)
			begin
				opcode <= control_word[nBit-1:nBit-4];
				DA <= control_word[nBit-5:nBit-8];
				AA <= control_word[nBit-9:nBit-12];
				BA <= control_word[nBit-13:nBit-16];
			end
			else if(instruct_load == 0)
			begin
				opcode <= opcode;
				DA <= DA;
				AA <= AA;
				BA <= BA;
			end
		end
	end

endmodule
