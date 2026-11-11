# 4-Bit Carry Lookahead Adder (CLA) in Verilog HDL

A high-speed 4-bit Carry Lookahead Adder (CLA) designed in Verilog HDL and verified/synthesized using **Xilinx Vivado** and **Yosys** (SkyWater 130nm PDK).

---

## 📌 Overview

Arithmetic adders are foundational building blocks in Digital Signal Processors (DSPs), ALUs, and microprocessors. While standard **Ripple Carry Adders (RCA)** suffer from sequential carry propagation delay *O(N)*, the **Carry Lookahead Adder (CLA)** evaluates all carry bits in parallel with *O(1)* gate depth by computing Generate (*G*) and Propagate (*P*) logic directly from primary inputs.

This repository contains:
* Complete, synthesizable Verilog RTL for a 4-bit CLA.
* Testbench for complete functional verification across edge cases.
* Architectural theory and gate-level synthesis analysis.

---

## 🔬 Architecture & Theory

In a standard full adder, the carry output C_(i+1) is computed sequentially:

C_(i+1) = A_i · B_i + (A_i ⊕ B_i) · C_i

To eliminate the ripple delay, we define:
* **Generate Signal (G_i):** G_i = A_i · B_i *(Carry is generated regardless of C_in)*
* **Propagate Signal (P_i):** P_i = A_i ⊕ B_i *(Carry is passed through if C_in = 1)*

Using G_i and P_i, the carry recurrence relation becomes:

C_(i+1) = G_i + P_i · C_i

### Unrolled Carry Equations (Parallel Carry Generator)

By recursively expanding the carry equations in terms of initial carry-in (C_0), all carry bits are calculated in parallel within **2 gate delays**:

* C_1 = G_0 + P_0 · C_0
* C_2 = G_1 + P_1 · G_0 + P_1 · P_0 · C_0
* C_3 = G_2 + P_2 · G_1 + P_2 · P_1 · G_0 + P_2 · P_1 · P_0 · C_0
* C_out (C_4) = G_3 + P_3 · G_2 + P_3 · P_2 · G_1 + P_3 · P_2 · P_1 · G_0 + P_3 · P_2 · P_1 · P_0 · C_0

### Sum Equations
The sum for each bit is computed as:

S_i = P_i ⊕ C_i

---

## 📁 Repository Structure

```text
├── rtl/
│   └── cla.v           # 4-bit Carry Lookahead Adder module
├── tb/
│   └── tb_cla.v        # Testbench with $monitor and corner cases
├── docs/
│   └── schematic.png   # Synthesized RTL block diagram
└── README.md           # Project documentation

## 👤 Author

Designed & Maintained by **[Durgesh B. Dongre](https://home.iitk.ac.in/~durgesh24/)** (M.Tech in Electrical Engineering, IIT Kanpur) — Connect on [GitHub](https://github.com/durgesh1029) or [LinkedIn](https://www.linkedin.com/).
