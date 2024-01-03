; int	ft_atoi_base(char *str, char *base)
; Inputs:
;   rdi - char *str: the string of number
;   rsi - char *base: the string of number base rdi is based on
; OutPut:
;   rax - the integer value of the string number

section .text
    global ft_atoi_base
; Inputs:
;   rdi - char *str: the string of number
;   rsi - char *base: the string of number base rdi is based on
; Output:
;   rax - the integer value of the string number
; Cobblers:
;   r8  - check_valid index
;       - base index
;   r9  - cmp dup value
;       - atoi index
;   r10 - store atoi value before adding to rax
; Preserved:
;   r12 - base_len
;   rbx - sign
ft_atoi_base:
                PUSH    rbx                     ; save for sign
                PUSH    r12                     ; save for base_len
                XOR     rax, rax                ; ret = 0
                XOR     rbx, rbx                ; sign = 0
                XOR     r12, r12                ; base_len = 0
                JMP     .check_base_loop

.check_base_inc:
                ADD     r12, 1
.check_base_loop:
                CMP     byte [rsi + r12], 0     ; base[len] != 0
                JZ      .end_check
                MOV     r8, r12                 ; i = base_len

.check_dup_inc:
                ADD     r8, 1                   ; i++
.check_dup_loop:                                ; while (base[i] != '\0')
                CMP     byte [rsi + r8], 0
                JZ      .check_char
                MOV     r9b, [rsi + r8]         ;
                CMP     byte [rsi + r12], r9b   ; base[base_len] == base[i]
                JE      .set_neg
                JMP     .check_dup_inc

.check_char:                                    ; if ((base[i] >= 9 && base[i] <= 13) || base[i] == ' ' || base[i] == '+' || base[i] == '-')
                CMP     byte [rsi + r12], 32    ; ' '
                JE      .set_neg
                CMP     byte [rsi + r12], 43    ; '+'
                JE      .set_neg
                CMP     byte [rsi + r12], 45    ; '-'
                JE      .set_neg
                CMP     byte [rsi + r12], 9     ; '\t'
                JE      .set_neg
                CMP     byte [rsi + r12], 10    ; '\n'
                JE      .set_neg
                CMP     byte [rsi + r12], 11    ; '\v'
                JE      .set_neg
                CMP     byte [rsi + r12], 12    ; '\f'
                JE      .set_neg
                CMP     byte [rsi + r12], 13    ; '\r'
                JE      .set_neg
                JMP     .check_base_inc

.end_check:
                CMP     r12, 1                  ; if (len < 2)
                JLE     .set_neg
                XOR     r8, r8                  ; i = 0;
                JMP     .skip_whitespaces

.skip_whitespaces_inc:
                ADD     r8, 1                   ; i++
.skip_whitespaces:
                CMP     byte [rdi + r8], 32     ; ' '
                JE      .skip_whitespaces_inc
                CMP     byte [rdi + r8], 9      ; '\t'
                JE      .skip_whitespaces_inc
                CMP     byte [rdi + r8], 10     ; '\n'
                JE      .skip_whitespaces_inc
                CMP     byte [rdi + r8], 11     ; '\v'
                JE      .skip_whitespaces_inc
                CMP     byte [rdi + r8], 12     ; '\f'
                JE      .skip_whitespaces_inc
                CMP     byte [rdi + r8], 13     ; '\r'
                JE      .skip_whitespaces_inc
                JMP     .check_sign

.is_neg:
                XOR     bl, 0x00000001
.is_pos:
                ADD     r8, 1

.check_sign:
                CMP     byte [rdi + r8], 45     ; '-'
                JE      .is_neg
                CMP     byte [rdi + r8], 43     ; '+'
                JE      .is_pos
                JMP     .atoi_loop

.atoi_inc:
                ADD     r8, 1                   ; i++
.atoi_loop:
                CMP     byte [rdi + r8], 0      ; while (str[i] != 0)
                JE      .set_neg
                XOR     r9, r9
                JMP     .atoi_idx

.atoi_idx_inc:
                ADD     r9, 1
.atoi_idx:
                MOV     r10b, byte[rsi + r9]
                CMP     r10b, 0                 ; base[j] == 0
                JE      .set_neg
                CMP     byte [rdi + r8], r10b   ; base[j] == str[i]
                JNE     .atoi_idx_inc

.add:
                MUL     r12                     ; ret *= base_len
                ADD     rax, r9                 ; total += k
                JMP     .atoi_inc

.set_neg:
                CMP     rbx, 0
                JZ      .return
                NEG     rax

.return:
                POP     r12
                POP     rbx
                RET