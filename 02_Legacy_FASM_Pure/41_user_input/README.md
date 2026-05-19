# ⌨️ Interactive Assembly: User Greeting System
A dynamic **x86_64 Assembly** program that facilitates user interaction via standard input and output. It captures a user's name and generates a personalized system greeting.
## Technical Workflow
 1. **Prompting:** Uses sys_write (RAX 1) to display a request for user input.
 2. **Input Capture:** Invokes sys_read (RAX 0) to read up to 50 bytes into a pre-allocated buffer.
 3. **Dynamic Sizing:** Stores the actual number of bytes read (returned in RAX) into r14 to ensure perfectly sized output.
 4. **Personalized Output:** Concatenates a system welcome message with the captured input for a final greeting.
 5. **Clean Exit:** Terminates the process using sys_exit (RAX 60).
## Features
 * **Buffer Management:** Demonstrates safe data handling using raw stdin (fd 0).
 * **Register Persistence:** Uses r14 as a stable counter for input length across syscalls.
 * **Pure Low-Level I/O:** Built entirely with Linux kernel syscalls without any high-level wrappers.
## How to Run
 1. Assemble:
```bash
fasm 41_user_input.asm

```
 2. Permission:
```bash
chmod +x 41_user_input

```
 3. Run:
```bash
./41_user_input

```
*Baran was here. Making Assembly talk back.*
