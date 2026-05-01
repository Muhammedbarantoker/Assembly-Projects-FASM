format ELF64 executable 3


segment readable executable
entry $


    mov rax, 0
    mov rdi, 0
    mov rsi, input_buffer1
    mov rdx, 10
    syscall


    mov rsi, input_buffer1
    call atoi
    mov r12, rax


    mov rax, 0
    mov rdi, 0
    mov rsi, input_buffer2
    mov rdx, 10
    syscall


    mov rsi, input_buffer2
    call atoi
    mov r13, rax


    cmp r12, r13
    jg .print_greater
    jl .print_less


.print_equal:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_equal
    mov rdx, 6
    syscall
    jmp .exit_program


.print_greater:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_greater
    mov rdx, 8
    syscall
    jmp .exit_program


.print_less:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_less
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
    input_buffer1 db 10 dup(0)
    input_buffer2 db 10 dup(0)
    msg_equal db 'Equal', 10
    msg_greater db 'Greater', 10
    msg_less db 'Less', 10
