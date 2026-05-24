format ELF64 executable 3


segment readable executable
entry _start


_start:
    mov rax, 2
    mov rdi, filename
    mov rsi, 65
    mov rdx, 644o
    syscall
    mov r8, rax


write_file:
    mov rax, 1
    mov rdi, r8
    mov rsi, text_data
    mov rdx, 17
    syscall


close_file:
    mov rax, 3
    mov rdi, r8
    syscall


exit_program:
    mov rax, 60
    mov rdi, 0
    syscall


segment readable writeable
    filename db "log.txt", 0
    text_data db "Terminal Started", 10
