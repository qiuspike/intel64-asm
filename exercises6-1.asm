    segment .data
x1  dq      3
y1  dq      2
x2  dq      -4
y2  dq      8
dis dq      0

    segment .text
    global  _start
_start:
    mov     rax, [x1]
    sub     rax, [x2]
    imul    rax, rax
    mov     rbx, [y1]
    sub     rbx, [y2]
    imul    rbx, rbx
    add     rax, rbx
    mov     [dis], rax
    ret
