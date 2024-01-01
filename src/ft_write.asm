; ssize_t write(int fd, const void buf[.count], size_t count);
; Inputs:
;   rdi - file descriptor
;   rsi - pointer to buffer
;   rdx - number of byte to write
; Output:
;   rax - number og byte to write
section .text
    SYS_WRITE equ 1

    global ft_write
    extern __errno_location



; Inputs:
;   rdi - file descriptor
;   rsi - pointer to buffer
;   rbx - number of byte to write
; Output:
;   rax - number og byte to write
ft_write:
    MOV rax, SYS_WRITE
    SYSCALL
    JC .syscall_error
    RET

.syscall_error:						; set errno and return -1
	neg rax                     ; negate return value
	push rax                    ; save return value
	call __errno_location       ; call __errno_location
	mov rbx, rax                ; save errno address
	pop rax                     ; restore return value
	mov [rbx], rax              ; set errno
	mov rax, -1                 ; return -1
	RET
