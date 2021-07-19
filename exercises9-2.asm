    segment .data
n       dd      10  ; arr len
printf_format   db  "%d ", 0
printf_end      db  "", 0x0a, 0

    segment .bss
arr     resd    10  ; arr at .bss

    segment .text
    global  main
    global  fill_arr
    global  print
    global  bubble_sort
    extern  printf
    extern  rand

    ; 各个函数，分别调试运行
main:
    push    rbp
    mov     rbp, rsp
    lea     rdi, [arr]
    mov     esi, [n]
    push    rdi
    push    rsi
    call    fill_arr
    pop     rsi
    pop     rdi
    push    rdi
    push    rsi
    call    print
    pop     rsi
    pop     rdi
    push    rdi
    push    rsi
    call    bubble_sort
    pop     rsi
    pop     rdi
    push    rdi
    push    rsi
    call    print
    leave
    ret


; arr address at rdi, arr len at rsi
bubble_sort:                    ; bubble_sort function
    push    rbp
    mov     rbp, rsp
.loop1:
    mov     dl,  0              ; swapped = false
    xor     ecx, ecx            ; i = 0
    mov     r8,  rdi
    mov     ebx, esi
    dec     ebx                 ; mov n-1 to ebx
    jmp     .comp               ; jump to i < n-1
.loop2:
    mov     edi, [r8+rcx*4]      ; mov a[i] to edi
    mov     esi, [r8+rcx*4+4]    ; mov a[i+1] to esi
    cmp     edi, esi
    jle     .continue
    mov     [r8+rcx*4], esi
    mov     [r8+rcx*4+4], edi
    mov     dl,  1
.continue:
    inc     ecx                 ; i++
.comp:
    cmp     ecx, ebx
    jl      .loop2
    cmp     dl, 0
    jnz     .loop1              ; swapped = true, loop
    leave
    ret


; arr address at rdi, arr len at rsi
print:                          ; print function
    push    rbp
    mov     rbp, rsp
    push    r12                 ; save r12, r13
    push    r13
    mov     r12, rdi
    mov     r13, rsi
    xor     ecx, ecx            ; set ecx to 0, i = 0
    jmp     .comp
.for:
    lea     rdi, [printf_format]; arg1 for printf
    mov     rsi, [r12+rcx*4]    ; arg2 for printf
    xor     eax, eax            ; set rax to 0
    push    rcx
    call    printf
.comp:
    pop     rcx
    cmp     rcx, r13            ; i < n
    jl      .for
    lea     rdi, [printf_end]   ; arg1 for printf
    xor     eax, eax            ; set rax to 0
    call    printf
    xor     eax, eax
    leave
    ret


; arr address at rdi, arr len at rsi
fill_arr:                       ; genarate random integers and fill arr function
    push    rbp
    mov     rbp, rsp
    push    r12
    push    r13                 ; save r12, r13
    mov     r12, rdi
    mov     r13, rsi
    xor     ecx, ecx            ; set ecx to 0, i = 0
    jmp     .comp
.for:
    push    rcx
    call    rand
    mov     [r12+rcx*4], rax    ; fill arr[i]
.comp:
    pop     rcx
    cmp     rcx, r13            ; i < n
    jl      .for
    xor     eax, eax
    leave
    ret



