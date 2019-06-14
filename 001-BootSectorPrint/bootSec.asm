
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

; Infinite Loop
loop: 
	jmp loop

; (510 - size of above code) times 0 
times 510 - ($ - $$) db 0

;Boot Sector Indicator
dw 0xAA55
