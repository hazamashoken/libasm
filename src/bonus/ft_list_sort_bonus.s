; void	ft_list_sort(t_list **begin_list, int (*cmp)())
section .text
    global ft_list_sort

; Inputs:
;       rdi - t_list **begin_list pointer to the t_list
;       rsi - int (*cmp)(void *, void *) function pointer to cmp func
ft_list_sort:
                PUSH    rbx
                PUSH    r12

                TEST    rdi, rdi            ; check begin_list for NULL
                JZ      .return

                MOV     r12, [rdi]          ; first = *begin
                TEST    rsi, rsi            ; check cmp for NULL
                JZ      .set_list

.set_list:
                MOV     [rdi], r12

.return:
                POP     r12
                POP     rbx
                RET