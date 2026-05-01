format ELF64 executable 3


segment readable executable
entry $


    mov edx, 19
    mov rsi, question
    mov edi, 1
    mov eax, 1
    syscall


    mov edx, 10
    mov rsi, buffer
    mov edi, 0
    mov eax, 0
    syscall


    mov edx, 18
    mov rsi, buffer
    mov edi, 1
    mov eax, 1
    syscall


    mov eax, 60
    xor edi, edi
    syscall


segment readable writeable
    question db 'Write Your Name: '
    buffer rb 10
