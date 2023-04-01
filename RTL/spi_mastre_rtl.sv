/* Generated by Yosys 0.9 (git sha1 1979e0b) */

module spi_master_rtl(i_slave_select, i_clk, i_rst, i_data, i_send, o_data, o_busy, i_miso, o_mosi, o_sclk, o_ss);
  wire _000_;
  wire _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  wire _086_;
  wire _087_;
  wire _088_;
  wire _089_;
  wire _090_;
  wire _091_;
  wire _092_;
  wire _093_;
  wire _094_;
  wire _095_;
  wire _096_;
  wire _097_;
  wire _098_;
  wire _099_;
  wire _100_;
  wire _101_;
  wire _102_;
  wire _103_;
  wire _104_;
  wire _105_;
  wire _106_;
  wire _107_;
  wire _108_;
  wire _109_;
  wire _110_;
  wire _111_;
  wire _112_;
  wire _113_;
  wire _114_;
  wire _115_;
  wire _116_;
  wire _117_;
  wire _118_;
  wire _119_;
  wire _120_;
  wire _121_;
  wire _122_;
  wire _123_;
  wire _124_;
  wire _125_;
  wire _126_;
  wire _127_;
  wire _128_;
  wire _129_;
  wire _130_;
  wire _131_;
  wire _132_;
  wire _133_;
  wire _134_;
  wire _135_;
  wire _136_;
  wire _137_;
  wire _138_;
  wire _139_;
  wire _140_;
  wire _141_;
  wire _142_;
  wire _143_;
  wire _144_;
  wire _145_;
  wire _146_;
  wire _147_;
  wire _148_;
  wire _149_;
  wire _150_;
  wire _151_;
  wire _152_;
  wire _153_;
  wire _154_;
  wire _155_;
  wire _156_;
  wire _157_;
  wire _158_;
  wire _159_;
  wire _160_;
  wire _161_;
  wire _162_;
  wire _163_;
  wire _164_;
  wire _165_;
  wire _166_;
  wire _167_;
  wire _168_;
  wire _169_;
  wire _170_;
  wire _171_;
  wire _172_;
  wire _173_;
  wire _174_;
  input i_clk;
  input [19:0] i_data;
  input i_miso;
  input i_rst;
  input i_send;
  input [2:0] i_slave_select;
  output o_busy;
  output [19:0] o_data;
  output o_mosi;
  reg o_mosi;
  output o_sclk;
  output [2:0] o_ss;
  wire s_bit;
  reg s_bit_in;
  wire s_inter;
  wire s_sin_en;
  wire s_sin_wrt;
  wire s_sout_en;
  wire s_sout_wrt;
  reg [6:0] s_state;
  wire s_watchdog_we;
  wire \shift.i_bit ;
  wire \shift.i_clk_p ;
  wire [19:0] \shift.i_data ;
  wire \shift.i_en ;
  wire \shift.i_rst_n ;
  wire \shift.i_wrt ;
  wire \shift.o_bit ;
  wire [19:0] \shift.o_data ;
  reg [19:0] \shift.s_shifter ;
  wire [19:0] \shift.s_shifter_next ;
  wire \watchdog.i_clk_p ;
  wire [5:0] \watchdog.i_cycles ;
  wire \watchdog.i_rst_n ;
  wire \watchdog.i_we ;
  wire \watchdog.o_inter ;
  reg [5:0] \watchdog.s_count ;
  wire [5:0] \watchdog.s_count_next ;
  reg [5:0] \watchdog.s_cycles ;
  wire [5:0] \watchdog.s_cycles_next ;
  assign _005_ = ~i_send;
  assign _006_ = ~i_slave_select[2];
  assign _007_ = ~i_slave_select[0];
  assign _008_ = ~i_slave_select[1];
  assign _009_ = ~s_inter;
  assign _004_ = s_state[4] | s_state[2];
  assign o_sclk = s_state[1] | _004_;
  assign _010_ = s_state[6] | s_state[5];
  assign s_sout_wrt = s_state[5] | s_state[4];
  assign s_sout_en = _004_ | _010_;
  assign _011_ = ~s_sout_en;
  assign _012_ = s_state[3] | s_state[1];
  assign _013_ = ~_012_;
  assign _014_ = _011_ & _013_;
  assign o_busy = ~_014_;
  assign _015_ = s_state[0] & _005_;
  assign _003_ = s_state[3] | _015_;
  assign _016_ = _006_ & i_slave_select[0];
  assign o_ss[0] = _014_ | _016_;
  assign _017_ = _006_ & i_slave_select[1];
  assign o_ss[1] = _014_ | _017_;
  assign _018_ = i_slave_select[2] & _007_;
  assign _019_ = _008_ & _018_;
  assign o_ss[2] = _014_ | _019_;
  assign _000_ = s_state[6] & s_inter;
  assign _002_ = s_state[0] & i_send;
  assign _001_ = s_state[6] & _009_;
  always @(posedge i_clk or negedge i_rst)
    if (!i_rst)
      s_state[0] <= 1;
    else
      s_state[0] <= _003_;
  always @(posedge i_clk or negedge i_rst)
    if (!i_rst)
      s_state[1] <= 0;
    else
      s_state[1] <= _000_;
  always @(posedge i_clk or negedge i_rst)
    if (!i_rst)
      s_state[2] <= 0;
    else
      s_state[2] <= _001_;
  always @(posedge i_clk or negedge i_rst)
    if (!i_rst)
      s_state[3] <= 0;
    else
      s_state[3] <= s_state[1];
  always @(posedge i_clk or negedge i_rst)
    if (!i_rst)
      s_state[4] <= 0;
    else
      s_state[4] <= s_state[5];
  always @(posedge i_clk or negedge i_rst)
    if (!i_rst)
      s_state[5] <= 0;
    else
      s_state[5] <= _002_;
  always @(posedge i_clk or negedge i_rst)
    if (!i_rst)
      s_state[6] <= 0;
    else
      s_state[6] <= _004_;
  always @(posedge o_sclk or negedge i_rst)
    if (!i_rst)
      s_bit_in <= 0;
    else
      s_bit_in <= i_miso;
  always @(negedge o_sclk or negedge i_rst)
    if (!i_rst)
      o_mosi <= 0;
    else
      o_mosi <= s_bit;
  assign _091_ = ~\shift.i_wrt ;
  assign _092_ = ~\shift.i_en ;
  assign _093_ = \shift.s_shifter [1] & _091_;
  assign _094_ = \shift.i_data [0] & \shift.i_wrt ;
  assign _095_ = \shift.s_shifter [0] | \shift.i_en ;
  assign _096_ = _092_ | _094_;
  assign _097_ = _093_ | _096_;
  assign \shift.s_shifter_next [0] = _095_ & _097_;
  assign _098_ = _091_ & \shift.s_shifter [2];
  assign _099_ = \shift.i_wrt  & \shift.i_data [1];
  assign _100_ = \shift.s_shifter [1] | \shift.i_en ;
  assign _101_ = _092_ | _099_;
  assign _102_ = _098_ | _101_;
  assign \shift.s_shifter_next [1] = _100_ & _102_;
  assign _103_ = _091_ & \shift.s_shifter [3];
  assign _104_ = \shift.i_wrt  & \shift.i_data [2];
  assign _105_ = \shift.i_en  | \shift.s_shifter [2];
  assign _106_ = _092_ | _104_;
  assign _107_ = _103_ | _106_;
  assign \shift.s_shifter_next [2] = _105_ & _107_;
  assign _108_ = _091_ & \shift.s_shifter [4];
  assign _109_ = \shift.i_wrt  & \shift.i_data [3];
  assign _110_ = \shift.i_en  | \shift.s_shifter [3];
  assign _111_ = _092_ | _109_;
  assign _112_ = _108_ | _111_;
  assign \shift.s_shifter_next [3] = _110_ & _112_;
  assign _113_ = _091_ & \shift.s_shifter [5];
  assign _114_ = \shift.i_wrt  & \shift.i_data [4];
  assign _115_ = \shift.i_en  | \shift.s_shifter [4];
  assign _116_ = _092_ | _114_;
  assign _117_ = _113_ | _116_;
  assign \shift.s_shifter_next [4] = _115_ & _117_;
  assign _118_ = _091_ & \shift.s_shifter [6];
  assign _119_ = \shift.i_wrt  & \shift.i_data [5];
  assign _120_ = \shift.i_en  | \shift.s_shifter [5];
  assign _121_ = _092_ | _119_;
  assign _020_ = _118_ | _121_;
  assign \shift.s_shifter_next [5] = _120_ & _020_;
  assign _021_ = _091_ & \shift.s_shifter [7];
  assign _022_ = \shift.i_wrt  & \shift.i_data [6];
  assign _023_ = \shift.i_en  | \shift.s_shifter [6];
  assign _024_ = _092_ | _022_;
  assign _025_ = _021_ | _024_;
  assign \shift.s_shifter_next [6] = _023_ & _025_;
  assign _026_ = _091_ & \shift.s_shifter [8];
  assign _027_ = \shift.i_wrt  & \shift.i_data [7];
  assign _028_ = \shift.i_en  | \shift.s_shifter [7];
  assign _029_ = _092_ | _027_;
  assign _030_ = _026_ | _029_;
  assign \shift.s_shifter_next [7] = _028_ & _030_;
  assign _031_ = _091_ & \shift.s_shifter [9];
  assign _032_ = \shift.i_wrt  & \shift.i_data [8];
  assign _033_ = \shift.i_en  | \shift.s_shifter [8];
  assign _034_ = _092_ | _032_;
  assign _035_ = _031_ | _034_;
  assign \shift.s_shifter_next [8] = _033_ & _035_;
  assign _036_ = _091_ & \shift.s_shifter [10];
  assign _037_ = \shift.i_wrt  & \shift.i_data [9];
  assign _038_ = \shift.i_en  | \shift.s_shifter [9];
  assign _039_ = _092_ | _037_;
  assign _040_ = _036_ | _039_;
  assign \shift.s_shifter_next [9] = _038_ & _040_;
  assign _041_ = _091_ & \shift.s_shifter [11];
  assign _042_ = \shift.i_wrt  & \shift.i_data [10];
  assign _043_ = \shift.i_en  | \shift.s_shifter [10];
  assign _044_ = _092_ | _042_;
  assign _045_ = _041_ | _044_;
  assign \shift.s_shifter_next [10] = _043_ & _045_;
  assign _046_ = _091_ & \shift.s_shifter [12];
  assign _047_ = \shift.i_wrt  & \shift.i_data [11];
  assign _048_ = \shift.i_en  | \shift.s_shifter [11];
  assign _049_ = _092_ | _047_;
  assign _050_ = _046_ | _049_;
  assign \shift.s_shifter_next [11] = _048_ & _050_;
  assign _051_ = _091_ & \shift.s_shifter [13];
  assign _052_ = \shift.i_wrt  & \shift.i_data [12];
  assign _053_ = \shift.i_en  | \shift.s_shifter [12];
  assign _054_ = _092_ | _052_;
  assign _055_ = _051_ | _054_;
  assign \shift.s_shifter_next [12] = _053_ & _055_;
  assign _056_ = _091_ & \shift.s_shifter [14];
  assign _057_ = \shift.i_wrt  & \shift.i_data [13];
  assign _058_ = \shift.i_en  | \shift.s_shifter [13];
  assign _059_ = _092_ | _057_;
  assign _060_ = _056_ | _059_;
  assign \shift.s_shifter_next [13] = _058_ & _060_;
  assign _061_ = _091_ & \shift.s_shifter [15];
  assign _062_ = \shift.i_wrt  & \shift.i_data [14];
  assign _063_ = \shift.i_en  | \shift.s_shifter [14];
  assign _064_ = _092_ | _062_;
  assign _065_ = _061_ | _064_;
  assign \shift.s_shifter_next [14] = _063_ & _065_;
  assign _066_ = _091_ & \shift.s_shifter [16];
  assign _067_ = \shift.i_wrt  & \shift.i_data [15];
  assign _068_ = \shift.i_en  | \shift.s_shifter [15];
  assign _069_ = _092_ | _067_;
  assign _070_ = _066_ | _069_;
  assign \shift.s_shifter_next [15] = _068_ & _070_;
  assign _071_ = _091_ & \shift.s_shifter [17];
  assign _072_ = \shift.i_wrt  & \shift.i_data [16];
  assign _073_ = \shift.i_en  | \shift.s_shifter [16];
  assign _074_ = _092_ | _072_;
  assign _075_ = _071_ | _074_;
  assign \shift.s_shifter_next [16] = _073_ & _075_;
  assign _076_ = _091_ & \shift.s_shifter [18];
  assign _077_ = \shift.i_wrt  & \shift.i_data [17];
  assign _078_ = \shift.i_en  | \shift.s_shifter [17];
  assign _079_ = _092_ | _077_;
  assign _080_ = _076_ | _079_;
  assign \shift.s_shifter_next [17] = _078_ & _080_;
  assign _081_ = _091_ & \shift.s_shifter [19];
  assign _082_ = \shift.i_wrt  & \shift.i_data [18];
  assign _083_ = \shift.i_en  | \shift.s_shifter [18];
  assign _084_ = _092_ | _082_;
  assign _085_ = _081_ | _084_;
  assign \shift.s_shifter_next [18] = _083_ & _085_;
  assign _086_ = _091_ & \shift.i_bit ;
  assign _087_ = \shift.i_wrt  & \shift.i_data [19];
  assign _088_ = \shift.i_en  | \shift.s_shifter [19];
  assign _089_ = _092_ | _087_;
  assign _090_ = _086_ | _089_;
  assign \shift.s_shifter_next [19] = _088_ & _090_;
  always @(posedge \shift.i_clk_p  or negedge \shift.i_rst_n )
    if (!\shift.i_rst_n )
      \shift.s_shifter [0] <= 0;
    else
      \shift.s_shifter [0] <= \shift.s_shifter_next [0];
  always @(posedge \shift.i_clk_p  or negedge \shift.i_rst_n )
    if (!\shift.i_rst_n )
      \shift.s_shifter [1] <= 0;
    else
      \shift.s_shifter [1] <= \shift.s_shifter_next [1];
  always @(posedge \shift.i_clk_p  or negedge \shift.i_rst_n )
    if (!\shift.i_rst_n )
      \shift.s_shifter [2] <= 0;
    else
      \shift.s_shifter [2] <= \shift.s_shifter_next [2];
  always @(posedge \shift.i_clk_p  or negedge \shift.i_rst_n )
    if (!\shift.i_rst_n )
      \shift.s_shifter [3] <= 0;
    else
      \shift.s_shifter [3] <= \shift.s_shifter_next [3];
  always @(posedge \shift.i_clk_p  or negedge \shift.i_rst_n )
    if (!\shift.i_rst_n )
      \shift.s_shifter [4] <= 0;
    else
      \shift.s_shifter [4] <= \shift.s_shifter_next [4];
  always @(posedge \shift.i_clk_p  or negedge \shift.i_rst_n )
    if (!\shift.i_rst_n )
      \shift.s_shifter [5] <= 0;
    else
      \shift.s_shifter [5] <= \shift.s_shifter_next [5];
  always @(posedge \shift.i_clk_p  or negedge \shift.i_rst_n )
    if (!\shift.i_rst_n )
      \shift.s_shifter [6] <= 0;
    else
      \shift.s_shifter [6] <= \shift.s_shifter_next [6];
  always @(posedge \shift.i_clk_p  or negedge \shift.i_rst_n )
    if (!\shift.i_rst_n )
      \shift.s_shifter [7] <= 0;
    else
      \shift.s_shifter [7] <= \shift.s_shifter_next [7];
  always @(posedge \shift.i_clk_p  or negedge \shift.i_rst_n )
    if (!\shift.i_rst_n )
      \shift.s_shifter [8] <= 0;
    else
      \shift.s_shifter [8] <= \shift.s_shifter_next [8];
  always @(posedge \shift.i_clk_p  or negedge \shift.i_rst_n )
    if (!\shift.i_rst_n )
      \shift.s_shifter [9] <= 0;
    else
      \shift.s_shifter [9] <= \shift.s_shifter_next [9];
  always @(posedge \shift.i_clk_p  or negedge \shift.i_rst_n )
    if (!\shift.i_rst_n )
      \shift.s_shifter [10] <= 0;
    else
      \shift.s_shifter [10] <= \shift.s_shifter_next [10];
  always @(posedge \shift.i_clk_p  or negedge \shift.i_rst_n )
    if (!\shift.i_rst_n )
      \shift.s_shifter [11] <= 0;
    else
      \shift.s_shifter [11] <= \shift.s_shifter_next [11];
  always @(posedge \shift.i_clk_p  or negedge \shift.i_rst_n )
    if (!\shift.i_rst_n )
      \shift.s_shifter [12] <= 0;
    else
      \shift.s_shifter [12] <= \shift.s_shifter_next [12];
  always @(posedge \shift.i_clk_p  or negedge \shift.i_rst_n )
    if (!\shift.i_rst_n )
      \shift.s_shifter [13] <= 0;
    else
      \shift.s_shifter [13] <= \shift.s_shifter_next [13];
  always @(posedge \shift.i_clk_p  or negedge \shift.i_rst_n )
    if (!\shift.i_rst_n )
      \shift.s_shifter [14] <= 0;
    else
      \shift.s_shifter [14] <= \shift.s_shifter_next [14];
  always @(posedge \shift.i_clk_p  or negedge \shift.i_rst_n )
    if (!\shift.i_rst_n )
      \shift.s_shifter [15] <= 0;
    else
      \shift.s_shifter [15] <= \shift.s_shifter_next [15];
  always @(posedge \shift.i_clk_p  or negedge \shift.i_rst_n )
    if (!\shift.i_rst_n )
      \shift.s_shifter [16] <= 0;
    else
      \shift.s_shifter [16] <= \shift.s_shifter_next [16];
  always @(posedge \shift.i_clk_p  or negedge \shift.i_rst_n )
    if (!\shift.i_rst_n )
      \shift.s_shifter [17] <= 0;
    else
      \shift.s_shifter [17] <= \shift.s_shifter_next [17];
  always @(posedge \shift.i_clk_p  or negedge \shift.i_rst_n )
    if (!\shift.i_rst_n )
      \shift.s_shifter [18] <= 0;
    else
      \shift.s_shifter [18] <= \shift.s_shifter_next [18];
  always @(posedge \shift.i_clk_p  or negedge \shift.i_rst_n )
    if (!\shift.i_rst_n )
      \shift.s_shifter [19] <= 0;
    else
      \shift.s_shifter [19] <= \shift.s_shifter_next [19];
  assign _122_ = ~\watchdog.s_count [5];
  assign _123_ = ~\watchdog.s_count [4];
  assign _124_ = ~\watchdog.s_count [2];
  assign _125_ = ~\watchdog.s_count [0];
  assign _126_ = ~\watchdog.i_we ;
  assign _127_ = \watchdog.s_count [1] | \watchdog.s_count [0];
  assign _128_ = \watchdog.s_count [2] | _127_;
  assign _129_ = \watchdog.s_count [3] | _128_;
  assign _130_ = ~_129_;
  assign _131_ = _123_ & _130_;
  assign _132_ = \watchdog.s_count [4] | _129_;
  assign _133_ = _122_ & _131_;
  assign _134_ = \watchdog.s_count [5] | _132_;
  assign _135_ = \watchdog.s_cycles [1] | \watchdog.s_cycles [0];
  assign _136_ = \watchdog.s_cycles [3] | \watchdog.s_cycles [2];
  assign _137_ = \watchdog.s_cycles [5] | \watchdog.s_cycles [4];
  assign _138_ = _136_ | _137_;
  assign _139_ = _135_ | _138_;
  assign _140_ = _126_ & _139_;
  assign \watchdog.o_inter  = _133_ & _140_;
  assign _141_ = \watchdog.i_we  & \watchdog.i_cycles [0];
  assign _142_ = _126_ & _134_;
  assign _143_ = _126_ & \watchdog.s_cycles [0];
  assign _144_ = _142_ | _143_;
  assign _145_ = _125_ & _144_;
  assign \watchdog.s_count_next [0] = _141_ | _145_;
  assign _146_ = \watchdog.i_we  & \watchdog.i_cycles [1];
  assign _147_ = \watchdog.s_count [1] ^ _125_;
  assign _148_ = _126_ & \watchdog.s_cycles [1];
  assign _149_ = _142_ | _148_;
  assign _150_ = _147_ & _149_;
  assign \watchdog.s_count_next [1] = _146_ | _150_;
  assign _151_ = \watchdog.i_we  & \watchdog.i_cycles [2];
  assign _152_ = _124_ ^ _127_;
  assign _153_ = _126_ & \watchdog.s_cycles [2];
  assign _154_ = _142_ | _153_;
  assign _155_ = _152_ & _154_;
  assign \watchdog.s_count_next [2] = _151_ | _155_;
  assign _156_ = \watchdog.i_we  & \watchdog.i_cycles [3];
  assign _157_ = _126_ & \watchdog.s_cycles [3];
  assign _158_ = _142_ | _157_;
  assign _159_ = \watchdog.s_count [3] & _128_;
  assign _160_ = _130_ | _159_;
  assign _161_ = _158_ & _160_;
  assign \watchdog.s_count_next [3] = _156_ | _161_;
  assign _162_ = \watchdog.s_count [4] & _129_;
  assign _163_ = \watchdog.s_count [5] | \watchdog.s_cycles [4];
  assign _164_ = _131_ & _163_;
  assign _165_ = _162_ | _164_;
  assign _166_ = _126_ & _165_;
  assign _167_ = \watchdog.i_we  & \watchdog.i_cycles [4];
  assign \watchdog.s_count_next [4] = _166_ | _167_;
  assign _168_ = _126_ & \watchdog.s_cycles [5];
  assign _169_ = _133_ & _168_;
  assign _170_ = \watchdog.s_count [5] & _126_;
  assign _171_ = _132_ & _170_;
  assign _172_ = \watchdog.i_we  & \watchdog.i_cycles [5];
  assign _173_ = _171_ | _172_;
  assign \watchdog.s_count_next [5] = _169_ | _173_;
  assign \watchdog.s_cycles_next [0] = _141_ | _143_;
  assign \watchdog.s_cycles_next [1] = _146_ | _148_;
  assign \watchdog.s_cycles_next [2] = _151_ | _153_;
  assign \watchdog.s_cycles_next [3] = _156_ | _157_;
  assign _174_ = _126_ & \watchdog.s_cycles [4];
  assign \watchdog.s_cycles_next [4] = _167_ | _174_;
  assign \watchdog.s_cycles_next [5] = _168_ | _172_;
  always @(posedge \watchdog.i_clk_p  or negedge \watchdog.i_rst_n )
    if (!\watchdog.i_rst_n )
      \watchdog.s_count [0] <= 0;
    else
      \watchdog.s_count [0] <= \watchdog.s_count_next [0];
  always @(posedge \watchdog.i_clk_p  or negedge \watchdog.i_rst_n )
    if (!\watchdog.i_rst_n )
      \watchdog.s_count [1] <= 0;
    else
      \watchdog.s_count [1] <= \watchdog.s_count_next [1];
  always @(posedge \watchdog.i_clk_p  or negedge \watchdog.i_rst_n )
    if (!\watchdog.i_rst_n )
      \watchdog.s_count [2] <= 0;
    else
      \watchdog.s_count [2] <= \watchdog.s_count_next [2];
  always @(posedge \watchdog.i_clk_p  or negedge \watchdog.i_rst_n )
    if (!\watchdog.i_rst_n )
      \watchdog.s_count [3] <= 0;
    else
      \watchdog.s_count [3] <= \watchdog.s_count_next [3];
  always @(posedge \watchdog.i_clk_p  or negedge \watchdog.i_rst_n )
    if (!\watchdog.i_rst_n )
      \watchdog.s_count [4] <= 0;
    else
      \watchdog.s_count [4] <= \watchdog.s_count_next [4];
  always @(posedge \watchdog.i_clk_p  or negedge \watchdog.i_rst_n )
    if (!\watchdog.i_rst_n )
      \watchdog.s_count [5] <= 0;
    else
      \watchdog.s_count [5] <= \watchdog.s_count_next [5];
  always @(posedge \watchdog.i_clk_p  or negedge \watchdog.i_rst_n )
    if (!\watchdog.i_rst_n )
      \watchdog.s_cycles [0] <= 0;
    else
      \watchdog.s_cycles [0] <= \watchdog.s_cycles_next [0];
  always @(posedge \watchdog.i_clk_p  or negedge \watchdog.i_rst_n )
    if (!\watchdog.i_rst_n )
      \watchdog.s_cycles [1] <= 0;
    else
      \watchdog.s_cycles [1] <= \watchdog.s_cycles_next [1];
  always @(posedge \watchdog.i_clk_p  or negedge \watchdog.i_rst_n )
    if (!\watchdog.i_rst_n )
      \watchdog.s_cycles [2] <= 0;
    else
      \watchdog.s_cycles [2] <= \watchdog.s_cycles_next [2];
  always @(posedge \watchdog.i_clk_p  or negedge \watchdog.i_rst_n )
    if (!\watchdog.i_rst_n )
      \watchdog.s_cycles [3] <= 0;
    else
      \watchdog.s_cycles [3] <= \watchdog.s_cycles_next [3];
  always @(posedge \watchdog.i_clk_p  or negedge \watchdog.i_rst_n )
    if (!\watchdog.i_rst_n )
      \watchdog.s_cycles [4] <= 0;
    else
      \watchdog.s_cycles [4] <= \watchdog.s_cycles_next [4];
  always @(posedge \watchdog.i_clk_p  or negedge \watchdog.i_rst_n )
    if (!\watchdog.i_rst_n )
      \watchdog.s_cycles [5] <= 0;
    else
      \watchdog.s_cycles [5] <= \watchdog.s_cycles_next [5];
  assign s_sin_en = 1'h0;
  assign s_sin_wrt = 1'h0;
  assign s_watchdog_we = s_sout_wrt;
  assign \shift.i_bit  = s_bit_in;
  assign \shift.i_clk_p  = o_sclk;
  assign \shift.i_data  = i_data;
  assign \shift.i_en  = s_sout_en;
  assign \shift.i_rst_n  = i_rst;
  assign \shift.i_wrt  = s_sout_wrt;
  assign s_bit = \shift.o_bit ;
  assign o_data = \shift.o_data ;
  assign \shift.o_bit  = \shift.s_shifter [0];
  assign \shift.o_data  = \shift.s_shifter ;
  assign \watchdog.i_clk_p  = o_sclk;
  assign \watchdog.i_cycles  = 6'h14;
  assign \watchdog.i_rst_n  = i_rst;
  assign \watchdog.i_we  = s_sout_wrt;
  assign s_inter = \watchdog.o_inter ;
endmodule
