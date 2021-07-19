movss   xmm0, [x]
movsd   [y], xmm1
movss   xmm2, xmm0

movups  xmm0, [x]
movups  ymm0, [x]
movupd  [a], xmm15

movss   xmm0, [a]
addss   xmm0, [b]
movss   [c], xmm0
movapd  xmm0, [a]
addpd   xmm0, [b]
movapd  [c], xmm0
movupd  ymm0, [a]
addpd   ymm0, [b]
movupd  [c], ymm0

movss   xmm0, [a]
subss   xmm0, [b]
movss   [c], xmm0
movapd  xmm0, [a]
subpd   xmm0, [b]
movapd  [c], xmm0
movapd  ymm0, [a]
subpd   ymm0, [b]
movapd  [c], ymm0

cvtss2sd    xmm0, [a]
addsd       xmm0, [b]
cvtsd2ss    xmm0, xmm0
movss       [c], xmm0

cvtss2si    eax, xmm0
cvtsi2sd    xmm0, rax
cvtsi2sd    xmm0, dword [x]

movss       xmm0, [a]
mulss       xmm0, [b]
ucomiss     xmm0, [c]
jbe         less_eq

movss       xmm0, [x]
maxss       xmm0, [y]
movapd      xmm0, [a]
minpd       xmm0, [b]


distance3d:
    movss   xmm0, [rdi]
    subss   xmm0, [rsi]
    mulss   xmm0, xmm0
    movss   xmm1, [rdi+4]
    subss   xmm1, [rsi+4]
    mulss   xmm1, xmm1
    movss   xmm2, [rdi+8]
    subss   xmm2, [rsi+8]
    mulss   xmm2, xmm2
    addss   xmm0, xmm1
    addss   xmm0, xmm2
    sqrtss  xmm0, xmm0
    ret

dot_product:
    movss   xmm0, [rdi]
    mulss   xmm0, [rsi]
    movss   xmm1, [rdi+4]
    mulss   xmm1, [rsi+4]
    addss   xmm0, xmm1
    movss   xmm2, [rdi+8]
    mulss   xmm2, [rsi+8]
    addss   xmm0, xmm2
    ret

horner:
    movsd   xmm1, xmm0
    movsd   xmm0, [rdi+rsi*8]
    cmp     esi, 0
    jz      done
more:
    subpd   esi, 1
    mulsd   xmm0, xmm1
    addsd   xmm0, [rdi+rsi*8]
    jnz     more
done:
    ret

