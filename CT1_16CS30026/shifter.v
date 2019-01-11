//name: P.V.SL. Hari Chandana
//roll no.: 16CS30026
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:58:49 09/05/2018 
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
module shifter(input[6:0] in, input clk, input start, input done, output out
    );
reg [7:0] out1;
assign out =out1[0]; //out assigned to last bit of shifted input
always @(posedge clk)
begin
	if(start)		// out1 is concatenated with 0 so that the first clock cycle would not neglect the last bit of input
	begin
		out1= {in,1'b0};
	end
	else
	begin 		//out is being serially shifted 
		if(~done)
		begin
			out1 = out1>>1;
		end
		else
		begin  //to remove any latches created
		out1 =0;
		end
	end
end

endmodule
