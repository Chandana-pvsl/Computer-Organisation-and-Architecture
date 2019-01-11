`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:55:55 08/11/2018 
// Design Name: 
// Module Name:    carry_lookahead_adder 
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
module carry_lookahead_adder( input[3:0] a, input [3:0] b, input cy_in, output cy_out, output[3:0] sum
    );
wire t1;
wire t2;
wire t3;

assign t1 = a[0]&b[0] | cy_in&(a[0]^b[0]);
assign t2 = a[1]&b[1] | (a[0] & b[0])&(a[1]^b[1]) | cy_in&(a[0]^b[0])&(a[1]^b[1]);
assign t3 = a[2]&b[2] | (a[1] & b[1])&(a[2]^b[2]) | (a[0] & b[0])&(a[2]^b[2])& (a[1]^b[1])| cy_in&(a[0]^b[0])&(a[1]^b[1])&(a[2]^b[2]);
assign cy_out = a[3]&b[3] | (a[2] & b[2])&(a[3]^b[3]) | (a[1] & b[1])&(a[2]^b[2])& (a[3]^b[3])| (a[0] & b[0])&(a[2]^b[2])& (a[3]^b[3])&(a[1]^b[1])| cy_in&(a[0]^b[0])&(a[1]^b[1])&(a[2]^b[2])&(a[3]^b[3]);
assign sum[0] = cy_in^a[0]^b[0];
assign sum[1] = t1^a[1]^b[1];
assign sum[2] = t2^a[2]^b[2];
assign sum[3] = cy_out^a[3]^b[3];


endmodule
