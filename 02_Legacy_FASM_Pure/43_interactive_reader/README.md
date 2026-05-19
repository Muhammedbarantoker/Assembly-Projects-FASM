# 📂 Interactive File Reader: Dynamic System I/O
An advanced x86_64 Assembly utility that allows users to specify which file to read at runtime. This program combines interactive user input with low-level file system operations, featuring manual string manipulation for path cleaning.
## Technical Workflow
 1. **Interactive Prompt:** Displays a message asking for a filename using sys_write (RAX 1).
 2. **Path Capture:** Reads the user-provided filename into a buffer using sys_read (RAX 0).
 3. **String Sanitization:** Implements a custom remove_newline loop to find and replace the ASCII 10 (LF) character with a null terminator (0). This ensures the sys_open call receives a valid file path.
 4. **File Operations:**
   * **Open:** Accesses the file using sys_open (RAX 2).
   * **Read:** Pulls content into a 1024-byte buffer via sys_read (RAX 0).
   * **Display:** Streams the buffer content to stdout using sys_write (RAX 1).
 5. **Resource Management:** Safely closes the file descriptor (sys_close) and terminates the process via sys_exit (RAX 60).
## Features
 * **Dynamic Path Handling:** Unlike hardcoded versions, this handles user-defined file paths dynamically.
 * **Low-Level String Parsing:** Manual pointer arithmetic (inc rdi) and counter management (dec rcx) to clean input strings.
 * **Robust Descriptor Flow:** Efficiently tracks the file descriptor in r15 and read length in r13.
## How to Run
 1. Assemble:
```bash
fasm 43_interactive_reader.asm

```
 2. Set Permissions:
```bash
chmod +x 43_interactive_reader

```
 3. Run:
```bash
./43_interactive_reader

```
*Baran was here. Making Assembly interactive and clean.*
