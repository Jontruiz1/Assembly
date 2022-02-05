INCLUDE Irvine32.inc
.data
str1 BYTE "Enter a Number: ",0
str2 BYTE "The Values Are: ",0
str3 BYTE "The Total is: ",0
str4 BYTE "  ",0
.code
main PROC
	mov  edx,OFFSET str1
	call WriteString
	call ReadInt
    mov  edx,OFFSET str2
	call WriteString
	mov  edx,OFFSET str4
	call WriteString
	mov ecx, eax
	mov eax,0
	mov ebx,0
L1:
	
    call WriteInt
	mov  edx,OFFSET str4
	call WriteString
	add ebx, eax
	add eax,2
	dec ecx

	jz Stop

loop L1
	Stop:

	call CRLF
	mov  edx,OFFSET str3
	call WriteString
	mov eax,ebx
	call WriteInt
	call crlf
	call WaitMSG
	exit
main ENDP
END main