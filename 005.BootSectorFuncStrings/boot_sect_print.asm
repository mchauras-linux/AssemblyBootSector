print:

	; Save all the Registers
	pusha

	; similar to
	; while(string[i] != 0) 
	; {
	;	print string[i]
	;	i++;
	; }

start:
	; bx is the base address for the string
	mov al, [bx]
	cmp al, 0
	je done		; if end of string, print has been completed

	; al already has the value, set tty mode and invoke interrupt
	mov ah, 0x0e
	int 0x10

	add bx, 1
	jmp start

done:
	popa
	ret


print_nl:
	pusha
	mov ah, 0x0e
	mov al, 0x0a ; new line char
	int 0x10
	mov al, 0x0d ; carriage return
	int 0x10
	popa
	ret
