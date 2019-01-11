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
// Create Date:    22:29:11 08/11/2018 
// Design Name: 
// Module Name:    bit_adder 
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
module bit_serial_adder(input clk, input rst, input [7:0] a, input [7:0] b, input cy_in ,input load, output[7:0] sum, output cy_out
    );
wire[7:0] temp1;
wire[7:0] temp2;
wire temp3;
wire temp4;
wire temp;

shifter S1(.a(a),.clock(clk),.out(temp1),.rst(rst), .load(load));
shifter S2(.a(b),.clock(clk),.out(temp2),.rst(rst) , .load(load));
shifter_sum S3(.a(temp3),.clock(clk),.out(sum),.rst(rst));

full_adder f1(.a(temp1[0]),.b(temp2[0]),.c_in(temp),.c_out(temp4),.sum(temp3));
dff d1(.in(temp4),.out(temp),.clock(clk), .load(load), .cy_in(cy_in), .rst(rst));

assign cy_out = temp;
endmodule
