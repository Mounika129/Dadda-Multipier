module dadda(a,b,mul_out);
input [15:0]a;
input [15:0]b;
output [31:0] mul_out;
wire cout,cin;
wire [15:0] p_product_1;

wire [16:1]p_product_2;
wire [17:2]p_product_3;
wire [18:3]p_product_4;
wire [19:4]p_product_5;
wire [20:5]p_product_6;
wire [21:6]p_product_7;
wire [22:7]p_product_8;
wire [23:8]p_product_9;
wire [24:9]p_product_10;
wire [25:10]p_product_11;
wire [26:11]p_product_12;
wire [27:12]p_product_13;
wire [28:13]p_product_14;
wire [29:14]p_product_15;
wire [30:15]p_product_16;
genvar i;

wire [18:13]q_0;
wire [19:14]q_1;
wire [17:14]q_2;
wire [18:15]q_3;
wire [16:15]q_4;
wire [17:16]q_5;


wire [22:9]x0;
wire [23:10]x1;
wire [21:10]x2;
wire [22:11]x3;
wire [20:11]x4;
wire [21:12]x5;
wire [19:12] x_6;
wire [20:13] x_7;
//wire [23:8] x_8;




wire [25:6] y0;
wire [26:7] y1;
wire [24:7] y2;
wire [25:8] y3;
wire [23:8] y4;
wire [24:9] y5;

wire [27:4]z0;
wire [28:5]z1;
wire [26:5]z2;
wire [27:6]z3;

wire [28:3]u0;
wire [29:4]u1;
wire [31:0]v0;
wire [31:0]v1;


//partial products :

generate 
for(i=0;i<=15;i=i+1)begin : dhalf_addernu
assign p_product_1[i]= a[i] & b[0];
assign p_product_2[i+1]= a[i] & b[1];
assign p_product_3[i+2]= a[i] & b[2];
assign p_product_4[i+3]= a[i] & b[3];
assign p_product_5[i+4]= a[i] & b[4];
assign p_product_6[i+5]= a[i] & b[5];
assign p_product_7[i+6]= a[i] & b[6];
assign p_product_8[i+7]= a[i] & b[7];
assign p_product_9[i+8]= a[i] & b[8];
assign p_product_10[i+9]= a[i] & b[9];
assign p_product_11[i+10]= a[i] & b[10];
assign p_product_12[i+11]= a[i] & b[11];
assign p_product_13[i+12]= a[i] & b[12];
assign p_product_14[i+13]= a[i] & b[13];
assign p_product_15[i+14]= a[i] & b[14];
assign p_product_16[i+15]= a[i] & b[15];
end
endgenerate


//Intializing values:

 assign v0[0] = p_product_1[0];

 assign v1[0]= 1'b0;
 
 assign v0[1]=p_product_1[1];

 assign v1[1]=p_product_2[1];

 assign v1[2]=p_product_3[2];

 assign v0[30]=p_product_16[30];

 assign v0[31]=1'b0;

 assign v1[31]=1'b0;
 

//1st layer addition 

half_adder half_adder13(p_product_1[13],p_product_2[13],q_0[13],q_1[14]);

full_adder full_adder14(p_product_1[14],p_product_2[14],p_product_3[14],q_0[14],q_1[15]);
half_adder half_adder14(p_product_4[14],p_product_5[14],q_2[14],q_3[15]);

full_adder full_adder15_1(p_product_1[15],p_product_2[15],p_product_3[15],q_0[15],q_1[16]);
full_adder full_adder15_2(p_product_4[15],p_product_5[15],p_product_6[15],q_2[15],q_3[16]);
half_adder half_adder15(p_product_7[15],p_product_8[15],q_4[15],q_5[16]);

full_adder full_adder16_1(p_product_2[16],p_product_3[16],p_product_4[16],q_0[16],q_1[17]);
full_adder full_adder16_2(p_product_5[16],p_product_6[16],p_product_7[16],q_2[16],q_3[17]);
half_adder half_adder16(p_product_8[16],p_product_9[16],q_4[16],q_5[17]);

full_adder full_adder17_1(p_product_3[17],p_product_4[17],p_product_5[17],q_0[17],q_1[18]);
full_adder full_adder17_2(p_product_6[17],p_product_7[17],p_product_8[17],q_2[17],q_3[18]);

full_adder full_adder18(p_product_4[18],p_product_5[18],p_product_6[18],q_0[18],q_1[19]);

