global _start


section .text
_start:
    mov rbx, 1  ; start rbx at 1
    mov rcx, 4  ; number of iterations

label:
    add rbx, rbx ; rbx += rbx
    dec rcx     ; rcx -= 1
    cmp rcx, 0   ; compare rcx with 0
    jg label     ; gump to label if greater
    mov rax, 60     ; sys_exit system call
    xor rdi, rdi   ; exit status is 0
    syscall