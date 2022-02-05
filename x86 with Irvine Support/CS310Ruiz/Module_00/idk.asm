INCLUDE Irvine32.inc


.data
array dword 5 dup(0)
str1 byte "Enter an integer",0
.code

main PROC

mov ecx,5
mov ebx, 0
L1:
	mov edx, offset str1
	call WriteString
	call Readint
	mov [array+ebx], eax
	add ebx, 4
loop L1

mov ecx, 5
mov esi, OFFSET array

L2:
	mov eax, [esi]
	call WriteInt
	mov al, ' '
	call WriteChar
	add esi, 4

loop L2
exit

main ENDP

END main