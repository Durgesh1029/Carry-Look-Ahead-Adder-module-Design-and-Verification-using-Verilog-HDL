`timescale 1ns/1ps

module tb_cla;
  reg  [3:0] a, b;
  reg        c0;
  wire [3:0] s;
  wire       cout;

  // Instantiate the Carry Lookahead Adder
  cla uut (
    .a(a),
    .b(b),
    .c0(c0),
    .cout(cout),
    .s(s)
  );

  initial begin
    // Monitor signals in console
    $monitor("Time=%0t | a=%b (%0d), b=%b (%0d), c0=%b | sum=%b (%0d), cout=%b", 
             $time, a, a, b, b, c0, s, s, cout);

    // Test Case 1: 0 + 0 + 0 = 0
    a = 4'b0000; b = 4'b0000; c0 = 1'b0; #10;

    // Test Case 2: 5 + 3 + 0 = 8
    a = 4'b0101; b = 4'b0011; c0 = 1'b0; #10;

    // Test Case 3: 7 + 8 + 1 = 16 (Cout = 1, Sum = 0)
    a = 4'b0111; b = 4'b1000; c0 = 1'b1; #10;

    // Test Case 4: 15 + 15 + 1 = 31 (Cout = 1, Sum = 15)
    a = 4'b1111; b = 4'b1111; c0 = 1'b1; #10;

    $finish;
  end
endmodule
