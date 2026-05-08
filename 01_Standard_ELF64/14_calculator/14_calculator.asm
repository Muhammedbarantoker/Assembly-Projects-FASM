format ELF64 executable 3


segment readable executable
entry _start


_start:
    mov rax, 0
    mov rdi, 0
    mov rsi, num1
    mov rdx, 2
    syscall


    mov rax, 0
    mov rdi, 0
    mov rsi, num2
    mov rdx, 2
    syscall


    mov al, byte [num1]
    sub al, 48


    mov bl, byte [num2]
    sub bl, 48
    

    add al, bl
    add al, 48


    mov byte [result_buf], al
    mov byte [result_buf + 1], 10


    mov rax, 1
    mov rdi, 1
    mov rsi, result_buf
    mov rdx, 2
    syscall


    mov rax, 60
    mov rdi, 0
    syscall


segment readable writeable
    num1 rb 2
    num2 rb 2
    result_buf rb 2
