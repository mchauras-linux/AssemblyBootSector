[org 0x7c00]

mov bx, OS_NAME
call print

call print_nl

mov bx, AUTHOR_NAME
call print

call print_nl

mov dx, 0x12fe
call print_hex
call print_nl

jmp $


; Subroutines inclusion
%include "boot_sect_print.asm"
%include "boot_sect_print_hex.asm"

; Data Segment

OS_NAME:
	db 'TindaOS', 0

AUTHOR_NAME:
	db 'Mukesh Chaurasiya', 0


; Padding and magic number
times 510 - ($ - $$) db 0
dw 0xAA55
