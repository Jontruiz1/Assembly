INCLUDE Irvine32.inc

.data

	INT01 dword 10
	INT02 word 5

.code
main PROC
	mov eax, 0
	mov ebx, 0

	mov eax, int01
	mov ebx, DWORD ptr int02

	xchg eax, ebx
	call dumpregs
	call waitmsg

	exit

main ENDP

END main