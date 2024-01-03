; char *ft_strdup(const char *s);
section .text
    global ft_strdup
    extern malloc
    extern ft_strlen
    extern ft_strcpy
    extern __errno_location

; Input: rdi - pointer to string to be copy
; Output: rax - pointer to new allocated pointer with copied value from rdi
; Preserved:
;   r12 - save src pointer
; Cobblers:
;   rdi - first arguemt for ft_strlen as the pointer to src string
;       - first argument for malloc as len of teh src string + 1
;       - first argument for ft_strcpy as the pointer of the dest string
;   rsi - second argument for ft_strcpy as the pointer to the src string
ft_strdup:
                PUSH    r12
                MOV     r12, rdi

                CALL    ft_strlen  wrt ..plt        ; call strlen
                ADD     rax, 1                      ; add for null

                MOV     rdi, rax                    ; move saved pointer to rdi for first argument
                CALL    malloc  wrt ..plt           ; call malloc
                TEST    rax, rax                    ; check syscall error
                JZ      .set_errno

                MOV     rsi, r12                    ; move src pointer to rsi
                MOV     rdi, rax                    ; move new pointer to rdi
                CALL    ft_strcpy  wrt ..plt        ; call ft_strcpy
                MOV     r12, rax
                XOR     rax, rax

.set_errno:						                    ; set errno and return -1
	            NEG     rax                         ; negate return value
                MOV     rdx, rax                    ; save return value
	            CALL    __errno_location  wrt ..plt ; call __errno_location
	            MOV     [rax], rdx                  ; set errno

                TEST    rdx, rdx
                JZ      .success_return

	            MOV     rax, 0                      ; return 0 or NULL
                JMP     .return

.success_return:
                MOV     rax, r12

.return:
                POP     r12
                RET