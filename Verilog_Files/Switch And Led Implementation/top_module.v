`timescale 1ns / 1ps


module top_module(input [15:0]bits,input clk,reset,mode_in, output reg [7:0]LED,output reset_led, clk_led,mode_led, output [4:0] state_led);

reg [4:0] state;
reg [255:0] buffer;
reg mode;
wire [127:0]ET;
wire [127:0] cypher;
wire [127:0] plain;
assign clk_led=clk;
assign reset_led=reset;
assign state_led=state;
assign mode_led=mode;

    encrypt_out inst1 (buffer[127:0], buffer[255:128], cypher);
    decrypt_out inst2 (buffer[127:0], buffer[255:128], plain);

assign ET=mode?plain:cypher;

always@(posedge clk , posedge reset, posedge mode_in)

        
    if (reset) begin
                state<=5'h0;
                buffer<=128'h0;
                mode<=0;
                LED<=0;
                end                
     else
        begin
        case(state)
            5'd0: begin buffer[15:0]<=bits; state=state+1; end
            5'd1: begin buffer[31:16]<=bits; state=state+1; end
            5'd2: begin buffer[47:32]<=bits; state=state+1; end
            5'd3: begin buffer[63:48]<=bits; state=state+1; end
            5'd4: begin buffer[79:64]<=bits; state=state+1; end
            5'd5: begin buffer[95:80]<=bits; state=state+1; end
            5'd6: begin buffer[111:96]<=bits; state=state+1; end
            5'd7: begin buffer[127:112]<=bits; state=state+1; end
            5'd8: begin buffer[143:128]<=bits; state=state+1; end
            5'd9: begin buffer[159:144]<=bits; state=state+1; end
            5'd10: begin buffer[175:160]<=bits; state=state+1; end
            5'd11: begin buffer[191:176]<=bits; state=state+1; end
            5'd12: begin buffer[207:192]<=bits; state=state+1; end
            5'd13: begin buffer[223:208]<=bits; state=state+1; end
            5'd14: begin buffer[239:224]<=bits; state=state+1; end
            5'd15: begin buffer[255:240]<=bits; state=state+1; end
            5'd16: begin LED<=ET[127:120]; state=state+1; end
            5'd17: begin LED<=ET[119:112]; state=state+1; end
            5'd18: begin LED<=ET[111:104]; state=state+1; end
            5'd19: begin LED<=ET[103:96]; state=state+1; end
            5'd20: begin LED<=ET[95:88]; state=state+1; end
            5'd21: begin LED<=ET[87:80]; state=state+1; end
            5'd22: begin LED<=ET[79:72]; state=state+1; end
            5'd23: begin LED<=ET[71:64]; state=state+1; end
            5'd24: begin LED<=ET[63:56]; state=state+1; end
            5'd25: begin LED<=ET[55:48]; state=state+1; end
            5'd26: begin LED<=ET[47:40]; state=state+1; end
            5'd27: begin LED<=ET[39:32]; state=state+1; end
            5'd28: begin LED<=ET[31:24]; state=state+1; end
            5'd29: begin LED<=ET[23:16]; state=state+1; end
            5'd30: begin LED<=ET[15:8]; state=state+1; end
            5'd31: begin LED<=ET[7:0]; state=0; end
            endcase
        
       if(mode_in)  mode=~mode;
       end
    
endmodule
