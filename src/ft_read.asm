; ssize_t ft_read(int fd, void buf[.count], size_t count);
; Inputs:
;   rdi - file descriptor
;   rsi - buffer
;   rdx - count
; Outputs:
;   rax - number of bytes read
section .text
    global ft_read
    extern __errno_location

ft_read:
    CALL __errno_location  wrt ..plt     ; reset errno
	MOV byte [rax], 0              ;

    MOV rax, 0      ; set read as syscall
    SYSCALL

    TEST rax, rax   ; check error
    JNS .return

.syscall_error:						; set errno and return -1
	NEG rax                     ; negate return value
    MOV rdx, rax                 ; save return value
	CALL __errno_location  wrt ..plt     ; call __errno_location
	MOV [rax], rdx              ; set errno
	OR rax, -1                 ; return -1

.return:
	RET