format ELF64 executable 3


segment readable executable
entry $


    mov rcx, 5


loop_start:
    push rcx


    mov edx, 8
    mov rsi, message
    mov edi, 1
    mov eax, 1
    syscall


    pop rcx
    dec rcx
    jnz loop_start


    mov eax, 60
    xor edi, edi
    syscall


segment readable writeable
    message db 'Hello',0xA
