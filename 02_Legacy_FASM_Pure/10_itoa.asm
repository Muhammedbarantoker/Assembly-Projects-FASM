format ELF64 executable 3


segment readable executable
entry $


    mov rax, 2001
    mov rdi, sonuc_tamponu + 19
    mov rbx, 10


dongu:
    xor rdx, rdx
    div rbx
    add dl, 48
    mov [rdi], dl
    dec rdi
    test rax, rax
    jnz dongu


    mov rax, 1
    mov rdi, 1
    mov rsi, sonuc_tamponu
    mov rdx, 21
    syscall


    mov rax, 60
    xor rdi, rdi
    syscall


segment readable writeable
    sonuc_tamponu db 20 dup(32), 10
