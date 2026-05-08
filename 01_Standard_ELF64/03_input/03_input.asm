format ELF64 executable 3


segment readable executable
entry _start


_start:
    mov rax, 0
    mov rdi, 0
    mov rsi, buffer
    mov rdx, 16
    syscall


    mov rax, 1
    mov rdi, 1
    mov rsi, buffer
    mov rdx, 16
    syscall


    mov rax, 60
    mov rdi, 0
    syscall


segment readable writeable
    buffer rb 16
