`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:37:36 08/14/2018 
// Design Name: 
// Module Name:    shift_sum 
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
module shifter_sum(input a, input clock, output reg[7:0] out, input rst
    );
	 
always @(posedge clock )
begin
if(!rst)
begin
out = out >> 1;
out[7] = a;
end
else 
out = 0;
end

endmodule
