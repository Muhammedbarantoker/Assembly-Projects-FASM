format ELF64 executable 3


segment readable executable
entry _start


_start:
    mov rdi, result_buf
    mov rcx, 0


find_end_loop:
    mov al, byte [rdi + rcx]
    cmp al, 0
    je append_second
    inc rcx
    jmp find_end_loop


append_second:
    mov rsi, second_str
    mov rdx, 0


copy_loop:
    mov al, byte [rsi+ rdx]
    mov byte [rdi + rcx], al


    cmp al, 0
    je print_result


    inc rcx
    inc rdx
    jmp copy_loop


print_result:
    mov byte [rdi + rcx], 10
    inc rcx


    mov rax, 1
    mov rdi, 1
    mov rsi, result_buf
    mov rdx, rcx
    syscall


end_program:
    mov rax, 60
    mov rdi, 0
    syscall


segment readable writeable
    result_buf db "MX ", 0
               rb 64
    second_str db "Linux", 0
