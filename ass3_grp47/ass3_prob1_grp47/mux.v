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
// Create Date:    06:18:27 08/09/2018 
// Design Name: 
// Module Name:    mux 
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
module mux( input[7:0] a, input[7:0] b, input s,  output reg[7:0] o
    );
always@(*)
begin
if(s)
	o =  b;
else
	o = a;
end

endmodule
