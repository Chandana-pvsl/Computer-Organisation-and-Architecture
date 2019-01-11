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
// Create Date:    14:23:59 08/08/2018 
// Design Name: 
// Module Name:    ripple_carry_adder 
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

module ripple_carry_adder (input [7:0] a, input [7:0] b, input cy_in, output [7:0] sum,
output cy_Out);

wire [6:0]cy_out;
//assign cy_out[7:0] = 8'b00000000;

full_adder A1( .a(a[0]), .b(b[0]), .c_in(cy_in ) , .sum(sum[0] ) , .c_out( cy_out[0] ));
full_adder A2( .a(a[1]), .b(b[1]), .c_in( cy_out[0] ) , .sum(sum[1] ) , .c_out( cy_out[1] ));
full_adder A3( .a(a[2]), .b(b[2]), .c_in(cy_out[1]  ) , .sum(sum[2] ) , .c_out( cy_out[2]  ));
full_adder A4( .a(a[3]), .b(b[3]), .c_in( cy_out[2] ) , .sum(sum[3] ) , .c_out(cy_out[3] ));
full_adder A5( .a(a[4]), .b(b[4]), .c_in(cy_out[3]  ) , .sum(sum[4] ) , .c_out(cy_out[4]  ));
full_adder A6( .a(a[5]), .b(b[5]), .c_in( cy_out[4]  ) , .sum(sum[5] ) , .c_out(cy_out[5]  ));

full_adder A7( .a(a[6]), .b(b[6]), .c_in(cy_out[5] ) , .sum(sum[6] ) , .c_out(cy_out[6]  ));
full_adder A8( .a(a[7]), .b(b[7]), .c_in(cy_out[6]) , .sum(sum[7] ) , .c_out( cy_Out ));
//full_adder A9( .a(a[8]), .b(b[8]), .c_in( sum[8] ) , .sum(sum[8] ) , .c_out(sum[9] ));
//full_adder A10( .a(a[9]), .b(b[9]), .c_in( sum[9] ) , .sum(sum[9] ) , .c_out(sum[10] ));
//full_adder A11( .a(a[10]), .b(b[10]), .c_in( sum[10] ) , .sum(sum[10] ) , .c_out(sum[11] ));
//full_adder A12( .a(a[11]), .b(b[11]), .c_in( sum[11] ) , .sum(sum[11] ) , .c_out( cy_out ));

endmodule
