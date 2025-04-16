`timescale 1ns / 1ps

module controller_new(
    input clk_100MHz,  // System clock
    input rx,          // UART receive input
    output tx,         // UART transmit output
    output rx_busy,    // UART RX busy flag
    output converted,  // UART RX data converted flag
    output data_valid, // UART RX data valid flag
    output tx_busy,     // UART TX busy flag
    input [2:0]in
);
    
    // FSM states
    localparam RX_NUM_PT_0th_LB = 0;
    localparam RX_NUM_PT_1th_LB = 1;
    localparam RX_NUM_PT_2th_LB = 2;
    localparam RX_NUM_PT_3th_LB = 3;
    localparam RX_NUM_PT_4th_LB = 4;
    localparam RX_NUM_PT_5th_LB = 5;
    localparam RX_NUM_PT_6th_LB = 6;
    localparam RX_NUM_PT_7th_LB = 7;
    localparam RX_NUM_PT_8th_LB = 8;
    localparam RX_NUM_PT_9th_LB = 9;
    localparam RX_NUM_PT_10th_LB = 10;
    localparam RX_NUM_PT_11th_LB = 11;
    localparam RX_NUM_PT_12th_LB = 12;
    localparam RX_NUM_PT_13th_LB = 13;
    localparam RX_NUM_PT_14th_LB = 14;
    localparam RX_NUM_PT_15th_LB = 15;
    
    localparam RX_NUM_KEY_0th_LB = 16;
    localparam RX_NUM_KEY_1th_LB = 17;
    localparam RX_NUM_KEY_2th_LB = 18;
    localparam RX_NUM_KEY_3th_LB = 19;
    localparam RX_NUM_KEY_4th_LB = 20;
    localparam RX_NUM_KEY_5th_LB = 21;
    localparam RX_NUM_KEY_6th_LB = 22;
    localparam RX_NUM_KEY_7th_LB = 23;
    localparam RX_NUM_KEY_8th_LB = 24;
    localparam RX_NUM_KEY_9th_LB = 25;
    localparam RX_NUM_KEY_10th_LB = 26;
    localparam RX_NUM_KEY_11th_LB = 27;
    localparam RX_NUM_KEY_12th_LB = 28;
    localparam RX_NUM_KEY_13th_LB = 29;
    localparam RX_NUM_KEY_14th_LB = 30;
    localparam RX_NUM_KEY_15th_LB = 31;
    
    localparam RX_NUM_CT_0th_HB = 32;
    localparam RX_NUM_CT_1th_HB = 33;
    localparam RX_NUM_CT_2th_HB = 34;
    localparam RX_NUM_CT_3th_HB = 35;
    localparam RX_NUM_CT_4th_HB = 36;
    localparam RX_NUM_CT_5th_HB = 37;
    localparam RX_NUM_CT_6th_HB = 38;
    localparam RX_NUM_CT_7th_HB = 39;
    localparam RX_NUM_CT_8th_HB = 40;
    localparam RX_NUM_CT_9th_HB = 41;
    localparam RX_NUM_CT_10th_HB = 42;
    localparam RX_NUM_CT_11th_HB = 43;
    localparam RX_NUM_CT_12th_HB = 44;
    localparam RX_NUM_CT_13th_HB = 45;
    localparam RX_NUM_CT_14th_HB = 46;
    localparam RX_NUM_CT_15th_HB = 47;
    
    reg [5:0] state; // FSM state register
    reg allow_next;  // Control flag for state transition
    reg flush_ctrl;  // Control flag for UART RX flush
    reg tx_enable_ctrl; // Control flag for UART TX enable
    
    wire [7:0] uart_data; // UART received data
    reg [7:0] out_data;   // Data to be transmitted
    reg [255:0] byte_buffer; // Temporary storage for received byte
//    reg [127:0] byte_buffer1;
    reg [127:0] sum;       // Sum of received numbers
    
    // UART clock generation variables
    reg clk_uart;   // UART clock signal
    reg [4:0] counter; // Clock divider counter
    
    // UART RX instance
    uart_rx uart_rx_115200 (
        .rx(rx),
        .i_clk(clk_uart),
        .flush(flush_ctrl),
        .data(uart_data),
        .converted(converted),
        .data_valid(data_valid),
        .busy(rx_busy)
    );
    
    // UART TX instance
    uart_tx uart_tx_115200(
        .clk(clk_uart),
        .tx_enable(tx_enable_ctrl),
        .data(out_data),
        .tx(tx),
        .tx_busy(tx_busy)
    );
    
    // Initial values for registers
    initial begin
        counter = 0;
        clk_uart = 0;
        flush_ctrl = 0;
        tx_enable_ctrl = 0;
        sum = 0;
        out_data = 0;
        byte_buffer = 0;
        state = RX_NUM_PT_0th_LB;
        allow_next = 0;
    end
    
    reg [127:0] Key0,PT0,Key1,PT1,Key2,PT2,Key3,PT3,Key4,PT4,Key5,PT5,Key6,PT6,Key7,PT7,Key8,PT8,Key9,PT9,Key10,PT10,Key11,PT11,Key12,PT12,Key13,PT13,Key14,PT14,Key15,PT15;
    
    initial
    begin
    Key0=128'h0;PT0=128'h0;
    Key1=128'h00000000000000000000000000000000;PT1=128'h9F589F5CF6122C32B6BFEC2F2AE8C35A;
    Key2=128'h9F589F5CF6122C32B6BFEC2F2AE8C35A;PT2=128'h019F9809DE1711858FAAC3A3BA20FBC3;
    Key3=128'hD491DB16E7B1C39E86CB086B789F5419;PT3=128'h019F9809DE1711858FAAC3A3BA20FBC3;
    Key4=128'h019F9809DE1711858FAAC3A3BA20FBC3;PT4=128'h6363977DE839486297E661C6C9D668EB;
    Key5=128'h6363977DE839486297E661C6C9D668EB;PT5=128'h816D5BD0FAE35342BF2A7412C246F752;
    Key6=128'h816D5BD0FAE35342BF2A7412C246F752;PT6=128'h5449ECA008FF5921155F598AF4CED4D0;
    Key7=128'h5449ECA008FF5921155F598AF4CED4D0;PT7=128'h6600522E97AEB3094ED5F92AFCBCDD10;
    end
    reg [127:0]K,PT;
    always@(in)
    case(in)
        3'd0: begin K=Key0; PT=PT0 ;end
        3'd1: begin K=Key1; PT=PT1 ;end
        3'd2: begin K=Key2; PT=PT2 ;end
        3'd3: begin K=Key3; PT=PT3 ;end
        3'd4: begin K=Key4; PT=PT4 ;end
        3'd5: begin K=Key5; PT=PT5 ;end
        3'd6: begin K=Key6; PT=PT6 ;end
        3'd7: begin K=Key7; PT=PT7 ;end
    endcase    
    
    //instatiate our 2fish module
    wire [127:0] ET;
    encrypt_out encrypt0(.plain_text(PT), .key(K),.encrypt(ET));
    
    
    // Generate UART clock at 115200 baud
    always @(posedge clk_100MHz) begin
        if(state==RX_NUM_CT_0th_HB) sum=ET;
        counter <= counter + 1;
        if(counter == 5'd27) begin
            counter <= 0;
            clk_uart <= ~clk_uart;
        end
    end
    
    // FSM for data reception and transmission
    always @(posedge clk_uart) begin
        case(state)
            RX_NUM_PT_0th_LB: begin
                tx_enable_ctrl <= 0; // Disable TX during reception
                if(converted) begin
                    byte_buffer[7:0] <= uart_data; // Store received byte
                    flush_ctrl <= 1; // Flush RX buffer
                    state <= RX_NUM_PT_1th_LB;
                end
            end

            RX_NUM_PT_1th_LB: begin
                if(~flush_ctrl && ~converted)
                    allow_next <= 1; // Allow next RX cycle
                
                if(converted && ~flush_ctrl && allow_next) begin
                    byte_buffer[15:8] <= uart_data; // Store second byte
                    flush_ctrl <= 1; // Flush RX buffer
                    allow_next <= 0;
                    state <= RX_NUM_PT_2th_LB;
                end
                else
                    flush_ctrl <= 0;
            end

            RX_NUM_PT_2th_LB: begin
                if(~flush_ctrl && ~converted)
                    allow_next <= 1; // Allow next RX cycle
                
                if(converted && ~flush_ctrl && allow_next) begin
                    byte_buffer[23:16] <= uart_data; // Store second byte
                    flush_ctrl <= 1; // Flush RX buffer
                    allow_next <= 0;
                    state <= RX_NUM_PT_3th_LB;
                end
                else
                    flush_ctrl <= 0;
            end

            RX_NUM_PT_3th_LB: begin
                if(~flush_ctrl && ~converted)
                    allow_next <= 1; // Allow next RX cycle
                
                if(converted && ~flush_ctrl && allow_next) begin
                    byte_buffer[31:24] <= uart_data; // Store second byte
                    flush_ctrl <= 1; // Flush RX buffer
                    allow_next <= 0;
                    state <= RX_NUM_PT_4th_LB;
                end
                else
                    flush_ctrl <= 0;
            end

            RX_NUM_PT_4th_LB: begin
                if(~flush_ctrl && ~converted)
                    allow_next <= 1; // Allow next RX cycle
                
                if(converted && ~flush_ctrl && allow_next) begin
                    byte_buffer[39:32] <= uart_data; // Store second byte
                    flush_ctrl <= 1; // Flush RX buffer
                    allow_next <= 0;
                    state <= RX_NUM_PT_5th_LB;
                end
                else
                    flush_ctrl <= 0;
            end

            RX_NUM_PT_5th_LB: begin
                if(~flush_ctrl && ~converted)
                    allow_next <= 1; // Allow next RX cycle
                
                if(converted && ~flush_ctrl && allow_next) begin
                    byte_buffer[47:40] <= uart_data; // Store second byte
                    flush_ctrl <= 1; // Flush RX buffer
                    allow_next <= 0;
                    state <= RX_NUM_PT_6th_LB;
                end
                else
                    flush_ctrl <= 0;
            end

            RX_NUM_PT_6th_LB: begin
                if(~flush_ctrl && ~converted)
                    allow_next <= 1; // Allow next RX cycle
                
                if(converted && ~flush_ctrl && allow_next) begin
                    byte_buffer[55:48] <= uart_data; // Store second byte
                    flush_ctrl <= 1; // Flush RX buffer
                    allow_next <= 0;
                    state <= RX_NUM_PT_7th_LB;
                end
                else
                    flush_ctrl <= 0;
            end

            RX_NUM_PT_7th_LB: begin
                if(~flush_ctrl && ~converted)
                    allow_next <= 1; // Allow next RX cycle
                
                if(converted && ~flush_ctrl && allow_next) begin
                    byte_buffer[63:56] <= uart_data; // Store second byte
                    flush_ctrl <= 1; // Flush RX buffer
                    allow_next <= 0;
                    state <= RX_NUM_PT_8th_LB;
                end
                else
                    flush_ctrl <= 0;
            end

            RX_NUM_PT_8th_LB: begin
                if(~flush_ctrl && ~converted)
                    allow_next <= 1; // Allow next RX cycle
                
                if(converted && ~flush_ctrl && allow_next) begin
                    byte_buffer[71:64] <= uart_data; // Store second byte
                    flush_ctrl <= 1; // Flush RX buffer
                    allow_next <= 0;
                    state <= RX_NUM_PT_9th_LB;
                end
                else
                    flush_ctrl <= 0;
            end

            RX_NUM_PT_9th_LB: begin
                if(~flush_ctrl && ~converted)
                    allow_next <= 1; // Allow next RX cycle
                
                if(converted && ~flush_ctrl && allow_next) begin
                    byte_buffer[79:72] <= uart_data; // Store second byte
                    flush_ctrl <= 1; // Flush RX buffer
                    allow_next <= 0;
                    state <= RX_NUM_PT_10th_LB;
                end
                else
                    flush_ctrl <= 0;
            end

            RX_NUM_PT_10th_LB: begin
                if(~flush_ctrl && ~converted)
                    allow_next <= 1; // Allow next RX cycle
                
                if(converted && ~flush_ctrl && allow_next) begin
                    byte_buffer[87:80] <= uart_data; // Store second byte
                    flush_ctrl <= 1; // Flush RX buffer
                    allow_next <= 0;
                    state <= RX_NUM_PT_11th_LB;
                end
                else
                    flush_ctrl <= 0;
            end

            RX_NUM_PT_11th_LB: begin
                if(~flush_ctrl && ~converted)
                    allow_next <= 1; // Allow next RX cycle
                
                if(converted && ~flush_ctrl && allow_next) begin
                    byte_buffer[95:88] <= uart_data; // Store second byte
                    flush_ctrl <= 1; // Flush RX buffer
                    allow_next <= 0;
                    state <= RX_NUM_PT_12th_LB;
                end
                else
                    flush_ctrl <= 0;
            end

            RX_NUM_PT_12th_LB: begin
                if(~flush_ctrl && ~converted)
                    allow_next <= 1; // Allow next RX cycle
                
                if(converted && ~flush_ctrl && allow_next) begin
                    byte_buffer[103:96] <= uart_data; // Store second byte
                    flush_ctrl <= 1; // Flush RX buffer
                    allow_next <= 0;
                    state <= RX_NUM_PT_13th_LB;
                end
                else
                    flush_ctrl <= 0;
            end

            RX_NUM_PT_13th_LB: begin
                if(~flush_ctrl && ~converted)
                    allow_next <= 1; // Allow next RX cycle
                
                if(converted && ~flush_ctrl && allow_next) begin
                    byte_buffer[111:104] <= uart_data; // Store second byte
                    flush_ctrl <= 1; // Flush RX buffer
                    allow_next <= 0;
                    state <= RX_NUM_PT_14th_LB;
                end
                else
                    flush_ctrl <= 0;
            end

            RX_NUM_PT_14th_LB: begin
                if(~flush_ctrl && ~converted)
                    allow_next <= 1; // Allow next RX cycle
                
                if(converted && ~flush_ctrl && allow_next) begin
                    byte_buffer[119:112] <= uart_data; // Store second byte
                    flush_ctrl <= 1; // Flush RX buffer
                    allow_next <= 0;
                    state <= RX_NUM_PT_15th_LB;
                end
                else
                    flush_ctrl <= 0;
            end

            RX_NUM_PT_15th_LB: begin
                if(~flush_ctrl && ~converted)
                    allow_next <= 1; // Allow next RX cycle
                
                if(converted && ~flush_ctrl && allow_next) begin
                    byte_buffer[127:120] <= uart_data; // Store second byte
                    flush_ctrl <= 1; // Flush RX buffer
                    allow_next <= 0;
                    state <= RX_NUM_KEY_0th_LB;
                end
                else
                    flush_ctrl <= 0;
            end

            RX_NUM_KEY_0th_LB: begin
                if(~flush_ctrl && ~converted)
                    allow_next <= 1; // Allow next RX cycle
                
                if(converted && ~flush_ctrl && allow_next) begin
                    byte_buffer[135:128] <= uart_data; // Store second byte
                    flush_ctrl <= 1; // Flush RX buffer
                    allow_next <= 0;
                    state <= RX_NUM_KEY_1th_LB;
                end
                else
                    flush_ctrl <= 0;
            end

            RX_NUM_KEY_1th_LB: begin
                if(~flush_ctrl && ~converted)
                    allow_next <= 1; // Allow next RX cycle
                
                if(converted && ~flush_ctrl && allow_next) begin
                    byte_buffer[143:136] <= uart_data; // Store second byte
                    flush_ctrl <= 1; // Flush RX buffer
                    allow_next <= 0;
                    state <= RX_NUM_KEY_2th_LB;
                end
                else
                    flush_ctrl <= 0;
            end

            RX_NUM_KEY_2th_LB: begin
                if(~flush_ctrl && ~converted)
                    allow_next <= 1; // Allow next RX cycle
                
                if(converted && ~flush_ctrl && allow_next) begin
                    byte_buffer[151:144] <= uart_data; // Store second byte
                    flush_ctrl <= 1; // Flush RX buffer
                    allow_next <= 0;
                    state <= RX_NUM_KEY_3th_LB;
                end
                else
                    flush_ctrl <= 0;
            end

            RX_NUM_KEY_3th_LB: begin
                if(~flush_ctrl && ~converted)
                    allow_next <= 1; // Allow next RX cycle
                
                if(converted && ~flush_ctrl && allow_next) begin
                    byte_buffer[159:152] <= uart_data; // Store second byte
                    flush_ctrl <= 1; // Flush RX buffer
                    allow_next <= 0;
                    state <= RX_NUM_KEY_4th_LB;
                end
                else
                    flush_ctrl <= 0;
            end

            RX_NUM_KEY_4th_LB: begin
                if(~flush_ctrl && ~converted)
                    allow_next <= 1; // Allow next RX cycle
                
                if(converted && ~flush_ctrl && allow_next) begin
                    byte_buffer[167:160] <= uart_data; // Store second byte
                    flush_ctrl <= 1; // Flush RX buffer
                    allow_next <= 0;
                    state <= RX_NUM_KEY_5th_LB;
                end
                else
                    flush_ctrl <= 0;
            end

            RX_NUM_KEY_5th_LB: begin
                if(~flush_ctrl && ~converted)
                    allow_next <= 1; // Allow next RX cycle
                
                if(converted && ~flush_ctrl && allow_next) begin
                    byte_buffer[175:168] <= uart_data; // Store second byte
                    flush_ctrl <= 1; // Flush RX buffer
                    allow_next <= 0;
                    state <= RX_NUM_KEY_6th_LB;
                end
                else
                    flush_ctrl <= 0;
            end

            RX_NUM_KEY_6th_LB: begin
                if(~flush_ctrl && ~converted)
                    allow_next <= 1; // Allow next RX cycle
                
                if(converted && ~flush_ctrl && allow_next) begin
                    byte_buffer[183:176] <= uart_data; // Store second byte
                    flush_ctrl <= 1; // Flush RX buffer
                    allow_next <= 0;
                    state <= RX_NUM_KEY_7th_LB;
                end
                else
                    flush_ctrl <= 0;
            end

            RX_NUM_KEY_7th_LB: begin
                if(~flush_ctrl && ~converted)
                    allow_next <= 1; // Allow next RX cycle
                
                if(converted && ~flush_ctrl && allow_next) begin
                    byte_buffer[191:184] <= uart_data; // Store second byte
                    flush_ctrl <= 1; // Flush RX buffer
                    allow_next <= 0;
                    state <= RX_NUM_KEY_8th_LB;
                end
                else
                    flush_ctrl <= 0;
            end

            RX_NUM_KEY_8th_LB: begin
                if(~flush_ctrl && ~converted)
                    allow_next <= 1; // Allow next RX cycle
                
                if(converted && ~flush_ctrl && allow_next) begin
                    byte_buffer[199:192] <= uart_data; // Store second byte
                    flush_ctrl <= 1; // Flush RX buffer
                    allow_next <= 0;
                    state <= RX_NUM_KEY_9th_LB;
                end
                else
                    flush_ctrl <= 0;
            end

            RX_NUM_KEY_9th_LB: begin
                if(~flush_ctrl && ~converted)
                    allow_next <= 1; // Allow next RX cycle
                
                if(converted && ~flush_ctrl && allow_next) begin
                    byte_buffer[207:200] <= uart_data; // Store second byte
                    flush_ctrl <= 1; // Flush RX buffer
                    allow_next <= 0;
                    state <= RX_NUM_KEY_10th_LB;
                end
                else
                    flush_ctrl <= 0;
            end

            RX_NUM_KEY_10th_LB: begin
                if(~flush_ctrl && ~converted)
                    allow_next <= 1; // Allow next RX cycle
                
                if(converted && ~flush_ctrl && allow_next) begin
                    byte_buffer[215:208] <= uart_data; // Store second byte
                    flush_ctrl <= 1; // Flush RX buffer
                    allow_next <= 0;
                    state <= RX_NUM_KEY_11th_LB;
                end
                else
                    flush_ctrl <= 0;
            end

            RX_NUM_KEY_11th_LB: begin
                if(~flush_ctrl && ~converted)
                    allow_next <= 1; // Allow next RX cycle
                
                if(converted && ~flush_ctrl && allow_next) begin
                    byte_buffer[223:216] <= uart_data; // Store second byte
                    flush_ctrl <= 1; // Flush RX buffer
                    allow_next <= 0;
                    state <= RX_NUM_KEY_12th_LB;
                end
                else
                    flush_ctrl <= 0;
            end

            RX_NUM_KEY_12th_LB: begin
                if(~flush_ctrl && ~converted)
                    allow_next <= 1; // Allow next RX cycle
                
                if(converted && ~flush_ctrl && allow_next) begin
                    byte_buffer[231:224] <= uart_data; // Store second byte
                    flush_ctrl <= 1; // Flush RX buffer
                    allow_next <= 0;
                    state <= RX_NUM_KEY_13th_LB;
                end
                else
                    flush_ctrl <= 0;
            end

            RX_NUM_KEY_13th_LB: begin
                if(~flush_ctrl && ~converted)
                    allow_next <= 1; // Allow next RX cycle
                
                if(converted && ~flush_ctrl && allow_next) begin
                    byte_buffer[239:232] <= uart_data; // Store second byte
                    flush_ctrl <= 1; // Flush RX buffer
                    allow_next <= 0;
                    state <= RX_NUM_KEY_14th_LB;
                end
                else
                    flush_ctrl <= 0;
            end

            RX_NUM_KEY_14th_LB: begin
                if(~flush_ctrl && ~converted)
                    allow_next <= 1; // Allow next RX cycle
                
                if(converted && ~flush_ctrl && allow_next) begin
                    byte_buffer[247:240] <= uart_data; // Store second byte
                    flush_ctrl <= 1; // Flush RX buffer
                    allow_next <= 0;
                    state <= RX_NUM_KEY_15th_LB;
                end
                else
                    flush_ctrl <= 0;
            end

            RX_NUM_KEY_15th_LB: begin
                if(~flush_ctrl && ~converted)
                    allow_next <= 1; // Allow next RX cycle
                
                if(converted && ~flush_ctrl && allow_next) begin
                    byte_buffer[255:248] <= uart_data; // Store second byte
                    flush_ctrl <= 1; // Flush RX buffer
                    allow_next <= 0;
                    state <= RX_NUM_CT_0th_HB;
                end
                else
                    flush_ctrl <= 0;
            end            

            RX_NUM_CT_0th_HB: begin
                out_data <= sum[127:120]; // Send higher byte of sum
                if(~tx_busy && ~allow_next)
                    tx_enable_ctrl <= 1; // Start transmission
                else begin
                    allow_next <= 1;
                    flush_ctrl <= 0;
                    tx_enable_ctrl <= 0;
                end
                if(~tx_busy && allow_next) begin
                    allow_next <= 0;
                    state <= RX_NUM_CT_1th_HB;
                end
            end

            RX_NUM_CT_1th_HB: begin
                out_data <= sum[119:112]; // Send higher byte of sum
                if(~tx_busy && ~allow_next)
                    tx_enable_ctrl <= 1; // Start transmission
                else begin
                    allow_next <= 1;
                    flush_ctrl <= 0;
                    tx_enable_ctrl <= 0;
                end
                if(~tx_busy && allow_next) begin
                    allow_next <= 0;
                    state <= RX_NUM_CT_2th_HB;
                end
            end

            RX_NUM_CT_2th_HB: begin
                out_data <= sum[111:104]; // Send higher byte of sum
                if(~tx_busy && ~allow_next)
                    tx_enable_ctrl <= 1; // Start transmission
                else begin
                    allow_next <= 1;
                    flush_ctrl <= 0;
                    tx_enable_ctrl <= 0;
                end
                if(~tx_busy && allow_next) begin
                    allow_next <= 0;
                    state <= RX_NUM_CT_3th_HB;
                end
            end

            RX_NUM_CT_3th_HB: begin
                out_data <= sum[103:96]; // Send higher byte of sum
                if(~tx_busy && ~allow_next)
                    tx_enable_ctrl <= 1; // Start transmission
                else begin
                    allow_next <= 1;
                    flush_ctrl <= 0;
                    tx_enable_ctrl <= 0;
                end
                if(~tx_busy && allow_next) begin
                    allow_next <= 0;
                    state <= RX_NUM_CT_4th_HB;
                end
            end

            RX_NUM_CT_4th_HB: begin
                out_data <= sum[95:88]; // Send higher byte of sum
                if(~tx_busy && ~allow_next)
                    tx_enable_ctrl <= 1; // Start transmission
                else begin
                    allow_next <= 1;
                    flush_ctrl <= 0;
                    tx_enable_ctrl <= 0;
                end
                if(~tx_busy && allow_next) begin
                    allow_next <= 0;
                    state <= RX_NUM_CT_5th_HB;
                end
            end

            RX_NUM_CT_5th_HB: begin
                out_data <= sum[87:80]; // Send higher byte of sum
                if(~tx_busy && ~allow_next)
                    tx_enable_ctrl <= 1; // Start transmission
                else begin
                    allow_next <= 1;
                    flush_ctrl <= 0;
                    tx_enable_ctrl <= 0;
                end
                if(~tx_busy && allow_next) begin
                    allow_next <= 0;
                    state <= RX_NUM_CT_6th_HB;
                end
            end

            RX_NUM_CT_6th_HB: begin
                out_data <= sum[79:72]; // Send higher byte of sum
                if(~tx_busy && ~allow_next)
                    tx_enable_ctrl <= 1; // Start transmission
                else begin
                    allow_next <= 1;
                    flush_ctrl <= 0;
                    tx_enable_ctrl <= 0;
                end
                if(~tx_busy && allow_next) begin
                    allow_next <= 0;
                    state <= RX_NUM_CT_7th_HB;
                end
            end

            RX_NUM_CT_7th_HB: begin
                out_data <= sum[71:64]; // Send higher byte of sum
                if(~tx_busy && ~allow_next)
                    tx_enable_ctrl <= 1; // Start transmission
                else begin
                    allow_next <= 1;
                    flush_ctrl <= 0;
                    tx_enable_ctrl <= 0;
                end
                if(~tx_busy && allow_next) begin
                    allow_next <= 0;
                    state <= RX_NUM_CT_8th_HB;
                end
            end

            RX_NUM_CT_8th_HB: begin
                out_data <= sum[63:56]; // Send higher byte of sum
                if(~tx_busy && ~allow_next)
                    tx_enable_ctrl <= 1; // Start transmission
                else begin
                    allow_next <= 1;
                    flush_ctrl <= 0;
                    tx_enable_ctrl <= 0;
                end
                if(~tx_busy && allow_next) begin
                    allow_next <= 0;
                    state <= RX_NUM_CT_9th_HB;
                end
            end

            RX_NUM_CT_9th_HB: begin
                out_data <= sum[55:48]; // Send higher byte of sum
                if(~tx_busy && ~allow_next)
                    tx_enable_ctrl <= 1; // Start transmission
                else begin
                    allow_next <= 1;
                    flush_ctrl <= 0;
                    tx_enable_ctrl <= 0;
                end
                if(~tx_busy && allow_next) begin
                    allow_next <= 0;
                    state <= RX_NUM_CT_10th_HB;
                end
            end

            RX_NUM_CT_10th_HB: begin
                out_data <= sum[47:40]; // Send higher byte of sum
                if(~tx_busy && ~allow_next)
                    tx_enable_ctrl <= 1; // Start transmission
                else begin
                    allow_next <= 1;
                    flush_ctrl <= 0;
                    tx_enable_ctrl <= 0;
                end
                if(~tx_busy && allow_next) begin
                    allow_next <= 0;
                    state <= RX_NUM_CT_11th_HB;
                end
            end

            RX_NUM_CT_11th_HB: begin
                out_data <= sum[39:32]; // Send higher byte of sum
                if(~tx_busy && ~allow_next)
                    tx_enable_ctrl <= 1; // Start transmission
                else begin
                    allow_next <= 1;
                    flush_ctrl <= 0;
                    tx_enable_ctrl <= 0;
                end
                if(~tx_busy && allow_next) begin
                    allow_next <= 0;
                    state <= RX_NUM_CT_12th_HB;
                end
            end

            RX_NUM_CT_12th_HB: begin
                out_data <= sum[31:24]; // Send higher byte of sum
                if(~tx_busy && ~allow_next)
                    tx_enable_ctrl <= 1; // Start transmission
                else begin
                    allow_next <= 1;
                    flush_ctrl <= 0;
                    tx_enable_ctrl <= 0;
                end
                if(~tx_busy && allow_next) begin
                    allow_next <= 0;
                    state <= RX_NUM_CT_13th_HB;
                end
            end

            RX_NUM_CT_13th_HB: begin
                out_data <= sum[23:16]; // Send higher byte of sum
                if(~tx_busy && ~allow_next)
                    tx_enable_ctrl <= 1; // Start transmission
                else begin
                    allow_next <= 1;
                    flush_ctrl <= 0;
                    tx_enable_ctrl <= 0;
                end
                if(~tx_busy && allow_next) begin
                    allow_next <= 0;
                    state <= RX_NUM_CT_14th_HB;
                end
            end

            RX_NUM_CT_14th_HB: begin
                out_data <= sum[15:8]; // Send higher byte of sum
                if(~tx_busy && ~allow_next)
                    tx_enable_ctrl <= 1; // Start transmission
                else begin
                    allow_next <= 1;
                    flush_ctrl <= 0;
                    tx_enable_ctrl <= 0;
                end
                if(~tx_busy && allow_next) begin
                    allow_next <= 0;
                    state <= RX_NUM_CT_15th_HB;
                end
            end

            RX_NUM_CT_15th_HB: begin
                out_data <= sum[7:0]; // Send lower byte of sum
                if(~tx_busy && ~allow_next)
                    tx_enable_ctrl <= 1;
                else begin
                    allow_next <= 1;
                    tx_enable_ctrl <= 0;
                end
                if(~tx_busy && allow_next) begin
                    allow_next <= 0;
                    state <= RX_NUM_PT_0th_LB; // Reset to receive new data
                end
            end

        endcase
    end
endmodule