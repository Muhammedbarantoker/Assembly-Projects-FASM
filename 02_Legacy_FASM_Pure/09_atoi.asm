format ELF64 executable 3


segment readable executable
entry $


    mov rdx, 16
    mov rsi, input
    mov rdi, 0
    mov rax, 0
    syscall


    xor rax, rax
    mov rsi, input


convert:
    movzx rdx, byte [rsi]
    cmp rdx, 10
    je done
    sub rdx, 48
    imul rax, 10
    add rax, rdx
    inc rsi
    jmp convert
done:


    mov rdi, 0
    mov rax, 60
    syscall


segment readable writeable
    input rb 16
