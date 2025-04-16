`timescale 1ns / 1ps

module multi(A,B,P,Out);
    input [7:0] A ,B; 
    input [8:0] P;
    output reg [7:0] Out;
    reg [8:0]temp;
    integer i;
    
    always @ (A,B,P)
        begin
        temp=0;
        for (i=1; i<=8 ; i=i+1)
            begin
            
            temp={temp,1'b0};
            
            if (temp[8]) temp=temp^P; 
            else temp=temp;
            
            if (A[8-i]) temp=temp^B;
            else temp=temp ;
            
            end    
        Out=temp[7:0];
        end
endmodule
