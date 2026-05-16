format ELF64 executable 3


segment readable executable
entry $


open_cpuinfo:
    mov rax, 2
    mov rdi, cpuinfo_path
    mov rsi, 0
    mov rdx, 0
    syscall


    mov r15, rax


read_cpuinfo:
    mov rax, 0
    mov rdi, r15
    mov rsi, info_buffer
    mov rdx, 512
    syscall


    mov r14, rax


print_cpuinfo:
    mov rax, 1
    mov rdi, 1
    mov rsi, info_buffer
    mov rdx, r14
    syscall


close_cpuinfo:
    mov rax, 3
    mov rdi, r15
    syscall


newline:
    mov rax, 1
    mov rdi, 1
    mov rsi, newline_char
    mov rdx, 1
    syscall


exit_program:
    mov rax, 60
    xor rdi, rdi
    syscall


segment readable writeable
    cpuinfo_path db '/proc/cpuinfo', 0
    newline_char db 10
    info_buffer db 512 dup(0)
