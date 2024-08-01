`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.12.2023 13:20:12
// Design Name: 
// Module Name: mux_4
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


module mux_4(
    input i0,i1,i2,i3,s1,s0,
    output out
    );
    
    wire s1n,s0n;
    wire y1,y2,y3,y4;
    
    not(s1n,s1);
    not(s0n,s0);
    and(y1,i0,s1,s0);
    and(y2,i1,s1n,s0);
    and(y3,i2,s1,s0n);
    and(y4,i3,s1n,s0n);
    or(out,y1,y2,y3,y4);
endmodule

module mux_4_tb;
reg i0,i1,i2,i3,s1,s0;
wire out;
mux_4 uut(.i0(i0),.i1(i1),.i2(i2),.i3(i3),.out(out),.s1(s1),.s0(s0));
initial begin
s1=0;s0=0;i0=0;i1=0;i2=0;i3=0;
#10 s1=0;s0=0;i1=0;i2=0;i3=1;i0=0;
#10 s1=1;i2=0;
#10 i2=1;i3=0;
#10 s1=0;s0=1;
#10 i1=1;i2=0;
#10 s1=1;s0=1;
#10 i0=1;


#10 $finish;
end 
endmodule

