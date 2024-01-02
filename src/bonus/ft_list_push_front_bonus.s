; void	ft_list_push_front(t_list **begin_list, void *data)

;;;;;;;;;;;;;;;;;;;;;;

struc s_list
    data:   resq    1
    next:   resq    1
endstruc

;;;;;;;;;;;;;;;;;;;;;;;

section .bss
    aBss:  resw    1

    pStru:  resq    1

    zBss:   resd    1

section .text
    global ft_list_push_front
    extern malloc
    extern __errno_location

ft_list_push_front:
                PUSH    rbx
                PUSH    r12
                PUSH    r13
                MOV     rbx, rdi
                MOV     r12, rsi

                MOV     rax, 16
                CALL    malloc wrt ..plt
                MOV     r13, rax



.call_errno:
	            CALL    __errno_location  wrt ..plt ; call __errno_location
	            MOV     byte [rax], 0               ; set errno
                TEST    r13, r13
                JZ      .set_error

                MOV     rax, r13
.return:
                POP     r13
                POP     r12
                POP     rbx
                RET