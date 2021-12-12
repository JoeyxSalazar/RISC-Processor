`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:06:38 12/09/2021 
// Design Name: 
// Module Name:    CPU 
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
module CPU(data_from_rom, reset, clk, address_to_rom, enable_to_rom, data_from_ram, data_to_ram, write_enable_to_ram, address_to_ram, read_enable_to_ram, enable_ram_read);

	parameter nBit = 16;
	
	input [nBit-1:0] data_from_rom, data_from_ram;
	input clk, reset;
	
	output [nBit-1:0] data_to_ram;
	output [5:0] address_to_rom, address_to_ram;
	output enable_to_rom, write_enable_to_ram, read_enable_to_ram, enable_ram_read;
	
	wire [nBit-1:0] A;
	wire [5:0] PC, PC_prev;
	wire [3:0] DA, AA, BA;
	wire [2:0] FS;
	wire zero_flag, IL, RW, MB, MD, MJ, MM, MW, MK, A_thru, B_thru, done;
	
	controller #(nBit) T1(.A(A),
								 .data_from_rom(data_from_rom),
								 .zero_flag(zero_flag),
								 .clk(clk), .reset(reset),
								 .DA(DA),
								 .AA(AA),
								 .BA(BA),
								 .FS(FS),
								 .IL(IL),
								 .RW(RW),
								 .MB(MB),
								 .MD(MD),
								 .MJ(MJ),
								 .MM(MM),
								 .MW(MW),
								 .MK(MK),
								 .A_thru(A_thru),
								 .B_thru(B_thru),
								 .PC(PC),
								 .PC_prev(PC_prev),
								 .done(done));
	
	datapath #(nBit) T2(.mem(data_from_ram),
							  .PC(PC),
							  .PC_prev(PC_prev),
							  .DA(DA),
							  .AA(AA),
							  .BA(BA),
							  .FS(FS),
							  .RW(RW),
							  .MB(MB),
							  .MD(MD),
							  .MJ(MJ),
							  .MM(MM),
							  .MK(MK),
							  .A_thru(A_thru),
							  .B_thru(B_thru),
							  .reset(reset),
							  .clk(clk),
							  .zero_flag(zero_flag),
							  .MUX_B(data_to_ram),
							  .MUX_M(address_to_rom),
							  .A(A));
	
	assign enable_to_rom = ~IL;
	
	assign write_enable_to_ram = MW;
	assign read_enable_to_ram = 1'b1;
	
	assign address_to_ram = A[5:0];
	
	assign enable_ram_read = done;
	
endmodule
