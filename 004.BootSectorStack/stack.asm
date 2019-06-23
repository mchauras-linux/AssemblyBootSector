mov ah, 0x0e; tty mode

mov bp, 0x8000 ; make it far away from ox7c00 so that stack doesnt overlaps
mov sp, bp ; Base pointer and stack pointer will point to the same address

;Store values in stack
push 'A'
push 'B'
push 'C'

mov al, ' '
int 0x10

mov al, '1'
int 0x10

mov al, ':'
int 0x10

; To show how the stack gros downwards
mov al, [0x7ffe] ; 8000-2
int 0x10


; You cannot access stack top so dont bother
mov al, [0x8000]
int 0x10



mov al, ' '
int 0x10

mov al, '2'
int 0x10

mov al, ':'
int 0x10

;recover characters from our stack
pop bx
mov al, bl
int 0x10 ; prints C

mov al, ' '
int 0x10

mov al, '3'
int 0x10

mov al, ':'
int 0x10

;recover characters from our stack
pop bx
mov al, bl
int 0x10 ; prints B

mov al, ' '
int 0x10

mov al, '4'
int 0x10

mov al, ':'
int 0x10

;recover characters from our stack
pop bx
mov al, bl
int 0x10 ; prints A

mov al, ' '
int 0x10

mov al, '5'
int 0x10

mov al, ':'
int 0x10

;Data has been removed so its garbage now
mov al, [0x8000]
int 0x10


times 510 - ($ - $$) db 0
dw 0xAA55
