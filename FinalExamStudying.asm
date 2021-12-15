INCLUDE Irvine32.inc

.data
	darray dword 10 dup(?)
	str1 BYTE "Enter an integer: ",0
	str2 BYTE "  ",0
.code
main PROC

	mov  edx,OFFSET str1
	call WriteString
	call ReadInt
	mov edx, 0

	mov ebx, 1
	mov edx, 1

	mov ecx, eax
	push ecx
	mov esi, 0
	L1:
		mov eax, 0
		mov eax, ebx

		mov [darray+esi], eax

		mov eax, ebx
		add eax, edx
		mov ebx, edx
		mov edx, eax
		add esi, 4

	loop L1
	mov  edx,OFFSET str2
	call WriteString
	mov ebx, 0
	mov edx, 0
	mov edx, 4

	pop ecx
	mov eax, ecx
	mul edx
	mov ebx, eax
	sub ebx, 4
	
	L2:
		mov eax, [darray+ebx]
		call writeint
		sub ebx, 4
	loop L2


	exit
main ENDP

END main