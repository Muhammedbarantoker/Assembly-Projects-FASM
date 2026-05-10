 🦾 Assembly Logic: Bitwise OR Operator

Part of my low-level logic series. This project focuses on the **Bitwise OR** operation. It takes two single-digit inputs, processes them through the CPU's logic unit, and outputs the inclusive result.

## 🧠 Logic Flow
1. **Input Stage:** Captures two numeric characters via `sys_read` (RAX 0).
2. **Normalization:** Converts ASCII characters to raw integers (subtracting 48).
3. **The OR Operation:** Executes `or r14, r15`. This sets a bit to 1 if *either* of the corresponding bits in the operands is 1.
4. **Output Stage:** Converts the numerical result back to ASCII and prints it using the `print_two_digits` routine via `sys_write` (RAX 1).

## 🛠 Features
* **Bit-Level Manipulation:** Direct use of the `OR` instruction.
* **No Standard Library:** Built entirely with Linux syscalls.
* **Modular Printing:** Includes a reusable two-digit output function.

## 🚀 How to Run

### 1. Prerequisites
Ensure you have the **Flat Assembler (FASM)** installed.

### 2. Compile and Execute
```bash
# Assemble the source code
fasm 30_logical_or.asm

# Run the program
./30_logical_or
