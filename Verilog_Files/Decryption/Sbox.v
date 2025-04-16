`timescale 1ns / 1ps

module Sbox(X,S0,S1,Y);
    input[31:0] X,S0,S1;
    output[31:0] Y;
    wire [7:0] X0,X1,X2,X3,S0_0,S0_1,S0_2,S0_3,S1_0,S1_1,S1_2,S1_3;
    wire [7:0] Y0,Y1,Y2,Y3;
    assign {X3,X2,X1,X0}=X;
    assign {S0_3,S0_2,S0_1,S0_0}=S0;
    assign {S1_3,S1_2,S1_1,S1_0}=S1;
    Sbox0 s0(X0,S0_0,S1_0,Y0);
    Sbox1 s1(X1,S0_1,S1_1,Y1);
    Sbox2 s2(X2,S0_2,S1_2,Y2);
    Sbox3 s3(X3,S0_3,S1_3,Y3);
    assign Y = {Y0,Y1,Y2,Y3};
endmodule

module Sbox0(X,S0,S1,Y);
    input[7:0] X,S0,S1;
    output[7:0] Y;
    wire [7:0] x1,x2,xor1,xor2;
    Q0 q0_0(X,x1);
    assign xor1 = x1^S0;
    Q0 q0_1(xor1,x2);
    assign xor2=x2^S1;
    Q1 q0_2(xor2,Y);
endmodule

module Sbox1(X,S0,S1,Y);
    input[7:0] X,S0,S1;
    output[7:0] Y;
    wire [7:0] x1,x2,xor1,xor2;
    Q1 q1_0(X,x1);
    assign xor1 = x1^S0;
    Q0 q1_1(xor1,x2);
    assign xor2=x2^S1;
    Q0 q1_2(xor2,Y);
endmodule

module Sbox2(X,S0,S1,Y);
    input[7:0] X,S0,S1;
    output[7:0] Y;
    wire [7:0] x1,x2,xor1,xor2;
    Q0 q2_0(X,x1);
    assign xor1 = x1^S0;
    Q1 q2_1(xor1,x2);
    assign xor2=x2^S1;
    Q1 q2_2(xor2,Y);
endmodule

module Sbox3(X,S0,S1,Y);
    input[7:0] X,S0,S1;
    output[7:0] Y;
    wire [7:0] x1,x2,xor1,xor2;
    Q1 q3_0(X,x1);
    assign xor1 = x1^S0;
    Q1 q3_1(xor1,x2);
    assign xor2=x2^S1;
    Q0 q3_2(xor2,Y);
endmodule