//name: P.V.SL. Hari Chandana
//roll no.: 16CS30026
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:08:55 09/05/2018 
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
module multiplier(input a, input[6:0] b, input clk, input start, input done, output[13:0] out
    );
reg [13:0] out1;
reg cy_out;
reg [6:0]sum ; 
assign out =out1;
always @(posedge clk)
begin
	if(start) //initial P(0) = 0
	begin
		out1 = 14'b00000000000000;
	end
	else
	begin
		if(~done) 
		begin
			{cy_out,sum}=((a)?b:(7'b0000000))+out1[13:7]; //to calculate if any carry is present
			out1 = {((a)?b:(7'b0000000)),7'b0000000}+out1;  //x*P(i)+P(i) 
			out1 = out1>>1; 											//shifts product for next calculation P(i+1) = 2^-1*P(i)
			out1[13] = cy_out?1'b1:1'b0; 							//updates the last bit of product with carry out
		end
		else
		out1 = 14'b00000000000000; 								//maintained to remove any latches present
	end
end

endmodule
