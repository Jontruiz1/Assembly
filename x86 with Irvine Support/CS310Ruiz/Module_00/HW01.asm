INCLUDE Irvine32.inc
.data
.code
main PROC
	mov eax, 73
	call dumpregs
	call waitmsg

	mov ah, 0AAh
	call dumpregs
	call waitmsg

	mov al, 73
	call dumpregs
	exit

main ENDP

END main