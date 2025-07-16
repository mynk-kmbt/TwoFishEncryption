module encrypt_out_tb();

    reg [127:0] plain_text, key;
    wire [127:0] cypher_text;
    reg clk, reset;
   
        
    encrypt_out uut ( .plain_text(plain_text), .key(key), .encrypt(cypher_text) ,.clk(clk), .reset(reset));
    
 
    initial
    begin
    clk=0;
    forever #5 clk=~clk;
    end
    
    initial 
    begin
    plain_text=128'hD491DB16E7B1C39E86CB086B789F5419;
    key=128'h9F589F5CF6122C32B6BFEC2F2AE8C35A;reset=1;#10;reset=0;#1000;
    $finish;
    end

endmodule