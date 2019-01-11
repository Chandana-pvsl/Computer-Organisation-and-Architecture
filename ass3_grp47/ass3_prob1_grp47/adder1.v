//Assignment 3
//Problem 1
//Group 47
//P.V.S.L. Hari Chandana(16CS30026)
//P.Anusha(16CS30027)

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:21:14 08/09/2018 
// Design Name: 
// Module Name:    adder1 
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
module adder1(
    input [7:0] a,
    input [7:0] b,
    output [8:0] sum
    //input cin
	//output reg out 
	);

wire [7:0] out1;
wire [7:0] out2;
wire[7:0] temp1;
wire[7:0] temp2;
wire [7:0] temp3;
wire temp;
assign temp1 ={1'b0, a[6:0]};
assign temp2 = {1'b0, b[6:0]};

comparator1 C1(.a(a), .b(b), .out(temp)) ;
mux M1 (.a(temp1) , .b(-temp1) , .s( a[7] ), .o( out1)  );
mux M2 (.a(temp2) , .b(-temp2 ) , .s( b[7] ), .o(out2 )  );
addermod A1(.a(out1), .b(out2) , .out(temp3));

assign sum ={temp , temp3 };
endmodule
