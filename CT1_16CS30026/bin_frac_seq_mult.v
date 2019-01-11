//name: P.V.S.L. Hari Chandana
//roll no.: 16CS30026
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:33:00 09/05/2018 
// Design Name: 
// Module Name:    bin_frac_seq_mult 
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
module bin_frac_seq_mult(input clk, input start, input [6:0] a, input [6:0] b, output done, output[13:0] product
    );
wire in_a; //for sending single bits of a
wire[13:0] out; //iterative product

counter c(.start(start),.clk(clk),.done(done));
shifter s1(.in(a),.clk(clk),.out(in_a),.start(start),.done(done));
multiplier m(.a(in_a),.b(b),.out(out),.clk(clk),.start(start),.done(done));
assign product = out;
endmodule
