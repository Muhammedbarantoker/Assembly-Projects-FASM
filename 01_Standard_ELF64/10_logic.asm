format ELF64 executable 3


segment readable executable
entry _start


_start:
    mov rax, 0
    mov rdi, 0
    mov rsi, input_buffer
    mov rdx, 2
    syscall


    cmp byte [input_buffer], '1'
    je is_correct


    mov rax, 1
    mov rdi, 1
    mov rsi, msg_wrong
    mov rdx, 6
    syscall
    jmp exit_program


is_correct:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_true
    mov rdx, 5
    syscall


exit_program:
    mov rax, 60
    mov rdi, 0
    syscall


segment readable Writeable
    input_buffer rb 2
    msg_true db 'True', 10
    msg_wrong db 'Wrong', 10
