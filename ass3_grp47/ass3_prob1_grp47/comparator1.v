//Assignment 3
//Problem 1
//Group 47
//P.V.S.L. Hari Chandana(16CS30026)
//P.Anusha(16CS30027)

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:26:23 08/09/2018 
// Design Name: 
// Module Name:    comparator1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module comparator1(
	input[7:0] a,
	input[7:0] b,
	output reg out
    );
	 
always@(*)
begin
if(a[6:0] > b[6:0])
	out = a[7];
else if(a[6:0] < b[6:0] )
	out = b[7];
else
	out = a[7]&b[7];
end




endmodule
