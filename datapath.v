`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:11:35 12/09/2021 
// Design Name: 
// Module Name:    datapath 
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
module datapath(mem, PC, PC_prev, DA, AA, BA, FS, RW, MB, MD, MJ, MM, MK, A_thru, B_thru, reset, clk, zero_flag, MUX_B, MUX_M, A);

	parameter nBit = 16;
	
	input [nBit-1:0] mem;
	input [5:0] PC, PC_prev;
	input [3:0] DA, AA, BA;
	input [2:0] FS;
	input RW, MB, MD, MJ, MM, MK, A_thru, B_thru, reset, clk;
	
	output zero_flag;
	output [nBit-1:0] A;
	output reg [nBit-1:0] MUX_B;
	output reg [5:0] MUX_M;
	
	wire [nBit-1:0] D, B;
	wire [3:0] MUX_K;
	reg [nBit-1:0] MUX_D;
	reg [nBit-1:0] MUX_J;
	
	assign MUX_K = MK ? DA:AA;
	
	register_file #(nBit) CE4(.D(MUX_J),
									  .DA(DA),
									  .AA(MUX_K),
									  .BA(BA),
									  .RW(RW),
									  .reset(reset),
									  .clk(clk),
									  .A(A),
									  .B(B));
	
	always@(*)
	begin
		if(MB == 1)
			MUX_B <= {8'b00000000,{AA, BA}};
		else if(MB == 0)
			MUX_B <= B;
	end
	
	always@(*)
	begin
		if(MM == 1)
			MUX_M <= PC;
		else if(MM == 0)
			MUX_M <= A[5:0];
	end
	
	FunctionalUnit #(nBit) CE5(.FS(FS),
										.A(A),
										.B(MUX_B),
										.A_thru(A_thru),
										.B_thru(B_thru),
										.zero_flag(zero_flag),
										.out(D));
	
	always@(*)
	begin
		if(MD == 1)
			MUX_D <= mem;
		else if(MD == 0)
			MUX_D <= D;
	end
	
	always@(*)
	begin
		if(MJ == 1)
			MUX_J <= PC_prev;
		else if(MJ == 0)
			MUX_J <= MUX_D;
	end

endmodule
