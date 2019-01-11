`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:40:03 08/14/2018 
// Design Name: 
// Module Name:    dff 
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
module dff(input in , output reg out , input clock, input rst, input load, input cy_in
    );
	
initial begin
out=1'b0;
end
always @(posedge clock )
begin
if(load)
begin
	out = cy_in;
end
else
begin
	if(rst)
	out = 0;
	else
	out = in;
end

end

endmodule
