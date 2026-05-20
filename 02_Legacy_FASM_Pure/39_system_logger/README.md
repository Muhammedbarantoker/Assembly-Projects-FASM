# 🕒 System Logger: Raw Timestamp Recorder
A pure **x86_64 Assembly** tool that interacts with the Linux kernel to fetch the current system time and log it into a permanent file. This project showcases direct hardware-to-software communication without standard C libraries.
## 🧠 Technical Workflow
 1. **Time Fetching:** Uses sys_time (RAX 201) to get the Unix timestamp (seconds since epoch).
 2. **Data Conversion:** Implements a manual itoa routine to convert the 64-bit integer into a human-readable ASCII string.
 3. **File Creation:** Uses sys_creat (RAX 85) to generate system_time.log with 0644 octal permissions (owner readable/writeable, group/others readable).
 4. **Buffered Writing:** Writes a custom prefix, the converted timestamp, and a newline character using sys_write (RAX 1).
 5. **Resource Management:** Safely closes the file descriptor using sys_close (RAX 3) before terminating via sys_exit (RAX 60).
## 🛠 Features
 * **Custom itoa Implementation:** Manual base-10 conversion logic using direct div and test instructions, utilizing a 20-byte local print buffer.
 * **Direct File I/O:** Demonstrates low-level file creation and sequential buffer writing via Linux kernel syscalls.
 * **Minimalist & Efficient:** Zero external library dependencies (no libc), resulting in an extremely small and lightweight ELF64 executable.
## 🚀 How to Run
### 1. Prerequisites
You need the **Flat Assembler (FASM)** installed on your Linux system.
### 2. Compile and Execute
Open your terminal and run the following commands sequentially:
```bash
# Assemble the source file into an ELF64 executable
fasm 39_system_logger.asm

# Ensure the binary has execution permissions
chmod +x 39_system_logger

# Execute the program
./39_system_logger

# Verify the output by checking the generated log file
cat system_time.log

```
## 📜 Output Example
After running the executable, system_time.log will contain:
```text
System Timestamp: 1779382148

```
*Baran was here.*
