# ⏳ Assembly Control Flow: Countdown Loop

A dynamic x86_64 Assembly program that implements a countdown mechanism using iterative loops. It captures a starting digit from the user and counts down to 1, displaying each step on the terminal.

## 🧠 Technical Workflow

1. **User Input:** Uses `sys_read` (RAX 0) to capture a starting value into `input_buf1`.
2. **ASCII to Integer:** Normalizes the input by subtracting 48, then stores the starting counter in `r14`.
3. **Loop Logic:**
* **Comparison:** Checks if `r14` is 0 using `cmp`.
* **Conditional Jump:** Uses `je` to exit the loop when the countdown is finished.
* **Iteration:** Decrements `r14` with the `dec` instruction and jumps back to the start of the loop.


4. **Formatted Output:** Calls a custom `print_two_digits` routine to handle ASCII conversion and display each number followed by a newline.
5. **System Exit:** Terminates the process cleanly once the counter reaches zero.

## 🛠 Features

* **Iterative Logic:** Demonstrates the fundamental use of labels and jumps for loop construction.
* **Register Management:** Efficiently tracks the state of the countdown within `r14` and uses `r12` as a temporary bridge during syscalls.
* **Dynamic Terminal Output:** Provides real-time feedback of the countdown process.

## 🚀 How to Run

### 1. Assemble

fasm 33_countdown_loop.asm

### 2. Run

./33_countdown_loop

---

*Baran was here. Counting down the cycles.*
