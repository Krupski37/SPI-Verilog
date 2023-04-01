module crc3_mod(i_data, i_poly, o_crc_local);
    parameter WCODE = 4;
    parameter WPOLY = 4;
    input logic [WCODE-1:0]  i_data;
    input logic [WPOLY-1:0]  i_poly;
    logic [WPOLY-2:0]  crc;
    output logic [WPOLY-2:0] o_crc_local;
    localparam LEN = WCODE+WPOLY-1;
    integer i;
    logic [LEN-1:0] crc_tmp;
    logic [LEN-1:0] poly_tmp;
    always @(*)
    begin
        {o_crc_local, crc_tmp, poly_tmp}  = 0;
        crc = 3'b000;
        crc_tmp     = {i_data, crc};
        poly_tmp    = {i_poly, {(WCODE-1){1'b0}}};
        for (i=WCODE-1; i >= 0; i--)
        begin : LOOP
            if (i_data[i] == 1'b1)
                    crc_tmp = crc_tmp ^ poly_tmp;
        poly_tmp = poly_tmp >> 1;
        end : LOOP
        o_crc_local = crc_tmp[WPOLY-2:0];
    end
endmodule