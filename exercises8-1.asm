    segment .data
; a   times   10  dq  0 ; define of array
a   dd      1, 2, 3, 4
b   dd      1, 2, 3, 4
n   dd      4
p   dd      0

    segment .text
    global  _start
_start:
    mov     edx, [n]    ; mov n to rdx
    xor     ecx, ecx    ; init i = 0
    xor     r8d, r8d    ; mov 0 to r8, save p
    jmp     .comp
.for:
    mov     edi, [a + ecx * 4]
    mov     eax, [b + ecx * 4]
    imul    rax, rdi
    add     r8,  rax
    inc     ecx
.comp:
    cmp     ecx, edx
    jl      .for
    mov     [p], r8
    ret


;     mov     edx, [n]    ; mov n to rdx
;     xor     ecx, ecx    ; init i = 0
;     xor     r8d, r8d    ; mov 0 to r8, save p
; .for:
;     cmp     ecx, edx
;     jge     .end_for
;     mov     edi, [a + ecx * 4]
;     mov     eax, [b + ecx * 4]
;     imul    rax, rdi
;     add     r8,  rax
;     inc     ecx
;     jmp     .for
; .end_for:
;     mov     [p], r8
;     ret


;     lea     rdi, [a]    ; load address of array a
;     lea     rsi, [b]    ; load address of array b
;     mov     ecx, [n]    ; mov len of array to rcx
;     xor     r8d, r8d    ; mov 0 to r8, save p
; .L1
;     mov     eax, [rdi]
;     imul    eax, dword [rsi]
;     add     r8, rax     ; add ax * by to r8
;     add     rdi, 4
;     add     rsi, 4
;     dec     ecx
;     jg      .L1         ; condition jmp to loop
;     mov     [p], r8
;     ret



; 强化mul
; 实现多种结构的循环