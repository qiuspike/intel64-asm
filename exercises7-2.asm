    segment .data
a   dq      24
b   dq      30

    segment .text
    global  _start
_start:
    mov     rcx, a
    mov     rax, [a]
    mov     rbx, [b]
    xor     rax, rbx
    xor     rbx, rax
    xor     rax, rbx
    mov     [a], rax
    mov     [b], rbx
    ret