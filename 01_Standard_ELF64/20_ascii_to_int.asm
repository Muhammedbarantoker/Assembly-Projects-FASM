format ELF64 executable 3


segment readable executable
entry _start


_start:
    mov rax, 0
    mov rdi, 0
    mov rsi, input_buf
    mov rdx, 3
    syscall


    mov rax, 0
    mov al, byte [input_buf]
    sub al, 48
    mov bl, 10
    mul bl
    mov r12, rax


    mov rax, 0
    mov al, byte [input_buf + 1]
    sub al, 48
    add r12, rax


    add r12, 5


    mov rax, r12
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
    input_buf rb 3
    output_buf rb 3
