format ELF64 executable 3


segment readable executable
entry $


    mov rax, 85
    mov rdi, filename
    mov rsi, 420
    syscall


    mov r12, rax


    mov rax, 1
    mov rdi, r12
    mov rsi, msg
    mov rdx, msg_len
    syscall


    mov rax, 3
    mov rdi, r12
    syscall


    mov rax, 60
    xor rdi, rdi
    syscall


segment readable writeable
    filename db 'system_note.txt', 0
    msg db 'Baran was here, Assembly directly talked to Linux.', 10
    msg_len = $ - msg
