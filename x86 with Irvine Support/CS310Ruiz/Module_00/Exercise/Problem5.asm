INCLUDE Irvine32.inc

.data
intarr dword 50, 30, 7, 3

.code
main PROC

	mov ecx, lengthof intarr
	mov eax, lengthof intarr
	mul ecx
	sub ax, 4

	mov ebx, eax

	L1:
		mov eax, 0
		mov eax, [intarr+ebx]
		call WriteInt

		sub ebx, 

	loop L1


	exit
main ENDP

END main