rst<=0;
# `RSTTIME;
rst<=1;
send_request = 1;
slave_select = 3; 


// odejmowanie, i_oper = 0, 4
send_data = {4'b1011,4'b0011,4'b0000,4'b0000,4'b0000};
expected_data = {4'b0000,4'b0000,4'b0000,4'b0000,4'b0000};
@(next_data);

send_data = {4'b0101,4'b0000,4'b0000,4'b0000,4'b0000};
expected_data = {4'b1011,4'b0011,4'b0000,4'b1000,4'b0111};
@(next_data);

send_data = {4'b0110,4'b0101,4'b0000,4'b0000,4'b0000};
expected_data = {4'b0101,4'b0000,4'b0000,4'b0101,4'b1000};
@(next_data);

send_data = {4'b1111,4'b0000,4'b0000,4'b0000,4'b0000};
expected_data = {4'b0110,4'b0101,4'b0000,4'b0001,4'b0110};
@(next_data);

// i_oper = 1 , 8

send_data = {4'b1100,4'b0110,4'b0001,4'b0000,4'b0000};
expected_data = {4'b1111,4'b0000,4'b0000,4'b1111,4'b1001};
@(next_data);

send_data = {4'b0000,4'b1000,4'b0001,4'b0000,4'b0000};
expected_data = {4'b1100,4'b0110,4'b0001,4'b1110,4'b0101};
@(next_data);

send_data = {4'b0111,4'b1110,4'b0001,4'b0000,4'b0000};
expected_data = {4'b0000,4'b1000,4'b0001,4'b1000,4'b0111};
@(next_data);

send_data = {4'b0101,4'b1000,4'b0001,4'b0000,4'b0000};
expected_data = {4'b0111,4'b1110,4'b0001,4'b1111,4'b1001};
@(next_data);

// i_oper = 2 , 12

send_data = {4'b1110,4'b1111,4'b0010,4'b0000,4'b0000};
expected_data = {4'b0101,4'b1000,4'b0001,4'b1101,4'b0101};
@(next_data);

send_data = {4'b1100,4'b1001,4'b0010,4'b0000,4'b0000};
expected_data = {4'b1110,4'b1111,4'b0010,4'b0000,4'b1000};
@(next_data);

send_data = {4'b0011,4'b1100,4'b0010,4'b0000,4'b0000};
expected_data = {4'b1100,4'b1001,4'b0010,4'b0010,4'b0110};
@(next_data);

send_data = {4'b1100,4'b1111,4'b0010,4'b0000,4'b0000};
expected_data = {4'b0011,4'b1100,4'b0010,4'b0000,4'b1000};
@(next_data);

// i_oper = 3, 16

send_data = {4'b0000,4'b0000,4'b0011,4'b0000,4'b0000};
expected_data = {4'b1100,4'b1111,4'b0010,4'b0000,4'b1000};
@(next_data);

send_data = {4'b1111,4'b0000,4'b0011,4'b0000,4'b0000};
expected_data = {4'b0000,4'b0000,4'b0011,4'b0000,4'b1000};
@(next_data);

send_data = {4'b0110,4'b0000,4'b0011,4'b0000,4'b0000};
expected_data = {4'b1111,4'b0000,4'b0011,4'b1111,4'b1001};
@(next_data);

send_data = {4'b0101,4'b0000,4'b0011,4'b0000,4'b0000};
expected_data = {4'b0110,4'b0000,4'b0011,4'b0011,4'b1000};
@(next_data);

// i_oper = 5 , 20

send_data = {4'b1011,4'b0000,4'b0101,4'b0000,4'b0000};
expected_data = {4'b0101,4'b0000,4'b0011,4'b0010,4'b0110};
@(next_data);

send_data = {4'b0101,4'b0000,4'b0101,4'b0000,4'b0000};
expected_data = {4'b1011,4'b0000,4'b0101,4'b0101,4'b1000};
@(next_data);

send_data = {4'b0110,4'b0000,4'b0101,4'b0000,4'b0000};
expected_data = {4'b0101,4'b0000,4'b0101,4'b0010,4'b0110};
@(next_data);

send_data = {4'b1111,4'b0000,4'b0101,4'b0000,4'b0000};
expected_data = {4'b0110,4'b0000,4'b0101,4'b0011,4'b1000};
@(next_data);

// i_oper = 7 , 24

send_data = {4'b0001,4'b1000,4'b0111,4'b0000,4'b0000};
expected_data = {4'b1111,4'b0000,4'b0101,4'b0111,4'b0100};
@(next_data);

send_data = {4'b0011,4'b0010,4'b0111,4'b0000,4'b0000};
expected_data = {4'b0001,4'b1000,4'b0111,4'b0010,4'b0110};
@(next_data);

send_data = {4'b0010,4'b1111,4'b0111,4'b0000,4'b0000};
expected_data = {4'b0011,4'b0010,4'b0111,4'b0011,4'b1000};
@(next_data);

send_data = {4'b1111,4'b0011,4'b0111,4'b0000,4'b0000};
expected_data = {4'b0010,4'b1111,4'b0111,4'b0101,4'b1000};
@(next_data);

// i_oper = 8 , 28

send_data = {4'b1111,4'b0000,4'b1000,4'b0000,4'b0000};
expected_data = {4'b1111,4'b0011,4'b0111,4'b0110,4'b1000};
@(next_data);

send_data = {4'b0010,4'b0000,4'b1000,4'b0000,4'b0000};
expected_data = {4'b1111,4'b0000,4'b1000,4'b1110,4'b0101};
@(next_data);

send_data = {4'b1101,4'b0000,4'b1000,4'b0000,4'b0000};
expected_data = {4'b0010,4'b0000,4'b1000,4'b0010,4'b0110};
@(next_data);

send_data = {4'b1111,4'b0000,4'b1000,4'b0000,4'b0000};
expected_data = {4'b1101,4'b0000,4'b1000,4'b1100,4'b1001};
@(next_data);

// i_oper = 9 , 32

send_data = {4'b0100,4'b0000,4'b1001,4'b0000,4'b0000};
expected_data = {4'b1111,4'b0000,4'b1000,4'b1110,4'b0101};
@(next_data);

send_data = {4'b1111,4'b0000,4'b1001,4'b0000,4'b0000};
expected_data = {4'b0100,4'b0000,4'b1001,4'b0111,4'b0100};
@(next_data);

send_data = {4'b0010,4'b0000,4'b1001,4'b0000,4'b0000};
expected_data = {4'b1111,4'b0000,4'b1001,4'b1010,4'b1001};
@(next_data);

send_data = {4'b0000,4'b0000,4'b1001,4'b0000,4'b0000};
expected_data = {4'b0010,4'b0000,4'b1001,4'b0011,4'b1000};
@(next_data);

// i_oper = 10, 36

send_data = {4'b0010,4'b0000,4'b1010,4'b0000,4'b0000};
expected_data = {4'b0000,4'b0000,4'b1001,4'b0000,4'b1000};
@(next_data);

send_data = {4'b0001,4'b0000,4'b1010,4'b0000,4'b0000};
expected_data = {4'b0010,4'b0000,4'b1010,4'b0001,4'b0110};
@(next_data);

send_data = {4'b1011,4'b0000,4'b1010,4'b0000,4'b0000};
expected_data = {4'b0001,4'b0000,4'b1010,4'b0000,4'b1000};
@(next_data);

send_data = {4'b0101,4'b0000,4'b1010,4'b0000,4'b0000};
expected_data = {4'b1011,4'b0000,4'b1010,4'b0011,4'b1000};
@(next_data);

// i_oper = 11 , 40

send_data = {4'b0001,4'b0000,4'b1011,4'b0000,4'b0000};
expected_data = {4'b0101,4'b0000,4'b1010,4'b0010,4'b0110};
@(next_data);

send_data = {4'b0000,4'b0000,4'b1011,4'b0000,4'b0000};
expected_data = {4'b0001,4'b0000,4'b1011,4'b0011,4'b1000};
@(next_data);

send_data = {4'b1111,4'b0000,4'b1011,4'b0000,4'b0000};
expected_data = {4'b0000,4'b0000,4'b1011,4'b0001,4'b0110};
@(next_data);

send_data = {4'b0110,4'b0000,4'b1011,4'b0000,4'b0000};
expected_data = {4'b1111,4'b0000,4'b1011,4'b1111,4'b1001};
@(next_data);

// i_oper = 12 , 44

send_data = {4'b0000,4'b1010,4'b1100,4'b0000,4'b0000};
expected_data = {4'b0110,4'b0000,4'b1011,4'b1111,4'b1001};
@(next_data);

send_data = {4'b0011,4'b1100,4'b1100,4'b0000,4'b0000};
expected_data = {4'b0000,4'b1010,4'b1100,4'b0000,4'b1000};
@(next_data);

send_data = {4'b0001,4'b0001,4'b1100,4'b0000,4'b0000};
expected_data = {4'b0011,4'b1100,4'b1100,4'b0100,4'b0110};
@(next_data);

send_data = {4'b1000,4'b1000,4'b1100,4'b0000,4'b0000};
expected_data = {4'b0001,4'b0001,4'b1100,4'b0001,4'b0110};
@(next_data);

// i_oper = 13 , 48

send_data = {4'b0000,4'b0001,4'b1101,4'b0000,4'b0000};
expected_data = {4'b1000,4'b1000,4'b1100,4'b0000,4'b1000};
@(next_data);

send_data = {4'b1111,4'b0001,4'b1101,4'b0000,4'b0000};
expected_data = {4'b0000,4'b0001,4'b1101,4'b0000,4'b1000};
@(next_data);

send_data = {4'b110,4'b1010,4'b1101,4'b0000,4'b0000};
expected_data = {4'b1111,4'b0001,4'b1101,4'b0111,4'b0100};
@(next_data);

send_data = {4'b0101,4'b0101,4'b1101,4'b0000,4'b0000};
expected_data = {4'b110,4'b1010,4'b1101,4'b0100,4'b0110};
@(next_data);

send_data = {4'b0000,4'b0000,4'b0000,4'b0000,4'b0000};
expected_data = {4'b0101,4'b0101,4'b1101,4'b0001,4'b0110};
@(next_data);