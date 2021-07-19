    segment .data
a   db      0x5a

    segment .text
    global  _start
_start:
    mov     cl, 0
    mov     al, [a]
.L1:
    mov     bl, 0x1
    and     bl, al
    add     cl, bl
    shr     al, 1
    cmp     al, 0
    jnz     .L1
    ret
