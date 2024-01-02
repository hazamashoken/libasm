; ft_strcpy function
section .text
    global ft_strcpy

; rdi - const char *dst
; rsi - const char *src
; rax - const char* (return value)
; dl - rax in byte size
ft_strcpy:
                MOV     rax, rdi        ; set return value to dst
.loop:
                MOV     dl, [rsi]       ;  dl = *src
                MOV     [rdi], dl       ;  *dst = dl
                ADD     rdi, 1          ; dst += 1
                ADD     rsi, 1          ; src += 1
                TEST    dl, dl          ; if (*src == 0)
                JNZ     .loop

                RET
