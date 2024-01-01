global add42

section .text
add42:
    push rbp
    mov rbp, rsp
    add rdi, 42
    mov rax, rdi
    pop rbp
    ret