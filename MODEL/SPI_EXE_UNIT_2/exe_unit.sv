module exe_unit(i_argA, 
                i_argB, 
                i_oper, 
                o_result,
                o_NF,
                o_BF,
                o_PF,
                o_ZF);
    parameter M = 4;
    parameter N = 4;
    input  logic [M-1:0] i_argA, i_argB;
    input  logic [N-1:0] i_oper;
    output logic [M-1:0] o_result;
    output logic o_NF, o_BF, o_PF,o_ZF;

        // logic [M-1:0] s_halfadder;
        // halfadder #(.NUM(M))
        //          u1_adder(.i_a(i_argA),.i_b(i_argB),.o_final(s_halfadder));


        logic [M-1:0] s_xor;
        xor_mod #(.NUM(M))
                u2_xor(.i_a(i_argA),.i_b(i_argB),.o_y1(s_xor));

        logic [M-1:0] s_nand;
        nand_mod #(.NUM(M))
                u3_nand(.i_a(i_argA),.i_b(i_argB),.o_y1(s_nand));

        logic [M-1:0] s_lshift_argA;
        lshift_mod #(.NUM(M))
                u4_lshift(.i_a(i_argA),.o_logic_right(s_lshift_argA));

        logic [M-1:0] s_ashift_argA;
        ashift_mod #(.NUM(M))
                u5_ashift(.i_a(i_argA),.o_arith_left(s_ashift_argA));
    
        logic [M-1:0] s_gray_argA;     
        gray_mod #(.NUM(M))
                u6_gray(.i_data(i_argA),.o_gray(s_gray_argA));

        logic [M-1:0] s_u1_2_u2_argA;
        u1_2_u2_mod #(.NUM(M))
                u7_u1tou2(.i_u1(i_argA),.o_u2(s_u1_2_u2_argA));

        logic [M-1:0] s_sum_one;
        sum_one_mod #(.NUM(M))
                u8_sum_one(.i_a(i_argA),.i_b(i_argB),.o_y(s_sum_one));

        logic [15-1:0] s_nkb2therm_argA;
        nkb2therm_mod #(.NUM(M))
                u9_nkb2therm(.i_nkb(i_argA),.o_thermo(s_nkb2therm_argA));

        logic [15-1:0] s_onehot_argA;
        nkb2onehot_mod #(.NUM(M))
                u10_nkb2onehot(.i_nkb(i_argA),.o_onehot(s_onehot_argA));

        logic [1:0] s_crcget3;
        logic [1:0] s_crccheck3;
        crc_eval3 #(.WCODE(M), .WPOLY(3))
                u11_getcrc3 (.i_data(i_argA), .i_poly(3'b101), .i_crc(2'd0), .o_crc(s_crcget3));
        crc_eval3 #(.WCODE(M), .WPOLY(3)) 
                u11_checkcrc (.i_data(i_argA), .i_poly(3'b101), .i_crc(i_argB), .o_crc(s_crccheck3));

        logic [2:0] s_crcget4;
        crc_eval4 #(.WCODE(M), .WPOLY(4))
                u12_getcrc4 (.i_data(i_argA), .i_poly(4'b1011), .i_crc(3'd0), .o_crc(s_crcget4));

        integer i;
        integer zeros;
    always @*
    begin
        case(i_oper)
            1     : o_result = i_argA + i_argB;
            2     : o_result = s_xor;
            3     : o_result = s_nand;
            4     : o_result = s_lshift_argA;
            5     : o_result = s_ashift_argA;
            6     : o_result = s_gray_argA;
            7     : o_result = s_u1_2_u2_argA; 
            8     : o_result = s_sum_one;
            9     : o_result = s_nkb2therm_argA;
            10    : o_result = s_onehot_argA;    
            11    : o_result = s_crccheck3;
            12    : o_result = s_crcget4;
            default  : o_result = '0;
        endcase
        
        // o_PF and O_NF           
        o_PF = ^o_result;
        if (o_PF == 1)
                o_NF = 0;
                else 
                        o_NF = 1;
        //o_BF
        zeros=0;
        for(i=0; i<M; i++)
        begin 
            if(o_result[i] ==1'd0)
                zeros = zeros +1;
        end
        if (zeros == 1'd1)
            o_BF=1'd1;
        else
            o_BF =1'd0;
        //O_ZF
        if (o_result == '0)
                o_ZF = 1;
            else
                        o_ZF = 0;

    end
endmodule