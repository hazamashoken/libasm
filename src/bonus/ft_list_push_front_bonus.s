; void	ft_list_push_front(t_list **begin_list, void *data)

;;;;;;;;;;;;;;;;;;;;;;

section .data
    struc s_list
        .data:   resq    1
        .next:   resq    1
    endstruc

    t_list_size     equ     $ - s_list


;;;;;;;;;;;;;;;;;;;;;;;

section .text
    global ft_list_push_front
    extern malloc
    extern __errno_location

;   Inputs: rdi - **begin_list
;           rsi - *data
ft_list_push_front:
                PUSH    rdi                         ; begin
                PUSH    rsi                         ; data

.malloc_list:
                MOV     rdi, 16                     ; sizeof(t_list) 16UL
                XOR     rax, rax
                CALL    malloc wrt ..plt            ; malloc(16)
                POP     rsi
                POP     rdi
                TEST    rax, rax                    ; if (!elem)
                JZ     .call_errno                      ;   set errno

.set_data:
                MOV     [rax], rsi                  ; elem->data = data
                MOV     rcx, [rdi]
                MOV     [rax + 8], rcx              ; elem->next = *begin_list
                MOV     [rdi], rax                    ; *begin_list = elem ?

.call_errno:
                PUSH    rax
	            CALL    __errno_location  wrt ..plt ; call __errno_location
	            MOV     byte [rax], 0               ; set errno
                POP     rsi
                NEG     r13
                MOV     [rax], rsi

.return:
                RET