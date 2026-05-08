format ELF64 executable 3


segment readable executable
entry $


    mov rax, 0
    mov rdi, 0
    mov rsi, input_buffer
    mov rdx, 10
    syscall


    mov rsi, input_buffer
    call atoi
    mov r12, rax


    test r12, 1
    jz .print_even


.print_odd:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_odd
    mov rdx, 4
    syscall
    jmp .exit_program


.print_even:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_even
    mov rdx, 5
    syscall


.exit_program:
    mov rax, 60
    xor rdi, rdi
    syscall


atoi:
    xor rax, rax
.parse_loop:
    movzx rdx, byte [rsi]
    cmp dl, 10
    je .end_parse
    sub dl, 48
    imul rax, 10
    add rax, rdx
    inc rsi
    jmp .parse_loop
.end_parse:
    ret


segment readable writeable
    input_buffer db 10 dup(0)
    msg_even db 'Even', 10
    msg_odd db 'Odd', 10
