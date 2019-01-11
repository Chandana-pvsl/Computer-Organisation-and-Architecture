`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:55:43 08/25/2018 
// Design Name: 
// Module Name:    booth_multiplier 
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
module booth_multiplier(input [5:0] x, input [5:0] y, 
output [11:0] product, input clk, input reset, input load
    );
	wire [5:0] acc;
	wire[6:0] q;
	wire [5:0] acc1;
	wire[6:0] q1;
	assign acc = 6'b000000;
	assign q = {x,1'b0};
	controller c(.load(load),.clk(clk),.reset(reset),.start(start));
	multiplier m(.load(load),.start(start),.reset(reset),.acc(acc),.q(q),.m(y),.clk(clk), .acc1(acc1), .q1(q1));
	assign product = {acc1,q1[6:1]};
	

endmodule
