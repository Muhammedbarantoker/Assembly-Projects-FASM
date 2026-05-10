 🕒 System Logger: Raw Timestamp Recorder

A pure **x86_64 Assembly** tool that interacts with the Linux kernel to fetch the current system time and log it into a permanent file. This project showcases direct hardware-to-software communication without standard C libraries.

## 🧠 Technical Workflow
1. **Time Fetching:** Uses `sys_time` (RAX 201) to get the Unix timestamp (seconds since epoch).
2. **Data Conversion:** Implements a manual `itoa` routine to convert the 64-bit integer into a human-readable ASCII string.
3. **File Creation:** Uses `sys_creat` (RAX 85) to generate `system_time.log` with `0644` permissions.
4. **Buffered Writing:** Writes a prefix and the converted timestamp using `sys_write` (RAX 1).
5. **Resource Management:** Safely closes the file descriptor using `sys_close` (RAX 3).

## 🛠 Features
* **Custom itoa Implementation:** Manual base-10 conversion logic using `div` and `test`.
* **Direct File I/O:** Demonstrates file creation and sequential writing via syscalls.
* **Minimalist & Efficient:** Compiled binary is extremely small and has zero external dependencies.

## 🚀 How to Run

### 1. Prerequisites
You need the **Flat Assembler (FASM)** installed on your Linux system.

### 2. Compile and Execute
```bash
# Assemble the source
fasm 39_system_logger.asm

# Run the program
./39_system_logger

# Check the generated log
cat system_time.log
