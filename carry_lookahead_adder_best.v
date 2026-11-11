module carry_lookahead_adder(
    input [3:0] A,         // 4-bit input A
    input [3:0] B,         // 4-bit input B
    input cin,             // Carry-in input
    output [3:0] Sum,      // 4-bit sum output
    output cout            // Carry-out output
);

    // Internal signals for carry generation
    wire [3:0] p;          // Propagate signals
    wire [3:0] g;          // Generate signals
    wire [3:0] c;          // Carry signals

    // Generate and propagate signals
    assign p = A ^ B;      // Propagate signal (P[i] = A[i] ^ B[i])
    assign g = A & B;      // Generate signal (G[i] = A[i] & B[i])

    // --- TRUE CLA CODE (Unrolled / Fully Parallel) ---
assign c[0] = cin;     // Initial carry-in
assign c[1] = g[0] | (p[0] & c[0]);
assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]); // Fully expanded
assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c[0]);
assign cout = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & c[0]);
// Sum calculation
assign Sum = p ^ c;

endmodule
