INCLUDE Irvine32.inc

	COMMENT !
		The following program prints a string. Modify the code necessary
		to print the string in reverse order.
	!

.data
str1 BYTE "This is a random text field.", 0
.code
main PROC
	mov esi,OFFSET str1
	add esi, lengthof str1-2				; -2 for the ,0
	mov ecx,SIZEOF str1-1
	L1:
		mov al,[esi]
		call WriteChar
		call Crlf
		dec esi
		loop L1
	exit
main ENDP
END main
