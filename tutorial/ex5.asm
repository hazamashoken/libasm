global _start

section .data
    ; db is 1 byte
    addr db "yellow"
    ; dw is 2 bytes
    ; dd is 4 bytes

section .text
_start:
    mov [addr], byte 'H'
    mov [addr + 5], byte '!'
    mov rax, 1      ; sys_write system call
    mov rdi, 1      ; stdout fd
    mov rsi, addr   ; bytes to write
    mov rdx, 6      ; number of bytes to write
    syscall        ; perform system call
    mov rax, 60     ; system_exit system call
    xor rdi, rdi      ; exit status is 0
    syscall