INCLUDE Irvine32.inc


Comment !
5.9.8
Write a program that displays a single character in all possible combinations of foreground
and background colors (16 x 16 = 256). The colors are numbered from 0 to 15, so you can use
a nested loop to generate all possible combinations
!

.data
	count dword ?
.code
main PROC
	mov ebx, 0				; background color
	mov edx, 0				; text color

	mov ecx, 16

	; loop for text color
	L1:
		mov count, ecx		; store outer loop count
		mov ecx, 16			; set inner loop count

		;  loop for background
		L2:
			push edx		; save edx
			push ebx		; save ebx

			; doing the textcolor + (backgroundcolor * 16)
			mov ax, 16
			mul edx
			add ebx, edx
			
			mov eax, ebx	; putting the combination back into eax
			call SetTextColor
			
			; just using 1 as the random character
			mov al, '1'
			call WriteChar

			pop ebx			; restoring ebx and edx
			pop edx
			inc ebx

		loop L2
		inc edx
		mov ecx, count
	loop L1

	mov eax, white + (black * 16)			; just resetting the console colors to not make eyes bleed
	call SetTextColor
	
	exit
main ENDP
END main