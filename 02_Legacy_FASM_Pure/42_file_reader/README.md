# 📂 File I/O: Pure Assembly File Reader

An advanced system-level program that demonstrates how to interact with the Linux file system using raw x86_64 Assembly. This module implements the complete lifecycle of a file operation: opening, reading, displaying, and closing.

## 🧠 Technical Workflow

1. **Open File:** Executes `sys_open` (RAX 2) with the filename and read-only flags. The resulting file descriptor is stored in `r15`.
2. **Read Content:** Invokes `sys_read` (RAX 0) using the file descriptor in `r15` to load data into a 1024-byte buffer. The actual byte count read is preserved in `r14`.
3. **Display Content:** Uses `sys_write` (RAX 1) to output exactly `r14` bytes from the buffer to the standard output.
4. **Close File:** Executes `sys_close` (RAX 3) to release the file descriptor and free system resources.
5. **Safe Exit:** Terminates via `sys_exit` (RAX 60).

## 🛠 Features

* **Descriptor Management:** Manual handling of file descriptors within general-purpose registers.
* **Buffer Allocation:** Uses `dup(0)` for static memory allocation in the writeable segment.
* **Resource Cleanup:** Ensures system stability by explicitly closing open files before termination.

## 🚀 How to Run

### 1. Create a Test File

echo "Hello Assembly" > test.txt

### 2. Assemble

fasm 42_file_reader.asm

### 3. Run

./42_file_reader

---

*Baran was here. Reading the system, one byte at a time.*
