`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:35:08 08/21/2018
// Design Name:   combinational_multiplier
// Module Name:   /home/chandana/Downloads/tst_com.v
// Project Name:  combinational_multiplier
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: combinational_multiplier
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tst_com;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;

	// Outputs
	wire [15:0] product;

	// Instantiate the Unit Under Test (UUT)
	combinational_multiplier uut (
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
		  b = 8'b11110011;
		  #50;
		  $finish;
		
		
        
		// Add stimulus here

	end
      
endmodule

