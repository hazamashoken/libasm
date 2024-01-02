; ft_strcpy function
; Copy the string pointed to by src, including the terminating null byte ('\0'), to the buffer pointed to by dest.
; Input: rdi - pointer to the null-terminated string, dst
;        rsi - pointer to the null-terminated string, src
; Output: rax - pointer to the null-terminated string, dst
section .text
    global ft_strcpy

; rdi - const char *dst
; rsi - const char *src
; rax - const char* (return value)
ft_strcpy:
    MOV rax, rdi    ; set return value to dst

.loop:
; dl - rax in byte size
    MOV dl, [rsi]           ;  dl = *src
    MOV [rdi], dl           ;  *dst = dl
    ADD rdi, 1                 ; dst += 1
    ADD rsi, 1                 ; src += 1
    TEST dl, dl             ; if (*src == 0)
    JNZ .loop

    RET
