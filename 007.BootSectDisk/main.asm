[org 0x7c00]

call init

    mov bx, 0x9000 ; es:bx = 0x0000:0x9000 = 0x09000
    mov dh, 2 ; read 2 sectors
    ; the bios sets 'dl' for our boot disk number
    ; if you have trouble, use the '-fda' flag: 'qemu -fda file.bin'
    call disk_load

    mov dx, [0x9000] ; retrieve the first loaded word, 0xdada
    call print_hex

    call print_nl

    mov dx, [0x9000 + 512] ; first word from second loaded sector, 0xface
    call print_hex

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
%include "boot_sect_disk.asm"

; Data Segment

OS_NAME:
	db 'TindaOS', 0

AUTHOR_NAME:
	db 'Mukesh Chaurasiya', 0


; Padding and magic number
times 510 - ($ - $$) db 0
dw 0xAA55

; boot sector = sector 1 of cyl 0 of head 0 of hdd 0
; from now on = sector 2 ...
times 256 dw 0xdada ; sector 2 = 512 bytes
times 256 dw 0xface ; sector 3 = 512 bytes
