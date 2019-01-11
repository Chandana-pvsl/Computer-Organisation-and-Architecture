//name: P.V.SL. Hari Chandana
//roll no.: 16CS30026
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:43:23 09/05/2018 
// Design Name: 
// Module Name:    counter 
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
module counter(input clk, input start, output done
    );
reg[2:0] count; //mainting count of 7
reg done1;
assign done = done1;
always @(posedge clk)
begin
	if(start) //if start the count and done are initialized to 0 
	begin
		count <=3'b000;
		done1 <= 1'b0;
	end
	else
	begin			//else if count reaches 7 done is updatd or count is incremented
		if(count==3'b111)
			done1 <= 1'b1;
		else
			count <= count + 3'b001;
	end
end

endmodule
