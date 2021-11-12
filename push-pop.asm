INCLUDE Irvine32.inc
.data
.code
main PROC

push 0Ah
push 0Bh

pop eax
pop ebx



move ecx, 100
L1:
	push ecx
	mov ecx, 20
	L2:
		mov eax, 2
	loop L2
	pop ecx
loop L1

call dumpregs

exit
main ENDP


END main