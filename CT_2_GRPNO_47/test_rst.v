`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Names: P.Anusha(16CS30027), P.V.S.L Hari Chandana(16CS30026) 
// Engineer:
//
// Create Date:   15:03:06 11/12/2018
// Design Name:   divider
// Module Name:   C:/Users/student/COA_CT_1/lab_test2/test_rst.v
// Project Name:  lab_test2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: divider
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_rst;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;
	reg clk;
	reg rst;

	// Outputs
	wire [7:0] quo;
	wire [7:0] rem;
	//wire[7:0] q;
	//wire[15:0] d;
	//wire[15:0] r;
	wire done;

	// Instantiate the Unit Under Test (UUT)
	divider uut (
		.a(a), 
		.b(b), 
		.clk(clk), 
		.rst(rst), 
		.quo(quo), 
		.rem(rem),
		.done(done)
	);

	always #10 clk = ~clk;

	// Check for outputs at time 180, 380, 580
	initial begin
		// Initialize Inputs
		a =8'b00000111;
		b =8'b00000010;
		clk = 1;
		rst = 1;

		#20;
		rst = 0;
		#180;

		
		a =8'b00001111;
		b =8'b00000011;
		rst = 1;

		#20;
		rst = 0;
		#180;
		
		a =8'b00111111;
		b =8'b00001000;
		rst = 1;

		#20;
		rst = 0;
		#180;
		
		a =8'b11111111;
		b =8'b00001001;
		rst = 1;

		#20;
		rst = 0;
		#180;
		
		a =8'b00100000;
		b =8'b00001000;
		rst = 1;

		#20;
		rst = 0;
		#180;
		
		$finish;
       
		// Add stimulus here

	end
      
endmodule

