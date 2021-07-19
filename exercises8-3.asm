    segment .data
a   dd      2, 3, 7, 12, 43, 8, 9, 12
n   dd      8

    segment .text
    global  main
main:
.loop1:
    mov     dl,  0          ; swapped = false

    xor     ecx, ecx        ; i = 0
    mov     ebx, [n]
    dec     ebx             ; mov n-1 to ebx
    jmp     .comp           ; jump to i < n-1
.loop2:
    mov     edi, [a+ecx*4]  ; mov a[i] to edi
    mov     esi, [a+ecx*4+4] ; mov a[i+1] to esi
    cmp     edi, esi
    jle     .continue
    mov     [a+ecx*4], esi
    mov     [a+ecx*4+4], edi
    mov     dl,  1
.continue:
    inc     ecx             ; i++
.comp:
    cmp     ecx, ebx
    jl      .loop2

    cmp     dl, 0
    jnz     .loop1          ; swapped = true, loop
    leave
    ret
