`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:20:12 12/09/2021 
// Design Name: 
// Module Name:    control_logic 
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
module control_logic(opcode, DA, zero_flag, clk, reset, FS, PS, IL, MB, MD, MJ, RW, MM, MW, MK, A_thru, B_thru, done);

	parameter nBit = 16;
	parameter s0 = 3'b000,
				 s1 = 3'b001,
				 s2 = 3'b010,
				 s3 = 3'b011,
				 s4 = 3'b100,
				 s5 = 3'b101;
				 
	input [3:0] opcode, DA;
	input zero_flag, clk, reset;
	
	output [2:0] FS;
	output reg [1:0] PS;
	output reg IL, MM, RW, done;
	output MB, MD, MJ, MW, MK, A_thru, B_thru;
	
	reg [2:0] state;
	wire MM_decode;
	wire RW_decode;
			
	instruction_decoder SE1(.opcode(opcode),
									.DA(DA),
									.FS(FS),
									.RW(RW_decode),
									.MB(MB),
									.MD(MD),
									.MJ(MJ),
									.MM(MM_decode),
									.MW(MW),
									.MK(MK),
									.B_thru(B_thru),
									.A_thru(A_thru));
	
	always@(posedge clk)
	begin
		if(reset)
		begin
			state <= s0;
		end
		else
		begin
			case(state)
				s0: state <= s1;
				s1:
				begin
					if(opcode[3] == 0 || opcode == 4'b1000 || opcode == 4'b1001 || opcode == 4'b1010 || (opcode == 4'b1011 && zero_flag == 0) || (opcode == 4'b1100 && zero_flag == 1))
						state <= s2;
					else if((opcode == 4'b1011 && zero_flag == 1) || (opcode == 4'b1100 && zero_flag == 0) || (opcode == 4'b1101) || (opcode == 4'b1110))
						state <= s3;
					else if(opcode == 4'b1111 && DA == 4'b0000)
						state <= s4;
					else if(opcode == 4'b1111 && DA == 4'b1111)
						state <= s5;
				end
				s2: state <= s1;
				s3: state <= s1;
				s4: state <= s1;
				s5: state <= s5;
			endcase
		end
	end
			
	always@(state)
	begin
		case(state)
			s0:
			begin
				done <= 0;
				PS <= 2'b00;
				IL <= 0;
				MM <= 1;
				RW <= 0;
			end
			s1: // execution step
			begin
				PS <= 2'b00;
				IL <= 1;
				MM <= 0;
				RW <= RW_decode;
			end
			s2:
			begin
				PS <= 2'b01;
				IL <= 0;
				MM <= 1;
				RW <= 0;
			end
			s3:
			begin
				PS <= 2'b10;
				IL <= 0;
				MM <= 1;
				RW <= 0;
			end
			s4:
			begin
				PS <= 2'b11;
				IL <= 0;
				MM <= 1;
				RW <= 0;
			end
			s5:
			begin
				done <= 1;
				IL <= 0;
				MM <= 1;
				RW <= 0;
			end
			
		endcase
	end

endmodule
