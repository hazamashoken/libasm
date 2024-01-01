# Registers

call-clobbered registers: volatile resgisters -> don't need to set back

call-preserved registers: non-volatile registers -> need to set back

```asm
; call-clobbered
rax     ;temp register; return value
rcx     ;used to pass 4th argument to functions
rdx     ;used to pass 3rd argument to functions
rsi     ;used to pass 2nd argument to functions
rdi     ;used to pass 1nd argument to functions
r8      ;used to pass 5nd argument to functions
r9      ;used to pass 6nd argument to functions
r10-r11 ;temporary

; call-preserved
rbx
rsp     ;stack pointer
rbp     ;base pointer
r12-r15

```
## Arguments
arguments to a function is pass as such for the 6 registers
the rest is push to the stack
same for accepting and sending arguments
```asm
rdi, rsi ,rdx, rcx, r8, r9
```

## System calls

```asm
mov rax, 1 ; system call number
mov rdi, 1 ; first argument
mov rsi, msg ; second argument
mov rdx, msg_len ; third argument
syscall ; call the kernel
```


## Full register table

| 64-bit | 32-bit | 16-bit | 8-bit |
|--------|--------|--------|-------|
| rax    | eax    | ax     | al    |
| rbx    | ebx    | bx     | bl    |
| rcx    | ecx    | cx     | cl    |
| rdx    | edx    | dx     | dl    |
| rdi    | edi    | di     | dl    |
| rbp    | ebp    | bp     | bpl   |
| rsp    | esp    | sp     | spl   |
| r8     | r8d    | r8w    | r8b   |
| r...   | r...d  | r...w  | r...b |
| r15    | r15d   | r15w   | r15b  |

# Operatiors

```asm
mov rbx, 123 ; rbx = 123
mov rax, rbx ; rax = rbx
add rbx, rcx ; rbx += rcx
sub rbx, rdx ; rbx -= rdx
mul rbx      ; rax *= rbx (multiplication is always done on rax)
div rdx      ; rax /= rdx (division is always done on rax)
```

# Memory

```asm
mov rax, [rbx] ; eax = *ebx
mov [rbx], rax ; *ebx = eax
```

# Stack

```asm
push rax ; push eax to the stack
pop rax  ; pop eax from the stack
```


## Jump instructions

```asm
je A, B     ; jupm if equal ==
jne A, B    ; jupm if not equal !=
jg A, B     ; jupm if greater >
jge A, B    ; jupm if greater or equal >=
jl A, B     ; jupm if less <
jle A, B    ; jupm if less or equal <=
```
