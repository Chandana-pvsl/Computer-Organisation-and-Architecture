`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:28:36 08/13/2018 
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
module shifter(input[7:0] a, input clock, output reg[7:0] out, input rst, input load
    );
always @(posedge clock or posedge load )
begin
if(load)
out =a;
else
	begin
if(!rst)
out = out>>1;

else 
out = 0;
	end
end

endmodule