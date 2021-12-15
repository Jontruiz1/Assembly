INCLUDE Irvine32.inc
	COMMENT !
		Write the code necessary to define an array 
		containing 10 double word values. Input a
		number from the console between 1 and 10. 
		Generate that number of numbers in the Fibonacci 
		sequence and store them in the array. Display
		the array on the screen in reverse sequence.
	!


.data
		
	arr DWORD 10 dup(?)
	numelm dword ?

.code
main PROC
	call ReadInt			; read num from console
	mov numelm, eax			; store num elements for later
	mov ebx, 4				; size of a dword in ebx
	mul ebx					; mul eax by size of dword

	mov esi, OFFSET arr		; get starting position of array
	add esi, eax			; move forward the number of elements
							; we're going to have

	mov eax, 1				; 1st starting num
	mov ebx, 1				; 2nd starting num

	mov ecx, numelm			; set loop counting var

	L1:
		mov [esi-4], eax	; set the last element in to eax
		push ebx			; save the num after eax for later
		add ebx, eax		; add eax and ebx, store in ebx
		pop eax				; restore ebx's value directly into eax
		sub esi, 4			; go backwards one position

	loop L1


	mov ecx, numelm			; set counting var from num elements
	mov esi, OFFSET arr		; reset to the start of array
	L2:						
		mov eax, [esi]		; move element into eax
		call WriteInt		; print eax
		add esi, 4			; move forward one dword
	loop L2

	exit

main ENDP

END main