    segment .data
f times       100 dq 0

    segment .text
    global  _start
_start:
    mov     dword [f], 0
    mov     dword [f + 8], 1
    mov     ecx, 2          ; set ecx 2, as index of f
    mov     r8, 0           ; set f0, r8 for f(i - 2)
    mov     r9, 1           ; set f1, r9 f(i - 1)
.for:
    mov     r10, r8
    add     r10, r9         ; f(i)
    cmp     r10, r9
    jl      .end
    ; pushf
    ; pop     ax
    ; test    ax, 0x0800
    ; jnz     .end
    mov     [f + ecx * 8], r10 ; save f(i) to memory
    mov     r8, r9
    mov     r9, r10
    inc     ecx
    jmp     .for
.end:
    ret