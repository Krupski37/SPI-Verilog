module sf_pointer_mod(i_input, o_pointer_local);

    parameter m = 4;
    input  logic [m-1:0] i_input;
    output logic [1:0] o_pointer_local;

    always@(*)
    begin

    if (i_input[m-1]==0)
        o_pointer_local=0;
    else
        o_pointer_local=1;
    end

endmodule