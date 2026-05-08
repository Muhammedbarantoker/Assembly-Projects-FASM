format ELF64 executable 3


segment readable executable
entry _start


_start:
    mov rax, 20
    mov rbx, 20
    cmp rax, rbx
    je equal_label


    mov rdi, 1
    jmp exit_program


equal_label:
    mov rdi, 0


exit_program:
    mov rax, 60
    syscall
