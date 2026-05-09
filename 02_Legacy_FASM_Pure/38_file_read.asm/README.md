 📂 Linux System Call: File Reader

This project demonstrates the power of **x86_64 Assembly** by talking directly to the Linux Kernel to perform file operations. No C standard library was used; everything is handled via **syscalls**.

## 🧠 Logic Flow
1. **Open:** Uses `sys_open` (RAX 2) to get a file descriptor for `system_note.txt`.
2. **Read:** Uses `sys_read` (RAX 0) to pull content into a memory buffer.
3. **Write:** Uses `sys_write` (RAX 1) to print the buffer to the terminal (STDOUT).
4. **Close:** Uses `sys_close` (RAX 3) to release the file descriptor.

## 🛠 Features
* **Zero Dependency:** Pure Assembly logic.
* **Direct I/O:** Interacts with the kernel filesystem layer.
* **Buffer Management:** Demonstrates manual memory handling for file data.

## 🚀 How to Run

### 1. Prerequisites
Ensure you have the `system_note.txt` file in the same directory as the source code.

### 2. Compile and Execute
Open your terminal in the project folder and run:

```bash
# Compile the .asm file into an executable
fasm file_read.asm

# Run the program
./file_read
