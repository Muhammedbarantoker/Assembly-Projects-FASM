format ELF64 executable 3


segment readable executable
entry $


sys_time:
    mov rax, 201
    mov rdi, 0
    syscall


    call itoa


    mov r14, rsi
    mov r15, rcx


    mov rax, 85
    mov rdi, filename
    mov rsi, 420
    syscall


    mov r12, rax


    mov rax, 1
    mov rdi, r12
    mov rsi, msg_prefix
    mov rdx, len_prefix
    syscall


    mov rax, 1
    mov rdi, r12
    mov rsi, r14
    mov rdx, r15
    syscall


    mov rax, 1
    mov rdi, r12
    mov rsi, newline_char
    mov rdx, 1
    syscall


    mov rax, 3
    mov rdi, r12
    syscall


exit_program:
    mov rax, 60
    xor rdi, rdi
    syscall


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
    filename db 'system_time.log', 0
    msg_prefix db 'System Timestamp: ', 0
    len_prefix = $ - msg_prefix
    print_buffer db 20 dup(0)
    newline_char db 10
