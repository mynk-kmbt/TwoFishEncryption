`timescale 1ns / 1ps
module encrypt_out(input [127:0] plain_text, input [127:0] key, output [127:0] encrypt, input clk, input reset);

    reg [31:0] t00,t01,t02,t03;
    reg [5:0] counter; 
    reg [63:0] K;
    wire [31:0] t10,t11,t12,t13;
    wire [127:0] in_whiten;
    wire [31:0] S0, S1;
    reg [127:0] Key1, Key2;
    wire [127:0] out;
    
    reg [31:0] K1, K2;
    

    
    Mat_Multi uut(.Key(key), .S0(S0), .S1(S1));
    wire [127:0] encrypt1;
    wire [7:0] e00,e01,e02,e03,e10,e11,e12,e13,e20,e21,e22,e23,e30,e31,e32,e33;
       
       
     
        
        
         FuncF_out funcf_inst0(
                .R0(t00), 
                .R1(t01),
                .R2(t02), 
                .R3(t03), 
                .K0(K1), 
                .K1(K2),
                .c2(t10), 
                .c3(t11),
                .r0(t12), 
                .r1(t13), 
                .S0(S0), 
                .S1(S1)
            );


        wire [31:0] Ke0,Ke1;
        
        H_Function hh0 (.i(counter), .key(key), .K0(Ke0), .K1(Ke1), .clk(clk));

        always@ (posedge clk)
        if (reset) 
        begin
        counter<=0;
        K<=0;
        Key1<=0;
        Key2<=0;
        K1<=0;
        K2<=0;
        t00<=0;
            t01<=0;
            t02<=0;
            t03<=0;
        end
        else
        begin
            if (counter<=22) K<={K,Ke0,Ke1};
            K1<=K[63:32];
            K2<=K[31:0];
            if (counter<=23) counter<=counter+1'b1;
            else counter<=counter;
            
            if (counter==2 || counter==3) 
            begin
            Key1<={Key1,Ke0,Ke1};
            
            end
            else if (counter==4 || counter==5) begin
            Key2<={Key2,Ke0,Ke1};
            {t00,t01,t02,t03} <= in_whiten;
           
            end
            
            else if (counter==6 || counter==7)
                begin
                {t00,t01,t02,t03} <= in_whiten;
                end
            
            else if ( counter>=8 && counter<=22) 
            begin
            t00<=t12;
            t01<=t13;
            t02<=t10;
            t03<=t11;
            end
            
            else 
            begin
            
            t00<=t00;
            t01<=t01;
            t02<=t02;
            t03<=t03;
            end
        end
        
        
         
    wire[127:0] plain_text1;
    wire[7:0] i00,i01,i02,i03,i10,i11,i12,i13,i20,i21,i22,i23,i30,i31,i32,i33;
    assign {i00,i01,i02,i03,i10,i11,i12,i13,i20,i21,i22,i23,i30,i31,i32,i33}=plain_text;
    assign plain_text1={i03,i02,i01,i00,i13,i12,i11,i10,i23,i22,i21,i20,i33,i32,i31,i30};  
    
    input_whitening w0(.plain_text(plain_text1), .key(Key1), .whitened_text(in_whiten));
           
           
    assign out={t10,t11,t12,t13};
    
    input_whitening w1(.plain_text(out), .key(Key2), .whitened_text(encrypt1));
    
    assign {e00,e01,e02,e03,e10,e11,e12,e13,e20,e21,e22,e23,e30,e31,e32,e33}=encrypt1;
    assign encrypt=(counter==5'h17)?{e03,e02,e01,e00,e13,e12,e11,e10,e23,e22,e21,e20,e33,e32,e31,e30}:encrypt;
    
    
endmodule