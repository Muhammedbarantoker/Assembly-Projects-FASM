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


    mov r13, 1453


    cmp r12, r13
    je .access_granted


.access_denied:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_denied
    mov rdx, 14
    syscall
    jmp .exit_program


.access_granted:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_granted
    mov rdx, 15
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
    msg_denied db 'ACCESS DENIED', 10
    msg_granted db 'ACCESS GRANTED', 10
