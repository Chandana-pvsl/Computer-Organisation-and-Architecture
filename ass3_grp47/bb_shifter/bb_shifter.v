//////////////////////////////////////////////////////////////////////////////////
#Assignment 3
#Problem no.2
#Semester 5
#Group no. 47
#Group members: P.V.S.L. Hari Chandana(16CS30026), P.Anusha(16CS30027)
////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:26:47 08/06/2018 
// Design Name: 
// Module Name:    barrel_sft 
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
module bb_shifter(input [7:0] in, input [2:0] shift, input direction, output [7:0]
out
    );

wire[7:0] temp1;
wire[7:0] temp2;
wire[7:0] temp0;
assign temp0 = in;

shifter a(.in(temp0),.out(temp1),.shift({shift[2],2'b00}),.direction(direction));
shifter b(.in(temp1),.out(temp2),.shift({1'b0,shift[1],1'b0}),.direction(direction));
shifter c(.in(temp2),.out(out),.shift({2'b00,shift[0]}),.direction(direction));


endmodule
