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
// Create Date:    06:18:00 08/09/2018 
// Design Name: 
// Module Name:    addermod 
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
module addermod(input[7:0] a, input [7:0] b, output reg [7:0]  out
    );

//reg[8:0] temp;
//assign temp = 0;
reg [8:0] temp; 

always@(*)

begin
temp = a+b;
if(temp[7])
	begin
	if(a[7]==0 && b[7]==0)
		out = temp[7:0];
	else
		out = -(temp[7:0]);
	end
else
	begin
	if(a[7]==1 && b[7]==1)
		out = -(temp[7:0]);
	else
		out = (temp[7:0]);
	end
end

endmodule
