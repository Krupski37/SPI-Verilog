rst<=0;
# `RSTTIME;
rst<=1;
send_request = 1;
slave_select = 2;
//Dodawanie (i_oper = 1)
send_data = {4'b1000,4'b0111,4'b0001,4'b0000,4'b0000};
expected_data = {4'b0000,4'b0000,4'b0000,4'b0000,4'b0000};
@(next_data);

send_data = {4'b0011,4'b1101,4'b0001,4'b0000,4'b0000};
expected_data = {4'b1000,4'b0111,4'b0001,4'b1111,4'b0001};
@(next_data);

send_data = {4'b1100,4'b0101,4'b0001,4'b0000,4'b0000};
expected_data = {4'b0011,4'b1101,4'b0001,4'b0000,4'b1001};
@(next_data);

send_data = {4'b1110,4'b0111,4'b0001,4'b0000,4'b0000};
expected_data = {4'b1100,4'b0101,4'b0001,4'b0001,4'b0100};
@(next_data);

//Xor - suma wyłaczna logiczna argumentów (i_oper = 2)
send_data = {4'b0110,4'b1100,4'b0010,4'b0000,4'b0000};
expected_data = {4'b1110,4'b0111,4'b0001,4'b0101,4'b0001};
@(next_data);

send_data = {4'b1110,4'b0111,4'b0010,4'b0000,4'b0000};
expected_data = {4'b0110,4'b1100,4'b0010,4'b1010,4'b0001};
@(next_data);

send_data = {4'b0110,4'b0011,4'b0010,4'b0000,4'b0000};
expected_data = {4'b1110,4'b0111,4'b0010,4'b1001,4'b0001};
@(next_data);

send_data = {4'b0011,4'b1111,4'b0010,4'b0000,4'b0000};
expected_data = {4'b0110,4'b0011,4'b0010,4'b0101,4'b0001};
@(next_data);

//3 Nand - zanegowany iloczyn logiczny argumentów (i_oper = 3)
send_data = {4'b0110,4'b1100,4'b0011,4'b0000,4'b0000};
expected_data = {4'b0011,4'b1111,4'b0010,4'b1100,4'b0001};
@(next_data);

send_data = {4'b1110,4'b0111,4'b0011,4'b0000,4'b0000};
expected_data = {4'b0110,4'b1100,4'b0011,4'b1011,4'b0110};
@(next_data);

send_data = {4'b0110,4'b0011,4'b0011,4'b0000,4'b0000};
expected_data = {4'b1110,4'b0111,4'b0011,4'b1001,4'b0001};
@(next_data);

send_data = {4'b0011,4'b1111,4'b0011,4'b0000,4'b0000};
expected_data = {4'b0110,4'b0011,4'b0011,4'b1101,4'b0110};
@(next_data);

//4. Logiczne przesuniecie argumentów w prawo (i_oper = 4)
send_data = {4'b0110,4'b1100,4'b0100,4'b0000,4'b0000};
expected_data = {4'b0011,4'b1111,4'b0011,4'b1100,4'b0001};
@(next_data);

send_data = {4'b1110,4'b0111,4'b0100,4'b0000,4'b0000};
expected_data = {4'b0110,4'b1100,4'b0100,4'b0011,4'b0001};
@(next_data);

send_data = {4'b0110,4'b0011,4'b0100,4'b0000,4'b0000};
expected_data = {4'b1110,4'b0111,4'b0100,4'b0111,4'b0110};
@(next_data);

send_data = {4'b0011,4'b1111,4'b0100,4'b0000,4'b0000};
expected_data = {4'b0110,4'b0011,4'b0100,4'b0011,4'b0001};
@(next_data);

//5. Arytmetyczne przesuniecie argumentów w lewo (i_oper = 5)
send_data = {4'b0110,4'b1100,4'b0101,4'b0000,4'b0000};
expected_data = {4'b0011,4'b1111,4'b0100,4'b0001,4'b0100};
@(next_data);

send_data = {4'b1110,4'b0111,4'b0101,4'b0000,4'b0000};
expected_data = {4'b0110,4'b1100,4'b0101,4'b1100,4'b0001};
@(next_data);

send_data = {4'b0110,4'b0011,4'b0101,4'b0000,4'b0000};
expected_data = {4'b1110,4'b0111,4'b0101,4'b1100,4'b0001};
@(next_data);

send_data = {4'b0011,4'b1111,4'b0101,4'b0000,4'b0000};
expected_data = {4'b0110,4'b0011,4'b0101,4'b1100,4'b0001};
@(next_data);

//6. Konwersja danej wejsciowej z kodu U2 na kod GRAY (i_oper = 6)
send_data = {4'b0110,4'b1100,4'b0110,4'b0000,4'b0000};
expected_data = {4'b0011,4'b1111,4'b0101,4'b0110,4'b0001};
@(next_data);

send_data = {4'b1110,4'b0111,4'b0110,4'b0000,4'b0000};
expected_data = {4'b0110,4'b1100,4'b0110,4'b0101,4'b0001};;
@(next_data);

send_data = {4'b0110,4'b0011,4'b0110,4'b0000,4'b0000};
expected_data = {4'b1110,4'b0111,4'b0110,4'b1001,4'b0001};
@(next_data);

send_data = {4'b0011,4'b1111,4'b0110,4'b0000,4'b0000};
expected_data = {4'b0110,4'b0011,4'b0110,4'b0101,4'b0001};
@(next_data);

//7. Konwersje danej wejsciowej z kodu U1 na kod U2 (i_oper = 7)
send_data = {4'b1110,4'b0000,4'b0111,4'b0000,4'b0000};
expected_data = {4'b0011,4'b1111,4'b0110,4'b0010,4'b0100};
@(next_data);

send_data = {4'b1101,4'b0000,4'b0111,4'b0000,4'b0000};
expected_data = {4'b1110,4'b0000,4'b0111,4'b1111,4'b0001};
@(next_data);

send_data = {4'b1100,4'b0000,4'b0111,4'b0000,4'b0000};
expected_data = {4'b1101,4'b0000,4'b0111,4'b1110,4'b0110};
@(next_data);

send_data = {4'b1011,4'b0000,4'b0111,4'b0000,4'b0000};
expected_data = {4'b1100,4'b0000,4'b0111,4'b1101,4'b0110};
@(next_data);

//8. Zliczanie sumarycznej liczby jedynek w obu argumentach wejsciowych (i_oper = 8)
send_data = {4'b0110,4'b1100,4'b1000,4'b0000,4'b0000};
expected_data = {4'b1011,4'b0000,4'b0111,4'b1100,4'b0001};
@(next_data);

send_data = {4'b1110,4'b0111,4'b1000,4'b0000,4'b0000};
expected_data = {4'b0110,4'b1100,4'b1000,4'b0100,4'b0100};
@(next_data);

send_data = {4'b0110,4'b0011,4'b1000,4'b0000,4'b0000};
expected_data = {4'b1110,4'b0111,4'b1000,4'b0110,4'b0001};
@(next_data);

send_data = {4'b0011,4'b1111,4'b1000,4'b0000,4'b0000};
expected_data = {4'b0110,4'b0011,4'b1000,4'b0100,4'b0100};
@(next_data);

//9. koder termometrowy (i_oper = 9)
send_data = {4'b0001,4'b0000,4'b1001,4'b0000,4'b0000};
expected_data = {4'b0011,4'b1111,4'b1000,4'b0110,4'b0001};
@(next_data);

send_data = {4'b0010,4'b0000,4'b1001,4'b0000,4'b0000};
expected_data = {4'b0001,4'b0000,4'b1001,4'b0001,4'b0100};
@(next_data);

send_data = {4'b0011,4'b0000,4'b1001,4'b0000,4'b0000};
expected_data = {4'b0010,4'b0000,4'b1001,4'b0011,4'b0001};
@(next_data);

send_data = {4'b0100,4'b0000,4'b1001,4'b0000,4'b0000};
expected_data = {4'b0011,4'b0000,4'b1001,4'b0111,4'b0110};
@(next_data);

//10. koder n na 1/onehot (i_oper = 10)
send_data = {4'b0110,4'b0000,4'b1010,4'b0000,4'b0000};
expected_data = {4'b0100,4'b0000,4'b1001,4'b1111,4'b0001};
@(next_data);

send_data = {4'b1110,4'b0000,4'b1010,4'b0000,4'b0000};
expected_data = {4'b0110,4'b0000,4'b1010,4'b0000,4'b1001};
@(next_data);

send_data = {4'b0011,4'b0000,4'b1010,4'b0000,4'b0000};
expected_data = {4'b1110,4'b0000,4'b1010,4'b0000,4'b1001};
@(next_data);

send_data = {4'b0000,4'b0000,4'b1010,4'b0000,4'b0000};
expected_data = {4'b0011,4'b0000,4'b1010,4'b1000,4'b0100};
@(next_data);

//11. CRC-3 sprawdzenie (i_oper = 11)
send_data = {4'b0110,4'b0010,4'b1011,4'b0000,4'b0000};
expected_data = {4'b0000,4'b0000,4'b1010,4'b0001,4'b0100};
@(next_data);

send_data = {4'b1110,4'b0010,4'b1011,4'b0000,4'b0000};
expected_data = {4'b0110,4'b0010,4'b1011,4'b0000,4'b1001};
@(next_data);

send_data = {4'b0111,4'b0011,4'b1011,4'b0000,4'b0000};
expected_data = {4'b1110,4'b0010,4'b1011,4'b0000,4'b1001};
@(next_data);

send_data = {4'b1100,4'b0000,4'b1011,4'b0000,4'b0000};
expected_data = {4'b0111,4'b0011,4'b1011,4'b0000,4'b1001};
@(next_data);

//Crc4 wyznaczenie (i_oper = 12 )
send_data = {4'b1000,4'b0000,4'b1100,4'b0000,4'b0000};
expected_data = {4'b1100,4'b0000,4'b1011,4'b0000,4'b1001};
@(next_data);

send_data = {4'b0110,4'b0000,4'b1100,4'b0000,4'b0000};
expected_data = {4'b1000,4'b0000,4'b1100,4'b0000,4'b1001};
@(next_data);

send_data = {4'b1100,4'b0000,4'b1100,4'b0000,4'b0000};
expected_data = {4'b0110,4'b0000,4'b1100,4'b0010,4'b0100};
@(next_data);

send_data = {4'b1110,4'b000,4'b1100,4'b0000,4'b0000};
expected_data = {4'b1100,4'b0000,4'b1100,4'b0100,4'b0100};
@(next_data);