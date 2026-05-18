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
    jne .echo_input
    cmp byte [input_buffer+1], 'x'
    jne .echo_input
    cmp byte [input_buffer+2], 'i'
    jne .echo_input
    cmp byte [input_buffer+3], 't'
    jne .echo_input
    cmp byte [input_buffer+4], 0
    je exit_program


.echo_input:
    cmp r14, 0
    je shell_loop

write_msg:
    mov rax, 1
    mov rdi, 1
    mov rsi, echo_msg
    mov rdx, echo_len
    syscall


    mov rax, 1
    mov rdi, 1
    mov rsi, input_buffer
    mov rdx, r14
    syscall


newline:
    mov rax, 1
    mov rdi, 1
    mov rsi, newline_char
    mov rdx, 1
    syscall


    jmp shell_loop


exit_program:
    mov rax, 60
    xor rdi, rdi
    syscall


segment readable writeable
    prompt_msg db 'asm_shell> ', 0
    prompt_len = $ - prompt_msg


    echo_msg db 'You entered: ', 0
    echo_len = $ - echo_msg


    newline_char db 10


    input_buffer db 256 dup(0)
