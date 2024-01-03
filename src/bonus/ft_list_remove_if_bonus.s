struc t_list
    .data:   resq    1
    .next:   resq    1
endstruc
section .text
    global  ft_list_remove_if
    extern free

; Inputs:
;       rdi - **begin_list
;       rsi - *data_ref
;       rdx - *cmp
;       rcx - *free_fct
; Cobblers:
;
ft_list_remove_if:
                PUSH    rbx                         ; **begin_list
                PUSH    r12                         ; *data_ref
                PUSH    r13                         ; *cmp
                PUSH    r14                         ; elem
                PUSH    r15                         ; prev
                PUSH    rbp                         ; *free_fct(void*)

                MOV     rbx, rdi                    ; *begin_list
                MOV     r12, rsi                    ; data_ref
                MOV     r13, rdx                    ; cmp
                MOV     rbp, rcx                    ; free_fct

                XOR     r15, r15                    ; prev = 0
                MOV     r14, [rbx]                  ; elem = *begin_list

                JMP     .remove_loop
.remove_next:
                MOV     r15, r14                    ; prev = elem
                MOV     r14, [r14 + t_list.next]    ; elem = prev->next
                JMP     .remove_loop

.found_match:
                CMP     r14, [rbx]                  ; if (elem == *begin_list)
                JNE     .set_prev
.set_head:                                          ; else
                MOV     r8, [r14 + t_list.next]
                MOV     [rbx], r8                   ; *begin_list = elem->next
                JMP     .free_elem
.set_prev:
                MOV     rcx, [r14 + t_list.next]    ; tmp = elem->next
                MOV     [r15 + t_list.next], rcx    ; prev->next = tmp
.free_elem:
                MOV     rdi, [r14 + t_list.data]    ; arg = elem->data
                CALL    rbp                         ; (*free_fct)(arg);
                MOV     rdi, r14                    ; arg = elem
                CALL    free wrt ..plt              ; free(arg)
                MOV     r14, [rbx]                    ; elem = *begin_list
.remove_loop:
                TEST    r14, r14                    ; while (elem != 0)
                JZ      .return
                MOV     rdi, [r14 + t_list.data]    ; arg1 = elem->data
                MOV     rsi, r12                    ; arg2 = data_ref
                CALL    r13                         ; cmp(arg1, arg2)
                CMP     rax, 0
                JE      .found_match                ; == 0
                JMP     .remove_next
.return:
                POP     rbp
                POP     r15
                POP     r14
                POP     r13
                POP     r12
                POP     rbx
                RET