format ELF64 executable 3


segment readable executable
entry $


ask_filename:
    mov rax, 1
    mov rdi, 1
    mov rsi, prompt_msg
    mov rdx, prompt_len
    syscall


read_filename:
    mov rax, 0
    mov rdi, 0
    mov rsi, filename_buffer
    mov rdx, 50
    syscall


    mov r14, rax


remove_newline:
    mov rcx, r14
    mov rdi, filename_buffer


.search_loop:
    cmp byte [rdi], 10
    je .found_newline
    inc rdi
    dec rcx
    jnz .search_loop
    jmp open_file


.found_newline:
    mov byte [rdi], 0


open_file:
    mov rax, 2
    mov rdi, filename_buffer
    mov rsi, 0
    mov rdx, 0
    syscall


    mov r15, rax


read_file:
    mov rax, 0
    mov rdi, r15
    mov rsi, file_buffer
    mov rdx, 1024
    syscall


    mov r13, rax


print_file:
    mov rax, 1
    mov rdi, 1
    mov rsi, file_buffer
    mov rdx, r13
    syscall


close_file:
    mov rax, 3
    mov rdi, r15
    syscall


exit_program:
    mov rax, 60
    xor rdi, rdi
    syscall


segment readable writeable
    prompt_msg db 'Enter filename to read: ', 0
    prompt_len = $ - prompt_msg


    filename_buffer db 50 dup(0)
    file_buffer db 1024 dup(0)
