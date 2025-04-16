`timescale 1ns / 1ps

module MDS(Y,Z) ;
    input [31:0] Y;
    output [31:0] Z;
    
    wire [7:0] y0,y1,y2,y3;
    
    assign {y0,y1,y2,y3}=Y;
    
    wire [7:0] z00,z01,z02,z03;
    wire [7:0] z10,z11,z12,z13;
    wire [7:0] z20,z21,z22,z23;
    wire [7:0] z30,z31,z32,z33;
    
    wire [7:0] z0,z1,z2,z3;
    
    multi m000 (8'h01,y0,9'b101101001,z00);
    multi m001 (8'hEF,y1,9'b101101001,z01);
    multi m002 (8'h5B,y2,9'b101101001,z02);
    multi m003 (8'h5B,y3,9'b101101001,z03);
    assign z0=z00^z01^z02^z03;
    
    multi m010 (8'h5B,y0,9'b101101001,z10);
    multi m011 (8'hEF,y1,9'b101101001,z11);
    multi m012 (8'hEF,y2,9'b101101001,z12);
    multi m013 (8'h01,y3,9'b101101001,z13);
    assign z1=z10^z11^z12^z13;
    
    multi m020 (8'hEF,y0,9'b101101001,z20);
    multi m021 (8'h5B,y1,9'b101101001,z21);
    multi m022 (8'h01,y2,9'b101101001,z22);
    multi m023 (8'hEF,y3,9'b101101001,z23);
    assign z2=z20^z21^z22^z23;
   
    multi m030 (8'hEF,y0,9'b101101001,z30);
    multi m031 (8'h01,y1,9'b101101001,z31);
    multi m032 (8'hEF,y2,9'b101101001,z32);
    multi m033 (8'h5B,y3,9'b101101001,z33);
    assign z3=z30^z31^z32^z33; 
  
    assign Z={z3,z2,z1,z0};
endmodule