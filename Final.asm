INCLUDE Irvine32.inc

	COMMENT !
		Write the code necessary to define an array containing 10
		double word values. Input a number from the console between
		1 and 10. Generate that number of numbers in the Fibonacci sequence
		and store them in the array. Display the arrow on the screen.
	!


.data

	arr DWORD 10 dup(?)
	numelems DWORD ?
	str1 BYTE "Enter a number between 1 and 10: ",0
	str2 BYTE "Fibonacci Sequence is: ", 0
	str3 BYTE " ", 0
	row BYTE 1
	col BYTE 20

.code
main PROC
	call locate
	mov edx, offset str1
	call writestring
	
	
	call ReadInt			; read num from console
	mov ecx, eax
	mov numelems, eax


	mov esi, OFFSET arr		; get starting position of array

	mov eax, 1				; 1st starting num
	mov ebx, 1				; 2nd starting num

	L1:
		mov [esi], eax		; set the last element in to eax
		push ebx			; save the num after eax for later
		add ebx, eax		; add eax and ebx, store in ebx
		pop eax				; restore ebx's value directly into eax
		add esi, 4			; go backwards one position

	loop L1

	add row, 1				; move cursor down 1
	call locate
	mov edx, offset str2	; print fibonacci sequence string
	call writestring


	mov edx, 0				; reset registers just in case
	mov esi, 0
	mov esi, OFFSET arr		; reset to the start of array
	mov ecx, numelems		; only print the number of elements that we 
							; read in
	L2:						
		mov eax, [esi]			; move element into eax
		call WriteDec			; print eax
		mov edx, offset str3	; just to put a space between the numbers 
		call writestring
		add esi, 4				; move forward one dword
	loop L2




	exit

main ENDP

; locate the cursor
Locate PROC
	mov  dh,row
	mov  dl,col
	call Gotoxy
	ret
Locate ENDP

END main