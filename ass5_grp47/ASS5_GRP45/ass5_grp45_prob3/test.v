`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:05:40 08/26/2018
// Design Name:   booth_multiplier
// Module Name:   /home/anusha/mutliplier/test.v
// Project Name:  mutliplier
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: booth_multiplier
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg [5:0] x;
	reg [5:0] y;
	reg clk;
	reg reset;

	// Outputs
	wire [11:0] product;

	// Instantiate the Unit Under Test (UUT)
	booth_multiplier uut (
		.x(x), 
		.y(y), 
		.product(product), 
		.clk(clk), 
		.reset(reset)
	);

	always
	#20 clk = !clk;
	initial begin
		// Initialize Inputs
		x = 0;
		y = 0;
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#120;
		x= 6'b000111;
		y = 6'b000010;
		#40;
		
		reset=0;
		
		#240;
		reset =1;
		x= 6'b000111;
		y = 6'b000111;
		#40;
		
		reset=0;
		
		#240;
		
		
		$finish;
        
		// Add stimulus here

	end
      
		
endmodule

