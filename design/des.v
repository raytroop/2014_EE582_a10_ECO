
module des ( in_1, out_1);
  input in_1;
  output out_1;
  wire n1;

  BUF_X1 UDriver ( .A(in_1), .Z(n1) );
  BUF_X1 USink ( .A(n1), .Z(out_1) );

endmodule

