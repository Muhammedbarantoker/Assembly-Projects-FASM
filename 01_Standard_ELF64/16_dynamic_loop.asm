format ELF64 executable 3


segment readable executable
entry _start


_start:
    mov rax, 0
    mov rdi, 0
    mov rsi, input_buf
    mov rdx, 2
    syscall


    mov rax, 0
    mov al, byte [input_buf]
    sub rax, 48
    mov r13, rax


    mov r12, 1


print_loop:
    mov rax, r12
    add rax, 48


    mov byte [output_buf], al
    mov byte [output_buf + 1], 10


    mov rax, 1
    mov rdi, 1
    mov rsi, output_buf
    mov rdx, 2
    syscall


    add r12, 1


    cmp r12, r13
    jle print_loop


    mov rax, 60
    mov rdi, 0
    syscall


segment readable writeable
    input_buf rb 2
    output_buf rb 2
