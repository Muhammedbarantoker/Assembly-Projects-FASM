# 📝 Linux System Call: File Creator & Writer
This project demonstrates how to create a new file and write data into it using pure **x86_64 Assembly** and **FASM (Flat Assembler)**. Operating entirely via native Linux kernel syscalls, the program bypasses the C standard library (libc) to communicate directly with the kernel's Virtual File System (VFS) layer.
## 🧠 Technical Workflow
 1. **File Creation:** Uses sys_creat (RAX 85) to generate a new file named system_note.txt with standard 0644 octal permissions (owner read/write, others read-only).
 2. **Descriptor Tracking:** Safely stores the returned file descriptor from the kernel into the R12 register for subsequent operations.
 3. **Data Writing:** Employs sys_write (RAX 1) to pass the file descriptor, a hardcoded text buffer, and its calculated byte length (msg_len) into the file.
 4. **Resource Cleanup:** Closes the active file descriptor using sys_close (RAX 3) to prevent resource leaks.
 5. **System Exit:** Cleanly terminates the process via sys_exit (RAX 60) with a successful status code of 0.
## 🛠 Features
 * **Direct System Interaction:** No linkages to external dynamic libraries, resulting in an optimized, standalone static binary.
 * **Low-Level Permission Management:** Demonstrates the application of raw POSIX file permission modes directly through registers.
 * **Efficient Memory Mapping:** Computes the buffer length dynamically at assemble-time using the location counter ($ - msg).
## 🚀 How to Run
### 1. Prerequisites
You need the **Flat Assembler (FASM)** installed on your Linux system.
### 2. Compile and Execute
Open your terminal in the directory containing the source file and run the following commands:
```bash
# Compile the source file into an ELF64 executable
fasm 37_file_write.asm

# Grant execution permissions to the compiled binary
chmod +x 37_file_write

# Run the program to create and write to the file
./37_file_write

# Verify the result by reading the generated text file
cat system_note.txt

```
*Baran was here.*
