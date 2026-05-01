format ELF64 executable 3


segment readable executable
entry $


    mov rax, 5
    mov rbx, 5


    cmp rax, rbx
    je if_equal


    mov eax, 60
    xor edi, edi
    syscall


if_equal:
    mov edx, 5
    mov rsi, message
    mov edi, 1
    mov eax, 1
    syscall


    mov eax, 60
    xor edi, edi
    syscall


segment readable writeable
    message db 'True',0xA
