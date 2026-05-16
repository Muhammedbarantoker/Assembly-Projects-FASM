# ✖️ Assembly Arithmetic: Factorial Loop

An advanced mathematical module in x86_64 Assembly designed to calculate the factorial of a user-defined single-digit number iteratively using signed multiplication.

## 🧠 Technical Workflow

1. **Input Acquisition:** Triggers `sys_read` (RAX 0) to capture a starting digit from standard input into `input_buf`.
2. **Value Sanitization:** Extracts the character, normalizes it by subtracting 48 (ASCII conversion), and zero-extends the result into `r14`.
3. **Multiplication Loop:**
* **Initialization:** Sets the accumulator register `r15` to 1 (the multiplicative identity).
* **Loop Process:** Checks if the counter `r14` has hit zero. If not, it executes `imul r15, r14`, multiplying the running total by the counter.
* **Decrement:** Reduces `r14` by 1 (`dec r14`) and branches back to re-evaluate the loop.


4. **Display Presentation:** Moves the final factorial result into `rax` and calls the `print_two_digits` subroutine for numeric rendering and layout styling.
5. **System Exit:** Terminates smoothly using `sys_exit` (RAX 60) with status code 0.

## 🛠 Features

* **Multiplicative Identity Setup:** Correctly uses 1 as the baseline for multiplication to prevent zero-product issues.
* **Hardware Multiplication (`imul`):** Leverages x86_64 hardware-level integer multiplication for fast factorial accumulation.
* **Modular Code Structure:** Isolates standard display logic from core mathematical calculations for clean debugging.

## 🚀 How to Run

### 1. Assemble

fasm 35_factorial_loop.asm

### 2. Set Permissions

chmod +x 35_factorial_loop

### 3. Run

./35_factorial_loop

---

*Baran was here. Scaling up the processing power.*
