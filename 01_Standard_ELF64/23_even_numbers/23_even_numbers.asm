format ELF64 executable 3


segment readable executable
entry _start


_start:
    mov r13, 1


check_loop:
    cmp r13, 20
    jg end_program


    mov rax, r13
    mov bl, 2
    div bl
    cmp ah, 0
    jne next_step


    mov rax, r13
    call print_two_digits


next_step:
    inc r13
    jmp check_loop


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
    output_buf rb 3
