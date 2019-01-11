`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:17:10 08/11/2018
// Design Name:   hybrid_adder
// Module Name:   /home/chandana/hybrid_adder/hyb_tst.v
// Project Name:  hybrid_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: hybrid_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module hyb_tst;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;
	reg cy_in;

	// Outputs
	wire [7:0] sum;
	wire cy_out;

	// Instantiate the Unit Under Test (UUT)
	hybrid_adder uut (
		.a(a), 
		.b(b), 
		.cy_in(cy_in), 
		.sum(sum), 
		.cy_out(cy_out)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		cy_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		a = 8'b10101101;
		b = 8'b11010110;
		cy_in = 0;
		#10;
        
		a = 8'b00101101;
		b = 8'b10010110;
		cy_in = 0;
		#10 ;
		$finish;
		// Add stimulus here

	end
      
endmodule

