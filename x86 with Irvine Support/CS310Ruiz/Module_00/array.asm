INCLUDE Irvine32.inc

.data
	console byte (20 * 20) dup(?)
	row dword 20
	col dword 20
.code
main PROC
	

	call dumpregs

	exit
main ENDP

END main