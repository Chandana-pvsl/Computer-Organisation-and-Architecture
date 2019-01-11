`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:41:01 08/29/2018
// Design Name:   three_mult
// Module Name:   E:/FPGA/three_multiple/test.v
// Project Name:  three_multiple
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: three_mult
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
	reg in;
	reg reset;
	reg clk;

	// Outputs
	wire out;
	wire [1:0] state;

	// Instantiate the Unit Under Test (UUT)
	three_mult uut (
		.in(in), 
		.reset(reset), 
		.out(out), 
		.state(state), 
		.clk(clk)
	);

	always
	#5 clk = ~clk;
	initial begin
		// Initialize Inputs
		in = 0;
		reset = 1;
		clk = 1;

		// Wait 100 ns for global reset to finish
		#10;
		reset =0;
		in = 1;
		#10;
		in =1;
		#10;
		in =0;
		#10;
		
		reset=1;
		#10;
		reset =0;
		in = 1;
		#10;
		in =0;
		#10;
		in = 0;
		#10;
		
		reset=1;
		#10;
		reset =0;
		in = 1;
		#10;
		in =1;
		#10;
		in = 1;
		#10;
		in = 0;
		#10;
		in = 1;
		#10;
		$finish;
		
		
        
		// Add stimulus here

	end
      
endmodule

