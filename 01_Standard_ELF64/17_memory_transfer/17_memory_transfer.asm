format ELF64 executable 3


segment readable executable
entry _start


_start:
    mov r12, 0


print_loop:
    mov al, byte [my_word + r12]
    mov byte [output_buf], al


    mov rax, 1
    mov rdi, 1
    mov rsi, output_buf
    mov rdx, 1
    syscall


    add r12, 1


    cmp r12, 5
    jl print_loop


    mov byte [output_buf], 10
    mov rax, 1
    mov rdi, 1
    mov rsi, output_buf
    mov rdx, 1
    syscall


    mov rax, 60
    mov rdi, 0
    syscall


segment readable writeable
    my_word db 'LINUX'
    output_buf rb 1
