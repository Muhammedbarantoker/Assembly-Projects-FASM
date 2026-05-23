format ELF64 executable 3


segment readable executable
entry $


get_cpu_info:
    mov eax, 0
    cpuid


    mov dword [cpu_vendor], ebx
    mov dword [cpu_vendor+4], edx
    mov dword [cpu_vendor+8], ecx


print_info:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_vendor
    mov rdx, msg_len
    syscall


    mov rax, 1
    mov rdi, 1
    mov rsi, cpu_vendor
    mov rdx, 12
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
    msg_vendor db 'CPU Vendor: ', 0
    msg_len = $ - msg_vendor


    newline_char db 10


    cpu_vendor db 12 dup(0)
