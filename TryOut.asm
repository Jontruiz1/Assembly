INCLUDE Irvine32.inc

.data
	sum sdword 0
	count sdword 0
	str1 BYTE "Enter an integer: ",0
	str2 BYTE "The sum is:       ",0
	str3 BYTE "Press any key...  ",0

	row  BYTE ?
	col  BYTE ?

.code
main PROC
	call Input
	mov ecx, eax
	mov eax, 0

	L1:
		add count, 1
		add eax, count
	loop L1
	call displaysum

	exit
main ENDP

; input an integer
Input PROC
	call Locate
	mov  edx,OFFSET str1
	call WriteString
	call ReadInt
	ret
Input ENDP

; locate the cursor
Locate PROC
	mov  dh,row
	mov  dl,col
	call Gotoxy
	ret
Locate ENDP

DisplaySum PROC
	add  row,2
	call Locate
	mov  edx,OFFSET str2
	call WriteString
	mov  eax,sum
	call WriteInt
	ret
DisplaySum ENDP

; Display "Press any key..." and wait for input
WaitForKey PROC
	add  row,2
	call Locate
	mov  edx,OFFSET str3
	call WriteString
	call Readchar
	ret
WaitForKey ENDP

END main