format ELF64 executable 3


segment readable executable
entry $


shell_loop:
    mov rax, 1
    mov rdi, 1
    mov rsi, prompt_msg
    mov rdx, prompt_len
    syscall


.input_start:
    mov rax, 0
    mov rdi, 0
    mov rsi, input_buffer
    mov rdx, 256
    syscall


    mov r14, rax


    mov rcx, r14
    mov rdi, input_buffer
.search_newline:
    cmp byte [rdi], 10
    je .found_newline
    inc rdi
    dec rcx
    jnz .search_newline
    jmp .check_exit


.found_newline:
    mov byte [rdi], 0
    dec r14


.check_exit:
    cmp byte [input_buffer], 'e'
    jne .prepare_exec
    cmp byte [input_buffer+1], 'x'
    jne .prepare_exec
    cmp byte [input_buffer+2], 'i'
    jne .prepare_exec
    cmp byte [input_buffer+3], 't'
    jne .prepare_exec
    cmp byte [input_buffer+4], 0
    je exit_program


.prepare_exec:
    mov rax, 57
    syscall
    cmp rax, 0
    je .child_process


    mov rdi, 0
    mov rax, 61
    syscall
    jmp shell_loop


.child_process:
    mov rax, 59
    mov rdi, input_buffer
    mov rsi, argv
    mov rdx, envp
    syscall


    mov rax, 60
    mov rdi, 1
    syscall


exit_program:
    mov rax, 60
    xor rdi, rdi
    syscall


segment readable writeable
    prompt_msg db 'asm_shell> ', 0
    prompt_len = $ - prompt_msg


    argv dq input_buffer, 0
    envp dq 0


    input_buffer db 256 dup(0)
