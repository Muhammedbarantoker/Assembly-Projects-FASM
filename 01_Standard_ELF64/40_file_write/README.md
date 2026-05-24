💻 System Utilities: Bare-Metal File Descriptors and Storage Writer (v1)

A low-level storage management utility compiled in x86_64 Assembly designed to execute direct system-level file creation passes and commit linear byte arrays onto physical storage blocks without runtime dependencies.

🧠 Technical Workflow

1. Syscall-Driven File Generation: Invokes the `sys_open` kernel transition (rax = 2) by targeting the filename string configuration, passing bitwise flag parameters (rsi = 65 representing O_WRONLY | O_CREAT), and specifying traditional file permissions (rdx = 644o octal mask).
2. Descriptor State Preservation: Intercepts the newly allocated file descriptor handle natively returned inside rax upon successful creation and dynamically mirrors the index integer into r8 for non-volatile reference retention.
3. Target Vector Commitment: Triggers the `sys_write` subsystem call (rax = 1) while feeding the cached file descriptor from r8 into rdi, pointing rsi to the internal text payload, and setting rdx to exactly 17 bytes to flush the characters securely onto storage tracks.
4. Active Resource Relinquishment: Routes control directly into the `sys_close` subsystem routine (rax = 3), providing the active file descriptor structure in rdi to release operating system resource chains instantly.
5. Absolute Environment Teardown: Finalizes execution state changes by driving the standard sys_exit kernel sequence (rax = 60) coupled with a zeroed error matrix status indicator (rdi = 0) to guarantee a clean system unload pass.

🛠 Features

* Direct Raw Flag Conjunction: Leverages low-level bitsel evaluation components (O_WRONLY and O_CREAT combined as literal 65) to bypass standardized high-level file system helper models.
* Isolated Descriptor Management: Safely captures and pathways active kernel resource indices across scratch registers without relying on unmanaged structural shift states.
* Zero Library Dependency Layout: Orchestrates physical asset construction, memory streaming passes, context cleanup operations, and process lifecycle teardown exclusively via direct software interrupts.

🚀 How to Run

1. Assemble

```bash
fasm 40_file_write.asm

```

2. Set Permissions

```bash
chmod +x 40_file_write

```

3. Run

```bash
./40_file_write

```

Baran was here. Managing localized storage allocations and descriptor streams at the bare kernel boundary.
