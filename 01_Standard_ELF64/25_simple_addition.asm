format ELF64 executable 3


segment readable executable
entry _start


_start:
    mov rax, 0
    mov rdi, 0
    mov rsi, input_buf1
    mov rdx, 2
    syscall


    mov al, byte [input_buf1]
    sub al, 48
    movzx r14, al


    mov rax, 0
    mov rdi, 0
    mov rsi, input_buf2
    mov rdx, 2
    syscall


    mov al, byte [input_buf2]
    sub al, 48
    movzx r15, al


    add r14, r15


    mov rax, r14
    call print_two_digits


end_program:
    mov rax, 60
    mov rdi, 0
    syscall


print_two_digits:
    mov bl, 10
    div bl


    add al, 48
    add ah, 48


    mov byte [output_buf], al
    mov byte [output_buf + 1], ah
    mov byte [output_buf + 2], 10


    mov r12, rax


    mov rax, 1
    mov rdi, 1
    mov rsi, output_buf
    mov rdx, 3
    syscall


    mov rax, r12
    ret


segment readable writeable
    input_buf1 rb 2
    input_buf2 rb 2
    output_buf rb 3
