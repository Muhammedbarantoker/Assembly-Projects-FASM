invert Assembly Logic: Bitwise NOT Operator

The final piece of the logical operators series. This project implements the **Bitwise NOT** (inversion) logic. It takes a single-digit input, flips its bits, and masks the result to 4 bits for a clean output.

## 🧠 Logic Flow
1. **Input:** Captures a digit via `sys_read` (RAX 0).
2. **ASCII to Int:** Normalizes the input by subtracting 48.
3. **The NOT Operation:** - Executes `not r14` to flip all bits.
   - Executes `and r14, 15` to keep only the last 4 bits (masking), preventing unwanted high-bit noise.
4. **Output:** Converts the inverted value back to ASCII and displays it using the `print_two_digits` routine.

## 🛠 Features
* **Bitwise Inversion:** Demonstrates the `NOT` instruction at the CPU level.
* **Bit Masking:** Shows how to use `AND` to limit result ranges.
* **Pure Assembly:** No external libraries, just raw Linux syscalls.

## 🚀 How to Run

### 1. Compile
```bash
fasm 31_logical_not.asm
