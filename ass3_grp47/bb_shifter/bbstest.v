//////////////////////////////////////////////////////////////////////////////////
#Assignment 3
#Problem no.2
#Semester 5
#Group no. 47
#Group members: P.V.S.L. Hari Chandana(16CS30026), P.Anusha(16CS30027)
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:26:01 08/06/2018
// Design Name:   barrel_sft
// Module Name:   E:/FPGA/barrel_sft/bbstest.v
// Project Name:  barrel_sft
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: barrel_sft
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bbstest;

	// Inputs
	reg [7:0] in;
	reg [2:0] shift;
	reg direction;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	barrel_sft uut (
		.in(in), 
		.shift(shift), 
		.direction(direction), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		shift = 0;
		direction =0;

		// Wait 100 ns for global reset to finish
		#100;
        
		 //Add stimulus here
		in = 8'b10101101;
		shift = 3'b110;
		direction = 1;
		
		#10;
		
		in = 8'b10101101;
		shift = 3'b010;
		direction = 0;
		
		#10;

		in = 8'b10101101;
		shift = 3'b001;
		direction = 0;
		
		#10;
		
		in = 8'b10101101;
		shift = 3'b100;
		direction = 0;
		
		#10;
		$finish;
        
		// Add stimulus here

	end
      
endmodule

