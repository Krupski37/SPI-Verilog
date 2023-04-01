module ones_counter_mod(i_argA_local, i_argB_local, o_result_local);
    parameter m=4;
    integer i;

    input  logic [m-1:0] i_argA_local, i_argB_local;
    output logic [m-1:0] o_result_local;
    always@(*)
    begin
    o_result_local=0;
    for(i=0 ; i<m ; i++)
    begin
        if (i_argA_local[i]==1)
            o_result_local++;
        if (i_argB_local[i]==1)
            o_result_local++;
    end
    
    end
endmodule