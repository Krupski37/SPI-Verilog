module nkb2onehot_mod (i_nkb, o_onehot);
    parameter NUM = 4;
    localparam LEN = 2**NUM-1;
    input logic  [NUM-1:0] i_nkb;
    output logic [LEN-1:0]  o_onehot;
    integer i;
    always @*
    begin
        o_onehot = '0;
        for ( i=0; i < LEN; i++)
            if (i == i_nkb)
                o_onehot[i] = 1'b1;
    end
endmodule