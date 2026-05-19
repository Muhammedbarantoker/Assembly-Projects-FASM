🔤 Core Utilities: Dynamic String Comparison Engine

A highly efficient, low-level system utility written in x86_64 Assembly designed to perform character-by-character validation between two independent memory-mapped strings at runtime.

🧠 Technical Workflow

1. Double Pointer Tracking: Initializes dual registers by loading the source address into rsi and the target comparison address into rdi, utilizing rcx as a synchronized offset index.
2. Synchronous Byte Extraction: Fetches an 8-bit character from each string profile simultaneously using identical offset configurations (rsi + rcx into al, and rdi + rcx into bl).
3. Early Conflict Evaluation: Evaluates the register payloads against each other via a comparison directive. If any structural mismatch occurs at the active memory layer, execution jumps directly to the failure branch.
4. Terminal Sequence Check: Inspects the verified byte against a standard null terminator (0). If a null byte is isolated concurrently without triggering early conflict flags, the strings are mathematically identical, and execution routes to the success branch.
5. Buffered Reflection Delivery: Writes an operations flag ('1' for match, '0' for mismatch) followed by a line feed character (ASCII 10) directly into output_buf, delivering the finalized evaluation layout to stdout via a sys_write call before invoking sys_exit.

🛠 Features

* Dual-Register Parallel Ingestion: Maximizes instruction cache efficiency by evaluating secondary buffer strings concurrently inside a singular localized loop pass.
* Immediate Evaluation Severing: Implements a proactive exit strategy that halts loop execution on the first mismatched byte, protecting system clock cycles.
* Zero Library Dependency: Handles complex string state testing completely inside the CPU registers without reliance on external procedural macros.

🚀 How to Run

1. Assemble

```bash
fasm 37_string_compare.asm

```

2. Set Permissions

```bash
chmod +x 37_string_compare

```

3. Run

```bash
./37_string_compare

```

Baran was here. Evaluating structural consistency across hardware buffers.
