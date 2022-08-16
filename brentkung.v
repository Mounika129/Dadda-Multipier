module brentkung ( a,b,cin,sum ,carry);

input [15:0] a,b;
input cin;
output carry;

output [15:0] sum;
	
wire [16:0] x;
assign c[0]=cin;

wire [15:0] f1_p,f1_g ;
wire [7:0] s1_p,s1_g;
wire [3:0] t1_p,t1_g;
wire [1:0] f4_p,f4_g;
wire  [0:0] f5_p,f5_g;
genvar i;

//f1 order
generate
for (i=0;i<=15;i=i+1)
begin :mk
xor_module x1(f1_p[i],a[i],b[i]);
and_module a1( f1_g[i],a[i],b[i]);
end
endgenerate

////s1 order

generate 
for (i=0;i<=7;i=i+1)
begin :mk1
aplusbc_module ap2(s1_g[i],f1_g[2*i+1],f1_p[2*i+1],f1_g[2*i]);
and_module a2 (s1_p[i],f1_p[2*i+1],f1_p[2*i]);
end
endgenerate

//t1 order

generate 
for (i=0;i<=3;i=i+1)
begin :mk2
 assign t1_g[i] = s1_g[2*i+1] | (s1_p[2*i+1]&s1_g[2*i]);
//aplusbc_module q11(t1_g[i],s1_g[2*i+1],s1_p[2*i+1],s1_g[2*i]);
and_module a3(t1_p[i],s1_p[2*i+1],s1_p[2*i]);
end
endgenerate

//f4 order

generate 
for (i=0;i<=1;i=i+1)
begin :mk3
aplusbc_module ap4(f4_g[i],t1_g[2*i+1],t1_p[2*i+1],t1_g[2*i]);
and_module a4(f4_p[i],t1_p[2*i+1],t1_p[2*i]);
end
endgenerate


//f5 order

generate 
for (i=0;i<=0;i=i+1)
begin :mk4
aplusbc_module ap5(f5_g[i],f4_g[2*i+1],f4_p[2*i+1],f4_g[2*i]);
and_module a5(f5_p[i],f4_p[2*i+1],f4_p[2*i]);
end
endgenerate


//f1_ c calculations

assign c[1]=f1_g[0] | ( f1_p[0] & c[0] );
assign c[2]=s1_g[0] | ( s1_p[0] & c[0] );
assign c[4]=t1_g[0] | ( t1_p[0] & c[0] );
assign c[8]=f4_g[0] | ( f4_p[0] & c[0] );
assign c[16]=f5_g[0] | ( f5_p[0] & c[0] );

//s1 order c calculations

assign c[3]=f1_g[2] | ( f1_p[2] & c[2] );
assign c[5]=f1_g[4] | ( f1_p[4] & c[4] );
assign c[9]=f1_g[8] | ( f1_p[8] & c[8] );
assign c[6]=s1_g[2] | ( s1_p[2] & c[4] );
assign c[10]=s1_g[4] | ( s1_p[4] & c[8] );
assign c[12]=t1_g[2] | ( t1_p[2] & c[8] );

//t1 order c calculations

assign c[7]=f1_g[6] | ( f1_p[6] & c[6] );
assign c[11]=f1_g[10] | ( f1_p[10] & c[10] );
assign c[13]=f1_g[12] | ( f1_p[12] & c[12] );
assign c[14]=s1_g[6] | ( s1_p[6] & c[12] );

// final order c calculations

assign c[15]=f1_g[14] | ( f1_p[14] & c[14] );


generate
for (i=0;i<=15;i=i+1)
begin :mk5
xor_module x2(sum[i],f1_p[i],c[i]);
end
endgenerate



assign carry_out = c[16];

endmodule



























