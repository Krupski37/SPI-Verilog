module sum_one_mod (i_a, i_b, o_y);
    parameter NUM = 2 ;
    input logic [NUM-1:0] i_a;
    input logic [NUM-1:0] i_b;
    output logic [NUM-1:0] o_y;
            logic [NUM*2-1:0] s_help;
    integer i;
always @*
begin 
    o_y = '0;
    s_help =  { i_a, i_b };
    for (i=0; i < NUM*2 ; i++)
    begin
        if (s_help[i] == 1'b1)
            o_y = o_y +1'b1;
        else;
    end
end
endmodule