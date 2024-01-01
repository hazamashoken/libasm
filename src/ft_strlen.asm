; ft_strlen function
; Calculates the length of a null-terminated string
; Input: rdi - pointer to the null-terminated string
; Output: rax - length of the string
section .text
    global ft_strlen

; rdi - const char *str
; rax - len (return value)
ft_strlen:
    XOR rax, rax ; len = 0

.loop:                 ;
    CMP byte [rdi + rax], 0 ; while (*(str + len) != '\0') {
    JZ .exit
    ADD rax, 1               ; len += 1
    JMP .loop

.exit:
    RET