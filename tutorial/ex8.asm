global  _start

_start:
    call func
    mov rax, 60
    xor rdi, rdi
    syscall

func:
    push rbp
    mov rbp, rsp
    sub rsp, 2
    mov [rsp], byte 'H'
    mov [rsp + 1], byte 'i'
    mov rax, 1
    mov rdi, 1
    mov rsi, rsp
    mov rdx, 2
    syscall
    mov rsp, rbp
    pop ebp
    ret