//2nd layer addition(half_adder9_2 implies 9th clmn and its is for layex2)

half_adder half_adder9_2(p_product_1[9],p_product_2[9],x0[9],x1[10]);

full_adder full_adder10_2(p_product_1[10],p_product_2[10],p_product_3[10],x0[10],x1[11]);
half_adder half_adder10_2(p_product_4[10],p_product_5[10],x2[10],x3[11]);

full_adder full_adder11a_2(p_product_1[11],p_product_2[11],p_product_3[11],x0[11],x1[12]);
full_adder full_adder11b_2(p_product_4[11],p_product_5[11],p_product_6[11],x2[11],x3[12]);
half_adder half_adder11_2(p_product_7[11],p_product_8[11],x4[11],x5[12]);

full_adder full_adder12a_2(p_product_1[12],p_product_2[12],p_product_3[12],x0[12],x1[13]);
full_adder full_adder12b_2(p_product_4[12],p_product_5[12],p_product_6[12],x2[12],x3[13]);
full_adder full_adder12c_2(p_product_7[12],p_product_8[12],p_product_9[12],x4[12],x5[13]);
half_adder half_adder12_2(p_product_10[12],p_product_11[12],x_6[12],x_7[13]);


full_adder full_adder13a_2(p_product_3[13],p_product_4[13],p_product_5[13],x0[13],x1[14]);
full_adder full_adder13b_2(p_product_6[13],p_product_7[13],p_product_8[13],x2[13],x3[14]);
full_adder full_adder13c_2(p_product_9[13],p_product_10[13],p_product_11[13],x4[13],x5[14]);
full_adder full_adder13d_2(p_product_12[13],p_product_13[13],p_product_14[13],x_6[13],x_7[14]);


full_adder full_adder14a_2(q_0[14],q_2[14],p_product_6[14],x0[14],x1[15]);
full_adder full_adder14b_2(p_product_7[14],p_product_8[14],p_product_9[14],x2[14],x3[15]);
full_adder full_adder14c_2(p_product_10[14],p_product_11[14],p_product_12[14],x4[14],x5[15]);
full_adder full_adder14d_2(p_product_13[14],p_product_14[14],p_product_15[14],x_6[14],x_7[15]);


full_adder full_adder15a_2(q_0[15],q_1[15],q_2[15],x0[15],x1[16]);
full_adder full_adder15b_2(p_product_10[15],p_product_9[15],q_4[15],x2[15],x3[16]);
full_adder full_adder15c_2(p_product_12[15],p_product_13[15],p_product_11[15],x4[15],x5[16]);
full_adder full_adder15d_2(p_product_14[15],p_product_15[15],p_product_16[15],x_6[15],x_7[16]);

full_adder full_adder16a_2(q_0[16],q_1[16],q_2[16],x0[16],x1[17]);
full_adder full_adder16b_2(p_product_10[16],q_4[16],q_5[16],x2[16],x3[17]);
full_adder full_adder16c_2(p_product_12[16],p_product_13[16],p_product_11[16],x4[16],x5[17]);
full_adder full_adder16d_2(p_product_14[16],p_product_15[16],p_product_16[16],x_6[16],x_7[17]);





full_adder full_adder17a_2(q_0[17],q_1[17],q_2[17],x0[17],x1[18]);
full_adder full_adder17b_2(p_product_9[17],p_product_10[17],q_5[17],x2[17],x3[18]);
full_adder full_adder17c_2(p_product_11[17],p_product_12[17],p_product_13[17],x4[17],x5[18]);
full_adder full_adder17d_2(p_product_14[17],p_product_15[17],p_product_16[17],x_6[17],x_7[18]);





full_adder full_adder18a_2(q_0[18],q_1[18],p_product_7[18],x0[18],x1[19]);
full_adder full_adder18b_2(p_product_8[18],p_product_9[18],p_product_10[18],x2[18],x3[19]);
full_adder full_adder18c_2(p_product_11[18],p_product_12[18],p_product_13[18],x4[18],x5[19]);
full_adder full_adder18d_2(p_product_14[18],p_product_15[18],p_product_16[18],x_6[18],x_7[19]);


