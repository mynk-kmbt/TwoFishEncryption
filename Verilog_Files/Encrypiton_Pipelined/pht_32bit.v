`timescale 1ns / 1ps
module pht_32bit(a,b,A,B);
    input [31:0] a,b;
    output [31:0] A,B;
    
     // Modulo 2^32 is implicit due to the 32-bit width of the output
    assign A=a+b;
    assign B=a+(b<<1);
endmodule