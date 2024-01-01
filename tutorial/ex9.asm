global main

extern printf

section .data
    msg db "Testing %i...", 0x0a, 0x00

section .text
main:
    push rbp
    mov rbp, rsp
    mov rdi, msg
    mov rsi, 123
    xor rax, rax
    call printf
    mov rax, 60
    mov rsp, rbp
    pop rbp
    ret