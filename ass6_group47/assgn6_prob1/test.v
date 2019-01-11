`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:46:04 08/29/2018
// Design Name:   convertor
// Module Name:   E:/FPGA/twocomp_convt/test.v
// Project Name:  twocomp_convt
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: convertor
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
	reg clk;
	reg reset;
	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	convertor uut (
		.in(in), 
		.out(out), 
		.clk(clk),
		.state(state),
		.reset(reset)
	);
	
	always
	#5 clk = ~clk;

	initial begin
		// Initialize Inputs	
//		in =0;
		clk =1;
		in = 0;
		reset =1;
		#10;
		reset =0;
		in =0;
		#10;
		in =1;
		#10;
		in =1;
		#10;
		in =0;
		#10;
		in =1;
		#10;
		in =0;
		#10;
		in =1;
		#10;
		
		reset =1;
		#10;
		reset =0;
		in =1;
		#10;
		in =0;
		#10;
		in =1;
		#10;
		$finish;
        
		// Add stimulus here

	end
      
endmodule

