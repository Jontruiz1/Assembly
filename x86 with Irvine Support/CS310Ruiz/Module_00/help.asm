INCLUDE Irvine32.inc


.data
.code
main PROC

	mov eax, 0
	call dumpregs
	call waitmsg
	exit

main ENDP
END main