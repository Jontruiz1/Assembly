INCLUDE Irvine32.inc

.data
	; 3.10.2
	mon = 0
	tue = 1
	wed = 2
	thu = 3
	fri = 4
	sat = 5
	sun = 6

	week dword mon, tue, wed, thu, fri, sat, sun

	; 3.10.3
	var01 byte 255
	var02 sbyte -129
	var03 word 65535
	var04 sword -32768
	var05 dword 12345678h
	var06 sdword -2147483648
	var07 fword 123456781234h
	var08 qword 1234567812345678h
	var09 tbyte 800000000000001234h
	var10 real4 -1.2
	var11 real8 3.2E-260
	var12 real10 4.6E+4096

	; HW problem 4
	val1 byte 'Jona'

.code
main PROC
	; 3.10.1
	mov eax, 10			; A = 10
	mov ebx, 5			; B = 5
	mov ecx, 3			; C = 3
	mov edx, 2			; D = 2

	add eax, ebx		; A = (A + B)
	add ecx, edx		; C = (C + D)
	sub eax, ecx		; A = (A - C)
	call dumpregs
	call waitmsg
	
	; I wanted to practice loops so this moves the week number into
	; eax started from 0 to 6
	; 3.10.2
	mov eax, 0
	mov ecx, 7
	mov ebx, 0
	L1:
		mov eax, [week + ebx]
		add ebx, 4
		call dumpregs		
	loop L1
	call waitmsg

	; HW problem 4
	mov eax, dword ptr val1			; move letters into register
	call dumpregs
	call waitmsg

	exit 
main ENDP

END main
