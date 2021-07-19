    segment .data
a   dd  4
b   dd  4.4
c   times   10 dd 0     ; define of array by times pseudo-op
d   dw  1, 2            ; define of array
e   db  0xfb
f   db  "hello world", 0 ; byte array initialized with a string and end with null

    segment .bss
g   resd    1           ; resd op-code, reserve double word
h   resd    10          ; 
i   resd    100

    segment .text
    global  main        ; let the linkder kown about main
main:
    push    rbp         ; set up a stack frame for main
    mov     rbp, rsp    ; set rbp to pointe to the stack frame
    sub     rsp, 16     ; leave some room for local variables
                        ; leave rsp on a 16 byte boundary
    xor     eax, eax    ; set rax to 0 for return value
    leave               ; undo the stack frame manipulations
    ret

    