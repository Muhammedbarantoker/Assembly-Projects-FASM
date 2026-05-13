# ⚖️ Assembly Logic: Bitwise XOR Operator

A specialized tool within the logical operators series that implements the **Bitwise XOR** (Exclusive OR) operation. The program takes İİtwo single-digit inputs, performs the XOR calculation at the bit level, and displays the result.

## 🧠 Technical Workflow

1. **Dual Input:** Performs two consecutive `sys_read` (RAX 0) calls to capture operands into separate buffers.
2. **ASCII Normalization:** Converts both inputs from ASCII characters to their numeric integer values.
3. **The XOR Operation:** Executes the `xor r14, r15` instruction. This flips bits only where the inputs differ, a fundamental operation for toggling and basic encryption logic.
4. **Output Routine:** Utilizes a custom `print_two_digits` function to handle the division and ASCII conversion needed for the final display.

## 🛠 Features

* **Exclusive Logic:** Demonstrates how XOR identifies differences between bit patterns.
* **Multi-Input Handling:** Shows sequential buffer management for multiple user inputs.
* **Register Efficiency:** Uses `r14` and `r15` to store operand values throughout the execution.

## 🚀 How to Run

### 1. Compile

fasm 32_logical_xor.asm

### 2. Execute

./32_logical_xor

---

*Baran was here. Logic defined by difference.*
