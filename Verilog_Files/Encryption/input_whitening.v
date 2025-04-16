`timescale 1ns / 1ps
module input_whitening(plain_text,key,whitened_text);
    input [127:0] plain_text;
    input [127:0] key;
    output [127:0] whitened_text;
    
    wire [31:0]P0=plain_text[31:0];
    wire [31:0]P1=plain_text[63:32];
    wire [31:0]P2=plain_text[95:64];
    wire [31:0]P3=plain_text[127:96];
    
    wire [31:0]K0=key[31:0];
    wire [31:0]K1=key[63:32];
    wire [31:0]K2=key[95:64];
    wire [31:0]K3=key[127:96]; 
    
    wire [31:0]R0=P0^K0;
    wire [31:0]R1=P1^K1;
    wire [31:0]R2=P2^K2;
    wire [31:0]R3=P3^K3;  
    
    assign whitened_text={R3,R2,R1,R0}; 
endmodule
