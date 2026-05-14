format ELF64 executable 3


segment readable executable
entry $


open_file:
    mov rax, 2
    mov rdi, filename
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


    mov r14, rax


print_file:
    mov rax, 1
    mov rdi, 1
    mov rsi, file_buffer
    mov rdx, r14
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
    filename db 'test.txt', 0
    file_buffer db 1024 dup(0)
