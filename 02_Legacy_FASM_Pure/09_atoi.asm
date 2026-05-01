format ELF64 executable 3


segment readable executable
entry $


    mov rdx, 16
    mov rsi, girdi
    mov rdi, 0
    mov rax, 0
    syscall


    xor rax, rax
    mov rsi, girdi


cevir:
    movzx rdx, byte [rsi]
    cmp rdx, 10
    je bitti
    sub rdx, 48
    imul rax, 10
    add rax, rdx
    inc rsi
    jmp cevir
bitti:


    mov rdi, 0
    mov rax, 60
    syscall


segment readable writeable
    girdi rb 16
