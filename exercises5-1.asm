    segment .data
a   dd      0x1f
b   dd      0x20
c   dd      0xff
d   dd      0xfe

    segment .text
    global  _start
_start:
    mov     eax, [a]    ; mov a into rax
    mov     ebx, [b]    
    mov     ecx, [c]
    mov     edx, [d]
    add     eax, ebx    ; add a, b, save in rax
    add     eax, ecx
    add     eax, edx
    ret