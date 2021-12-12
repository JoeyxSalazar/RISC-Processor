`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:02:05 12/10/2021
// Design Name:   top_level
// Module Name:   C:/Users/Karna Nagalla/Desktop/ECE/ECE414/FinalProjectParts/CPU/CPU/tb_top_level.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top_level
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_top_level;

	// Inputs
	reg reset;
	reg clk;

	// Outputs
	wire UART_TX;

	// Instantiate the Unit Under Test (UUT)
	top_level uut (
		.reset(reset), 
		.clk(clk), 
		.UART_TX(UART_TX)
	);

	initial begin
		// Initialize Inputs
		reset = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset = 1;
		#100;
		
		reset = 0;
		#100;

	end
	
	always
	#5 clk = ~clk;
      
endmodule

