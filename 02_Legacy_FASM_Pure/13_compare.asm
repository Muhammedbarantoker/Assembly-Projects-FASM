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


    cmp rax, 50
    jge is_greater


    mov rsi, smaller_msg
    mov rdx, 8
    jmp print_result


is_greater:
    mov rsi, greater_msg
    mov rdx, 8


print_result:
    mov rax, 1
    mov rdi, 1
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


segment readable writeable
    input_buffer db 20 dup(0)
    greater_msg db "Greater", 10
    smaller_msg db "Smaller", 10
