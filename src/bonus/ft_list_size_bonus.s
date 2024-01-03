; int	ft_list_size(t_list *begin_list)
struc t_list
    .data:   resq    1
    .next:   resq    1
endstruc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section .text
    global  ft_list_size

; Inputs:
;       rdi - *begin_list
; Output:
;       rax - list size
ft_list_size:
                XOR     rax, rax                ; int i = 1;
                CMP     rdi, 0
                JE      .return
.size_loop_inc:
                ADD     rax, 1                  ; i++
.size_loop:
                MOV     rdx, [rdi + t_list.next]          ; list_next = begin_list->next
                CMP     rdx, 0                  ; if (!list_next)
                JE      .return                 ; return i
                MOV     rdi, rdx                ; begin_list = list_next
                JMP     .size_loop_inc
.return:
                RET