; Offset to boot Sector Program
[org 0x7C00]

mov ah, 0x0E		; TTY Mode
mov bx, osName		; Store addres in bx to maintain it as a counter for address
mov al, [bx]		; move the byte at bl to al
add bx, 1		; move pointer to next address
int 0x10		; send interrupt to print

mov al, [bx]		; move the byte at bl to al
add bx, 1		; move pointer to next address
int 0x10		; send interrupt to print

mov al, [bx]		; move the byte at bl to al
add bx, 1		; move pointer to next address
int 0x10		; send interrupt to print

mov al, [bx]		; move the byte at bl to al
add bx, 1		; move pointer to next address
int 0x10		; send interrupt to print

mov al, [bx]		; move the byte at bl to al
add bx, 1		; move pointer to next address
int 0x10		; send interrupt to print

mov al, [bx]		; move the byte at bl to al
add bx, 1		; move pointer to next address
int 0x10		; send interrupt to print

mov al, [bx]		; move the byte at bl to al
add bx, 1		; move pointer to next address
int 0x10		; send interrupt to print

mov al, [bx]		; move the byte at bl to al
add bx, 1		; move pointer to next address
int 0x10		; send interrupt to print

mov al, 0x0A		; New Line Char
int 0x10

mov al, 0x0D		; Carriage Return. Move the cursor to the beginning of line
int 0x10

loop: 
	jmp loop

;String to Print
osName:
	db 'TINDA OS', 0	; null byte at the end as content end indicator

; (510 - size of above code) times 0 
times 510 - ($ - $$) db 0

;Boot Sector Indicator
dw 0xAA55
