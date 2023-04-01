module exe_unit(i_argA, i_argB, i_oper, o_result , o_PF , o_SF , o_BF, o_NF);
    parameter m=4; // rozmiar ( w bitach ) wejść i wyjść
    parameter n=4; // rozmiar ( w bitach ) wejścia sterującego

    // wejścia (input)
    input  logic [m-1:0] i_argA, i_argB;

    //wejście sterujące
    input  logic [n-1:0] i_oper;

    // główny output
    output logic [m-1:0] o_result;

    // znaczniki ( rozmiar: 1 bit )
    output logic [1:0] o_PF, o_SF , o_BF , o_NF;

    // sygnały pomocnicze
    logic [m-1:0] ones_counter , u2_to_u1 , gray_to_u2;
    logic [m-1:0] thermometer_code , thermometer_decode;
    logic [m-1:0] o_crc3 , o_crc4;
    logic [1:0]   SF,BF,NF,PF;

    // instacjonowanie modułów operacji
    ones_counter_mod    #(.m(m))
                        ones_counter_main
                        (.i_argA_local(i_argA), .i_argB_local(i_argB), .o_result_local(ones_counter));
    u2_to_u1_mod        #(.m(m))
                        u2_to_u1_main
                        (.i_argA_local(i_argA), .o_result_local(u2_to_u1));
    gray_to_u2_mod      #(.m(m))
                        gray_to_u2_main
                        (.i_gray(i_argA), .o_result_local(gray_to_u2));
    thermometer_coder_mod    #(.m(m))
                        thermometer_code_main
                        (.i_thermo(i_argA), .o_result_local(thermometer_code));
    thermometer_decoder_mod #(.m(m))
                        thermometer_decoder_main
                        (.i_nkb(i_argA), .o_result_local(thermometer_decode));
    crc3_mod #(.WCODE(m),.WPOLY(m))
                        crc3_main
                        (.i_data(i_argA),.i_poly(i_argB),.o_crc_local(o_crc3));
    crc4_mod #(.WCODE(m),.WPOLY(m))
                        crc4_main
                        (.i_data(i_argA),.i_poly(i_argB),.o_crc_local(o_crc4));

    // instacjonowanie modułów znaczników
    nf_pointer_mod      #(.m(m))
                        nf_pointer_main
                        (.i_input(o_result), .o_pointer_local(NF));
    sf_pointer_mod      #(.m(m))
                        sf_pointer_main
                        (.i_input(o_result), .o_pointer_local(SF));
    bf_pointer_mod      #(.m(m))
                        bf_pointer_main
                        (.i_input(o_result), .o_pointer_local(BF));                   

    always@(*) // główna układ
    begin
        case(i_oper) // wyjście jest wynikiem operacji wybranej poprzez i_oper
            0     : o_result = (i_argA - i_argB);
            1     : o_result = (i_argA | i_argB);
            2     : o_result = (i_argA ~| i_argB);
            3     : o_result = ($signed(i_argA) >>> 1); 
            4     : o_result = ($signed(i_argB) >>> 1); 
            5     : o_result = (i_argA >> 1);
            6     : o_result = (i_argB >> 1);
            7     : o_result = ones_counter;
            8     : o_result = u2_to_u1;
            9     : o_result = gray_to_u2;
            10    : o_result = thermometer_code;
            11    : o_result = thermometer_decode;
            12    : o_result = o_crc3;
            13    : o_result = o_crc4;
            default     : o_result = (i_argA - i_argB);
        endcase

        // implementacja znaczników
        o_SF=SF;
        o_BF=BF;
        o_NF=NF;
        o_PF=~NF; 
        // PF jest po prostu negacją NF (parzystość/nieparzystość), nie wymaga osobnego modułu

    end
endmodule