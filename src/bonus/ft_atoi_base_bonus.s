; int	ft_atoi_base(char *str, char *base)
; Inputs:
;   rdi - char *str: the string of number 
;   rsi - char *base: the string of number base rdi is based on
; OutPut:
;   rax - the integer value of the string number 
global ft_atoi_base
extern 

section .text
; Inputs:
;   rdi - char *str: the string of number 
;   rsi - char *base: the string of number base rdi is based on
; Output:
;   rax - the integer value of the string number 
; Cobblers:
;   rbx - store the pointer to string of number
;   r12 - store the pointer to the base string
;   r15 - use to store the integer value for return
ft_atoi_base:
    PUSH rbx        ; save for sign
    PUSH r12        ; save for base_len
    MOV r12, rsi
    XOR r15, r15 

 