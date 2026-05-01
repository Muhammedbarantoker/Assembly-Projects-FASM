format ELF64 executable 3


segment readable executable
entry _start


_start:
    mov rax, 5
    mov rbx, 3


    add rax, rbx


    sub rax, 2


    cmp rax, 6
    je is_six


    mov rax, 60
    mov rdi, 1
    syscall


is_six:
    mov rax, 60
    mov rdi, 0
    syscall
