format ELF64 executable 3


segment readable executable
entry $


open_file:
    mov rax, 2
    mov rdi, filename
    mov rsi, 0
    mov rdx, 0
    syscall


    mov r12, rax


    mov rax, 0
    mov rdi, r12
    mov rsi, file_buffer
    mov rdx, 100
    syscall


    mov r13, rax


print_file:
    mov rax, 1
    mov rdi, 1
    mov rsi, file_buffer
    mov rdx, r13
    syscall


    mov rax, 3
    mov rdi, r12
    syscall


exit_program:
    mov rax, 60
    xor rdi, rdi
    syscall


segment readable writeable
    filename db 'system_note.txt', 0
    file_buffer db 100 dup(0)
