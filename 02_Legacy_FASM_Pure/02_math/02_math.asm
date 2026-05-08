format ELF64 executable 3
segment readable executable
entry $


	mov rax, 5
	add rax, 3


	mov rdi, rax
	mov eax, 60
	syscall
