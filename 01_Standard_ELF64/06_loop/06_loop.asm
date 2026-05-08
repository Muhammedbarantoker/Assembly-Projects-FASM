format ELF64 executable 3


segment readable executable
entry _start


_start:
    mov rcx, 5


loop_start:
    dec rcx
    cmp rcx, 0
    jne loop_start


    mov rdi, rcx
    mov rax, 60
    syscall
