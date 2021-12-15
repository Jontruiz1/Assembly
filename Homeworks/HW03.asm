INCLUDE Irvine32.inc

.data
	arrayW dword 10h, 20h, 30h, 40h, 50h, 60h, 70h, 80h

.code
main PROC
	; 4.10.2
	mov ecx, lengthof arrayW - 4
	mov eax, 4			; counting

	; loop to rearrange values
	L1:
		mov ebx, [arrayW + eax - 4]		; current pos
		mov edx, [arrayW + eax]			; next pos
		mov [arrayW + eax - 4], edx		; next into curr
		mov [arrayW + eax], ebx			; curr into next
		add eax, 8						; increment eax
	loop L1


	; loop to print out new array
	mov ecx, lengthof arrayW
	mov ebx, 0
	L2:
		mov eax, [arrayW+ebx]
		add ebx, 4
		call dumpregs
	loop L2

	call waitmsg
	

	; 4.10.5
	mov ecx, 5
	mov eax, 1
	mov ebx, 1
	call dumpregs

	; starts with eax and ebx as the first 2 values
	; ebx represents the current value after the first dumpregs vgbn
	L3:
		mov edx, ebx
		add edx, eax
		mov eax, ebx
		mov ebx, edx
		call dumpregs
	loop L3
	


	exit

main ENDP

END main