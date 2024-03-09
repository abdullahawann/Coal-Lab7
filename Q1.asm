[org 0x0100]

jmp start

delayfunc:
push cx
mov cx, 0x4FFF

delayDec:
dec cx
jnz delayDec
pop cx
dec cx
jnz delayfunc

ret

start:
call delayfunc

mov ax, 0x4c00
int 0x21