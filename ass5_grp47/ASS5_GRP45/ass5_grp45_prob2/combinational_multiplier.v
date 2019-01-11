`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:55:48 08/20/2018 
// Design Name: 
// Module Name:    combinational_multiplier 
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
module combinational_multiplier (input [7:0] a, input [7:0] b, output [15:0] product);

wire[7:0] temp1;
wire[7:0] temp2;
wire [15:0] pro;
mux m1(.p(a), .out(temp1), .select(a[7]));
mux m2(.p(b), .out(temp2), .select(b[7]));
array_multiplier a1(.a(temp1), .b(temp2), .product(pro));
mux_16 m3(.p(pro),.out(product),.select(a[7]^b[7]));


endmodule
