    segment .data
x   dq      1.0
n   dq      1
    segment .text
    global  main
    extern  scanf
    extern  printf
main:
    push    rbp
    mov     rbp, rsp
    segment .data
.scanf  db      "%lf %lf",0
; .prompt db      "Enter 2 floating point numbers: ",0
.printf db      "sin(x) = %lf", 0x0a, 0
    segment .text
.more:
    ; lea     rdi, [.scanf]
    ; lea     rsi, [x]
    ; lea     rdx, [n]
    ; xor     eax, eax
    ; call    scanf
    ; cmp     ax, 2
    ; jne     .end
    movsd   xmm0, qword [x]
    mov     rdi, [n]
    mov     eax, 1
    call    sin
    lea     rdi, [.printf]
    mov     rax, 1
    call    printf
    ; jmp     .more
.end:
    leave
    ret

;       compute sin(x) by Taylor's series
;       x at xmm0, n at rdi, return at xmm0
sin:
    mov     ecx, 1      ; count
    mov     edx, 1      ; n!
    mov     ebx, 1      ; sign
    movsd   xmm1, xmm0  ; xmm1 save x
    cvtsi2sd   xmm2, rcx     ; xmm2 save x^n
    xor     rax, rax
    cvtsi2sd   xmm0, rax
 .more:
    mulsd   xmm2, xmm1
    imul    rdx, rcx
    test    rcx, 0x1    ; even or odd
    jnz     .continue
    movsd   xmm3, xmm2
    cvtsi2sd    xmm4, rdx
    cvtsi2sd    xmm5, rbx
    mulsd   xmm3, xmm5
    divsd   xmm3, xmm4
    addsd   xmm0, xmm3
    neg     ebx
.continue:
    inc     rcx
    cmp     rcx, rdi
    jle     .more
    ret
    