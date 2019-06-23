[org 0x7c00]

call init
mov ah, 0x0e ; tty

mov al, [the_secret]
int 0x10 ; we already saw this doesn't work, right?

mov bx, 0x7c0 ; remember, the segment is automatically <<4 for you
mov ds, bx
; WARNING: from now on all memory references will be offset by 'ds' implicitly
mov al, [the_secret]
int 0x10

mov al, [es:the_secret]
int 0x10 ; doesn't look right... isn't 'es' currently 0x000?

mov bx, 0x7c0
mov es, bx
mov al, [es:the_secret]
int 0x10

jmp $


init:
	pusha
	mov bx, OS_NAME
	call print
	call print_nl
	mov bx, AUTHOR_NAME
	call print
	call print_nl
	popa
	ret

; Subroutines inclusion
%include "boot_sect_print.asm"
%include "boot_sect_print_hex.asm"

; Data Segment

the_secret:
	db 'X'

OS_NAME:
	db 'TindaOS', 0

AUTHOR_NAME:
	db 'Mukesh Chaurasiya', 0


; Padding and magic number
times 510 - ($ - $$) db 0
dw 0xAA55
