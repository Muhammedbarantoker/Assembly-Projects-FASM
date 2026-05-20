🔤 System Utilities: Native Assembly Shell (v3)

A minimalist, low-level command-line interpreter engineered in x86_64 Assembly to handle direct binary execution, process synchronization, and user space interface routines natively.

🧠 Technical Workflow

1. Prompt Interfacing: Writes the hardcoded prompt layout directly to stdout using a sys_write routing directive before shifting process control to intercept character data inputs.
2. Newline Extraction Sweep: Evaluates the raw incoming stream from stdin, executing a character-by-character search register sequence to locate the line feed marker (ASCII 10) and substitute it with a standard null terminator (0).
3. Structural Command Verification: Performs sequential byte testing on the target buffer to isolate the specific 'exit' pattern, triggering an immediate shutdown routine via sys_exit if verified.
4. Subprocess Isolation and Execution: Invokes a sys_fork command to separate control structures. The parent framework halts via a sys_wait4 configuration while the child layer leverages sys_execve to transfer absolute path strings straight to the kernel boundary.

🛠 Features

* Low-Level Subprocess Spawning: Utilizes primitive hardware cloning workflows to ensure independent application context switches.
* Precision Buffer Sanitization: Strips trailing transmission indicators smoothly inside registers to generate clean, null-terminated environment paths.
* Zero Library Dependency: Handles input capture, validation tracking, string processing, and process management entirely through raw Linux kernel interrupts.

🚀 How to Run

1. Assemble

```bash
fasm 47_asm_shell_v3.asm

```

2. Set Permissions

```bash
chmod +x 47_asm_shell_v3

```

3. Run

```bash
./47_asm_shell_v3

```

Baran was here. Managing dynamic binary execution at the kernel boundary.
