format ELF64 executable 3


segment readable executable
entry $


    mov rsi, msg1
    mov rdx, 16
    call print


    mov rsi, msg2
    mov rdx, 17
    call print


    mov eax, 60
    xor edi, edi
    syscall


print:
    mov eax, 1
    mov edi, 1
    syscall
    ret


segment readable writeable
    msg1 db 'first function!',0xA
    msg2 db 'second function!',0xA
