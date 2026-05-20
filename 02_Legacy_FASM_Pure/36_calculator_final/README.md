# 🧮 x86_64 Assembly Interactive Calculator
This project is an interactive Command-Line Interface (CLI) calculator written completely in pure **x86_64 Assembly** using **FASM (Flat Assembler)**. Operating entirely via Linux kernel syscalls without relying on the C standard library (libc), it features custom numeric conversion algorithms and defensive error handling.
## 🧠 Technical Workflow
 1. **Menu Rendering & Input:** Prints an operation menu using sys_write (RAX 1) and captures user choice using sys_read (RAX 0).
 2. **Numeric Parsing (atoi):** Takes ASCII inputs for two numbers, processes characters sequentially by subtracting 48, multiplies the tracking register by 10 (imul rax, 10), and converts strings to raw 64-bit integers.
 3. **Execution Routing:** Branches the execution flow using conditional jumps (je) based on the selected operation ASCII code.
 4. **Defensive Math Logic:** Performs math operations via native ALU instructions. If division is selected, it pre-validates the divisor register to block runtime panics.
 5. **Output Processing (itoa):** Implements a manual base-10 conversion utilizing a 20-byte local buffer to transform the raw binary results back into displayable ASCII strings.
## 🛠 Features
 * **Core Math Operations:** Full support for basic integer Arithmetic: Addition (add), Subtraction (sub), Signed Multiplication (imul), and Unsigned Division (div).
 * **Defensive Hardware Validation:** Uses a test r13, r13 validation layer. If a division by zero is detected, it skips the risky div instruction, prints a graceful error message, and routes execution safely back to the menu loop.
 * **Custom I/O Subroutines:** Handcrafted string-to-integer (atoi) and integer-to-string (itoa) algorithms that manage buffers manually at the register level.
## 🛡️ Key Safety Update: Zero Division Protection
In low-level environments, executing a division instruction while the divisor register contains a zero value triggers a catastrophic hardware exception (SIGFPE), causing an immediate program crash. To ensure system stability, this implementation runs a bitwise verification layer right before division:
```assembly
do_div:
    test r13, r13           ; Bitwise check if the divisor (R13) is zero
    jz print_div_error      ; If flags register detects zero, branch to handler
    mov rax, r12
    xor rdx, rdx            ; Clear high-order RDX register to prevent overflow
    div r13                 ; Safe to execute division

```
## 🚀 How to Run
### 1. Prerequisites
You need the **Flat Assembler (FASM)** installed on your Linux machine.
 * **Debian / Ubuntu / MX Linux:** sudo apt update && sudo apt install fasm
 * **Arch Linux:** sudo pacman -S fasm
### 2. Compile and Execute
Open your terminal in the directory containing the source file and execute:
```bash
# Assemble the source file into an ELF64 executable
fasm 36_ccalculato_final.asm

# Grant execution permissions to the compiled binary
chmod +x 36_calculator_final

# Launch the interactive calculator loop
./36_calculator_final

```
*Baran was here.*
