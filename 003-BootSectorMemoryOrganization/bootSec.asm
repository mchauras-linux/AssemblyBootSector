
mov ah, 0x0E  	; write contents of al in TTY Mode
mov al, 'T'	; put Character on lower byte
int 0x10 	; interrupt to put the char on screen

mov al, 'I'	; put Character on lower byte
int 0x10 	; interrupt to put the char on screen
mov al, 'N'	; put Character on lower byte
int 0x10 	; interrupt to put the char on screen
mov al, 'D'	; put Character on lower byte
int 0x10 	; interrupt to put the char on screen
mov al, 'A'	; put Character on lower byte
int 0x10 	; interrupt to put the char on screen
mov al, ' '	; put Character on lower byte
int 0x10 	; interrupt to put the char on screen
mov al, 'O'	; put Character on lower byte
int 0x10 	; interrupt to put the char on screen
mov al, 'S'	; put Character on lower byte
int 0x10 	; interrupt to put the char on screen

mov al, ' '	; put Character on lower byte
int 0x10 	; interrupt to put the char on screen

; attempt 1
; Fails because it tries to print the memory address (i.e. pointer)
; not its actual contents
mov al, "1"
int 0x10
mov al, the_secret
int 0x10

mov al, ' '     ; put Character on lower byte
int 0x10        ; interrupt to put the char on screen

; attempt 2
; It tries to print the memory address of 'the_secret' which is the correct approach.
; However, BIOS places our bootsector binary at address 0x7c00
; so we need to add that padding beforehand. We'll do that in attempt 3
mov al, "2"
int 0x10
mov al, [the_secret]
int 0x10

mov al, ' '     ; put Character on lower byte
int 0x10        ; interrupt to put the char on screen

; attempt 3
; Add the BIOS starting offset 0x7c00 to the memory address of the X
; and then dereference the contents of that pointer.
; We need the help of a different register 'bx' because 'mov al, [ax]' is illegal.
; A register can't be used as source and destination for the same command.
mov al, "3"
int 0x10
mov bx, the_secret
add bx, 0x7c00
mov al, [bx]
int 0x10

mov al, ' '     ; put Character on lower byte
int 0x10        ; interrupt to put the char on screen

; attempt 4
; We try a shortcut since we know that the X is stored at byte 0x61 in our binary
; That's smart but ineffective, we don't want to be recounting label offsets
; every time we change the code
mov al, "4"
int 0x10
mov al, [0x7c61]
int 0x10


mov al, ' '     ; put Character on lower byte
int 0x10        ; interrupt to put the char on screen


; Infinite Loop
loop: 
	jmp loop

the_secret:
    ; ASCII code 0x58 ('X') is stored just before the zero-padding.
    ; On this code that is at byte 0x2d (check it out using 'xxd file.bin')
    db "X"


; (510 - size of above code) times 0 
times 510 - ($ - $$) db 0

;Boot Sector Indicator
dw 0xAA55
