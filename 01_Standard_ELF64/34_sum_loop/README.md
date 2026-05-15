# ➕ Assembly Arithmetic: Summation Loop

A high-level arithmetic implementation in x86_64 Assembly that calculates the sum of all natural numbers from a user-defined starting point down to 1 (e.g., if input is 5, result is 15).

## 🧠 Technical Workflow

1. **Initial Capture:** Standard `sys_read` (RAX 0) captures a single-digit starting number.
2. **ASCII Normalization:** Subtracts 48 from the input byte and zero-extends it into `r14` for processing.
3. **Accumulation Logic:**
* **Initialization:** Clears `r15` to act as the total sum accumulator.
* **The Loop:** Compares `r14` to zero. If not zero, it adds the current value of `r14` to `r15` (`add r15, r14`).
* **Decrement:** Reduces `r14` by 1 and jumps back to the start of the loop.


4. **Final Output:** Once the loop terminates, the total stored in `r15` is passed to the `print_two_digits` routine for ASCII formatting and terminal display.
5. **Exit:** Clean termination via `sys_exit` (RAX 60).

## 🛠 Features

* **Accumulator Pattern:** Demonstrates how to use registers to store and update running totals.
* **Mathematical Iteration:** Implements the summation formula ($\sum_{i=1}^{n} i$) through manual assembly cycles.
* **Efficient Register Usage:** Uses `r14` as a counter and `r15` as the storage for the final result.

## 🚀 How to Run

### 1. Assemble

fasm 34_sum_loop.asm

### 2. Set Permissions

chmod +x 34_sum_loop

### 3. Run

./34_sum_loop

---

*Baran was here. Summing up the cycles.*
