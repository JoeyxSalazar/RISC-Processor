`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:17:35 12/09/2021 
// Design Name: 
// Module Name:    ShiftArray 
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
module ShiftArray(In, sh_cond, out);

	parameter nBit = 16;
	
	input [nBit-1:0] In;
	input sh_cond;
	
	output reg [nBit-1:0] out;
	
	always@(*)
	begin
		if(sh_cond == 0)
			out <= {In[nBit-2:0], 1'b0};
		else if(sh_cond == 1)
			out <= {In[nBit-1], In[nBit-1:1]};
	end
	
endmodule
