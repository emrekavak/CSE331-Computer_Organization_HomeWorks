module full_adder(sum1, carry_out, a10, b10, carry_in);
input a10, b10, carry_in;
output sum1, carry_out;
wire temp_sum, first_carry_out, second_carry_out;

half_adder first_sum(temp_sum, first_carry_out, a10, b10);
half_adder second_sum(sum1, second_carry_out, temp_sum, carry_in);

or final_carry_out(carry_out, second_carry_out, first_carry_out);

endmodule