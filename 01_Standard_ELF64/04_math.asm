format ELF64 executable 3


segment readable executable
entry _start


_start:
    mov rax, 5
    mov rbx, 10
    add rax, rbx


    mov rdi, rax
    mov rax, 60
    syscall
