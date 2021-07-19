    segment .data
x1  dq      4
y1  dq      2
x2  dq      4
y2  dq      8
x0  dq      0
y0  dq      0

    segment .text
    global  _start
_start:
    mov     rax, 0
    mov     rcx, 1
    mov     rdi, [x1]
    sub     rdi, [x2]
    cmovz   rax, rcx
    mov     [x0], rdi
    mov     rbx, [y1]
    sub     rbx, [y2]
    mov     [y0], rbx  
    ret