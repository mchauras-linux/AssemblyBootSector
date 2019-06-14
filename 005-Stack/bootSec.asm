; Offset to boot Sector Program
[org 0x7C00]

mov ah, 0x0E 	; TTY mode

mov bp, 0x8000  ; This is an far away address from 0x7C00 so the it doesnt owerwrites our code
mov sp, bp	; Stack Empty Indication

push 'T'
push 'I'
push 'N'
push 'D'
push 'A'
push ' '
push 'O'
push 'S'


mov al, [0x7FFF] ; 0x8000 - 1   ; Wil print null as hiogher byte contains 0
int 0x10
mov al, [0x7FFE] ; 0x8000 - 2   ; Will Print 'T' as T is pushed 1st and the stack grows downwards
int 0x10
mov al, [0x7FFD] ; 0x8000 - 3   ; Wil print null as hiogher byte contains 0
int 0x10
mov al, [0x7FFC] ; 0x8000 - 4   ; Will Print 'I' as T is pushed 1st and the stack grows downwards
int 0x10
mov al, [0x7FFB] ; 0x8000 - 5   ; Wil print null as hiogher byte contains 0
int 0x10
mov al, [0x7FFA] ; 0x8000 - 6   ; Will Print 'N' as T is pushed 1st and the stack grows downwards
int 0x10
mov al, [0x7FF9] ; 0x8000 - 7   ; Wil print null as hiogher byte contains 0
int 0x10
mov al, [0x7FF8] ; 0x8000 - 8   ; Will Print 'D' as T is pushed 1st and the stack grows downwards
int 0x10
mov al, [0x7FF7] ; 0x8000 - 9   ; Wil print null as hiogher byte contains 0
int 0x10
mov al, [0x7FF6] ; 0x8000 - 10  ; Will Print 'A' as T is pushed 1st and the stack grows downwards
int 0x10
mov al, [0x7FF5] ; 0x8000 - 11  ; Wil print null as hiogher byte contains 0
int 0x10
mov al, [0x7FF4] ; 0x8000 - 12  ; Will Print ' ' as T is pushed 1st and the stack grows downwards
int 0x10
mov al, [0x7FF3] ; 0x8000 - 13  ; Wil print null as hiogher byte contains 0
int 0x10
mov al, [0x7FF2] ; 0x8000 - 14  ; Will Print 'O' as T is pushed 1st and the stack grows downwards
int 0x10
mov al, [0x7FF1] ; 0x8000 - 15  ; Wil print null as hiogher byte contains 0
int 0x10
mov al, [0x7FF0] ; 0x8000 - 16  ; Will Print 'S' as T is pushed 1st and the stack grows downwards
int 0x10
mov al, [0x7FEF] ; 0x8000 - 17  ; Will Print Garbage
int 0x10
mov al, [0x7FED] ; 0x8000 - 18  ; Will Print Garbage as we havent pushed anything
int 0x10

pop bx 
mov al, bl
int 0x10	; pops last char in stack i.e 'S' and prints it

pop bx 
mov al, bl
int 0x10	; Prints 'O'

pop bx 
mov al, bl
int 0x10	; Prints ' '

pop bx 
mov al, bl
int 0x10	; Prints 'A'

pop bx 
mov al, bl
int 0x10	; Prints 'D'

pop bx 
mov al, bl
int 0x10	; Prints 'N'

pop bx 
mov al, bl
int 0x10	; Prints 'I'

pop bx 
mov al, bl
int 0x10	; Prints 'T'




; Infinite Loop
loop: 
	jmp loop


; (510 - size of above code) times 0 
times 510 - ($ - $$) db 0

;Boot Sector Indicator
dw 0xAA55
