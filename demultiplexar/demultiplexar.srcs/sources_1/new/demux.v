`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.12.2023 19:07:59
// Design Name: 
// Module Name: demux
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module demux_4(
    input i,s1,s0,
    output a,b,c,d
    );
    
   wire s1n,s0n;
   not(s1n,s1);
   not(s0n,s0);
   and(a,s1,s0,i);
   and(b,s1n,s0,i);
   and(c,s1,s0n,i);
   and(d,s1n,s0n,i);
endmodule

module demux_tb;
reg i,s1,s0;
wire a,b,c,d;
demux_4 uut(.a(a),.b(b),.c(c),.d(d),.i(i),.s0(s0),.s1(s1));
initial begin
s1=0;s0=0;i=0;
#10 i=1;
#10 s1=1;
#10 i=0;
#10 s1=0;s0=1;
#10 i=1;
#10 s1=1;s0=1;
#10 i=0;
#10 $finish;
end 
endmodule