full_adder full_adder19a_2(p_product_5[19],p_product_6[19],p_product_7[19],x0[19],x1[20]);
full_adder full_adder19b_2(p_product_8[19],p_product_9[19],p_product_10[19],x2[19],x3[20]);
full_adder full_adder19c_2(p_product_11[19],p_product_12[19],p_product_13[19],x4[19],x5[20]);
full_adder full_adder19d_2(p_product_14[19],p_product_15[19],p_product_16[19],x_6[19],x_7[20]);

full_adder full_adder20a_2(p_product_6[20],p_product_7[20],p_product_8[20],x0[20],x1[21]);
full_adder full_adder20b_2(p_product_9[20],p_product_10[20],p_product_11[20],x2[20],x3[21]);
full_adder full_adder20c_2(p_product_12[20],p_product_13[20],p_product_14[20],x4[20],x5[21]);

full_adder full_adder21a_2(p_product_9[21],p_product_7[21],p_product_8[21],x0[21],x1[22]);
full_adder full_adder21b_2(p_product_12[21],p_product_10[21],p_product_11[21],x2[21],x3[22]);


full_adder full_adder22a_2(p_product_10[22],p_product_8[22],p_product_9[22],x0[22],x1[23]);


//3rd addition

half_adder half_adder6_3(p_product_1[6],p_product_2[6],y0[6],y1[7]);

full_adder full_adder7a_3(p_product_1[7],p_product_2[7],p_product_3[7],y0[7],y1[8]);
half_adder half_adder7b_3(p_product_4[7],p_product_5[7],y2[7],y3[8]);


full_adder full_adder8a_3(p_product_1[8],p_product_2[8],p_product_3[8],y0[8],y1[9]);
full_adder full_adder8b_3(p_product_4[8],p_product_5[8],p_product_6[8],y2[8],y3[9]);
half_adder half_adder8c_3(p_product_7[8],p_product_8[8],y4[8],y5[9]);

full_adder full_adder9a_3(p_product_3[9],p_product_4[9],x0[9],y0[9],y1[10]);
full_adder full_adder9b_3(p_product_5[9],p_product_6[9],p_product_7[9],y2[9],y3[10]);
full_adder full_adder9c_3(p_product_8[9],p_product_9[9],p_product_10[9],y4[9],y5[10]);

full_adder full_adder10a_3(x0[10],x1[10],x2[10],y0[10],y1[11]);
full_adder full_adder10b_3(p_product_8[10],p_product_6[10],p_product_7[10],y2[10],y3[11]);
full_adder full_adder10c_3(p_product_11[10],p_product_9[10],p_product_10[10],y4[10],y5[11]);

full_adder full_adder11a_3(x0[11],x1[11],x2[11],y0[11],y1[12]);
full_adder full_adder11b_3(x3[11],x4[11],p_product_9[11],y2[11],y3[12]);
full_adder full_adder11c_3(p_product_10[11],p_product_11[11],p_product_12[11],y4[11],y5[12]);

full_adder full_adder12a_3(x0[12],x1[12],x2[12],y0[12],y1[13]);
full_adder full_adder12b_3(x3[12],x4[12],x5[12],y2[12],y3[13]);
full_adder full_adder12c_3(x_6[12],p_product_12[12],p_product_13[12],y4[12],y5[13]);



full_adder full_adder13a_3(x0[13],x1[13],x2[13],y0[13],y1[14]);
full_adder full_adder13b_3(x3[13],x4[13],x5[13],y2[13],y3[14]);
full_adder full_adder13c_3(x_6[13],x_7[13],q_0[13],y4[13],y5[14]);

full_adder full_adder14a_3(x0[14],x1[14],x2[14],y0[14],y1[15]);
full_adder full_adder14b_3(x3[14],x4[14],x5[14],y2[14],y3[15]);
full_adder full_adder14c_3(x_6[14],x_7[14],q_1[14],y4[14],y5[15]);

full_adder full_adder15a_3(x0[15],x1[15],x2[15],y0[15],y1[16]);
full_adder full_adder15b_3(x3[15],x4[15],x5[15],y2[15],y3[16]);
full_adder full_adder15c_3(x_6[15],x_7[15],q_3[15],y4[15],y5[16]);



full_adder full_adder16a_3(x0[16],x1[16],x2[16],y0[16],y1[17]);
full_adder full_adder16b_3(x3[16],x4[16],x5[16],y2[16],y3[17]);
full_adder full_adder16c_3(x_6[16],x_7[16],q_3[16],y4[16],y5[17]);

