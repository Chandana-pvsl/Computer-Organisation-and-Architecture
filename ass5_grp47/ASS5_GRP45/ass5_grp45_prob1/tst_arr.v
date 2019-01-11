`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:22:35 08/20/2018
// Design Name:   array_multiplier
// Module Name:   E:/FPGA/array_multiplier/tst_arr.v
// Project Name:  array_multiplier
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: array_multiplier
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tst_arr;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;

	// Outputs
	wire [15:0] product;

	// Instantiate the Unit Under Test (UUT)
	array_multiplier uut (
		.a(a), 
		.b(b), 
		.product(product)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        a = 8'b00000100;
		  b = 8'b00000010;
		  #50;
		  a = 8'b00001100;
		  b = 8'b00000011;
		  #50;
		  $finish;
		// Add stimulus here

	end
      
endmodule

