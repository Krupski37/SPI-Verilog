module ashift_mod(i_a, 
                    o_arith_left);
    parameter NUM = 2;
    input  logic signed [NUM-1:0] i_a;
    output logic signed [NUM-1:0] o_arith_left;
    always @*
    begin
        o_arith_left = (i_a <<< 1);    
    end
endmodule