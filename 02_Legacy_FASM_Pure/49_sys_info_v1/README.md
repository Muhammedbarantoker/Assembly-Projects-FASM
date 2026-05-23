💻 System Utilities: Low-Level CPUID Vendor Hardware Scanner (v1)

A bare-metal hardware diagnostic module engineered in x86_64 Assembly designed to interface directly with the processor silicon to extract and reconstruct the native CPU Vendor Identification string.

🧠 Technical Workflow

1. Register-Level Hardware Query: Sets the primary accumulator register (eax) to zero and triggers the primitive `cpuid` hardware instruction to request basic processor identification parameters.
2. Segmented Identification Capture: Intercepts the raw 12-byte manufacturer signature returned dynamically by the CPU architecture across three distinct 32-bit general-purpose registers: `ebx`, `edx`, and `ecx`.
3. Contiguous Memory Reconstruction: Performs manual memory offset positioning by streaming the 4-byte dword blocks from `ebx` into `cpu_vendor`, `edx` into `cpu_vendor+4`, and `ecx` into `cpu_vendor+8` to establish a perfectly aligned, uninterrupted text layout.
4. Prefix and Payload Dispatch: Invokes the Linux storage subsystem using raw sys_write kernel transitions to emit the descriptive label payload followed instantly by the newly assembled 12-byte hardware signature vector to stdout.
5. Environment Control Release: Routes execution safely to the standard newline layout modification handler before cleanly executing a zero-status sys_exit sequence to free CPU allocation boundaries.

🛠 Features

* Direct Silicon Interrogation: Leverages raw x86_64 hardware instructions to bypass high-level software abstraction interfaces entirely.
* Structured Register-to-Memory Mapping: Chains discrete 32-bit hardware register segments into a linear 12-character buffer alignment pass without formatting library layers.
* Low-Latency Zero-Dependency Core: Coordinates physical execution context parsing, stream writing operations, and process lifecycle drops directly over native Linux system call structures.

🚀 How to Run

1. Assemble

```bash
fasm 49_sys_info_v1.asm

```

2. Set Permissions

```bash
chmod +x 49_sys_info_v1

```

3. Run

```bash
./49_sys_info_v1

```

Baran was here. Interrogating hardware descriptor parameters at the execution boundary.
