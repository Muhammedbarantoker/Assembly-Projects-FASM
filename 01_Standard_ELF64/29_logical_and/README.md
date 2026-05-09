 🤖 Assembly Logic: Bitwise AND Operator

This project demonstrates the fundamental **Bitwise AND** operation using **x86_64 Assembly**. It takes two single-digit numeric inputs from the user, performs a logical `AND` at the binary level, and prints the result.

## 🧠 Logic Flow
1. **Input:** Receives two digits from `STDIN` (keyboard) using `sys_read` (RAX 0).
2. **ASCII to Int:** Converts the characters to integers by subtracting 48 (ASCII '0').
3. **Bitwise AND:** Executes the `and r14, r15` instruction to find the logical intersection of bits.
4. **Display:** Uses a custom `print_two_digits` routine to convert the result back to ASCII and print it via `sys_write` (RAX 1).

## 🛠 Features
* **Raw Syscalls:** Direct communication with the Linux kernel for I/O.
* **Manual Conversion:** Hand-written ASCII/Integer conversion logic.
* **Low-Level Logic:** Explores how CPU flags and bitwise operations work at the machine level.

## 🚀 How to Run

### 1. Prerequisites
Ensure you have the **Flat Assembler (FASM)** installed on your Linux system.

### 2. Compile and Execute
Open your terminal in the project folder and run:

```bash
# Compile the source code
fasm logic_and.asm

# Run the program
./logic_and
