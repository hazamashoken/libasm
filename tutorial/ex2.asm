global _start

section .data
    msg db "Hello, world!", 10
    len equ $ - msg

section .text
_start:
    mov rax, 1      ; sys_write system call
    mov rdi, 1      ; stdout file descriptor
    mov rsi, msg    ; bytes to write
    mov rdx, len    ; number of bytes to write
    syscall
    mov rax, 60     ; sys_exit system call
    xor rdi, rdi    ; exit status is 0
    syscall         ; perform system call