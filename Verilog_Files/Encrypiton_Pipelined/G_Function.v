`timescale 1ns / 1ps
module func_g(X,S0,S1,Z);
    input [31:0]X,S0,S1;
    output [31:0]Z;
    wire [31:0] Y;
    wire [7:0]X0,X1,X2,X3,S0_0,S0_1,S0_2,S0_3,S1_0,S1_1,S1_2,S1_3;
    wire [7:0]Y0,Y1,Y2,Y3;
    
    assign {X0,X1,X2,X3}=X;
    assign {S0_0,S0_1,S0_2,S0_3}=S0;
    assign {S1_0,S1_1,S1_2,S1_3}=S1;
    
    Sbox AA0(.X(X),.S0(S0),.S1(S1),.Y(Y));
    assign {Y0,Y1,Y2,Y3}=Y;
    
    MDS MM0(Y,Z);
endmodule