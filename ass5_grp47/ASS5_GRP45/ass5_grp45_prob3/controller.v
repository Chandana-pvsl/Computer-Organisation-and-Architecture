`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:10:29 08/25/2018 
// Design Name: 
// Module Name:    controller 
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
module controller(input clk,input reset, output reg start, input load
    );
	reg[2:0] count;
	
always @(posedge clk)
begin
	if(reset || load)
		begin
			count = 3'b000;
			start = 1'b1;
		end
	else
	begin
		if(count >= 3'b110)
			start = 1'b0;
		else
			count = count+3'b001;
	end
end

endmodule
