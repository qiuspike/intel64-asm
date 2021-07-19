    segment .data
a   times   10  dq  0
b   db      "hello", 0

    segment .bss
c   resw    5

    segment .text
    global _start
_start:
    ret
