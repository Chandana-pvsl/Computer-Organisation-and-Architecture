//////////////////////////////////////////////////////////////////////////////////
#Assignment 3
#Problem no.2
#Semester 5
#Group no. 47
#Group members: P.V.S.L. Hari Chandana(16CS30026), P.Anusha(16CS30027)
////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:27:00 08/06/2018 
// Design Name: 
// Module Name:    shifter 
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
module shifter(
    input [7:0] in,
    output reg [7:0] out,
    input direction,
    input [2:0] shift
    );

always @(*)
	begin
	
	if(direction)
	begin
	
		if(shift[2])
		begin
		out = { in[3:0],in[7:4]};
		end 
		else if(shift[1])
		begin
		out = { in[1:0],in[7:2]};
		end 
		else if(shift[0])
		begin
		out = { in[0:0],in[7:1]};
		end 
		else
		out = in;
	end
	
	else
		begin
		if(shift[2])
		begin
		out = { in[3:0],in[7:4]};
		end 
		else if(shift[1])
		begin
		out = { in[5:0],in[7:6]};
		end 
		else if(shift[0])
		begin
		out = { in[6:0],in[7:7]};
		end
		else
		out = in;
		end
	
	end
	endmodule
