`timescale 1ns / 1ps
module H_Function(key,i,K0,K1, clk);
    input clk;
    input [127:0]key;
    input [5:0]i;
    output [31:0]K0,K1;
//    output [31:0] K0,K1,K2,K3,K4,K5,K6,K7,K8,K9,K10,K11,K12,K13,K14,K15,K16,K17,K18,K19,K20,K21,K22,K23,K24,K25,K26,K27,K28,K29,K30,K31,K32,K33,K34,K35,K36,K37,K38,K39;
//    wire [31:0] K [0:39];
    wire [31:0] O1,O2;
    wire [31:0] M0,M1,M2,M3;
    wire [31:0] M0n,M1n,M2n,M3n;
    wire [31:0]ROL8,ROL9;
    wire [31:0] k;
    reg [7:0] i1,i2;
    
    reg [31:0] pht_input0, pht_input1;
    
    func_g f0({4{i1}},M2n,M0n,O1);
    func_g f1({4{i2}},M3n,M1n,O2);
    pht_32bit P0(pht_input0,pht_input1,K0,k);       
    
    // pht_input0 = O1
    // pht_input1= ROL8
    assign {M0,M1,M2,M3}=key;
    
    assign M0n={M0[7:0],M0[15:8],M0[23:16],M0[31:24]};
    assign M1n={M1[7:0],M1[15:8],M1[23:16],M1[31:24]};
    assign M2n={M2[7:0],M2[15:8],M2[23:16],M2[31:24]};
    assign M3n={M3[7:0],M3[15:8],M3[23:16],M3[31:24]};
             
    
    assign ROL8=(O2<<8)|(O2>>24);
    assign ROL9=(k<<9)|(k>>23);
    assign K1=ROL9;
    
    
    always @(posedge clk)
    begin
        i1<=2*i;
        i2<=2*i+1;
        pht_input0<=O1;
        pht_input1<=ROL8;
    end
//   assign K0=K[0];assign K1=K[1];assign K2=K[2];assign K3=K[3];assign K4=K[4];assign K5=K[5];assign K6=K[6];assign K7=K[7];assign K8=K[8];assign K9=K[9];
//   assign K10=K[10];assign K11=K[11];assign K12=K[12];assign K13=K[13];assign K14=K[14];assign K15=K[15];assign K16=K[16];assign K17=K[17];assign K18=K[18];assign K19=K[19];
//   assign K20=K[20];assign K21=K[21];assign K22=K[22];assign K23=K[23];assign K24=K[24];assign K25=K[25];assign K26=K[26];assign K27=K[27];assign K28=K[28];assign K29=K[29];
//   assign K30=K[30];assign K31=K[31];assign K32=K[32];assign K33=K[33];assign K34=K[34];assign K35=K[35];assign K36=K[36];assign K37=K[37];assign K38=K[38];assign K39=K[39];
endmodule
