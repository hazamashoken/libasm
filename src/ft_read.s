; ssize_t ft_read(int fd, void buf[.count], size_t count);

section .text
    global ft_read
    extern __errno_location

; Inputs:
;   rdi - file descriptor
;   rsi - buffer
;   rdx - count
; Outputs:
;   rax - number of bytes read
ft_read:
                MOV         rax, 0
                SYSCALL
                PUSH        rax
.error:
                CALL        __errno_location wrt ..plt
                POP         rdi
                CMP         rdi, 0
                JL          .set_error

                MOV         byte [rax], 0
                MOV         rax, rdi
                JMP         .return

.set_error:
                NEG         rdi
                MOV         [rax], rdi
                OR          rax, -1
.return:
                RET
