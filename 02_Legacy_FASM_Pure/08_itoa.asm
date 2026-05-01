format ELF64 executable 3


segment readable executable
entry $


    mov rax, 2001
    mov rdi, buffer
    call print_number


    mov eax, 60
    xor edi, edi
    syscall


print_number:
    mov rcx, 0
    mov rbx, 10


split_digits:
    xor rdx, rdx
    div rbx
    add rdx, 48
    push rdx
    inc rcx
    test rax, rax
    jnz split_digits


display_digits:
    pop rdx
    mov [buffer], dl
    push rcx
    mov rdx, 1
    mov rsi, buffer
    mov rdi, 1
    mov rax, 1
    syscall


    pop rcx
    dec rcx
    jnz display_digits
    

    mov byte [buffer], 10
    mov rdx, 1
    mov rsi, buffer
    mov rdi, 1
    mov rax, 1
    syscall
    ret

segment readable writeable
    buffer rb 32
