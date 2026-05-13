format ELF64 executable 3


segment readable executable
entry $


ask_for_name:
    mov rax, 1
    mov rdi, 1
    mov rsi, prompt_msg
    mov rdx, prompt_len
    syscall


read_user_input:
    mov rax, 0
    mov rdi, 0
    mov rsi, input_buffer
    mov rdx, 50
    syscall


    mov r14, rax


print_greating:
    mov rax, 1
    mov rdi, 1
    mov rsi, hello_msg
    mov rdx, hello_len
    syscall


print_user_name:
    mov rax, 1
    mov rdi, 1
    mov rsi, input_buffer
    mov rdx, r14
    syscall


exit_program:
    mov rax, 60
    xor rdi, rdi
    syscall


segment readable writeable
    prompt_msg db 'Enter your name: ', 0
    prompt_len = $ - prompt_msg


    hello_msg db 'Welcome to the system, ', 0
    hello_len = $ - hello_msg


    input_buffer db 50 dup(0)
