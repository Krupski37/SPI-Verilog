module gray_to_u2_mod(i_gray, o_result_local);

    parameter m = 4;
    integer i;
    input  logic [m-1:0] i_gray;
    output logic [m-1:0] o_result_local;

    always@(*)
    begin
        
        o_result_local = i_gray;
        for (i=m-1; i>0; i=i-1)
            o_result_local[i-1] = o_result_local[i] ^ i_gray[i-1];    

    end

endmodule