# 💻 System Diagnostics: CPU Information Fetcher

A low-level system utility in x86_64 Assembly that interfaces directly with the Linux kernel via the virtual file system. It dynamically opens, reads, and displays hardware specifications straight from `/proc/cpuinfo`.

## 🧠 Technical Workflow

1. **Kernel Interface:** Points directly to the `/proc/cpuinfo` virtual path defined in the writable segment.
2. **File Resource Acquisition:** Triggers `sys_open` (RAX 2) in read-only mode, moving the resulting file descriptor securely into `r15`.
3. **Data Streaming:** Uses `sys_read` (RAX 0) to pull hardware statistics into a `512`-byte static buffer (`info_buffer`). The exact byte count returned by the kernel is preserved in `r14`.
4. **Terminal Output:** Invokes `sys_write` (RAX 1) using `r14` as the dynamic length controller, printing vendor specs, model names, and CPU flags directly to stdout.
5. **Resource Disposal & Termination:** Closes the descriptor via `sys_close` (RAX 3) and gracefully exits with standard status 0.

## 🛠 Features

* **Virtual File System Interaction:** Bypasses standard disk storage to communicate directly with kernel-generated process information.
* **Dynamic Length Handling:** Utilizes register tracking (`r14`) rather than hardcoded lengths to ensure precisely sized console outputs.
* **Explicit Resource Security:** Safely manages file state transitions from open to close to prevent resource leakage.

## 🚀 How to Run

### 1. Assemble

fasm 44_proc_cpuinfo.asm

### 2. Set Permissions

chmod +x 44_proc_cpuinfo

### 3. Run

./44_proc_cpuinfo

---

*Baran was here. Extracting raw hardware details.*
