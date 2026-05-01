format ELF64 executable 3


segment readable executable
entry $


    mov r12, 1


main_loop:
    mov rax, r12
    mov rdi, output_buffer + 19
    call itoa


    mov rax, 1
    mov rdi, 1
    mov rsi, output_buffer
    mov rdx, 21
    syscall


    inc r12
    cmp r12, 20
    jle main_loop


done:
    mov rax, 60
    xor rdi, rdi
    syscall


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
    output_buffer db 20 dup(32), 10
