;         segment .data
; msg:    db      "Hello World!", 0x0a
; len:    equ     $ - msg
;         segment .text
;         global  main
;         extern  write, exit
; main:
;         mov     edi, 1
;         mov     rsi, msg
;         mov     edx, len
;         call    write
;         xor     edi, edi
;         call    exit


;         segment .data
; hello:  db      "Hello world!!!", 0x0a
;         segment .text
;         global  main
; main:
;         mov     eax, 1
;         mov     edi, 1
;         lea     rsi, [hello]
;         mov     edx, 15
;         syscall
;         mov     eax, 60
;         xor     edi, edi
;         syscall


;         segment .data
; fd:     dd      0
; name:   dd      "sample", 0
;         segment .text
;         extern  open
;         lea     rdi, [name]
;         mov     esi, 0x42
;         mov     rdx, 600o
;         call    open
;         cmp     eax, 0
;         jl      error
;         mov     [fd], eax
; error:


mov     edi, [fd]
xor     esi, esi
mov     edx, 2
call    lseek
mov     [size], rax
mov     rdi, rax
call    malloc
mov     [data], rax
mov     edi, [fd]
xor     esi, esi
xor     edx, edx
call    lseek
mov     edi, [fd]
mov     esi, [data]
mov     edx, [size]
call    read
mov     edi, [fd]
call    close

