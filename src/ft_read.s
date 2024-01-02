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
    PUSH r12

    MOV rax, 0
    SYSCALL
    MOV r12, rax

.call_errno:
	CALL __errno_location  wrt ..plt     ; call __errno_location
	MOV byte [rax], 0              ; set errno
    TEST r12, r12
    JZ .set_error

    MOV rax, r12
    JMP .return

.set_error:						; set errno and return -1
	OR rax, -1                 ; return -1

.return:
    POP r12
	RET