full_adder full_adder17a_3(x0[17],x1[17],x2[17],y0[17],y1[18]);
full_adder full_adder17b_3(x3[17],x4[17],x5[17],y2[17],y3[18]);
full_adder full_adder17c_3(x_6[17],x_7[17],q_3[17],y4[17],y5[18]);


full_adder full_adder18a_3(x0[18],x1[18],x2[18],y0[18],y1[19]);
full_adder full_adder18b_3(x3[18],x4[18],x5[18],y2[18],y3[19]);
full_adder full_adder18c_3(x_6[18],x_7[18],q_3[18],y4[18],y5[19]);

full_adder full_adder19a_3(x0[19],x1[19],x2[19],y0[19],y1[20]);
full_adder full_adder19b_3(x3[19],x4[19],x5[19],y2[19],y3[20]);
full_adder full_adder19c_3(x_6[19],x_7[19],q_1[19],y4[19],y5[20]);


full_adder full_adder20a_3(x0[20],x1[20],x2[20],y0[20],y1[21]);
full_adder full_adder20b_3(x3[20],x4[20],x5[20],y2[20],y3[21]);
full_adder full_adder20c_3(x_7[20],p_product_15[20],p_product_16[20],y4[20],y5[21]);

full_adder full_adder21a_3(x0[21],x1[21],x2[21],y0[21],y1[22]);
full_adder full_adder21b_3(x3[21],x5[21],p_product_13[21],y2[21],y3[22]);
full_adder full_adder21c_3(p_product_14[21],p_product_15[21],p_product_16[21],y4[21],y5[22]);


full_adder full_adder22a_3(x0[22],x1[22],p_product_11[22],y0[22],y1[23]);
full_adder full_adder22b_3(x3[22],p_product_12[22],p_product_13[22],y2[22],y3[23]);
full_adder full_adder22c_3(p_product_14[22],p_product_15[22],p_product_16[22],y4[22],y5[23]);

full_adder full_adder23a_3(x1[23],p_product_9[23],p_product_10[23],y0[23],y1[24]);
full_adder full_adder23b_3(p_product_11[23],p_product_12[23],p_product_13[23],y2[23],y3[24]);
full_adder full_adder23c_3(p_product_14[23],p_product_15[23],p_product_16[23],y4[23],y5[24]);

full_adder full_adder24a_3(p_product_10[24],p_product_11[24],p_product_12[24],y0[24],y1[25]);
//doubt 2 times p_product_14 used

full_adder full_adder24b_3(p_product_13[24],p_product_14[24],p_product_15[24],y2[24],y3[25]);

full_adder full_adder25_3(p_product_11[25],p_product_12[25],p_product_13[25],y0[25],y1[26]);


//4th stage addition

half_adder half_adder4a_4(p_product_1[4],p_product_2[4],z0[4],z1[5]);

full_adder full_adder5a_4(p_product_1[5],p_product_2[5],p_product_3[5],z0[5],z1[6]);
half_adder half_adder5b_4(p_product_4[5],p_product_5[5],z2[5],z3[6]);

full_adder full_adder6a_4(y0[6],p_product_3[6],p_product_4[6],z0[6],z1[7]);
full_adder full_adder6b_4(p_product_5[6],p_product_6[6],p_product_7[6],z2[6],z3[7]);

full_adder full_adder7a_4(y0[7],y1[7],y2[7],z0[7],z1[8]);
full_adder full_adder7b_4(p_product_6[7],p_product_7[7],p_product_8[7],z2[7],z3[8]);


full_adder full_adder8a_4(y0[8],y1[8],y2[8],z0[8],z1[9]);
full_adder full_adder8b_4(y3[8],y4[8],p_product_9[8],z2[8],z3[9]);


full_adder full_adder9a_4(y0[9],y1[9],y2[9],z0[9],z1[10]);
full_adder full_adder9b_4(y3[9],y4[9],y5[9],z2[9],z3[10]);

full_adder full_adder10a_4(y0[10],y1[10],y2[10],z0[10],z1[11]);
full_adder full_adder10b_4(y3[10],y4[10],y5[10],z2[10],z3[11]);

full_adder full_adder11a_4(y0[11],y1[11],y2[11],z0[11],z1[12]);
full_adder full_adder11b_4(y3[11],y4[11],y5[11],z2[11],z3[12]);

