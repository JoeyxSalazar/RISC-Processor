`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:13:45 12/09/2021 
// Design Name: 
// Module Name:    register_file 
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
module register_file(D, DA, AA, BA, RW, clk, reset, A, B);
	
	parameter nBit = 16;

	input [15:0] D;
	input [3:0] DA, AA, BA;
	input RW, reset, clk;
	
	output reg [15:0] A, B;
	 
	reg [15:0] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg15;
	
	always @(negedge clk)
	begin
		if(reset)
		begin
			reg0 <= 0;
			reg1 <= 0;
			reg2 <= 0;
			reg3 <= 0;
			reg4 <= 0;
			reg5 <= 0;
			reg6 <= 0;
			reg7 <= 0;
			reg8 <= 0;
			reg9 <= 0;
			reg10 <= 0;
			reg11 <= 0;
			reg12 <= 0;
			reg13 <= 0;
			reg14 <= 0;
			reg15 <= 0;
		end
		else
		begin
			if(RW)
			begin
				case(DA)
					4'b0000: reg0 <= D;
					4'b0001: reg1 <= D;
					4'b0010: reg2 <= D;
					4'b0011: reg3 <= D;
					4'b0100: reg4 <= D;
					4'b0101: reg5 <= D;
					4'b0110: reg6 <= D;
					4'b0111: reg7 <= D;
					4'b1000: reg8 <= D;
					4'b1001: reg9 <= D;
					4'b1010: reg10 <= D;
					4'b1011: reg11 <= D;
					4'b1100: reg12 <= D;
					4'b1101: reg13 <= D;
					4'b1110: reg14 <= D;
					4'b1111: reg15 <= D;
				endcase
			end
			
			else if(RW == 0)
			begin
				reg0 <= reg0;
				reg1 <= reg1;
				reg2 <= reg2;
				reg3 <= reg3;
				reg4 <= reg4;
				reg5 <= reg5;
				reg6 <= reg6;
				reg7 <= reg7;
				reg8 <= reg8;
				reg9 <= reg9;
				reg10 <= reg10;
				reg11 <= reg11;
				reg12 <= reg12;
				reg13 <= reg13;
				reg14 <= reg14;
				reg15 <= reg15;
			end
		end
	end
	
	always @(*)
	begin
		case(AA)
			4'b0000 : A <= reg0;
			4'b0001 : A <= reg1;
			4'b0010 : A <= reg2;
			4'b0011 : A <= reg3;
			4'b0100 : A <= reg4;
			4'b0101 : A <= reg5;
			4'b0110 : A <= reg6;
			4'b0111 : A <= reg7;
			4'b1000 : A <= reg8;
			4'b1001 : A <= reg9;
			4'b1010 : A <= reg10;
			4'b1011 : A <= reg11;
			4'b1100 : A <= reg12;
			4'b1101 : A <= reg13;
			4'b1110 : A <= reg14;
			4'b1111 : A <= reg15;
		endcase
				
		case(BA)
			4'b0000 : B <= reg0;
			4'b0001 : B <= reg1;
			4'b0010 : B <= reg2;
			4'b0011 : B <= reg3;
			4'b0100 : B <= reg4;
			4'b0101 : B <= reg5;
			4'b0110 : B <= reg6;
			4'b0111 : B <= reg7;
			4'b1000 : B <= reg8;
			4'b1001 : B <= reg9;
			4'b1010 : B <= reg10;
			4'b1011 : B <= reg11;
			4'b1100 : B <= reg12;
			4'b1101 : B <= reg13;
			4'b1110 : B <= reg14;
			4'b1111 : B <= reg15;
		endcase
	end
	
endmodule
