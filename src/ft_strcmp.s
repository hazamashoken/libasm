; ft_strcmp Function
; Inputs: rdi pointer to string 1
;         rsi pointer to string 2
; Outputs: rax 0 if strings are equal, a negative number if string 1 is less than string 2, a positive number if string 1 is greater than string 2
section .text
    global ft_strcmp

; Inputs:
;   rdi pointer to string 1
;   rsi pointer to string 2
; Outputs:
;   rax different in char value (return value)
; Cobblers:
;   rcx use to store value from pointer rsi (use for converting char to int for negative)
ft_strcmp:
    XOR rax, rax  ; set rax to 0
    XOR rcx, rcx  ; set rcx to 0

.loop:
    MOV al, byte [rdi]  ; mov and convert value to char
    MOV cl, byte [rsi]
    CMP al, 0           ; check if value is '\0'
    JE .return
    CMP cl, 0
    JE .return
    CMP al, cl          ; check if value is not equal
    JNE .return

    ADD rdi, 1          ; move pointer
    ADD rsi, 1
    JMP .loop

.return:
    SUB eax, ecx        ; get the different in dword size
    RET
