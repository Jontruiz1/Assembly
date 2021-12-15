INCLUDE Irvine32.inc
.data

	list DWORD 5, 1, 4, 2, 8

	
	
.code
main PROC
	COMMENT !
		Given an array of 100 double words, write the code
		to sort the array in ascending sequence
	!
	mov eax, OFFSET list
	mov ebx, offset list
    mov ecx, lengthof list
	outer:

		mov edx, [eax]
		xchg edx, [ebx]
		mov [eax], edx


	loop outer




	mov ecx, lengthof list
	Display:

		mov eax, [edi]
		call WriteInt
		add edi, 4

	loop Display

	exit
	
main ENDP

END main