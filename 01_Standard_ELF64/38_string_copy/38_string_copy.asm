format ELF64 executable 3


segment readable executable
entry _start


_start:
    mov rsi, source_str
    mov rdi, dest_buf
    mov rcx, 0


copy_loop:
    mov al, byte [rsi + rcx]
    mov byte [rdi + rcx], al


    cmp al, 0
    je print_copied


    inc rcx
    jmp copy_loop


print_copied:
    mov byte [rdi + rcx], 10


    mov rax, 1
    mov rdi, 1
    mov rsi, dest_buf
    mov rdx, rcx
    inc rdx
    syscall


end_program:
    mov rax, 60
    mov rdi, 0
    syscall


segment readable writeable
    source_str db "System İnitialized", 0
    dest_buf rb 64
