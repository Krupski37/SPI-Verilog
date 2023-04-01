module nkb2therm_mod (i_nkb, o_thermo);
    parameter NUM = 4;
    localparam LEN = NUM*4-1;
    input  logic [NUM-1:0] i_nkb;
    output logic [LEN-1:0]  o_thermo;
    integer i=0;
    always @*
    begin
        o_thermo = '0;
        for (i=0; i < LEN; i++)
            if (i_nkb > i)
                o_thermo[i] = 1'b1;
    end
endmodule
