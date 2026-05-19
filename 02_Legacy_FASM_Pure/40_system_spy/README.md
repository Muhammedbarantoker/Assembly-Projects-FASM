# 🕵️‍♂️ System Spy: OS & User Identity Logger
A sophisticated **x86_64 Assembly** utility that audits the local system. It extracts kernel information and user credentials directly via Linux syscalls and generates a formatted text report.
## Technical Workflow
 1. **OS Identification:** Invokes sys_uname (RAX 63) to retrieve the kernel name and system release from the utsname structure.
 2. **Identity Check:** Calls sys_getuid (RAX 102) to fetch the real user ID of the calling process.
 3. **Data Transformation:** Utilizes a custom-built itoa routine to convert the numeric UID into a printable ASCII format.
 4. **Report Generation:** Creates system_report.txt using sys_creat (RAX 85) and performs a series of buffered writes (sys_write, RAX 1) to log the findings.
 5. **Finalization:** Ensures data integrity by closing the file descriptor (sys_close, RAX 3) before a clean exit.
## Features
 * **Kernel Probing:** Demonstrates how to access complex system structures (uname_buffer).
 * **Identity Mapping:** Hand-written logic to bridge the gap between binary system IDs and human-readable text via custom integer-to-ASCII conversion.
 * **Pure Assembly:** Zero reliance on C standard libraries (libc) for complete control over system interactions.
## How to Run
 1. Assemble:
```bash
fasm 40_system_spy.asm

```
 2. Set Permissions:
```bash
chmod +x 40_system_spy

```
 3. Run:
```bash
./40_system_spy

```
*Baran was here. Auditing kernel structures and system metrics.*
