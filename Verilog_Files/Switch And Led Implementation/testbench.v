`timescale 1ns / 1ps

module testbench( );
    reg [15:0]bits;
    reg clk,reset,mode_in;
    wire [7:0]LED;
    wire reset_led, clk_led,mode_led;
    wire [4:0] state_led;
    
    top_module uut (.bits(bits), .clk(clk), .reset(reset), .mode_in(mode_in) , .LED(LED), .reset_led(reset_led), .clk_led(clk_led), .mode_led(mode_led), .state_led(state_led) ) ;

    initial
    begin
    clk=0;
    bits=16'b0;
    reset=0;#1;reset=1;#1;reset=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    reset=0;#1;reset=1;#1;reset=0;#1;
    mode_in=0;#1;mode_in=1;#1;mode_in=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
    clk=1;#1;clk=0;#1;
      $finish;
    end 
endmodule
