    segment .data
g1  dq      78
g2  dq      90
g3  dq      80
g4  dq      59
ave dq      0
rem dq      0

    segment .text
    global  _start
_start:
    mov     rdi, [g1]
    mov     rax, [g1]
    add     rax, [g2]
    add     rax, [g3]
    add     rax, [g4]
    mov     rdx, 0
    mov     rcx, 4
    div     rcx
    mov     [ave], rax
    mov     [rem], rdx
    ret