INCLUDE Irvine32.inc
	COMMENT !
		Write a procedure that will use the value in AH
		divide the value by 73, and store the result
		in BH and the remainder in BL.
	!



.data
.code
main PROC

	mov ah, 100
	call DivByNum
	call DumpRegs
	exit

main ENDP

DivByNum PROC
	
	mov al, ah
	mov ah, 0
	mov ebx, 73
	div bl
	mov ebx, 0
	mov bh, al
	mov bl, ah
	ret
	

DivByNum ENDP

END main