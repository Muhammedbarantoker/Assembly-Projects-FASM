# 📂 Linux System Call: File Reader
This project demonstrates the power of **x86_64 Assembly** by communicating directly with the Linux Kernel to perform low-level file operations. No C standard library (libc) is used; everything is handled completely via native **syscalls**.
## 🧠 Logic Flow
 1. **Open:** Uses sys_open (RAX 2) with standard read-only flags (O_RDONLY) to retrieve a file descriptor for system_note.txt.
 2. **Read:** Uses sys_read (RAX 0) to load up to 100 bytes of data from the file descriptor into a pre-allocated memory buffer (file_buffer).
 3. **Write:** Uses sys_write (RAX 1) to output the exact number of bytes read (dynamically stored in R13) directly to the terminal (STDOUT).
 4. **Close:** Uses sys_close (RAX 3) to release the file descriptor and free system resources.
 5. **Exit:** Cleanly terminates the execution using sys_exit (RAX 60) with an exit code of 0.
## 🛠 Features
 * **Zero Dependency:** Pure assembly pipeline with no external linkages, resulting in a lightweight static binary.
 * **Direct I/O Interface:** Direct interaction with the VFS (Virtual File System) layer of the Linux kernel.
 * **Dynamic Buffer Track:** Tracks and registers the exact file size dynamically to prevent garbage data from printing out of the buffer.
## 🚀 How to Run
### 1. Prerequisites
 * You need the **Flat Assembler (FASM)** installed on your Linux system.
 * Ensure you have a text file named system_note.txt in the same directory as the executable.
### 2. Compile and Execute
Open your terminal in the project folder and run the following commands sequentially:
```bash
# Compile the .asm file into an ELF64 executable
fasm 38_file_read.asm

# Grant execution permissions to the compiled binary
chmod +x 38_file_read

# Run the program to read and display the file
./38_file_read

```
*Baran was here.*
