module half_adder(sum, carry_out, X, Y);
input X, Y;
output sum, carry_out;

xor sum_of_digits(sum, X, Y);
and carry_of_sum(carry_out, X, Y);

endmodule