full_adder full_adder12a_4(y0[12],y1[12],y2[12],z0[12],z1[13]);
full_adder full_adder12b_4(y3[12],y4[12],y5[12],z2[12],z3[13]);


full_adder full_adder13a_4(y0[13],y1[13],y2[13],z0[13],z1[14]);
full_adder full_adder13b_4(y3[13],y4[13],y5[13],z2[13],z3[14]);

full_adder full_adder14a_4(y0[14],y1[14],y2[14],z0[14],z1[15]);
full_adder full_adder14b_4(y3[14],y4[14],y5[14],z2[14],z3[15]);

full_adder full_adder15a_4(y0[15],y1[15],y2[15],z0[15],z1[16]);
full_adder full_adder15b_4(y3[15],y4[15],y5[15],z2[15],z3[16]);

full_adder full_adder16a_4(y0[16],y1[16],y2[16],z0[16],z1[17]);
full_adder full_adder16b_4(y3[16],y4[16],y5[16],z2[16],z3[17]);

full_adder full_adder17a_4(y0[17],y1[17],y2[17],z0[17],z1[18]);
full_adder full_adder17b_4(y3[17],y4[17],y5[17],z2[17],z3[18]);

full_adder full_adder18a_4(y0[18],y1[18],y2[18],z0[18],z1[19]);
full_adder full_adder18b_4(y3[18],y4[18],y5[18],z2[18],z3[19]);

full_adder full_adder19a_4(y0[19],y1[19],y2[19],z0[19],z1[20]);
full_adder full_adder19b_4(y3[19],y4[19],y5[19],z2[19],z3[20]);

full_adder full_adder20a_4(y0[20],y1[20],y2[20],z0[20],z1[21]);
full_adder full_adder20b_4(y3[20],y4[20],y5[20],z2[20],z3[21]);


full_adder full_adder21a_4(y0[21],y1[21],y2[21],z0[21],z1[22]);
full_adder full_adder21b_4(y3[21],y4[21],y5[21],z2[21],z3[22]);

full_adder full_adder22a_4(y0[22],y1[22],y2[22],z0[22],z1[23]);
full_adder full_adder22_4(y3[22],y4[22],y5[22],z2[22],z3[23]);

full_adder full_adder23a_4(y0[23],y1[23],y2[23],z0[23],z1[24]);
full_adder full_adder23_4(y3[23],y4[23],y5[23],z2[23],z3[24]);

full_adder full_adder24a_4(y0[24],y1[24],y2[24],z0[24],z1[25]);
full_adder full_adder24_4(y3[24],p_product_16[24],y5[24],z2[24],z3[25]);


full_adder full_adder25a_4(y0[25],y1[25],p_product_14[25],z0[25],z1[26]);
full_adder full_adder25_4(y3[25],p_product_15[25],p_product_16[25],z2[25],z3[26]);


full_adder full_adder26a_4(y1[26],p_product_12[26],p_product_13[26],z0[26],z1[27]);
full_adder full_adder26_4(p_product_14[26],p_product_15[26],p_product_16[26],z2[26],z3[27]);



full_adder full_adder27_4(p_product_13[27],p_product_14[27],p_product_15[27],z0[27],z1[28]);


//fifth stage addition

half_adder half_adder3a_5(p_product_1[3],p_product_2[3],u0[3],u1[4]);

full_adder full_adder4a_5(p_product_3[4],p_product_4[4],p_product_5[4],u0[4],u1[5]);

full_adder full_adder5a_5(z1[5],z2[5],p_product_6[5],u0[5],u1[6]);

full_adder full_adder6a_5(z0[6],z1[6],z2[6],u0[6],u1[7]);

