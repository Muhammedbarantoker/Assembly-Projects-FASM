format ELF64 executable 3


segment readable executable
entry $


get_sys_info:
    mov rax, 63
    mov rdi, uname_buffer
    syscall


get_user_id:
    mov rax, 102
    syscall


    call itoa
    mov r14, rsi
    mov r15, rcx


open_report_file:
    mov rax, 85
    mov rdi, filename
    mov rsi, 420
    syscall


    mov r12, rax


write_os_prefix:
    mov rax, 1
    mov rdi, r12
    mov rsi, os_prefix
    mov rdx, os_prefix_len
    syscall


write_os_name:
    mov rax, 1
    mov rdi, r12
    mov rsi, uname_buffer
    mov rdx, 65
    syscall


write_first_newline:
    mov rax, 1
    mov rdi, r12
    mov rsi, newline
    mov rdx, 1
    syscall


write_uid_prefix:
    mov rax, 1
    mov rdi, r12
    mov rsi, uid_prefix
    mov rdx, uid_prefix_len
    syscall


write_uid_value:
    mov rax, 1
    mov rdi, r12
    mov rsi, r14
    mov rdx, r15
    syscall


write_second_newline:
    mov rax, 1
    mov rdi, r12
    mov rsi, newline
    mov rdx, 1
    syscall


close_report_file:
    mov rax, 3
    mov rdi, r12
    syscall


exit_program:
    mov rax, 60
    xor rdi, rdi
    syscall


itoa:
    mov rdi, print_buffer
    add rdi, 19
    mov rcx, 0
    mov r8, 10
.convert_loop:
    xor rdx, rdx
    div r8
    add dl, 48
    mov [rdi], dl
    dec rdi
    inc rcx
    test rax, rax
    jnz .convert_loop
    inc rdi
    mov rsi, rdi
    ret


segment readable writeable
    filename db 'system_report.txt', 0
    
    os_prefix db 'Operating System: ', 0
    os_prefix_len = $ - os_prefix


    uid_prefix db 'user ID: ', 0
    uid_prefix_len = $ - uid_prefix


    newline db 10


    print_buffer db 20 dup(0)
    uname_buffer db 390 dup(0)
