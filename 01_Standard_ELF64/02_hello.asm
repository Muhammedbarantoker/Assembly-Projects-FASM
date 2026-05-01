format ELF64 executable 3


segment readable executable
entry _start


_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, message
    mov rdx, 13
    syscall


    mov rax, 60
    mov rdi, 0
    syscall


segment readable
message db 'Hello World!', 10
