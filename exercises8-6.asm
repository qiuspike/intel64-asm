    segment .data
c   dd      5
a   dd      0
b   dd      0

    segment .text
    global  main
main:
    mov     ecx, [c]    ; mov c to ecx
    mov     edi, ecx
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
    mov     [a], eax    ; found, save a, b
    mov     [b], ebx
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
