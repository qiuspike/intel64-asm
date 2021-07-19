    segment .data
c   dd      500
printf_format   db      "a = %d, b = %d, c = %d", 0x0a, 0

    segment .text
    global  pythagorean_triple
    global  main
    extern  printf
main:
    push    rbp
    mov     rbp, rsp
    mov     r12, 3      ; start at 3
    mov     r13d, [c]   ; end at 500
    jmp     .comp
.for:
    mov     rdi, r12    ; pass arg
    call    pythagorean_triple
    inc     r12
.comp:
    cmp     r12, r13
    jle     .for
    xor     eax, eax
    leave
    ret

pythagorean_triple:
    mov     ecx, edi    ; mov c to ecx
    imul    edi, edi    ; save c^2 to edi
    mov     eax, 1      ; eax for a
    jmp     .cmp1
.loop1:
    mov     ebx, eax
    inc     ebx         ; b = a + 1
    jmp     .cmp2
.loop2:
    mov     r8d, eax    ; r8d for a^2
    imul    r8d, r8d
    mov     r9d, ebx    ; r9d fro b^2
    imul    r9d, r9d
    add     r9d, r8d    ; a^2 + b^2
    cmp     r9d, edi
    jne     .continue
    lea     rdi, [printf_format]    ; set arg1 for printf
    mov     rsi, rax                ; set arg2 for printf
    mov     rdx, rbx                ; set arg3 for printf
    mov     rcx, rcx                ; set arg4 for printf
    xor     eax, eax                ; set rax to 0
    call    printf
    jmp     .end
.continue:
    cmp     r9d, edi
    jg      .end
    inc     ebx
.cmp2:
    cmp     ebx, ecx
    jl      .loop2    
    inc     eax
.cmp1:
    cmp     eax, ecx
    jl      .loop1
.end:
    ret
