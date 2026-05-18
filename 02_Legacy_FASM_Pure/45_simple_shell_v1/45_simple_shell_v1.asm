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


    cmp byte [input_buffer], 'e'
    jne continue_loop
    cmp byte [input_buffer+1], 'x'
    jne continue_loop
    cmp byte [input_buffer+2], 'i'
    jne continue_loop
    cmp byte [input_buffer+3], 't'
    jne continue_loop
    cmp byte [input_buffer+4], 10
    je exit_program


continue_loop:
    jmp shell_loop


exit_program:
    mov rax, 60
    xor rdi, rdi
    syscall


segment readable writeable
    prompt_msg db 'asm_shell> ', 0
    prompt_len = $ - prompt_msg


    input_buffer db 256 dup(0)
