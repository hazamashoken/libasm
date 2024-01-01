global _start

section .text
_start:
    mov rcx, 99
    mov rbx, 42
    cmp rcx, 100
    je skip
    mov rbx, 13

skip:
    mov rax, 60  ; sys_exit system call
    xor rdi, rdi ; exit status is 0
    syscall