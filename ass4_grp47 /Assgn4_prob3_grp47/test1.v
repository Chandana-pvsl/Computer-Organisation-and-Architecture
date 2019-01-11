`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:15:38 08/15/2018
// Design Name:   bit_serial_adder
// Module Name:   /home/anusha/bit_serial_adder/test1.v
// Project Name:  bit_serial_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bit_serial_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test1;

	// Inputs
	reg clk;
	reg rst;
	reg [7:0] a;
	reg [7:0] b;
	reg cy_in;
	reg load;

	// Outputs
	wire [7:0] sum;
	wire cy_out;

	// Instantiate the Unit Under Test (UUT)
	bit_serial_adder uut (
		.clk(clk), 
		.rst(rst), 
		.a(a), 
		.b(b), 
		.cy_in(cy_in), 
		.load(load), 
		.sum(sum), 
		.cy_out(cy_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst =0;
		load =1;
		
      a = 8'b10101010;
		b = 8'b01011101;
		cy_in = 0;
		#20;
		load =0; 
		#300;
		rst =1;
		#40;

		rst =0;
		load =1;
		
      a = 8'b10111010;
		b = 8'b11011101;
		cy_in = 0;
		#20;
		load =0; 
		#300;
		rst=1;
		// Add stimulus here

	end
      always
		#20 clk = ~clk;
      
endmodule

