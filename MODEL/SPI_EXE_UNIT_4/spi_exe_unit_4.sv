module spi_exe_unit_4 (i_rst, i_sclk, i_mosi, o_miso, i_cs);
parameter BITS = 5;
input logic i_rst, i_sclk, i_mosi, i_cs;
output logic o_miso;

logic s_shift_out;
logic s_transfer;
logic s_bit, s_bit_next;

shifter #(.N(BITS))
    shift_out (
        .i_clk_p(i_sclk), 
        .i_rst_n(i_rst), 
        .i_bit(i_mosi),      
        .i_data('0),     
        .i_en(s_transfer),       
        .i_wrt('0),          
        .o_bit(s_bit_next)
    );

always @(*)
begin
    if (!i_cs)
    begin
        o_miso = s_bit;
        s_transfer  = '1;
    end
    else
    begin
        s_transfer  = '0;
        o_miso = '0;
    end
end

always @(negedge i_sclk, negedge i_rst)
begin
 if (!i_rst)
     s_bit <= 0;
 else
     s_bit <= s_bit_next;
end

endmodule