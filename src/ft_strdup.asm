; char *ft_strdup(const char *s);
; Input: rdi - pointer to string to be copy
; Output: rax - pointer to new allocated pointer with copied value from rdi
global ft_strdup
extern malloc
extern ft_strlen
extern ft_strcpy
extern __errno_location

section .text
ft_strdup:
    CALL __errno_location  wrt ..plt     ; call __errno_location
	MOV byte [rax], 0              ; set errno to 0
    MOV r12, rdi            ; save pointer to r12

    CALL ft_strlen  wrt ..plt       ; call strlen
    ADD rax, 1          ; add for null

    MOV rdi, rax        ; move saved pointer to rdi for first argument
    CALL malloc  wrt ..plt          ;call malloc
    TEST rax, rax           ; check syscall error
    JZ .syscall_error

    MOV rsi, r12            ; move src pointer to rsi
    MOV rdi, rax            ; move new pointer to rdi
    CALL ft_strcpy  wrt ..plt       ; call ft_strcpy
    RET

.syscall_error:						; set errno and return -1
	NEG rax                     ; negate return value
    MOV rdx, rax                 ; save return value
	CALL __errno_location  wrt ..plt     ; call __errno_location
	MOV [rax], rdx              ; set errno
	MOV rax, 0                 ; return 0 or NULL
    RET