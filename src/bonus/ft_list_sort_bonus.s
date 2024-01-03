; void	ft_list_sort(t_list **begin_list, int (*cmp)())
struc t_list
    .data:   resq    1
    .next:   resq    1
endstruc
section .text
    global ft_list_sort
    extern printf
; Inputs:
;       rdi - t_list **begin_list pointer to the t_list
;       rsi - int (*cmp)(void *, void *) function pointer to cmp func
ft_list_sort:
                PUSH    rbx                                 ; current
                PUSH    r12                                 ; inner

                TEST    rdi, rdi                            ; check begin_list for NULL
                JZ      .return
                TEST    rsi, rsi                            ; check cmp for NULL
                JZ      .return
                MOV     rbx, [rdi]                          ; current = *begin_list;
                TEST    rbx, rbx
                JZ      .return
                JMP     .list_loop

.list_next:
                MOV     rcx, [rbx + t_list.next]            ; tmp = current->next
                MOV     rbx, rcx                            ; current = tmp
.list_loop:
                TEST    rbx, rbx                            ; while(current)
                JZ      .return
                MOV     r12, [rdi]                          ; inner = *begin_list
                JMP     .swap_loop

.swap_next:
                MOV     rcx, [r12 + t_list.next]            ; tmp = inner->next
                MOV     r12, rcx                            ; inner = tmp
.swap_loop:
                CMP     qword [r12 + t_list.next], 0        ; while (inner->next)
                JE     .list_next
                PUSH    rdi                                 ; save begin_list before call
                PUSH    rsi                                 ; save cmp before call
                MOV     rax, rsi                            ; move cmp to non preseverd register
                MOV     rdx, [r12 + t_list.next]            ; tmp = inner->next
                MOV     rdi, [r12 + t_list.data]            ; arg1 = inner->data
                MOV     rsi, [rdx + t_list.data]            ; arg2 = inner->next->data
                CALL    rax                                 ; call cmp(arg1, arg2)
                POP     rsi
                POP     rdi
                JG      .swap
                JMP     .swap_next

.swap:
                MOV     rcx, [r12 + t_list.next]            ; tmp = inner->next
                MOV     rdx, [r12 + t_list.data]            ; swap = inner->data
                MOV     r8,  [rcx + t_list.data]            ; swap2 = tmp->data
                MOV     [r12 + t_list.data], r8            ; inner->data = swap2
                MOV     [rcx + t_list.data], rdx             ; tmp->data = swap
                JMP     .swap_next

.return:
                POP     r12
                POP     rbx
                RET