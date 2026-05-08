format ELF64 executable 3


segment readable executable
entry $


    mov rax, 10
    mov rbx, 5


    add rax, rbx


    sub rax, 3


    mov rbx, 2
    imul rax, rbx


    mov rdi, rax
    mov eax, 60
    syscall
