format ELF64 executable 3


segment readable executable
entry _start


_start:
    mov rax, 5
    mov rbx, 3
    add rax, rbx


    add rax, 48
    mov [result], al


    mov rax, 1
    mov rdi, 1
    mov rsi, result
    mov rdx, 1
    syscall


    mov rax, 60
    mov rdi, 0
    syscall


segment readable writeable
    result db 0
