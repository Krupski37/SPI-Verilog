module gray_mod (i_data, o_gray);

    parameter NUM = 4;
    input  logic [NUM-1:0] i_data;
    output logic [NUM-1:0] o_gray;

    always @*
    begin
        o_gray  = i_data ^ (i_data >> 1);
    end

endmodule