🔤 Core Utilities: Low-Level String Concatenation Engine

An optimized, system-level memory manipulation utility written in x86_64 Assembly designed to compute string boundaries dynamically and append sequential byte streams within bare-metal buffers.

🧠 Technical Workflow

1. Base Buffer Boundary Scanning: Initializes rdi with the destination buffer and iterates through memory bytes using a localized offset tracking register (rcx) until it intercepts the initial string's null terminator (0).
2. Secondary Memory Vector Mapping: Sets up rsi to point to the source string layout and clears rdx to act as an independent read index counter for the secondary vector payload.
3. Synchronous Memory Blending: Extracts 8-bit character data from the source block via rdx into the low-byte register al, then immediately commits the payload onto the target buffer location discovered during the initial boundary sweep.
4. Terminal Formatting Integration: Overwrites the final synchronized null terminator boundary with a dynamic line feed operation (ASCII 10) directly inside the active memory layout, incrementing the length register to account for the tracking configuration.
5. Absolute Output Execution: Pipelines the final combined buffer address and dynamically evaluated stream length metrics straight to sys_write for stdout rendering, before dropping control seamlessly into the standard sys_exit routine.

🛠 Features

* Dual-Pointer Offset Synchronization: Coordinates destination and source indexing counters simultaneously across registers to eliminate memory footprint processing overhead.
* Direct Memory Invalidation Overwrite: Builds continuous data blocks directly over stale string termination parameters without invoking structural shift instructions.
* Independent Operating Architecture: Handles text tracking boundaries, character translation passes, and system output streaming entirely free from linked C library layers.

🚀 How to Run

1. Assemble

```bash
fasm 39_string_concat.asm

```

2. Set Permissions

```bash
chmod +x 39_string_concat

```

3. Run

```bash
./39_string_concat

```

Baran was here. Evaluating structural consistency across hardware buffers.
