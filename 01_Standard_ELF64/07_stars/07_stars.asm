format ELF64 executable 3


segment readable executable
entry _start


_start:
    mov rbx, 5


print_loop:
    mov rax, 1
    mov rdi, 1
    mov rsi, star
    mov rdx, 1
    syscall


    dec rbx
    cmp rbx, 0
    jne print_loop


    mov rax, 60
    mov rdi, 0
    syscall


segment readable
    star db '*'
