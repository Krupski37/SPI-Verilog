`timescale 1s/1ms
`define CLKSTEP     10
`define SIMTIME     28000
`define DATASTEP    100
`define RSTTIME     201
// `define TIMESTEP 2000
module testbench;
parameter BITS = 20;

logic               clk = 1'b1;
logic               rst = 1'b1;
logic               master_busy;
logic               send_request = 1'b0;
logic [BITS-1:0]    send_data = '0;
logic [BITS-1:0]    received_data;
logic [BITS-1:0]    expected_data = '0;

// Sygnaly zdarzen sterujacych 
event               end_simulation;
event               next_data;
event               check_data;

// Sygnaly interfejsu SPI
logic spi_mosi, spi_miso, spi_sclk, spi_miso1, spi_miso2, spi_miso3;
logic [2:0] spi_ss;
logic [2:0] slave_select;

// Liczniki poprawnej i blednej transmisji
integer liczba_bledow_transferow = 0;
integer liczba_poprawnych_transferow = 0;
// Numer slave'a w transmisji
//  integer select_slave = 0;

// Mater komunikacji SPI
spi_master_rtl
    spi_master    (
        .i_slave_select(slave_select),
        .i_clk(clk), 
        .i_rst(rst), 
        .i_data(send_data), 
        .i_send(send_request), 
        .o_data(received_data),
        .o_busy(master_busy),
        
        .i_miso(spi_miso),
        .o_mosi(spi_mosi),
        .o_sclk(spi_sclk),
        .o_ss(spi_ss)
    );

// Poszczegolne moduly exe_unit z interfejsem SPI
spi_exe_unit_1_rtl 
    spi_exe_unit_1 (
        .i_rst(rst), 
        .i_sclk(spi_sclk), 
        .i_mosi(spi_mosi), 
        .o_miso(spi_miso1), 
        .i_cs(spi_ss)
    );

spi_exe_unit_2_rtl 
    spi_exe_unit_2 (
        .i_rst(rst), 
        .i_sclk(spi_sclk), 
        .i_mosi(spi_mosi), 
        .o_miso(spi_miso2), 
        .i_cs(spi_ss)
    );


spi_exe_unit_3_rtl 
    spi_exe_unit_3 (
        .i_rst(rst), 
        .i_sclk(spi_sclk), 
        .i_mosi(spi_mosi), 
        .o_miso(spi_miso3), 
        .i_cs(spi_ss)
    );    

// spi_exe_unit_4_rtl 
//     spi_exe_unit_4 (
//         .i_rst(rst), 
//         .i_sclk(spi_sclk), 
//         .i_mosi(spi_mosi), 
//         .o_miso(spi_miso4), 
//         .i_cs(spi_ss)
//     );

always@(*)
    begin
        case(slave_select)
            1     : spi_miso = spi_miso1;
            2     : spi_miso = spi_miso2;
            3     : spi_miso = spi_miso3;
            default  : spi_miso = '0;
    endcase
    end
// Blok sprawdzania poprawnosci
// odebranych danych
always @(negedge clk)
begin
    if (rst)
        if (~master_busy & ~send_request)
        begin
            -> check_data;
            if (received_data !== expected_data)
            begin
                $display("%c[1;31mERROR%c[0m @%0ds: Bledny transfer: slave_number=%0d, received_data=%0b, expected_data=%0b",27,27, $time, slave_select, received_data, expected_data);
                liczba_bledow_transferow += 1;
            end
            else liczba_poprawnych_transferow += 1;
        end    
end

// Blok wyzwalania kolejnej transmisji
always @(posedge clk)
    if (rst)
    begin
        if (~master_busy)
        begin
            if (~send_request)
                -> next_data;
                send_request = 1;
        end
        else
            send_request = 0;
    end
// Blok kolejnych transmisji
// wraz z określeniem oczekiwanych wartosci odebranych
initial begin
  
    //# `DATASTEP;
   

    // Testy dla poszczegolnych układów spi_slave_exe_unit
    `include "../TEST/test_spi_exe_unit_1.vh"
    `include "../TEST/test_spi_exe_unit_2.vh"
    `include "../TEST/test_spi_exe_unit_3.vh"
 


   
   


    -> end_simulation;
end

// Generacja zegara w srodowisku testowym
always #`CLKSTEP clk <= ~clk;


// Utworzenie pliku wynikow oraz 
// wyswietlenie statystyk komunikacji
initial begin
    {clk, rst} <= '0;
    $dumpfile("waves.vcd");
    $dumpvars(0, testbench);
    $display("\n---------------------------");
    # `RSTTIME rst <= '1;
    
    
    // Wszystkie testy wykonane
    @(end_simulation);
    $display(""); 
    $display("Koniec transmisji\n");
    $display("Liczba blednych transferow: %c[1;31m  %0d %c[0m ",27, liczba_bledow_transferow,27);
    $display("Liczba poprawnych transferow:%c[1;32m %0d %c[0m ",27, liczba_poprawnych_transferow,27);
    $display("---------------------------\n");
    
    $finish;
end

endmodule