INCLUDE Irvine32.inc

.data
	int01 dword 10
	int02 dword 05
.code
main PROC

	mov eax, int01
	mov ebx, int02

	xchg eax, ebx

	mov int01, eax
	mov int02, ebx

	exit
	
main ENDP
END main