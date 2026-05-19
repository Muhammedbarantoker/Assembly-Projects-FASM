format ELF64 executable 3


segment readable executable
entry _start


_start:
    mov rsi, string1
    mov rdi, string2
    mov rcx, 0


compare_loop:
    mov al, byte [rsi + rcx]
    mov bl, byte [rdi + rcx]


    cmp al, bl
    jne not_equal


    cmp al, 0
    je is_equal


    inc rcx
    jmp compare_loop


not_equal:
    mov byte [output_buf], '0'
    jmp print_result


is_equal:
    mov byte [output_buf], '1'


print_result:
    mov byte [output_buf + 1], 10


    mov rax, 1
    mov rdi, 1
    mov rsi, output_buf
    mov rdx, 2
    syscall


end_program:
    mov rax, 60
    mov rdi, 0
    syscall


segment readable writeable
    string1 db "linux", 0
    string2 db "linux", 0
    output_buf rb 2
