format ELF64 executable 3


segment readable executable
entry $


    mov rax, 0
    mov rdi, 0
    mov rsi, girdi_tamponu
    mov rdx, 20
    syscall


    mov rsi, girdi_tamponu
    call atoi


    cmp rax, 50
    jge buyuk_etiketi


    mov rsi, kucuk_mesaj
    mov rdx, 6
    jmp yazdir


buyuk_etiketi:
    mov rsi, buyuk_mesaj
    mov rdx, 6


yazdir:
    mov rax, 1
    mov rdi, 1
    syscall


    mov rax, 60
    xor rdi, rdi
    syscall


atoi:
    xor rax, rax
.dongu:
    movzx rdx, byte [rsi]
    cmp dl, 10
    je .bitti
    sub dl, 48
    imul rax, 10
    add rax, rdx
    inc rsi
    jmp .dongu
.bitti:
    ret


segment readable writeable
    girdi_tamponu db 20 dup(0)
    buyuk_mesaj db "Buyuk", 10
    kucuk_mesaj db "Kucuk", 10
