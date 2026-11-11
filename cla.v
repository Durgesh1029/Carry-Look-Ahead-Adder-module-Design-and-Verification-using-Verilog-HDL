module cla(a,b,c0,cout,s);
input [3:0] a,b;
input c0;
output cout;
output [3:0] s;
wire [3:0] g,p;
wire [2:0] carry;
assign g = a & b;
assign p = a ^ b; 
/* for parmeterized design 
integer i; // 4 ha ckt ready now
always @(*) begin
    for(i=0;i<4;i=i+1) begin
        g[i] = a[i] & b[i];
        p[i] = a[i] ^ b[i];
    end
end */
//carry lookahead generator
assign carry[0] = g[0] | (p[0] & c0);//c1= g0+p0c0 
assign carry[1] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c0);//c2= g1+p1c1= g1+p1g0+p1p0c0
assign carry[2] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0])|(p[2] & p[1] &p[0] &c0);//c3=g2+p2c2=g2+p2g1+p2p1g0+p2p1p0c0
assign cout = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1])|(p[3] & p[2] &p[1] &g[0])|(p[3]&p[2]&p[1]&p[0]&c0);//c4=g3+p3c3=g3+p3g2+p3p2g1+p3p2p1g0+p3p2p1p0c0
assign s[0]= p[0] ^ c0;
assign s[1]= p[1] ^ carry[0];
assign s[2]= p[2] ^ carry[1];
assign s[3]= p[3] ^ carry[2];
endmodule
