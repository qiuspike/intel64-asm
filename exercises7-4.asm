    segment .data
a   dq      1.25
sign db     0
exp dw      0
frac dq     0

    segment .text
    global  _start
_start:
    mov     rax, [a]
    mov     rbx, 0xfff  ; 12 bits 1
    shl     rbx, 52     ; shift left 52
    not     rbx         ; get mask for low 52 bits frac
    and     rbx, rax    ; selet frac by mask
    mov     rcx, 0x1
    shl     rcx, 52
    or      rbx, rcx
    mov     [frac], rbx

    shr     rax, 52
    mov     rcx, 0x800
    and     rcx, rax
    mov     [sign], cl
    and     rax, 0x7ff  ; 7 bits 1 as mask to select exp
    sub     rax, 1023   ; sub bias
    mov     [exp], ax

    ret
