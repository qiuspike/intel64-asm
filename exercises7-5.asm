    segment .data
f1  dq  1.25
f2  dq  1.0
p   dq  0.0

    segment .text
    global  _start
_start:
    mov     rax, [f1]
    mov     rbx, 0xfff
    shl     rbx, 52
    not     rbx
    and     rbx, rax 
    mov     rcx, 0x1
    shl     rcx, 52
    or      rbx, rcx
    mov     rdi, rbx

    mov     rax, [f2]
    mov     rbx, 0xfff
    shl     rbx, 52
    not     rbx
    and     rbx, rax 
    mov     rcx, 0x1
    shl     rcx, 52
    or      rbx, rcx

    mov     rax, rbx
    mul     rdi         ; rdi, low 52 bits, frac


    mov     rax, [f1]
    shr     rax, 52
    mov     rcx, 0x800
    and     rcx, rax
    mov     rdx,  rcx

    and     rax, 0x7ff
    sub     rax, 1023
    mov     rsi, rax
    
    mov     rax, [f2]
    shr     rax, 52
    mov     rcx, 0x800
    and     rcx, rax

    and     rax, 0x7ff
    sub     rax, 1023

    add     rsi, rax
    add     rsi, 1023    ; rsi, low 11 bits, exp

    xor     rdx,  rcx    ; rdx, low 1 bit, sign


    and     rsi, 0x7ff
    and     rdx, 0x1
    shl     rdx, 11
    or      rsi, rdx

    mov     rbx, 0xfff
    shl     rbx, 52
    not     rbx
    and     rdi, rbx

    shl     rsi, 52
    or      rdi, rsi
    mov     [p], rdi

    ret