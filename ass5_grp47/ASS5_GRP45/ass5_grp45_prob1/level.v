`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:39:41 08/20/2018 
// Design Name: 
// Module Name:    level 
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
module level(input[6:0] a, input[6:0] b,output[6:0] product, output c_out
    );
wire [5:0] c;	 
half_adder h1(.a(a[0]),.b(b[0]),.product(product[0]),.c_out(c[0]));
full_adder a1(.a(a[1]),.b(b[1]),.c_in(c[0]),.product(product[1]),.c_out(c[1]));
full_adder a2(.a(a[2]),.b(b[2]),.c_in(c[1]),.product(product[2]),.c_out(c[2]));
full_adder a3(.a(a[3]),.b(b[3]),.c_in(c[2]),.product(product[3]),.c_out(c[3]));
full_adder a4(.a(a[4]),.b(b[4]),.c_in(c[3]),.product(product[4]),.c_out(c[4]));
full_adder a5(.a(a[5]),.b(b[5]),.c_in(c[4]),.product(product[5]),.c_out(c[5]));
full_adder a6(.a(a[6]),.b(b[6]),.c_in(c[5]),.product(product[6]),.c_out(c_out));
endmodule
