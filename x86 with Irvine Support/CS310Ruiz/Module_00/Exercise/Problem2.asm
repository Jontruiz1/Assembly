INCLUDE Irvine32.inc

.data
.code
main PROC

	mov eax, 10
	mov ebx, 20
	mov ecx, 30
	mov edx, 40

	push eax
	push ebx
	push ecx
	push edx

	pop eax
	pop ecx
	pop ebx
	pop edx

	call dumpregs
	call waitmsg
	
	xchg eax, edx
	xchg ebx, ecx

	call dumpregs
	call waitmsg

	exit


main ENDP

END main