module u2_to_u1_mod(i_argA_local, o_result_local);
    parameter m=4;
    input  logic [m-1:0] i_argA_local;
    output logic [m-1:0] o_result_local;
    always@(*) 
    begin

    if(i_argA_local[m-1]==0)
        o_result_local=i_argA_local;
    else
        o_result_local=i_argA_local-1;

    end
endmodule