module bf_pointer_mod(i_input, o_pointer_local);

    parameter m = 4;
    input  logic [m-1:0] i_input;
    output logic [1:0] o_pointer_local;
    integer i;
    integer counter;

    always@(*)
    begin
    counter=0;

    for(i=0; i<m ; i++)
    begin
        if ( i_input[i]  == 1'b1)
        begin
            counter++;
        end
    end

    if(counter==1)
    begin
        o_pointer_local=1;
    end 

    else
    begin
        o_pointer_local=0;
    end

    end
endmodule