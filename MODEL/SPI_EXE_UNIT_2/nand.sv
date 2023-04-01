module nand_mod (i_a, i_b, o_y1);

    parameter NUM = 3;
    input  logic [NUM-1:0] i_a, i_b;
    output logic [NUM-1:0] o_y1;

    always @*
    begin
        o_y1 = ~ (i_a & i_b); 
    end

endmodule
