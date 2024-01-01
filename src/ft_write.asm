; ssize_t write(int fd, const void buf[.count], size_t count);
; Inputs:
;   rdi - file descriptor
;   rsi - pointer to buffer
;   rdx - number of byte to write
; Output:
;   rax - number og byte to write
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
    CALL __errno_location  wrt ..plt     ; call __errno_location
	MOV byte [rax], 0              ; set errno to 0
    MOV rax, 1
    SYSCALL
    TEST rax, rax
	JNS .return

.syscall_error:						; set errno and return -1
	NEG rax                     ; negate return value
    MOV rdx, rax                 ; save return value
	CALL __errno_location  wrt ..plt     ; call __errno_location
	MOV [rax], rdx              ; set errno
	OR rax, -1                 ; return -1

.return:
	RET
