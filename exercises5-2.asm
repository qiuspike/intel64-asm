    segment .data
a   db      0xff
b   dw      0xfffe
c   dd      0x10
d   dq      0x20

    segment .text
    global  _start
_start:
    push    rbp
    mov     rbp, rsp
    sub     rsp, 8
    movsx   rax, byte   [a]    ; mov byte, sign extend
    movsx   rbx, word   [b]
    movsxd  rcx, dword  [c]
    mov     rdx, [d]
    add     rax, rbx
    add     rax, rcx
    add     rax, rdx
    mov     [rsp], rax
    leave
    ret