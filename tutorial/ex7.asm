global _start

_start:
    call func
    mov rax, 60
    syscall

func:
    mov rdi, 42
    ret