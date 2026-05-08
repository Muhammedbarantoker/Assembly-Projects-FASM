format ELF64 executable 3


segment readable executable
entry $


    mov rax, 2001
    mov rdi, buffer + 19
    mov rbx, 10


convert_loop:
    xor rdx, rdx
    div rbx
    add dl, 48
    mov [rdi], dl
    dec rdi
    test rax, rax
    jnz convert_loop


    mov rax, 1
    mov rdi, 1
    mov rsi, buffer
    mov rdx, 21
    syscall


    mov rax, 60
    xor rdi, rdi
    syscall


segment readable writeable
    buffer db 20 dup(32), 10
