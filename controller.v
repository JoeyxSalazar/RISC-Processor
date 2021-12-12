`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:11:23 12/09/2021 
// Design Name: 
// Module Name:    controller 
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
module controller(A, data_from_rom, zero_flag, clk, reset, DA, AA, BA, FS, IL, RW, MB, MD, MJ, MM, MW, MK, A_thru, B_thru, PC, PC_prev, done);

	parameter nBit = 16;
	
	input [nBit-1:0] A, data_from_rom; 
	input clk, reset, zero_flag;
	
	output [5:0] PC, PC_prev;
	output [3:0] DA, AA, BA;
	output [2:0] FS;
	output IL, RW, MB, MD, MJ, MM, MW, MK, A_thru, B_thru, done;
	
	wire [3:0] opcode;
	wire [1:0] PS;

	program_counter SE2(.A(A[5:0]),
							  .AA(AA),
							  .BA(BA),
							  .PS(PS),
							  .clk(clk),
							  .reset(reset),
							  .PC(PC),
							  .PC_prev(PC_prev));

	instruction_reg #(nBit) SE3(.control_word(data_from_rom),
										 .instruct_load(IL),
										 .reset(reset),
										 .clk(clk),
										 .opcode(opcode),
										 .DA(DA),
										 .AA(AA),
										 .BA(BA));

	control_logic #(nBit) SE4(.opcode(opcode),
									  .DA(DA),
									  .zero_flag(zero_flag),
									  .clk(clk),
									  .reset(reset),
									  .FS(FS),
									  .PS(PS),
									  .IL(IL),
									  .MB(MB),
									  .MD(MD),
									  .MJ(MJ),
									  .RW(RW),
									  .MM(MM),
									  .MW(MW),
									  .MK(MK),
									  .A_thru(A_thru),
									  .B_thru(B_thru),
									  .done(done));

endmodule
