`timescale 1ns / 1ps
module FuncF_out(input [31:0] R0,
                input [31:0] R1,
                input [31:0] R2,
                input [31:0] R3,
                input [31:0] K0,
                input [31:0] K1,
                input [31:0] S0,
                input [31:0] S1,
                output [31:0] c2,
                output [31:0] c3,
                output [31:0] r0,
                output [31:0] r1);
                
    wire [31:0] F0, F1, T0, T1, C2, C3;
    
  F_function f1(.R0(R0), .R1(R1), .K0(K0),.S0(S0),.S1(S1), .K1(K1), .F0(F0), .F1(F1));
    
    assign T0 = F0 ^ R2;
    assign C2 = ((T0 >> 1) | (T0 << 31));
    assign T1 = ((R3 << 1) | (R3 >> 31));
    assign C3 = T1 ^ F1;
    
    assign r0 = C2;
    assign r1 = C3;
    assign c2 = R0;
    assign c3 = R1;
    
endmodule
