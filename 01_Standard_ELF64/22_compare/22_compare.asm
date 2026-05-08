format ELF64 executable 3


segment readable executable
entry _start


_start:
    mov r8, 45
    mov r9, 89


    cmp r8, r9
    jg first_is_greater


second_is_greater:
    mov rax, r9
    call print_two_digits
    jmp end_program


first_is_greater:
    mov rax, r8
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
    output_buf rb 3
