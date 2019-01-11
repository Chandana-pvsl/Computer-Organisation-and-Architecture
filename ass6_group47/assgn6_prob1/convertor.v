//Semester 5
//Assignment no:
//Problem no: 1
//Group no: 47
//P.V.S.L. Hari Chandana 16CS30026
//P. Anusha	16CS30027
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:33:46 08/29/2018 
// Design Name: 
// Module Name:    convertor 
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
module convertor(
	input in,
	input reset,
	output reg out,
	input clk, 
	output reg state
    );

//initial state =0;
always@(posedge clk)
begin
	if(reset)
	begin
		out =0;
		state =0;
	end
	else
	begin
	
	if(state)
	begin
		out = !in;
	end	
	else
	begin
		if(in)
		begin
			state = 1'b1;
			out = in;
		end
		else
		begin
			state = 1'b0;
			out = in;
		end	
	end
	
	end

end

endmodule
