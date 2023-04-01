module exe_unit (
    i_oper, //sygnal operacyjny
    i_argA, // wejscie a
    i_argB, // wejscie b
    o_result, // wyjscie jednoski exe_unit
    o_OF, //wyjscie sygnalizujace flage of
    o_BF, //wyjscie sygnalizujace flage bf
    o_PF, //wyjscie sygnalizujace flage pf
	o_VF // wyjscie sygnalizujace flage vf
);
parameter N = 4;
parameter M = 4; //liczba bitow wejsci i wyjscia
localparam LEN = $clog2(M);
input logic [N-1:0] i_oper;
input logic [M-1:0] i_argA, i_argB;

output logic [M-1:0] o_result;
output logic [0:0] o_OF;
output logic [0:0] o_BF;
output logic [0:0] o_PF;
output logic [0:0] o_VF;

// Sygnaly pomocnicze
integer counter;
// Sygnaly wewnetrzne
logic [M-1:0] nkb_code; //zmienna przechowujaca wynik modulu onehot2nkb_encoder
logic [M-1:0] gray_code; //zmienna przechowujaca wynik modulu gray_koder2
logic [M-1:0] number_of_zeros; //zmienna przechowujaca wynik modulu count_zeros
logic [M-1:0] crc_code; //zmienna przechowujaca wynik crc_coder
logic [M-1:0] crc_3; //zmienna przechowujaca wynik modulu crc_eval
// logic signed [BITS-1:0] pri_dec_result; //zmienna przechowujaca wynik modulu priority_decoder
logic [M-1:0] u2_code; // zmienna przechowujaca wynik modulu sm_to_u2
logic [M-1:0] sum; // zmienna przechowujaca wynik modulu adder
logic [0:0] overflow; //zmienna pomocnicza do okreslenia flagi VF
logic [0:0] overflow_2;
integer i;
// instancjonowanie poszczegolnych modulow
onehot2nkb_encoder #(.LEN(M))
					onehot
						(.i_onehot(i_argA), .o_nkb(nkb_code));

gray_koder2 #(.LEN(M))
					gray
						(.i_data(i_argA), .o_gray(gray_code));

count_zeros #(.LEN(M))
					zeros
						(.i_a(i_argA), .i_b(i_argB), .o_zeros(number_of_zeros), .o_carry(overflow_2));

crc_coder #(.WCODE(M), .WPOLY(M+1))
					crc4
						(.i_data(i_argA), .i_poly({1, i_argB[3], i_argB[2], i_argB[1], i_argB[0]}), .i_crc(4'b0000), .o_crc(crc_code));

crc_eval #(.WCODE(M), .WPOLY(M))
					crc3
						(.i_data(i_argA), .i_crc(3'b111), .i_poly({i_argB[3], i_argB[2], i_argB[1], i_argB[0]}), .o_crc(crc_3));

sm_to_u2 #(.LEN(M))
					u2sm
						(.i_a(i_argA), .o_u2code(u2_code));

adder #(.LEN(M))
					add
						(.i_a(i_argA), .i_b(i_argB), .o_sum(sum), .o_carry(overflow));
						

always @(*) begin : main // jednostka sterujaca
	{o_OF, o_BF, o_PF, o_VF} = '0;
	counter = 0;
    case (i_oper)
        4'b0000: begin
					o_result = sum;
					o_VF = overflow;
				 end
        4'b0001: o_result = i_argA ~| i_argB;
        4'b0010: o_result = ~(i_argA & i_argB);
        4'b0011: o_result = i_argA << i_argB;
        4'b0100: o_result = i_argA >>> i_argB;
        4'b0101: o_result = gray_code;
        4'b0110: begin
					o_result = number_of_zeros;
					o_VF = overflow_2;
				 end	
        4'b0111: o_result = nkb_code;
		4'b1000: o_result = crc_code;
		4'b1001: o_result = crc_3;
	   	4'b1011: o_result = u2_code;
        default: o_result = '1;
    endcase

	if(o_result == '1) begin //sprawdzanie flagi OF
		o_OF = 1'b1;
	end
///////////////////////////////////
	for(i=0; i<M; i=i+1)begin // sprawdznie flagi BF
		if(o_result[i] == 1)begin
			counter = counter + 1;
		end
	end
	if(counter == 1)begin
		o_BF = 1'b1;
	end
/////////////////////////////// sprawdzanie flagi PF
	counter = 0;
	for(i=0; i<M; i=i+1)begin
		if(o_result[i] == 1)begin
			counter = counter + 1;
		end
	end
	if(counter % 2 == 1)begin
		o_PF = 1'b1;
	end


end


endmodule
