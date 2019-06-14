; Infinite Loop
loop: 
	jmp loop

; (510 - size of above code) times 0 
times 510 - ($ - $$) db 0

;Boot Sector Indicator
dw 0xAA55
