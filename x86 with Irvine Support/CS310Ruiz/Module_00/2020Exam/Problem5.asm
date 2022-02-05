INCLUDE Irvine32.inc

.data

	TestArray dword 123, 56, 32, 77, 45

.code

main PROC

	mov esi, OFFSET TestArray
	mov ecx, lengthof TestArray

	L1:

		mov eax, [esi]
		call WriteInt
		add esi, 4

	loop L1

	exit

main ENDP

END main