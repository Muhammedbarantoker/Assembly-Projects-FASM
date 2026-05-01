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


    sub r12, rax


    mov rax, r12
    call itoa


    mov rdx, rcx
    mov rax, 1
    mov rdi, 1
    syscall


    mov rax, 1
    mov rdi, 1
    mov rsi, newline_char
    mov rdx, 1
    syscall


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


itoa:
    mov rdi, print_buffer
    add rdi, 19
    mov rcx, 0
    mov r8, 10
.convert_loop:
    xor rdx, rdx
    div r8
    add dl, 48
    mov [rdi], dl
    dec rdi
    inc rcx
    test rax, rax
    jnz .convert_loop
    inc rdi
    mov rsi, rdi
    ret


segment readable writeable
    input_buffer1 db 10 dup(0)
    input_buffer2 db 10 dup(0)
    print_buffer db 20 dup(0)
    newline_char db 10
