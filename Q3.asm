[org 0x0100]
jmp start 
msg1: db 'Name : M Abdullah Awan', 0
msg2: db 'Institute : FAST NUCES', 0
msg3: db 'Batch : 2021', 0
msg4: db 'Roll # 21L-5663', 0
msg5: db 'Email ID : l215663@lhr.nu.edu.pk', 0
msg6: db 'Address : Lahore, Pakistan', 0
msg7: db 'Features : Punctual, Honest and determined', 0

;-------------------------------------------------------------------------------------------------------------------------------------------

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

;-------------------------------------------------------------------------------------------------------------------------------------------

clrscr: 
push es 
push ax 
push cx 
push di 
mov ax, 0xb800 
mov es, ax 
xor di, di 
mov ax, 0x0720 
mov cx, 2000 
cld 
rep stosw 
pop di
pop cx 
pop ax 
pop es
 
ret

;----------------------------------------------------------------------------------------------------------------------------------------------------

printstr: 
push bp 
mov bp, sp 
push es 
push ax 
push cx 
push si 
push di 
push ds 
pop es
mov di, [bp+4]
mov cx, 0xffff 
xor al, al
repne scasb 
mov ax, 0xffff
sub ax, cx 
dec ax  
jz exit 
mov cx, ax  
mov ax, 0xb800 
mov es, ax 
mov al, 80 
mul byte [bp+8] 
add ax, [bp+10] 
shl ax, 1 
mov di, ax 
mov si, [bp+4] 
mov ah, [bp+6] 
cld 

nextchar: 
lodsb 
stosw  
loop nextchar 
 
exit: 
pop di 
pop si 
pop cx 
pop ax 
pop es
pop bp
ret 8

;---------------------------------------------------------------------------------------------------------------------------------------------

scrollup:
push bp 
mov bp, sp 
push ax 
push cx 
push si 
push di 
push es 
push ds 
mov ax, 80  
mul byte [bp+4]  
mov si, ax
push si
shl si, 1  
mov cx, 2000  
sub cx, ax  
mov ax, 0xb800 
mov es, ax 
mov ds, ax  
mov di, di
cld  
rep movsw 
mov ax, 0x0720  
pop cx
rep stosw
pop ds 
pop es 
pop di 
pop si 
pop cx 
pop ax 
pop bp 

ret 2

;--------------------------------------------------------------------------------------------------------------------------------------------

start: 
call clrscr
mov cx, 0x0110
call delayfunc
mov ax, 30
push ax
mov ax, 16
push ax
mov ax, 9
push ax
mov ax, msg1
push ax
call printstr
mov ax, 1
push ax
call scrollup
mov cx, 0x0110
call delayfunc
mov ax, 29
push ax
mov ax, 16
push ax
mov ax, 9
push ax
mov ax, msg2
push ax
call printstr
mov ax, 1
push ax
call scrollup
mov cx, 0x0110
call delayfunc
mov ax, 28
push ax
mov ax, 16
push ax
mov ax, 9
push ax
mov ax, msg3
push ax
call printstr
mov ax, 1
push ax
call scrollup
mov cx, 0x0110
call delayfunc
mov ax, 27
push ax
mov ax, 16
push ax
mov ax, 9
push ax
mov ax, msg4
push ax
call printstr
mov ax, 1
push ax
call scrollup
mov cx, 0x0110
call delayfunc
mov ax, 26
push ax
mov ax, 16
push ax
mov ax, 9
push ax
mov ax, msg5
push ax
call printstr
mov ax, 1
push ax
call scrollup
mov cx, 0x0110
call delayfunc
mov ax, 25
push ax
mov ax, 16
push ax
mov ax, 9
push ax
mov ax, msg6
push ax
call printstr
mov ax, 1
push ax
call scrollup	
mov cx, 0x0110
call delayfunc
mov ax, 24
push ax
mov ax, 16
push ax
mov ax, 9
push ax
mov ax, msg7
push ax
call printstr
mov ax, 1
push ax
call scrollup
	
mov ax, 0x4c00  
int 0x21
