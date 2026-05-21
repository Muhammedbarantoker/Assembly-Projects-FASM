format ELF64 executable 3


segment readable executable
entry $


main_loop:
    call clear_buffers


    mov rax, 1
    mov rdi, 1
    mov rsi, msg_menu
    mov rdx, len_menu
    syscall


    mov rax, 0
    mov rdi, 0
    mov rsi, input_op
    mov rdx, 2
    syscall


    mov al, byte [input_op]
    cmp al, 48
    je exit_program


    mov rax, 1
    mov rdi, 1
    mov rsi, msg_num1
    mov rdx, len_num1
    syscall


    mov rax, 0
    mov rdi, 0
    mov rsi, input_buffer1
    mov rdx, 10
    syscall


    mov rsi, input_buffer1
    call atoi
    mov r12, rax


    mov rax, 1
    mov rdi, 1
    mov rsi, msg_num2
    mov rdx, len_num2
    syscall


    mov rax, 0
    mov rdi, 0
    mov rsi, input_buffer2
    mov rdx, 10
    syscall


    mov rsi, input_buffer2
    call atoi
    mov r13, rax


    mov al, byte [input_op]
    cmp al, 49
    je do_add
    cmp al, 50
    je do_sub
    cmp al, 51
    je do_mul
    cmp al, 52
    je do_div
    

    jmp main_loop


do_add:
    mov rax, r12
    add rax, r13
    mov r15, rax
    jmp print_result


do_sub:
    mov rax, r12
    sub rax, r13
    mov r15, rax
    jmp print_result


do_mul:
    mov rax, r12
    imul rax, r13
    mov r15, rax
    jmp print_result


do_div:
	test r13, r13
	jz print_div_error
    mov rax, r12
    xor rdx, rdx
    div r13
    mov r15, rax
    jmp print_result


print_result:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_result
    mov rdx, len_result
    syscall


	mov rax, r15


    call itoa


    mov rsi, rdi


    mov rdx, rcx
    mov rax, 1
    mov rdi, 1
    syscall


newline:
    mov rax, 1
    mov rdi, 1
    mov rsi, newline_char
    mov rdx, 1
    syscall


    jmp main_loop
	
	
print_div_error:
	mov rax, 1
	mov rdi, 1
	mov rsi, msg_div_error
	mov rdx, len_div_error
	syscall
	

    jmp main_loop


exit_program:
    mov rax, 60
    xor rdi, rdi
    syscall


atoi:
    xor rax, rax
.parse_loop:
    movzx rdx, byte [rsi]
    cmp dl, 10
    je .end_parse
    sub dl, 48
    imul rax, 10
    add rax, rdx
    inc rsi
    jmp .parse_loop
.end_parse:
    ret


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


clear_buffers:
    cld
    mov rdi, input_buffer1
    mov rcx, 10
    xor al, al
    rep stosb


    mov rdi, input_buffer2
    mov rcx, 10
    xor al, al
    rep stosb


    mov rdi, print_buffer
    mov rcx, 20
    xor al, al
    rep stosb
    ret


segment readable writeable
    msg_menu db 'Select Op (1:Add,2:Sub, 3:Mul, 4:Div, 0:Exit): ', 0
    len_menu = $ - msg_menu
    msg_num1 db 'First Number: ', 0
    len_num1 = $ - msg_num1
    msg_num2 db 'Second Number: ', 0
    len_num2 = $ - msg_num2
    msg_result db 'Result: ', 0
    len_result = $ - msg_result
	msg_div_error db 'Error: Division by zero!', 10, 0
	len_div_error = $ - msg_div_error
	

    input_op db 2 dup(0)
    input_buffer1 db 10 dup(0)
    input_buffer2 db 10 dup(0)
    print_buffer db 20 dup(0)
    newline_char db 10
