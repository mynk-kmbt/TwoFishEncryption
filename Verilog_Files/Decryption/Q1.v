`timescale 1ns / 1ps
module Q1(X,X1);
    input[7:0] X;
    output [7:0] X1;
    wire [3:0] a0,b0,a1,b1,a2,b2,a3,b3,a4,b4,ROR1,ROR2,x1,x2;
    assign {a0,b0}=X;
    assign a1=a0^b0;
    assign x1=(8*a0)%16;
    assign ROR1=(b0>>1)|(b0<<3);
    assign b1=a0^ROR1^x1;
    assign a2= T0(a1);
    assign b2=T1(b1);
    assign a3=a2^b2;
    assign x2=(8*a2)%16;
    assign ROR2=(b2>>1)|(b2<<3);
    assign b3=a2^ROR2^x2;
    assign a4=T2(a3);
    assign b4=T3(b3);
    assign X1=16*b4+a4;
    
    function [3:0] T0 (input[3:0] data);
        case(data)
            4'd0: T0 = 4'd2;
            4'd1 : T0= 4'd8;
            4'd2 : T0= 4'd11;
            4'd3 : T0= 4'd13;
            4'd4 : T0= 4'd15;
            4'd5 : T0= 4'd7;
            4'd6 : T0= 4'd6;
            4'd7 : T0= 4'd14;
            4'd8 : T0= 4'd3;
            4'd9 : T0= 4'd1;
            4'd10 : T0= 4'd9;
            4'd11 : T0= 4'd4;
            4'd12 : T0= 4'd0;
            4'd13 : T0= 4'd10;
            4'd14 : T0= 4'd12;
            4'd15 : T0= 4'd5;
        endcase
    endfunction
    function [3:0] T1 (input[3:0] data);
        case(data)
            4'd0: T1 = 4'd1;
            4'd1 : T1= 4'd14;
            4'd2 : T1= 4'd2;
            4'd3 : T1= 4'd11;
            4'd4 : T1= 4'd4;
            4'd5 : T1= 4'd12;
            4'd6 : T1= 4'd3;
            4'd7 : T1= 4'd7;
            4'd8 : T1= 4'd6;
            4'd9 : T1= 4'd13;
            4'd10 : T1= 4'd10;
            4'd11 : T1= 4'd5;
            4'd12 : T1= 4'd15;
            4'd13 : T1= 4'd9;
            4'd14 : T1= 4'd0;
            4'd15 : T1= 4'd8;
        endcase
    endfunction
    function [3:0] T2 (input[3:0] data);
        case(data)
            4'd0: T2 = 4'd4;
            4'd1 : T2= 4'd12;
            4'd2 : T2= 4'd7;
            4'd3 : T2= 4'd5;
            4'd4 : T2= 4'd1;
            4'd5 : T2= 4'd6;
            4'd6 : T2= 4'd9;
            4'd7 : T2= 4'd10;
            4'd8 : T2= 4'd0;
            4'd9 : T2= 4'd14;
            4'd10 : T2= 4'd13;
            4'd11 : T2= 4'd8;
            4'd12 : T2= 4'd2;
            4'd13 : T2= 4'd11;
            4'd14 : T2= 4'd3;
            4'd15 : T2= 4'd15;
        endcase
    endfunction
    function [3:0] T3 (input[3:0] data);
        case(data)
            4'd0: T3 = 4'd11;
            4'd1 : T3= 4'd9;
            4'd2 : T3= 4'd5;
            4'd3 : T3= 4'd1;
            4'd4 : T3= 4'd12;
            4'd5 : T3= 4'd3;
            4'd6 : T3= 4'd13;
            4'd7 : T3= 4'd14;
            4'd8 : T3= 4'd6;
            4'd9 : T3= 4'd4;
            4'd10 : T3= 4'd7;
            4'd11 : T3= 4'd15;
            4'd12 : T3= 4'd2;
            4'd13 : T3= 4'd0;
            4'd14 : T3= 4'd8;
            4'd15 : T3= 4'd10;
        endcase
    endfunction





endmodule