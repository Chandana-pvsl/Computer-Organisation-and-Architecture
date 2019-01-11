`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:10:43 08/20/2018 
// Design Name: 
// Module Name:    array_multiplier 
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
module array_multiplier (input [7:0] a, input [7:0] b, output [15:0] product);

wire[6:0] i2;
wire [6:0] i1;
wire[6:0] i3;
wire [6:0] i4;
wire[6:0] i5;
wire [6:0] i6;
wire[6:0] i7;
wire [6:0] i8;
wire[6:0] i9;
wire [6:0] i10;
wire[6:0] i11;
wire [6:0] i12;
wire[6:0] i13;
wire [6:0] i14;
wire[6:0] i15;
wire [6:0] i16;
wire [6:0] temp1;
wire [6:0] temp2;
wire [6:0] temp3;
wire [6:0] temp4;
wire [6:0] temp5;
wire [6:0] temp6;
wire [6:0] temp7;
wire [6:0] temp8;

wire [7:0]t;
assign product[0] = a[0]&b[0];
assign i1[0] =  a[1]&b[0];
assign i1[1] =  a[2]&b[0];
assign i1[2] =  a[3]&b[0];
assign i1[3] =  a[4]&b[0];
assign i1[4] =  a[5]&b[0];
assign i1[5] =  a[6]&b[0];
assign i1[6] =  a[7]&b[0];
assign i2[0] =  a[0]&b[1];
assign i2[1] =  a[1]&b[1];
assign i2[2] =  a[2]&b[1];
assign i2[3] =  a[3]&b[1];
assign i2[4] =  a[4]&b[1];
assign i2[5] =  a[5]&b[1];
assign i2[6] =  a[6]&b[1];
level l1 (.a(i1),.b(i2),.product(temp1),.c_out(t[0]));
assign product[1] = temp1[0];
assign i4 = {t[0],temp1[6:1]};

assign i3[0] = a[0]&b[2];
assign i3[1] = a[1]&b[2];
assign i3[2] = a[2]&b[2];
assign i3[3] = a[3]&b[2];
assign i3[4] = a[4]&b[2];
assign i3[5] = a[5]&b[2];
assign i3[6] = a[7]&b[1];

level l2 (.a(i3),.b(i4),.product(temp2),.c_out(t[1]));
assign product[2] = temp2[0];
assign i6 = {t[1],temp2[6:1]};
assign i5[0] = a[0]&b[3];
assign i5[1] = a[1]&b[3];
assign i5[2] = a[2]&b[3];
assign i5[3] = a[3]&b[3];
assign i5[4] = a[4]&b[3];
assign i5[5] = a[6]&b[2];
assign i5[6] = a[7]&b[2];

level l3 (.a(i5),.b(i6),.product(temp3),.c_out(t[2]));
assign product[3] = temp3[0];
assign i8 = {t[2],temp3[6:1]};
assign i7[0] = a[0]&b[4];
assign i7[1] = a[1]&b[4];
assign i7[2] = a[2]&b[4];
assign i7[3] = a[3]&b[4];
assign i7[4] = a[5]&b[3];
assign i7[5] = a[6]&b[3];
assign i7[6] = a[7]&b[3];

level l4 (.a(i7),.b(i8),.product(temp4),.c_out(t[3]));
assign product[4] = temp4[0];
assign i10 = {t[3],temp4[6:1]};

assign i9[0] = a[0]&b[5];
assign i9[1] = a[1]&b[5];
assign i9[2] = a[2]&b[5];
assign i9[3] = a[4]&b[4];
assign i9[4] = a[5]&b[4];
assign i9[5] = a[6]&b[4];
assign i9[6] = a[7]&b[4];

level l5 (.a(i9),.b(i10),.product(temp5),.c_out(t[4]));
assign product[5] = temp5[0];
assign i12 = {t[4],temp5[6:1]};

assign i11[0] = a[0]&b[6];
assign i11[1] = a[1]&b[6];
assign i11[2] = a[3]&b[5];
assign i11[3] = a[4]&b[5];
assign i11[4] = a[5]&b[5];
assign i11[5] = a[6]&b[5];
assign i11[6] = a[7]&b[5];

level l6 (.a(i11),.b(i12),.product(temp6),.c_out(t[5]));
assign product[6] = temp6[0];
assign i14 = {t[5],temp6[6:1]};

assign i13[0] = a[0]&b[7];
assign i13[1] = a[2]&b[6];
assign i13[2] = a[3]&b[6];
assign i13[3] = a[4]&b[6];
assign i13[4] = a[5]&b[6];
assign i13[5] = a[6]&b[6];
assign i13[6] = a[7]&b[6];


level l7 (.a(i13),.b(i14),.product(temp7),.c_out(t[6]));
assign product[7] = temp7[0];
assign i16 = {t[6],temp7[6:1]};

assign i15[0] = a[1]&b[7];
assign i15[1] = a[2]&b[7];
assign i15[2] = a[3]&b[7];
assign i15[3] = a[4]&b[7];
assign i15[4] = a[5]&b[7];
assign i15[5] = a[6]&b[7];
assign i15[6] = a[7]&b[7];

level l8 (.a(i15),.b(i16),.product(temp8),.c_out(t[7]));
assign product[15:8] = {t[7],temp8};


//level l1(.a())


endmodule
