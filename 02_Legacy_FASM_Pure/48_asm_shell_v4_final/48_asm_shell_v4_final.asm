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
    cmp r14, 0
    je shell_loop


    cmp byte [input_buffer], 'e'
    jne .build_path
    cmp byte [input_buffer+1], 'x'
    jne .build_path
    cmp byte [input_buffer+2], 'i'
    jne .build_path
    cmp byte [input_buffer+3], 't'
    jne .build_path
    cmp byte [input_buffer+4], 0
    je exit_program


.build_path:
    mov rsi, bin_prefix
    mov rdi, full_path
.copy_prefix:
    mov al, byte [rsi]
    cmp al, 0
    je .copy_command
    mov byte [rdi], al
    inc rsi
    inc rdi
    jmp .copy_prefix


.copy_command:
    mov rsi, input_buffer
.copy_cmd_loop:
    mov al, byte [rsi]
    mov byte [rdi], al
    cmp al, 0
    je .prepare_exec
    inc rsi
    inc rdi
    jmp .copy_cmd_loop


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
    mov rdi, full_path
    mov rsi, argv
    mov rdx, envp
    syscall


error_msg:
    mov rax, 1
    mov rdi, 1
    mov rsi, err_msg
    mov rdx, err_len
    syscall


    mov rax, 60
    mov rdi, 1
    syscall


exit_program:
    mov rax, 60
    xor rdi, rdi
    syscall


segment readable writeable
    prompt_msg db 'asm_shell_v4> ', 0
    prompt_len = $ - prompt_msg


    bin_prefix db '/bin/', 0


    err_msg db 'Command not found', 10, 0
    err_len = $ - err_msg


    argv dq full_path, 0
    envp dq 0


    input_buffer db 256 dup(0)
    full_path db 512 dup(0)
