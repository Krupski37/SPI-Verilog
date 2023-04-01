module spi_exe_unit_3 (i_rst, i_sclk, i_mosi, o_miso, i_cs);
parameter BITS = 20;
input logic i_rst, i_sclk, i_mosi;
input logic [2:0] i_cs;
output logic o_miso;
localparam NUM=12;
logic s_shift_out;
logic s_transfer;
logic s_bit, s_bit_next;
logic [3:0] reg_argA, reg_argB, reg_oper, reg_results,reg_flags;

logic [BITS-1:0] s_wyniki;
logic [3:0]s_argA_next,s_argB_next,s_oper_next,s_results_next,s_flags_next;
logic s_inter,  s_watchdog_we;

logic [3:0]s_argA,s_argB,s_oper,s_results,s_flags;
logic s_wrt;
logic [BITS-1:0] s_data;

logic   [3:0] s_state, s_state_next;

shifter #(.N(BITS))
    shift_out (
        .i_clk_p(i_sclk), 
        .i_rst_n(i_rst), 
        .i_bit(i_mosi),      
        .i_data(s_data),     
        .i_en(s_transfer),       
        .i_wrt(s_wrt),          
        .o_bit(s_bit_next),
        .o_data(s_wyniki)
    );

watchdog #(.N($clog2(NUM)+1))
    watchdog (
        .i_clk_p(i_sclk),
        .i_rst_n(i_rst),
        .i_cycles(BITS-1),
        .i_we(s_watchdog_we),
        .o_inter(s_inter)
    );


exe_unit #(.n(4),.m(4))
    exe_unit1 (
        .i_argA(reg_argA),
        .i_argB(reg_argB),
        .i_oper(reg_oper),
        .o_result(s_results),
        .o_SF(s_flags[0]),
        .o_BF(s_flags[1]),
        .o_NF(s_flags[2]),
        .o_PF(s_flags[3])
              );
always @(*)
begin
    s_transfer  = '0;
    s_wrt='0;
    s_data='0;
    s_watchdog_we='0;
    s_argA_next = reg_argA;
    s_argB_next = reg_argB;
    s_oper_next = reg_oper;
    s_results_next = reg_results;
    s_flags_next = reg_flags;
    s_transfer  = '0;
    o_miso = '0;
    s_state_next=s_state;
    s_argA='0;
    s_argB='0;
    s_oper='0;
    case (s_state)
        1: 
         begin
                        if (i_cs==3)
                        begin
                        s_state_next = 2;
                        s_watchdog_we = '1;
                        s_transfer = '1;
                        o_miso = s_bit;
                        end
         end
        2:
            begin
               o_miso = s_bit;
                    // if (s_inter)
                    //     begin
                            
                    //         // s_argA_next = s_argA;
                    //         // s_argB_next = s_argB;
                    //         // s_oper_next = s_oper;
                    //         // s_argA=s_argA_next;
                    //         // s_argB=s_argB_next;
                    //         // s_oper=s_oper_next;
                    //         // s_flags=s_flags_next;
                    //         // s_results=s_results_next;
                    //         //s_data = {reg_argA,reg_argB,reg_oper,reg_results,reg_flags};
                      
                    //     end
                    // else
                    //     begin
                             
                            s_watchdog_we = '0;
                            s_argA_next = s_wyniki[19:16];
                            s_argB_next = s_wyniki[15:12];
                            s_oper_next = s_wyniki[11:8];
                            s_results_next = s_wyniki[7:4];
                            s_flags_next = s_wyniki[3:0];
                            s_transfer = '1;
                            if (s_inter)
                                s_state_next = 3;
                        // end 
            end
        3:
        begin
                    // s_transfer = '1;
                    // s_wrt = '1;
                    s_flags_next=s_flags;
                    s_results_next=s_results;
                    s_state_next=4;
            
        end
        4:
            begin
                        s_wrt='1;
                        s_transfer = '1;
                        s_data ={reg_argA,reg_argB,reg_oper,reg_results,reg_flags};
                        s_state_next=1;
            end
            default:
            begin
                s_state_next=1;
            end 
    endcase
end
always @(negedge i_sclk, negedge i_rst) //negedge
begin
    if (!i_rst)
    begin
        s_state <= '1;

    end
    else
    begin
        s_state <= s_state_next;

    end
end







always @(negedge i_sclk, negedge i_rst)
begin
 if (!i_rst)
     s_bit <= 0;
 else
     s_bit <= s_bit_next;
end
//register reg_argA
always @(negedge i_sclk, negedge i_rst)
begin
    if(!i_rst)
        reg_argA <=0;
    else
        reg_argA <= s_argA_next;
end
//register reg_argB
always @(negedge i_sclk, negedge i_rst)
begin
 if (!i_rst)
     reg_argB <= 0;
 else
     reg_argB <= s_argB_next;
end

//register reg_oper
always @(negedge i_sclk, negedge i_rst)
begin
 if (!i_rst)
     reg_oper <= 0;
 else
     reg_oper <= s_oper_next;
end

//register reg_result
always @(negedge i_sclk, negedge i_rst)
begin
 if (!i_rst)
     reg_results <= 0;
 else
     reg_results <= s_results_next;
end

//register reg_flags
always @(negedge i_sclk, negedge i_rst)
begin
 if (!i_rst)
     reg_flags <= 0;
 else
     reg_flags <= s_flags_next;
end

endmodule