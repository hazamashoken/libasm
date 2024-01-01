global _start
_start:
    sub rsp, 4
    mov [rsp], byte 'H'
    mov [rsp+1], byte 'e'
    mov [rsp+2], byte 'y'
    mov [rsp+3], byte '!'
    mov rax, 1      ; sys_write system call
    mov rdi, 1      ; std fd
    mov rsi, rsp    ; pointer to bytes to write
    mov rdx, 4      ; number of bytes to write
    syscall         ; perform system call
    mov rax, 60     ; sys_exit system call
    xor rdi, rdi    ; exit status is 0
    syscall