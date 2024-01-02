; ssize_t write(int fd, const void buf[.count], size_t count);

section .text

    global ft_write
    extern __errno_location

; Inputs:
;   rdi - file descriptor
;   rsi - pointer to buffer
;   rbx - number of byte to write
; Output:
;   rax - number og byte to write
ft_write:
                MOV         rax, 1
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
