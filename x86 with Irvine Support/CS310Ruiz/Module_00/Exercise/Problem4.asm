INCLUDE Irvine32.inc

.data
.code
main PROC

	call ReadInt

main ENDP

DumpReg PROC

	mov ecx, eax

	L1:

		call dumpregs
		call waitmsg

	loop L1
	exit

DumpReg ENDP


END main