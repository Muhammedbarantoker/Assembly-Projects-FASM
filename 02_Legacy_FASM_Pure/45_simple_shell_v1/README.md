🐚 Core Systems: Custom Assembly Shell (v1.0)

A lightweight, native command-line interpreter (Shell) built completely from scratch in x86_64 Assembly. This project marks the foundational stage of a custom terminal environment that interfaces directly with Linux system calls.

🧠 Technical Workflow

1. Interactive Prompt: Executes sys_write (RAX 1) to continuously output a custom string indicator (asm_shell> ) to stdout based on an equated length controller (prompt_len).
2. Stream Ingestion: Invokes sys_read (RAX 0) to halt execution, listen to stdin, and safely capture user command inputs into a 256-byte buffer (input_buffer).
3. Sequential Byte Validation: Evaluates the buffer contents byte-by-byte using hardcoded offsets to inspect if the user typed the exact sequence for e-x-i-t followed strictly by a line feed character (ASCII 10).
4. Conditional Branching:

* If the sequence matches perfectly, control transfers directly to the program termination block.
* If any character deviates, the system triggers an unconditional jump (jmp) to reset the loop and await the next instruction.

5. Clean Lifecycle Exit: Safely offloads the process via sys_exit (RAX 60) returning status code 0 when triggered by the user.

🛠 Features

* Infinite Command Loop: Implements a persistent operational loop that doesn't crash or exit unless explicitly instructed by the user.
* Direct Character Offset Evaluation: Bypasses external standard string functions by inspecting explicit raw memory offsets for input commands.
* Low Footprint I/O: Efficiently handles a 256-byte dynamic command pool using minimal system resources.

🚀 How to Run

1. Assemble
'''
fasm 45_simple_shell_v1.asm
'''
2. Set Permissions
'''
chmod +x 45_simple_shell_v1
'''
3. Run
'''
./45_simple_shell_v1
'''
Baran was here. Building a custom terminal workspace from the ground up.
