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
    mov r13, rax


    mov r12, 1


.outer_loop:
    cmp r12, r13
    jg .exit_program


    mov r14, 1


.inner_loop:
    cmp r14, r12
    jg .end_inner_loop


    mov rax, 1
    mov rdi, 1
    mov rsi, star_char
    mov rdx, 1
    syscall


    inc r14
    jmp .inner_loop


.end_inner_loop:
    mov rax, 1
    mov rdi, 1
    mov rsi, newline_char
    mov rdx, 1
    syscall


    inc r12
    jmp .outer_loop


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
    star_char db '*'
    newline_char db 10
