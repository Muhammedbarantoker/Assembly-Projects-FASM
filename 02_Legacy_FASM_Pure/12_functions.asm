format ELF64 executable 3


segment readable executable
entry $


    mov rax, 0
    mov rdi, 0
    mov rsi, input_buffer
    mov rdx, 20
    syscall


    mov rsi, input_buffer
    call atoi


    add rax, 10


    mov rdi, buffer + 19
    call itoa


    mov rax, 1
    mov rdi, 1
    mov rsi, buffer
    mov rdx, 21
    syscall


    mov rax, 60
    xor rdi, rdi
    syscall


atoi:
    xor rax, rax
.parse_loop:
    movzx rdx, byte [rsi]
    cmp dl, 10
    je .done
    sub dl, 48
    imul rax, 10
    add rax, rdx
    inc rsi
    jmp .parse_loop
.done:
    ret


itoa:
    mov rbx, 10
.convert_loop:
    xor rdx, rdx
    div rbx
    add dl, 48
    mov [rdi], dl
    dec rdi
    test rax, rax
    jnz .convert_loop
    ret


segment readable writeable
    input_buffer db 20 dup(0)
    buffer db 20 dup(32), 10
