format ELF64 executable 3


segment readable executable
entry $


    mov rbx, 1


main_loop:
    mov rax, rbx
    add al, 48
    mov byte [char_buffer], al


    mov rax, 1
    mov rdi, 1
    mov rsi, char_buffer
    mov rdx, 2
    syscall


    inc rbx
    cmp rbx, 5
    jle main_loop


done:
    mov rax, 60
    xor rdi, rdi
    syscall


segment readable writeable
    char_buffer db 0, 10
