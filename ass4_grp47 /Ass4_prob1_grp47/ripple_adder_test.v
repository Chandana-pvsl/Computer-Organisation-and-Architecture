`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:44:15 08/08/2018
// Design Name:   ripple_carry_adder
// Module Name:   E:/FPGA/ripple_carry_adder/ripple_adder_test.v
// Project Name:  ripple_carry_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ripple_carry_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ripple_adder_test;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;
	reg cy_in;

	// Outputs
	wire [7:0] sum;
	wire cy_Out;

	// Instantiate the Unit Under Test (UUT)
	ripple_carry_adder uut (
		.a(a), 
		.b(b), 
		.cy_in(cy_in), 
		.sum(sum), 
		.cy_Out(cy_Out)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		cy_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		a = 8'b10101111;
		b = 8'b01011010;
		cy_in = 0;
		
		#100;
		
		a = 8'b01010110;
		b =8'b10001000;
		cy_in =0;
		
		#100;
		
		$finish;
        
		// Add stimulus here

	end
      
endmodule

