`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:17:05 08/25/2018 
// Design Name: 
// Module Name:    multiplier 
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
module multiplier(input [6:0] q, input [5:0] acc, input [5:0] m , input load,
	input clk , input start, input reset,
	output reg[5:0]  acc1, output reg [6:0] q1
    );
	wire [6:0] sum;
	wire [6:0] diff;
	assign sum = acc1+m;
	assign diff = acc1-m;
	always @(posedge clk)
	begin
	if(reset)
	begin
		acc1 =6'b000000;
		q1=7'b0000000;
	end	
	else 
	begin
	if(start)
	begin
		if(q1[1:0] == 2'b00 || q1[1:0] == 2'b11)
			{acc1,q1} = {acc1[5],acc1,q1[6:1]};
		else if(q1[1:0] == 2'b01)
			{acc1,q1} = {sum[5],sum[5:0],q1[6:1]};
		else if(q1[1:0] == 2'b10)
			{acc1,q1} = {diff[5],diff[5:0],q1[6:1]};
	end	
	if(load)
	begin
		acc1 = acc;
		q1 = q; 
	end
	end
	end

endmodule
