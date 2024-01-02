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
    PUSH r12

    MOV rax, 1
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
