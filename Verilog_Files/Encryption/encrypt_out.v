`timescale 1ns / 1ps
module encrypt_out(input [127:0] plain_text, input [127:0] key, output [127:0] encrypt);

    wire [127:0] in_whiten;
    wire [31:0] S0, S1;
    wire [127:0] Key1, Key2,out;
    wire [31:0] K [39:0] ;
    wire [31:0] t00,t01,t02,t03,t10,t11,t12,t13,t20,t21,t22,t23,t30,t31,t32,t33,t40,t41,t42,t43,t50,t51,t52,t53,t60,t61,t62,t63,t70,t71,t72,t73,t80,t81,t82,t83,t90,t91,t92,t93,t100,t101,t102,t103,t110,t111,t112,t113,t120,t121,t122,t123,t130,t131,t132,t133,t140,t141,t142,t143,t150,t151,t152,t153,t160,t161,t162,t163;
    Mat_Multi uut(.Key(key), .S0(S0), .S1(S1));
    wire [127:0] encrypt1;
    wire [7:0] e00,e01,e02,e03,e10,e11,e12,e13,e20,e21,e22,e23,e30,e31,e32,e33;
    
        H_Function h0(.i(0), .key(key), .K0(K[0]), .K1(K[1]));
        H_Function h1(.i(1), .key(key), .K0(K[2]), .K1(K[3]));
        H_Function h2(.i(2), .key(key), .K0(K[4]), .K1(K[5]));
        H_Function h3(.i(3), .key(key), .K0(K[6]), .K1(K[7]));
        H_Function h4(.i(4), .key(key), .K0(K[8]), .K1(K[9]));
        H_Function h5(.i(5), .key(key), .K0(K[10]), .K1(K[11]));
        H_Function h6(.i(6), .key(key), .K0(K[12]), .K1(K[13]));
        H_Function h7(.i(7), .key(key), .K0(K[14]), .K1(K[15]));
        H_Function h8(.i(8), .key(key), .K0(K[16]), .K1(K[17]));
        H_Function h9(.i(9), .key(key), .K0(K[18]), .K1(K[19]));
        H_Function h10(.i(10), .key(key), .K0(K[20]), .K1(K[21]));
        H_Function h11(.i(11), .key(key), .K0(K[22]), .K1(K[23]));
        H_Function h12(.i(12), .key(key), .K0(K[24]), .K1(K[25]));
        H_Function h13(.i(13), .key(key), .K0(K[26]), .K1(K[27]));
        H_Function h14(.i(14), .key(key), .K0(K[28]), .K1(K[29]));
        H_Function h15(.i(15), .key(key), .K0(K[30]), .K1(K[31]));
        H_Function h16(.i(16), .key(key), .K0(K[32]), .K1(K[33]));
        H_Function h17(.i(17), .key(key), .K0(K[34]), .K1(K[35]));
        H_Function h18(.i(18), .key(key), .K0(K[36]), .K1(K[37]));
        H_Function h19(.i(19), .key(key), .K0(K[38]), .K1(K[39]));
    assign Key1={K[0],K[1],K[2],K[3]};  
    wire[127:0] plain_text1;
    wire[7:0] i00,i01,i02,i03,i10,i11,i12,i13,i20,i21,i22,i23,i30,i31,i32,i33;
    assign {i00,i01,i02,i03,i10,i11,i12,i13,i20,i21,i22,i23,i30,i31,i32,i33}=plain_text;
    assign plain_text1={i03,i02,i01,i00,i13,i12,i11,i10,i23,i22,i21,i20,i33,i32,i31,i30};  
    input_whitening w0(.plain_text(plain_text1), .key(Key1), .whitened_text(in_whiten));
    
    
    assign {t00,t01,t02,t03} = in_whiten;

               assign {t00,t01,t02,t03} = in_whiten;

            FuncF_out funcf_inst0(
                .R0(t00), 
                .R1(t01),
                .R2(t02), 
                .R3(t03), 
                .K0(K[8]), 
                .K1(K[9]),
                .c2(t10), 
                .c3(t11),
                .r0(t12), 
                .r1(t13), 
                .S0(S0), 
                .S1(S1)
            );
    

            FuncF_out funcf_inst1(
                .R0(t12), 
                .R1(t13),
                .R2(t10), 
                .R3(t11), 
                .K0(K[10]), 
                .K1(K[11]),
                .c2(t20), 
                .c3(t21),
                .r0(t22), 
                .r1(t23), 
                .S0(S0), 
                .S1(S1)
            );
    

            FuncF_out funcf_inst2(
                .R0(t22), 
                .R1(t23),
                .R2(t20), 
                .R3(t21), 
                .K0(K[12]), 
                .K1(K[13]),
                .c2(t30), 
                .c3(t31),
                .r0(t32), 
                .r1(t33), 
                .S0(S0), 
                .S1(S1)
            );
    

            FuncF_out funcf_inst3(
                .R0(t32), 
                .R1(t33),
                .R2(t30), 
                .R3(t31), 
                .K0(K[14]), 
                .K1(K[15]),
                .c2(t40), 
                .c3(t41),
                .r0(t42), 
                .r1(t43), 
                .S0(S0), 
                .S1(S1)
            );
    

            FuncF_out funcf_inst4(
                .R0(t42), 
                .R1(t43),
                .R2(t40), 
                .R3(t41), 
                .K0(K[16]), 
                .K1(K[17]),
                .c2(t50), 
                .c3(t51),
                .r0(t52), 
                .r1(t53), 
                .S0(S0), 
                .S1(S1)
            );
    

            FuncF_out funcf_inst5(
                .R0(t52), 
                .R1(t53),
                .R2(t50), 
                .R3(t51), 
                .K0(K[18]), 
                .K1(K[19]),
                .c2(t60), 
                .c3(t61),
                .r0(t62), 
                .r1(t63), 
                .S0(S0), 
                .S1(S1)
            );
    

            FuncF_out funcf_inst6(
                .R0(t62), 
                .R1(t63),
                .R2(t60), 
                .R3(t61), 
                .K0(K[20]), 
                .K1(K[21]),
                .c2(t70), 
                .c3(t71),
                .r0(t72), 
                .r1(t73), 
                .S0(S0), 
                .S1(S1)
            );
    

            FuncF_out funcf_inst7(
                .R0(t72), 
                .R1(t73),
                .R2(t70), 
                .R3(t71), 
                .K0(K[22]), 
                .K1(K[23]),
                .c2(t80), 
                .c3(t81),
                .r0(t82), 
                .r1(t83), 
                .S0(S0), 
                .S1(S1)
            );
    

            FuncF_out funcf_inst8(
                .R0(t82), 
                .R1(t83),
                .R2(t80), 
                .R3(t81), 
                .K0(K[24]), 
                .K1(K[25]),
                .c2(t90), 
                .c3(t91),
                .r0(t92), 
                .r1(t93), 
                .S0(S0), 
                .S1(S1)
            );
    

            FuncF_out funcf_inst9(
                .R0(t92), 
                .R1(t93),
                .R2(t90), 
                .R3(t91), 
                .K0(K[26]), 
                .K1(K[27]),
                .c2(t100), 
                .c3(t101),
                .r0(t102), 
                .r1(t103), 
                .S0(S0), 
                .S1(S1)
            );
    

            FuncF_out funcf_inst10(
                .R0(t102), 
                .R1(t103),
                .R2(t100), 
                .R3(t101), 
                .K0(K[28]), 
                .K1(K[29]),
                .c2(t110), 
                .c3(t111),
                .r0(t112), 
                .r1(t113), 
                .S0(S0), 
                .S1(S1)
            );
    

            FuncF_out funcf_inst11(
                .R0(t112), 
                .R1(t113),
                .R2(t110), 
                .R3(t111), 
                .K0(K[30]), 
                .K1(K[31]),
                .c2(t120), 
                .c3(t121),
                .r0(t122), 
                .r1(t123), 
                .S0(S0), 
                .S1(S1)
            );
    

            FuncF_out funcf_inst12(
                .R0(t122), 
                .R1(t123),
                .R2(t120), 
                .R3(t121), 
                .K0(K[32]), 
                .K1(K[33]),
                .c2(t130), 
                .c3(t131),
                .r0(t132), 
                .r1(t133), 
                .S0(S0), 
                .S1(S1)
            );
    

            FuncF_out funcf_inst13(
                .R0(t132), 
                .R1(t133),
                .R2(t130), 
                .R3(t131), 
                .K0(K[34]), 
                .K1(K[35]),
                .c2(t140), 
                .c3(t141),
                .r0(t142), 
                .r1(t143), 
                .S0(S0), 
                .S1(S1)
            );
    

            FuncF_out funcf_inst14(
                .R0(t142), 
                .R1(t143),
                .R2(t140), 
                .R3(t141), 
                .K0(K[36]), 
                .K1(K[37]),
                .c2(t150), 
                .c3(t151),
                .r0(t152), 
                .r1(t153), 
                .S0(S0), 
                .S1(S1)
            );
    

            FuncF_out funcf_inst15(
                .R0(t152), 
                .R1(t153),
                .R2(t150), 
                .R3(t151), 
                .K0(K[38]), 
                .K1(K[39]),
                .c2(t160), 
                .c3(t161),
                .r0(t162), 
                .r1(t163), 
                .S0(S0), 
                .S1(S1)
            );
    assign out={t160,t161,t162,t163};
    
    assign Key2={K[4],K[5],K[6],K[7]};
    input_whitening w1(.plain_text(out), .key(Key2), .whitened_text(encrypt1));
    
    assign {e00,e01,e02,e03,e10,e11,e12,e13,e20,e21,e22,e23,e30,e31,e32,e33}=encrypt1;
    assign encrypt={e03,e02,e01,e00,e13,e12,e11,e10,e23,e22,e21,e20,e33,e32,e31,e30};
    
    
endmodule