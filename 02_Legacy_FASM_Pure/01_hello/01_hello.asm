format ELF64 executable 3
segment readable executable
entry $


	mov edx, 13
	mov rsi, msg
	mov edi, 1
	mov eax, 1
	syscall


	mov eax, 60
	xor edi, edi
	syscall


segment readable writeable
	msg db 'Hello World!',0xA
