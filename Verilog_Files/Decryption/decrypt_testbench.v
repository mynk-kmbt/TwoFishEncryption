`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2025 00:16:37
// Design Name: 
// Module Name: decrypt
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module decrypt();

    reg [127:0] cypher_text, key;
    wire [127:0] plain_text;
    
    decrypt_out uut ( .plain_text(cypher_text), .key(key), .encrypt(plain_text));
    
    initial 
    begin
    cypher_text=128'h9F589F5CF6122C32B6BFEC2F2AE8C35A;
    key=128'h00000000000000000000000000000000;#10;
    $finish;
    end

endmodule
