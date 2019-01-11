//name: P.V.SL. Hari Chandana
//roll no.: 16CS30026
`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:28:45 09/05/2018
// Design Name:   bin_frac_seq_mult
// Module Name:   E:/PIC/fraction_multiplier/tst.v
// Project Name:  fraction_multiplier
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bin_frac_seq_mult
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tst;

	// Inputs
	reg clk;
	reg start;
	reg [6:0] a;
	reg [6:0] b;

	// Outputs
	wire done;
	wire [13:0] product;

	// Instantiate the Unit Under Test (UUT)
	bin_frac_seq_mult uut (
		.clk(clk), 
		.start(start), 
		.a(a), 
		.b(b), 
		.done(done), 
		.product(product)
	);
	always 
	#10 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		start = 1;
		a = 7'b1010101;
		b = 7'b0101010;
		#20;
      start = 0;
		#160;
		
		start=1;
		a = 7'b1111100;
		b = 7'b01101101;
		#20;
		start=0;
		#160;
		
		start=1;
		a = 7'b1100000;
		b = 7'b0110000;
		#20;
		start=0;
		#160;
		
		start=1;
		a = 7'b1111111;
		b = 7'b1111111;
		#20;
		start=0;
		#160;
		 $finish;
		// Add stimulus here

	end
      
endmodule

