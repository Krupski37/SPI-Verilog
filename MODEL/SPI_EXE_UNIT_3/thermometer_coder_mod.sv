module thermometer_coder_mod(i_thermo, o_result_local);
    parameter m = 4;
    localparam BITS = $clog2(m);
    input logic  [m-1:0] i_thermo;
    output logic [BITS-1:0] o_result_local;
    integer i;

    always@(*)
    begin
        o_result_local = '0;
        for(i=0; i < m; i++)
        begin
            if (i_thermo[i] == 1'b1)
                o_result_local = i;
        end
    end
endmodule

