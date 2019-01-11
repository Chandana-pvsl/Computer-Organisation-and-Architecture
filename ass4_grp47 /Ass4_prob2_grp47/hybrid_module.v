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
// Create Date:    21:54:21 08/11/2018 
// Design Name: 
// Module Name:    hybrid_adder 
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
module hybrid_adder (input [7:0] a, input [7:0] b, input cy_in, output [7:0] sum,
output cy_out);

wire temp;
wire c_out;
carry_lookahead_adder a1(.a(a[3:0]),.b(b[3:0]),.cy_in(cy_in),.sum(sum[3:0]),.cy_out(c_out));
carry_lookahead_adder a2(.a(a[7:4]),.b(b[7:4]),.cy_in(c_out),.sum(sum[7:4]),.cy_out(cy_out));

endmodule
