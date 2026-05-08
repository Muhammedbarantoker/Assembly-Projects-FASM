This is the final version of my 64-bit Assembly calculator, developed using FASM. After several iterations, this version focuses on system stability and robust error handling to prevent common runtime crashes.
🛠 Features

    Core Operations: Addition, Subtraction, Multiplication, and Division.

    Efficient I/O: Custom atoi (String to Integer) and itoa (Integer to String) implementations for high performance.

    Clean Exit: Proper program termination using sys_exit (syscall 60).

    Architecture: Written specifically for x86_64 Linux systems.

🛡️ Key Update: Zero Division Protection

In low-level programming, dividing by zero causes a fatal CPU exception that crashes the program. I have implemented a Defensive Programming layer to catch this before it happens.

The program now performs a logic check on the divisor register before the div instruction is executed:

do_div:
test r13, r13           ; Check if the divisor (R13) is zero
jz print_div_error      ; If zero, jump to the error handler instead of crashing
mov rax, r12
xor rdx, rdx            ; Clear RDX to prevent overflow
div r13                 ; Safe to execute

If a division by zero is attempted, the program gracefully prints an error message and returns to the main menu, keeping the system stable.
🚀 How to Run
1. Install FASM

You need the Flat Assembler to compile this project.

    MX Linux / Debian / Ubuntu:
    sudo apt update && sudo apt install fasm

    Arch Linux:
    sudo pacman -S fasm

    Other Distributions: Download the official binary from flatassembler.net if it's not in your repository.

2. Compile and Execute

Open your terminal in the project folder and run:
Compile the .asm file

fasm calculator.asm
Run the program

./calculator

Developed by Baran as part of low-level system programming studies.
