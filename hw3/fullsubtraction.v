module fullsubtraction(sum0, barrowout,q, w, barrow);
input w, q, barrow;
output sum0,barrowout;
wire temp_sum, first_B0, second_B0,B0;

halfsubtraction first_sub(temp_sum, first_B0, q, w);
halfsubtraction second_sub(sum0, second_B0, temp_sum, barrow);

or final_carry_out(barrowout, second_B0, first_B0);

endmodule