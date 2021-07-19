    segment .data
x   dq          0
scanf_formaat   db      "%ld", 0
printf_format   db      "fact(%ld) = %ld", 0x0a, 0

    segment .text
    global  main        ; tell linker about main
    global  fact        ; tell world about fact
    extern  scanf       ; resolve scanf and printf from libc
    extern  printf
main:
    push    rbp
    mov     rbp, rsp
    lea     rdi, [scanf_formaat]    ; set arg1 for scanf
    lea     rsi, [x]                ; set arg2 for scanf
    xor     eax, eax                ; set rax to 0
    call    scanf
    mov     rdi, [x]                ; mov x for fact call
    call    fact
    lea     rdi, [printf_format]    ; set arg1 for printf
    mov     rsi, [x]                ; set arg2 for printf
    mov     rdx, rax                ; set arg3 to be x
    xor     eax, eax                ; set rax to 0
    call    printf
    xor     eax, eax                ; set return value to 0
    leave
    ret

fact:                   ; recursive function
n   equ     8
    push    rbp
    mov     rbp, rsp
    sub     rsp, 16     ; make room for storing n
    cmp     rdi, 1      ; compare argument with 1
    jg      greater     ; if n <= 1, return 1
    mov     eax, 1      ; set return value to 1
    leave
    ret
greater:
    mov     [rsp + n], rdi  ; save n
    dec     rdi             ; call fact with n-1
    call    fact
    mov     rdi, [rsp + n]  ; restore original n
    imul    rax, rdi        ; multiply fact(n-1)*n
    leave
    ret

