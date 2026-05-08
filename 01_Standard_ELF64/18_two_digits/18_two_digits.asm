format ELF64 executable 3


segment readable executable
entry _start


_start:
    mov rax, 0
    mov al, 42
    mov bl, 10
    div bl


    add al, 48
    add ah, 48


    mov byte [output_buf], al
    mov byte [output_buf + 1], ah
    mov byte [output_buf + 2], 10


    mov rax, 1
    mov rdi, 1
    mov rsi, output_buf
    mov rdx, 3
    syscall


    mov rax, 60
    mov rdi, 0
    syscall


segment readable writeable
    output_buf rb 3
