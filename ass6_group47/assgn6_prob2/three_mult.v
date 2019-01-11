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
// Create Date:    15:26:36 08/29/2018 
// Design Name: 
// Module Name:    three_mult 
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
module three_mult(
	input in,
	input reset,
	output reg out,
	output reg[1:0]  state,
	input clk
    );

always@(posedge clk)
begin
	if(reset)
	begin
		state =0;
		out =0;
	end
	else
	begin
		case(state)
		2'b0:
		begin
			if(in)
				begin
				state = 2'b1;
				out = 0;
				end
			else
				out = 1;
		end

		2'b1:
		begin
			if(in)
				begin
				state = 2'b0;
				out = 1;
				end
			else
				begin
				state = 2'b10;
				out = 0;
				end
		end

		
		2'b10:
		begin
			if(in)
				begin
				state = 2'b10;
				out = 0;
				end
			else
				begin
				state = 2'b1;
				out = 0;
				end
		end	
		endcase
	end
end
endmodule
