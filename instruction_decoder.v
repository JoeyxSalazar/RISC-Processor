`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:20:40 12/09/2021 
// Design Name: 
// Module Name:    instruction_decoder 
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
module instruction_decoder(opcode, DA, FS, RW, MB, MD, MJ, MM, MW, MK, B_thru, A_thru);

	input [3:0] opcode, DA;
	
	output reg [2:0] FS;
	output reg RW, MB, MD, MJ, MM, MW, MK, A_thru, B_thru;
	
	always@(opcode)
	begin
		if(opcode[3] == 0)
		begin
			RW <= 1;
			MB <= 0;
			MD <= 0;
			MJ <= 0;
			MW <= 0;
			MK <= 0;
			A_thru <= 0;
			B_thru <= 0;
			case(opcode)
				4'b0000: FS <= 3'b000;
				4'b0001: FS <= 3'b001;
				4'b0010: FS <= 3'b010;
				4'b0011: FS <= 3'b011;
				4'b0100: FS <= 3'b100;
				4'b0101: FS <= 3'b101;
				4'b0110: FS <= 3'b110;
				4'b0111: FS <= 3'b111;
			endcase
		end
		
		else if(opcode == 4'b1000)
		begin
			RW <= 1;
			MB <= 1;
			MD <= 0;
			MJ <= 0;
			MW <= 0;
			MK <= 0;
			A_thru <= 0;
			B_thru <= 1;
		end
		
		else if(opcode == 4'b1001 || opcode == 4'b1010)
		begin
			MM <= 0;
			A_thru <= 0;
			B_thru <= 0;
			MJ <= 0;
			MB <= 0;
			MK <= 0;
			if(opcode[1:0] == 2'b01)
			begin
				RW <= 1;
				MD <= 1;
				MW <= 0;
			end
			else if(opcode[1:0] == 2'b10)
			begin
				RW <= 0;
				MD <= 0;
				MW <= 1;
			end
		end
		
		else if(opcode == 4'b1011 || opcode == 4'b1100)
		begin
			RW <= 0;
			MB <= 0;
			MD <= 0;
			MJ <= 0;
			MW <= 0;
			MK <= 1;
			A_thru <= 1;
			B_thru <= 0;
		end
		
		else if(opcode == 4'b1101)
		begin
			RW <= 1;
			MB <= 0;
			MD <= 0;
			MJ <= 1;
			MW <= 0;
			MK <= 0;
			A_thru <= 0;
			B_thru <= 0;
		end
		
		else if(opcode == 4'b1110)
		begin
			RW <= 0;
			MB <= 0;
			MD <= 0;
			MJ <= 0;
			MW <= 0;
			MK <= 0;
			A_thru <= 0;
			B_thru <= 0;
		end
		
		else if(opcode == 4'b1111 && DA == 4'b0000)
		begin
			RW <= 0;
			MB <= 0;
			MD <= 0;
			MJ <= 0;
			MW <= 0;
			MK <= 0;
			A_thru <= 0;
			B_thru <= 0;
		end
		
		else if(opcode == 4'b1111 && DA == 4'b1111)
		begin
			RW <= 0;
			MB <= 0;
			MD <= 0;
			MJ <= 0;
			MW <= 0;
			MK <= 0;
			A_thru <= 0;
			B_thru <= 0;
		end
	end
	
endmodule
