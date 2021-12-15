INCLUDE Irvine32.inc


.data
	intarr DWORD 13, 55, 2, 1, 50
	temp DWORD ?


.code
main PROC


	mov eax, OFFSET intarr
	mov ebx, OFFSET intarr
	add ebx, 4

	mov edx, [eax]
	xchg edx, [ebx]
	mov [eax], edx
	

	mov esi, OFFSET intarr
	mov ecx, lengthof intarr
	L1:

		mov eax, [esi]
		add esi, 4
		call WriteInt

	loop L1

	exit

main ENDP

END main