full_adder full_adder7_5(z0[7],z1[7],z2[7],u0[7],u1[8]);
full_adder full_adder8_5(z0[8],z1[8],z2[8],u0[8],u1[9]);
full_adder full_adder9_5(z0[9],z1[9],z2[9],u0[9],u1[10]);
full_adder full_adder10_5(z0[10],z1[10],z2[10],u0[10],u1[11]);
full_adder full_adder11_5(z0[11],z1[11],z2[11],u0[11],u1[12]);
full_adder full_adder12_5(z0[12],z1[12],z2[12],u0[12],u1[13]);
full_adder full_adder13_5(z0[13],z1[13],z2[13],u0[13],u1[14]);
full_adder full_adder14_5(z0[14],z1[14],z2[14],u0[14],u1[15]);
full_adder full_adder15_5(z0[15],z1[15],z2[15],u0[15],u1[16]);
full_adder full_adder16_5(z0[16],z1[16],z2[16],u0[16],u1[17]);
full_adder full_adder17_5(z0[17],z1[17],z2[17],u0[17],u1[18]);
full_adder full_adder18_5(z0[18],z1[18],z2[18],u0[18],u1[19]);
full_adder full_adder19_5(z0[19],z1[19],z2[19],u0[19],u1[20]);
full_adder full_adder20_5(z0[20],z1[20],z2[20],u0[20],u1[21]);
full_adder full_adder21_5(z0[21],z1[21],z2[21],u0[21],u1[22]);
full_adder full_adder22_5(z0[22],z1[22],z2[22],u0[22],u1[23]);
full_adder full_adder23_5(z0[23],z1[23],z2[23],u0[23],u1[24]);
full_adder full_adder24_5(z0[24],z1[24],z2[24],u0[24],u1[25]);
full_adder full_adder25_5(z0[25],z1[25],z2[25],u0[25],u1[26]);
full_adder full_adder26_5(z0[26],z1[26],z2[26],u0[26],u1[27]);
full_adder full_adder27_5(z0[27],z1[27],p_product_16[27],u0[27],u1[28]);

full_adder full_adder28_5(z1[28],p_product_14[28],p_product_15[28],u0[28],u1[29]);


//6th stage addition

half_adder half_adder2_6(p_product_1[2],p_product_2[2],v0[2],v1[3]);

full_adder full_adder3_6(u0[3],p_product_3[3],p_product_4[3],v0[3],v1[4]);

full_adder full_adder4_6(u0[4],u1[4],z0[4],v0[4],v1[5]);

full_adder full_adder5_6(u0[5],u1[5],z0[5],v0[5],v1[6]);

full_adder full_adder6_6(u0[6],u1[6],z3[6],v0[6],v1[7]);

full_adder full_adder7_6(u0[7],u1[7],z3[7],v0[7],v1[8]);
full_adder full_adder8_6(u0[8],u1[8],z3[8],v0[8],v1[9]);
full_adder full_adder9_6(u0[9],u1[9],z3[9],v0[9],v1[10]);
full_adder full_adder10_6(u0[10],u1[10],z3[10],v0[10],v1[11]);
full_adder full_adder11_6(u0[11],u1[11],z3[11],v0[11],v1[12]);
full_adder full_adder12_6(u0[12],u1[12],z3[12],v0[12],v1[13]);
full_adder full_adder13_6(u0[13],u1[13],z3[13],v0[13],v1[14]);
full_adder full_adder14_6(u0[14],u1[14],z3[14],v0[14],v1[15]);
full_adder full_adder15_6(u0[15],u1[15],z3[15],v0[15],v1[16]);
full_adder full_adder16_6(u0[16],u1[16],z3[16],v0[16],v1[17]);
full_adder full_adder17_6(u0[17],u1[17],z3[17],v0[17],v1[18]);
full_adder full_adder18_6(u0[18],u1[18],z3[18],v0[18],v1[19]);
full_adder full_adder19_6(u0[19],u1[19],z3[19],v0[19],v1[20]);
full_adder full_adder20_6(u0[20],u1[20],z3[20],v0[20],v1[21]);
full_adder full_adder21_6(u0[21],u1[21],z3[21],v0[21],v1[22]);
full_adder full_adder22_6(u0[22],u1[22],z3[22],v0[22],v1[23]);
full_adder full_adder23_6(u0[23],u1[23],z3[23],v0[23],v1[24]);
full_adder full_adder24_6(u0[24],u1[24],z3[24],v0[24],v1[25]);
full_adder full_adder25_6(u0[25],u1[25],z3[25],v0[25],v1[26]);
full_adder full_adder26_6(u0[26],u1[26],z3[26],v0[26],v1[27]);
full_adder full_adder27_6(u0[27],u1[27],z3[27],v0[27],v1[28]);
full_adder full_adder28_6(u0[28],u1[28],p_product_16[28],v0[28],v1[29]);
full_adder full_adder29_6(p_product_15[29],u1[29],p_product_16[29],v0[29],v1[30]);


bentkung adder(v0,v1,1'b0,mul_out,cout);

//brent_kung16bit addex1(v0[15:0],v1[15:0],b,sum,cin,carry);

 
 endmodule
 
 
 
 
 