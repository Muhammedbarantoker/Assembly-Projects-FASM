🔤 Core Utilities: Dynamic String Length Calculator

A foundational system utility written in x86_64 Assembly that dynamically calculates the length of a null-terminated string at runtime without relying on external high-level standard library functions.

🧠 Technical Workflow

1. Pointer Initialization: Loads the source memory address of the target string into rsi and clears the counter register (rcx) to zero.
2. Null-Terminator Scanning Loop:

* Fetches the character at the current base-plus-index offset (rsi + rcx) into the 8-bit al register.
* Compares the character against 0 (the null-terminator standard).
* If a null byte is hit, the program branches directly out of the calculation block.
* If the byte is valid data, it increments rcx by 1 and loops back to inspect the next memory position.

3. Numeric Translation & Rendering: Moves the final count stored in rcx into rax, then executes the print_two_digits subroutine to format and write the multi-digit ASCII result to stdout.
4. Execution Halting: Safely releases control back to the operating system using sys_exit (RAX 60) with a standard exit status of 0.

🛠 Features

* Custom Pointer-Offset Iteration: Demonstrates low-level memory addressing mechanics by manually scanning byte boundaries using index register tracking.
* Independent String Evaluation: Operates without hardcoded string length values, making it dynamically adaptable to any null-terminated message configuration.
* Non-Overlapping Subroutine Design: Isolates length scanning from output presentation formatting to keep the execution pathway modular.

🚀 How to Run

1. Assemble
fasm 36_string_length.asm
2. Set Permissions
chmod +x 36_string_length
3. Run
./36_string_length

Baran was here. Decoupling character arrays from static constraints.
