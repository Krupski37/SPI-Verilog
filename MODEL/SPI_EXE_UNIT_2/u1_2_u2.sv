module u1_2_u2_mod (i_u1, o_u2);
parameter NUM = 4;
localparam LEN = NUM-1;
input logic [NUM-1:0] i_u1;
output logic [NUM-1:0] o_u2;

always @*
begin 
    if (i_u1 [LEN] == 1)
        o_u2 = i_u1 + 1;
    else
        o_u2 = i_u1;
end
endmodule