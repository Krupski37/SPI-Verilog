# `RSTTIME;
@(next_data);
slave_select = 1;
send_request = 1;

// Sprawdzenie operacji dodawania i_oper = 0000
send_data = {4'b0100,4'b0001,4'b0000,4'b0000,4'b0000};
expected_data = {4'b0000,4'b0000,4'b0000,4'b0000,4'b0000};
@(next_data);

// Sprawdzenie operacji NAND i_oper = 0010
send_data = {4'b1010,4'b0101,4'b0010,4'b0000,4'b0000};
expected_data = {4'b0100,4'b0001,4'b0000,4'b0101,4'b0000};
@(next_data);

// Sprawdzenie operacji NOR i_oper = 0001
send_data = {4'b1100,4'b0011,4'b0001,4'b0000,4'b0000};
expected_data = {4'b1010,4'b0101,4'b0010,4'b1111,4'b0001};
@(next_data);

// Sprawdzenie operacji ONE_HOT -> NKB i_oper = 0111
send_data = {4'b1000,4'b0000,4'b0111,4'b0000,4'b0000};
expected_data = {4'b1100,4'b0011,4'b0001,4'b0000,4'b0000};
@(next_data);

// Sprawdzenie operacji bit shift left i_oper = 0011
send_data = {4'b0010,4'b0010,4'b0011,4'b0000,4'b0000};
expected_data = {4'b1000,4'b0000,4'b0111,4'b0011,4'b0000};
@(next_data);

// Sprawdzenie operacji arithemtic shift right i_oper = 0100
send_data = {4'b0010,4'b1000,4'b0100,4'b0000,4'b0000};
expected_data = {4'b0010,4'b0010,4'b0011,4'b1000,4'b0110};
@(next_data);

// Sprawdzenie operacji nkb -> gray i_oper = 0101
send_data = {4'b1010,4'b0000,4'b0101,4'b0000,4'b0000};
expected_data = {4'b0010,4'b1000,4'b0100,4'b0000,4'b0000};
@(next_data);

// Sprawdzenie operacji COUNT_ZEROS i_oper = 0110
send_data = {4'b0001,4'b0101,4'b0110,4'b0000,4'b0000};
expected_data = {4'b1010,4'b0000,4'b0101,4'b1111,4'b0001};
@(next_data);

// Sprawdzenie operacji sm -> u2 i_oper = 1011
send_data = {4'b1101,4'b0010,4'b1011,4'b0000,4'b0000};
expected_data = {4'b0001,4'b0101,4'b0110,4'b0101,4'b0000};
@(next_data);

// Sprawdzenie operacji crc4 i_oper = 1000
send_data = {4'b1101,4'b0010,4'b1000,4'b0000,4'b0000};
expected_data = {4'b1101,4'b0010,4'b1011,4'b1011,4'b0100};
@(next_data);

// Sprawdzenie operacji dodawania i_oper = 0000
send_data = {4'b0001,4'b0011,4'b0000,4'b0000,4'b0000};
expected_data = {4'b1101,4'b0010,4'b1000,4'b1010,4'b0000};
@(next_data);

// Sprawdzenie operacji dodawania i_oper = 0000
send_data = {4'b1011,4'b1100,4'b0000,4'b0000,4'b0000};
expected_data = {4'b0001,4'b0011,4'b0000,4'b0100,4'b0110};
@(next_data);

// Sprawdzenie operacji dodawania i_oper = 0000
send_data = {4'b0101,4'b0000,4'b0000,4'b0000,4'b0000};
expected_data = {4'b1011,4'b1100,4'b0000,4'b0111,4'b1100};
@(next_data);

// Sprawdzenie operacji dodawania i_oper = 0000
send_data = {4'b1011,4'b1100,4'b0000,4'b0000,4'b0000};
expected_data = {4'b0101,4'b0000,4'b0000,4'b0101,4'b0000};
@(next_data);

// Sprawdzenie operacji dodawania i_oper = 0000
send_data = {4'b1001,4'b0001,4'b0000,4'b0000,4'b0000};
expected_data = {4'b1011,4'b1100,4'b0000,4'b0111,4'b1100};
@(next_data);

// Sprawdzenie operacji NOR i_oper = 0001
send_data = {4'b0000,4'b1000,4'b0001,4'b0000,4'b0000};
expected_data = {4'b1001,4'b0001,4'b0000,4'b1010,4'b0000};
@(next_data);

// Sprawdzenie operacji NOR i_oper = 0001
send_data = {4'b0101,4'b0101,4'b0001,4'b0000,4'b0000};
expected_data = {4'b0000,4'b1000,4'b0001,4'b0111,4'b0100};
@(next_data);

// Sprawdzenie operacji NOR i_oper = 0001
send_data = {4'b1000,4'b0000,4'b0001,4'b0000,4'b0000};
expected_data = {4'b0101,4'b0101,4'b0001,4'b1010,4'b0000};
@(next_data);

// Sprawdzenie operacji NAND i_oper = 0010
send_data = {4'b0111,4'b0111,4'b0010,4'b0000,4'b0000};
expected_data = {4'b1000,4'b0000,4'b0001,4'b0111,4'b0100};
@(next_data);

// Sprawdzenie operacji NAND i_oper = 0010
send_data = {4'b0011,4'b1110,4'b0010,4'b0000,4'b0000};
expected_data = {4'b0111,4'b0111,4'b0010,4'b1000,4'b0110};
@(next_data);

// Sprawdzenie operacji NAND i_oper = 0010
send_data = {4'b1111,4'b0000,4'b0010,4'b0000,4'b0000};
expected_data = {4'b0011,4'b1110,4'b0010,4'b1101,4'b0100};
@(next_data);

// Sprawdzenie operacji NAND i_oper = 0010
send_data = {4'b1001,4'b0101,4'b0010,4'b0000,4'b0000};
expected_data = {4'b1111,4'b0000,4'b0010,4'b1111,4'b0001};
@(next_data);

// Sprawdzenie operacji ONE_HOT -> NKB i_oper = 011
send_data = {4'b1111,4'b0011,4'b0111,4'b0000,4'b0000};
expected_data = {4'b1001,4'b0101,4'b0010,4'b1110,4'b0100};
@(next_data);

// Sprawdzenie operacji ONE_HOT -> NKB i_oper = 011
send_data = {4'b1000,4'b1000,4'b0111,4'b0000,4'b0000};
expected_data = {4'b1111,4'b0011,4'b0111,4'b0011,4'b0000};
@(next_data);

// Sprawdzenie operacji ONE_HOT -> NKB i_oper = 011
send_data = {4'b1101,4'b1101,4'b0111,4'b0000,4'b0000};
expected_data = {4'b1000,4'b1000,4'b0111,4'b0011,4'b0000};
@(next_data);

// Sprawdzenie operacji ONE_HOT -> NKB i_oper = 011
send_data = {4'b0010,4'b0101,4'b0111,4'b0000,4'b0000};
expected_data = {4'b1101,4'b1101,4'b0111,4'b0011,4'b0000};
@(next_data);

// Sprawdzenie operacji bit shift left i_oper = 0011
send_data = {4'b1101,4'b1101,4'b0011,4'b0000,4'b0000};
expected_data = {4'b0010,4'b0101,4'b0111,4'b0001,4'b0110};
@(next_data);

// Sprawdzenie operacji bit shift left i_oper = 0011
send_data = {4'b1110,4'b0111,4'b0011,4'b0000,4'b0000};
expected_data = {4'b1101,4'b1101,4'b0011,4'b0000,4'b0000};
@(next_data);

// Sprawdzenie operacji bit shift left i_oper = 0011
send_data = {4'b0011,4'b0111,4'b0011,4'b0000,4'b0000};
expected_data = {4'b1110,4'b0111,4'b0011,4'b0000,4'b0000};
@(next_data);

// Sprawdzenie operacji bit shift left i_oper = 0011
send_data = {4'b0101,4'b1111,4'b0011,4'b0000,4'b0000};
expected_data = {4'b0011,4'b0111,4'b0011,4'b0000,4'b0000};
@(next_data);

// Sprawdzenie operacji arithemtic shift right i_oper = 0100
send_data = {4'b0010,4'b1001,4'b0100,4'b0000,4'b0000};
expected_data = {4'b0101,4'b1111,4'b0011,4'b0000,4'b0000};
@(next_data);

// Sprawdzenie operacji arithemtic shift right i_oper = 0100
send_data = {4'b0110,4'b1011,4'b0100,4'b0000,4'b0000};
expected_data = {4'b0010,4'b1001,4'b0100,4'b0000,4'b0000};
@(next_data);

// Sprawdzenie operacji arithemtic shift right i_oper = 0100
send_data = {4'b0000,4'b0110,4'b0100,4'b0000,4'b0000};
expected_data = {4'b0110,4'b1011,4'b0100,4'b0000,4'b0000};
@(next_data);

// Sprawdzenie operacji nkb -> gray i_oper = 0101
send_data = {4'b0110,4'b0101,4'b0101,4'b0000,4'b0000};
expected_data = {4'b0000,4'b0110,4'b0100,4'b0000,4'b0000};
@(next_data);

// Sprawdzenie operacji nkb -> gray i_oper = 0101
send_data = {4'b0011,4'b0010,4'b0101,4'b0000,4'b0000};
expected_data = {4'b0110,4'b0101,4'b0101,4'b0101,4'b0000};
@(next_data);

// Sprawdzenie operacji nkb -> gray i_oper = 0101
send_data = {4'b0011,4'b1100,4'b0101,4'b0000,4'b0000};
expected_data = {4'b0011,4'b0010,4'b0101,4'b0010,4'b0110};
@(next_data);


send_data = {4'b0111,4'b0010,4'b0110,4'b0000,4'b0000};
expected_data = {4'b0011,4'b1100,4'b0101,4'b0010,4'b0110};
@(next_data);

// Sprawdzenie operacji COUNT_ZEROS i_oper = 0110
send_data = {4'b1111,4'b0000,4'b0110,4'b0000,4'b0000};
expected_data = {4'b0111,4'b0010,4'b0110,4'b0100,4'b0110};
@(next_data);

// Sprawdzenie operacji COUNT_ZEROS i_oper = 0110
send_data = {4'b1101,4'b0010,4'b0110,4'b0000,4'b0000};
expected_data = {4'b1111,4'b0000,4'b0110,4'b0100,4'b0110};
@(next_data);

// Sprawdzenie operacji sm -> u2 i_oper = 1011
send_data = {4'b0001,4'b1110,4'b1011,4'b0000,4'b0000};
expected_data = {4'b1101,4'b0010,4'b0110,4'b0100,4'b0110};
@(next_data);

// Sprawdzenie operacji sm -> u2 i_oper = 1011
send_data = {4'b1001,4'b1001,4'b1011,4'b0000,4'b0000};
expected_data = {4'b0001,4'b1110,4'b1011,4'b0001,4'b0110};
@(next_data);

// Sprawdzenie operacji sm -> u2 i_oper = 1011
send_data = {4'b0100,4'b1011,4'b1011,4'b0000,4'b0000};
expected_data = {4'b1001,4'b1001,4'b1011,4'b1111,4'b0001};
@(next_data);

// Sprawdzenie operacji crc4 i_oper = 1000
send_data = {4'b1000,4'b1100,4'b1000,4'b0000,4'b0000};
expected_data = {4'b0100,4'b1011,4'b1011,4'b0100,4'b0110};
@(next_data);

// Sprawdzenie operacji crc4 i_oper = 1000
send_data = {4'b0111,4'b1001,4'b1000,4'b0000,4'b0000};
expected_data = {4'b1000,4'b1100,4'b1000,4'b0000,4'b0000};
@(next_data);

// Sprawdzenie operacji crc4 i_oper = 1000
send_data = {4'b0001,4'b1111,4'b1000,4'b0000,4'b0001};
expected_data = {4'b0111,4'b1001,4'b1000,4'b1111,4'b0001};
@(next_data);

// Sprawdzenie operacji DODAWNIA i_oper = 0000
send_data = {4'b1101,4'b1110,4'b0000,4'b0000,4'b0000};
expected_data = {4'b0001,4'b1111,4'b1000,4'b1111,4'b0001};
@(next_data);

// Sprawdzenie operacji crc4 i_oper = 1000
send_data = {4'b1011,4'b1010,4'b1000,4'b0000,4'b0000};
expected_data = {4'b1101,4'b1110,4'b0000,4'b1011,4'b0100};
@(next_data);

// Sprawdzenie operacji DODAWNIA i_oper = 0000
send_data = {4'b0000,4'b0000,4'b0000,4'b0000,4'b0000};
expected_data = {4'b1011,4'b1010,4'b1000,4'b1110,4'b0100};
@(next_data);