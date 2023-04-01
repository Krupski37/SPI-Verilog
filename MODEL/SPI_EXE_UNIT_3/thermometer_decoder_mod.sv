module thermometer_decoder_mod(i_nkb, o_result_local);
    parameter m = 2;
    localparam LEN = 2**m-1;
    input  logic [m-1:0] i_nkb;
    output logic [LEN-1:0]  o_result_local;
    integer i;

    always@(*)
    begin
        o_result_local = '0;
        for (i=0; i < LEN; i++)
        begin
            if (i_nkb >= i)
                o_result_local[i] = 1'b1;
        end
    end
endmodule