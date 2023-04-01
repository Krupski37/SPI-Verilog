module lshift_mod(i_a, o_logic_right);
    parameter NUM = 3;
    input  logic [NUM-1:0] i_a;
    output logic [NUM-1:0] o_logic_right;
    always @*
    begin 
        o_logic_right = (i_a >> 1);
    end
endmodule