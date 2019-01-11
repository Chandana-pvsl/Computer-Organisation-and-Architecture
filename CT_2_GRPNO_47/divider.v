`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Names: P. Anusha (16CS30027) , P.V.S.L.Hari Chandana (16CS30026)
// GROUP NO: 16CS30027
// 
// Create Date:    14:37:18 11/12/2018 
// Design Name: 
// Module Name:    divider 
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
module divider(input[7:0] a, input[7:0] b, input clk, input rst,
output[7:0] quo, output[7:0] rem , 
//output reg[7:0] q, output reg[15:0] r, output reg[15:0] d,
output done
    );

reg[7:0] q;
reg[15:0] r;
reg[15:0] d;

wire notdone;
assign done = ~notdone;

assign quo = q;
assign rem = r[7:0];
counter c(clk, rst, notdone);

always@(posedge clk)
begin
	if(rst)
	begin
		r = {8'b0, a};
		d = {b, 8'b0};
		q = {8'b0};
	end
	else
	begin
		if(notdone)
		begin
			r = r - d;	
		if(r[15]) // if remainder<0, add back divisor to remainder and left shift quotient with 0.
		begin
			r = r + d;
			q = {q[6:0], 1'b0};
		end
		else // remainder>=0, and left shift quotient with 1 at end.
			q = {q[6:0], 1'b1};
			
		d = {1'b0, d[15:1]}; // shift divisor in any case
		end
	end
	
end

endmodule


/*
 Counter module: It counts 8 clock cycles, and till 8 cycles notdone is set to one.
 After 8 clock cycles,  notdone is set to zero.
 Count is done using the register count. 
*/
module counter(input clk, input rst, output reg notdone);
reg[3:0] count;
always@(posedge clk)
begin
	if(rst)
	begin
		count = 4'b0000;
		notdone = 1'b1;
	end
	else
	begin
	if(count < 4'b1000)
	begin
		notdone = 1'b1;
		count = count + 1'b1;
	end
	else
		notdone = 1'b0;
	end
end	
endmodule
