format ELF64 executable 3


segment readable executable
entry $


    mov rax, 0
    mov rdi, 0
    mov rsi, girdi_tamponu
    mov rdx, 20
    syscall


    xor rax, rax
    mov rsi, girdi_tamponu


cevir_dongu:
    movzx rdx, byte [rsi]
    cmp dl, 10
    je islem_yap
    sub dl, 48
    imul rax, 10
    add rax, rdx
    inc rsi
    jmp cevir_dongu


islem_yap:
    add rax, 5


    mov rdi, sonuc_tamponu + 19
    mov rbx, 10


yazi_dongu:
    xor rdx, rdx
    div rbx
    add dl, 48
    mov [rdi], dl
    dec rdi
    test rax, rax
    jnz yazi_dongu


    mov rax, 1
    mov rdi, 1
    mov rsi, sonuc_tamponu
    mov rdx, 21
    syscall


    mov rax, 60
    xor rdi, rdi
    syscall


segment readable writeable
    girdi_tamponu db 20 dup(0)
    sonuc_tamponu db 20 dup(32), 10
